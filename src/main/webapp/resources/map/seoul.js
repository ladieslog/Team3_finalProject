var mapOptions = {
	center: new naver.maps.LatLng(37.56570923435898, 126.97715302005895), //지도의 초기 중심 좌표
	zoom: 11, //지도의 초기 줌 레벨
	minZoom: 11, //지도의 최소 줌 레벨
	maxZoom: 11, //지도의 최소 줌 레벨
};

var map = new naver.maps.Map('map', mapOptions);

map.setOptions({
	draggable: false,
	keyboardShortcuts: false,
	disableDoubleTapZoom: false,
	disableDoubleClickZoom: false,
	scaleControl: false,
	logoControl: false,
	mapDataControl: false,
});

var HOME_PATH = '../resources/map',
	urlPrefix = HOME_PATH + '/detailRegionJson/detail',
	urlSuffix = '.json',
	regionGeoJson = [],
	loadCount = 0;

naver.maps.Event.once(map, 'init_stylemap', function() {
	for (var i = 83; i < 109; i++) {
		var keyword = i + '';

		if (keyword.length === 2) {
			keyword = '0' + keyword;
		}
		
		if (i === 83) {
			keyword = '259'
		}

		$.ajax({
			url: urlPrefix + keyword + urlSuffix,
			success: function(idx) {
				return function(geojson) {
					console.log(geojson);
					regionGeoJson[idx] = geojson;
					loadCount++;

					if (loadCount === 26) {
						startDataLayer();
					}
				}
			}(i - 1),
			error: function() {
				alert("에러");
			}
		});
	}
});
var tooltip = $('<div style="position:absolute;z-index:1000;padding:5px 10px;background-color:#fff;border:solid 2px #000;font-size:14px;pointer-events:none;display:none;"></div>');

tooltip.appendTo(map.getPanes().floatPane);

function startDataLayer() {
	map.data.setStyle(function(feature) {
		if (feature.getProperty('area2') == '') {
			var styleOptions = {
				fillColor: '#FFD8D8',
				fillOpacity: 0,
				strokeColor: '#8C8C8C',
				strokeWeight: 3,
				strokeOpacity: 1
			};
		}
		else if (feature.getProperty('area3') == '') {
			var styleOptions = {
				fillColor: '#F6F6F6',
				fillOpacity: 0.1,
				strokeColor: '#8C8C8C',
				strokeWeight: 1,
				strokeOpacity: 1
			};
		}
		else {
			var styleOptions = {
				fillColor: '#FFC19E',
				fillOpacity: 0.1,
				strokeColor: '#8C8C8C',
				strokeWeight: 1,
				strokeOpacity: 1
			};
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
		if (feature.getProperty('area3') == '') {
			var regionName = feature.getProperty('area1')
				+ ' ' + feature.getProperty('area2');
		}

		else {
			regionName = feature.getProperty('area1')
				+ ' ' + feature.getProperty('area2')
				+ ' ' + feature.getProperty('area3');
		}

		tooltip.css({
			display: '',
			left: e.offset.x,
			top: e.offset.y
		}).text(regionName);

		map.data.overrideStyle(feature, {
			fillOpacity: 0.3,
			strokeColor: '#F15F5F',
			strokeWeight: 3,
			strokeOpacity: 1
		});
	});

	map.data.addListener('mouseout', function(e) {
		tooltip.hide().empty();
		map.data.revertStyle();
	});
}