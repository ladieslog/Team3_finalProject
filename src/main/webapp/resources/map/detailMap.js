var mapOptions = {
	center: new naver.maps.LatLng(35.797336021559566, 127.61588108068118), //지도의 초기 중심 좌표
	mapTypes: new naver.maps.MapTypeRegistry({
    	'normal': naver.maps.NaverStyleMapTypeOption.getVectorMap()	// 레이어 없는 지도
    }),
	zoom: 7, //지도의 초기 줌 레벨
	minZoom: 7, //지도의 최소 줌 레벨
	maxZoom: 8, //지도의 최소 줌 레벨
	zoomControlOptions: { //줌 컨트롤의 옵션
		zoomControl: true, //줌 컨트롤의 표시 여부
        position: naver.maps.Position.TOP_RIGHT
    }
};

var map = new naver.maps.Map('map', mapOptions);

map.setOptions({
	draggable: true,
	pinchZoom: true,
	scrollWheel: true,
	keyboardShortcuts: false,
	disableDoubleTapZoom: false,
	disableDoubleClickZoom: false,
	scaleControl: false,
    logoControl: false,
    mapDataControl: false,
    zoomControl: true,
	zoomControlOptions: {
            style: naver.maps.ZoomControlStyle.SMALL,
            position: naver.maps.Position.TOP_RIGHT
    },
});



var HOME_PATH = '../resources/map',
	urlPrefix = HOME_PATH + '/detailRegionJson/detail',
	urlSuffix = '.json',
	regionGeoJson = [],
	loadCount = 0;

naver.maps.Event.once(map, 'init_stylemap', function() {
	for (var i = 1; i < 251; i++) {
		var keyword = i + '';

		if (keyword.length === 1) {
			keyword = '00' + keyword;
		}
		else if (keyword.length === 2) {
			keyword = '0' + keyword;
		}

		$.ajax({
			url: urlPrefix + keyword + urlSuffix,
			success: function(idx) {
				return function(geojson) {
					//console.log(geojson);
					regionGeoJson[idx] = geojson;
					loadCount++;

					if ( loadCount === 250) {
						startDataLayer();
					}
				}
			}(i - 1),
			error: function() {
				//alert("에러");
			}
		});
		
	}
});

var tooltip = $('<div style="position:absolute;z-index:1000;padding:5px 10px;background-color:#fff;border:solid 2px #000;font-size:14px;pointer-events:none;display:none;"></div>');

tooltip.appendTo(map.getPanes().floatPane);

function startDataLayer() {	
	map.data.setStyle(function(feature) {
		if(feature.getProperty('area3') == ''){
			var styleOptions = {
				fillColor: '#F6F6F6',
				fillOpacity: 1,
				strokeColor: '#8C8C8C',
				strokeWeight: 1,
				strokeOpacity: 0.6
			};
		}
		else{
			var styleOptions = {
				fillColor: '#E4F7BA',
				fillOpacity: 1,
				strokeColor: '#8C8C8C',
				strokeWeight: 1,
				strokeOpacity: 1
			};
		}
		console.log(feature);
		if (feature.getProperty('focus')) {	// 마우스 클릭 상태
			styleOptions.fillColor = '#FFC19E';
			styleOptions.fillOpacity = 0.3;
			styleOptions.strokeColor = '#F29661';
			styleOptions.strokeWeight = 1;
			styleOptions.strokeOpacity = 1;
		}
		return styleOptions;
	});

	regionGeoJson.forEach(function(geojson) {
		map.data.addGeoJson(geojson);
	});

	map.data.addListener('click', function(e) {
		var feature = e.feature;

		if (feature.getProperty('focus') !== true) {
			feature.setProperty('focus', true);
		} 

		else {
			feature.setProperty('focus', false);
		}
	});

	map.data.addListener('mouseover', function(e) { // 마우스 올린 상태
		var feature = e.feature
		if(feature.getProperty('area3') == ''){
			var regionName = feature.getProperty('area1') 
				+ ' '+  feature.getProperty('area2');
		}
		
		else {
			regionName = feature.getProperty('area1') 
				+ ' '+  feature.getProperty('area2')
				+ ' '+  feature.getProperty('area3');
		}
		
		tooltip.css({
			display: '',
			left: e.offset.x,
			top: e.offset.y
		}).text(regionName);

		map.data.overrideStyle(feature, {
			fillOpacity: 1,
			strokeWeight: 2,
			strokeOpacity: 1
		});
	});

	map.data.addListener('mouseout', function(e) {	
		tooltip.hide().empty();
		map.data.revertStyle();
	});
}