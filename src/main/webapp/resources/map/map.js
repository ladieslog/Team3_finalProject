var mapOptions = {
	center: new naver.maps.LatLng(35.797336021559566, 127.61588108068118), //지도의 초기 중심 좌표
	zoom: 7, //지도의 초기 줌 레벨
	minZoom: 7, //지도의 최소 줌 레벨
	maxZoom: 21, //지도의 최소 줌 레벨
	zoomControlOptions: { //줌 컨트롤의 옵션
		position: naver.maps.Position.TOP_RIGHT
	}
};

var map = new naver.maps.Map('map', mapOptions);

map.setOptions({ //지도 인터랙션 끄기
	draggable: true,
	pinchZoom: true,
	scrollWheel: true,
	keyboardShortcuts: true,
	disableDoubleTapZoom: false,
	disableDoubleClickZoom: false,
	disableTwoFingerTapZoom: false
});

var HOME_PATH = '../resources/map',
    urlPrefix = HOME_PATH +'/data/region',
    urlSuffix = '.json',
    regionGeoJson = [],
    loadCount = 0;

naver.maps.Event.once(map, 'init_stylemap', function () {
    for (var i = 1; i < 18; i++) {
        var keyword = i +'';

        if (keyword.length === 1) {
            keyword = '0'+ keyword;
        }

        $.ajax({
            url: urlPrefix + keyword + urlSuffix,
			
            success: function(idx) {
                return function(geojson) {
					
					console.log(geojson);
                    regionGeoJson[idx] = geojson;

                    loadCount++;

                    if (loadCount === 17) {
                        startDataLayer();
                    }
                }
            }(i - 1),
			error : function() {
				alert("에러");
			}
        });
    }
});

var tooltip = $('<div style="position:absolute;z-index:1000;padding:5px 10px;background-color:#fff;border:solid 2px #000;font-size:14px;pointer-events:none;display:none;"></div>');

tooltip.appendTo(map.getPanes().floatPane);

function startDataLayer() {
    map.data.setStyle(function(feature) {
        var styleOptions = {
            fillColor: '#ff0000',
            fillOpacity: 0.0001,
            strokeColor: '#ff0000',
            strokeWeight: 2,
            strokeOpacity: 0.4
        };

        if (feature.getProperty('focus')) {
            styleOptions.fillOpacity = 0.6;
            styleOptions.fillColor = '#0f0';
            styleOptions.strokeColor = '#0f0';
            styleOptions.strokeWeight = 4;
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
        } else {
            feature.setProperty('focus', false);
        }
    });

    map.data.addListener('mouseover', function(e) {
        var feature = e.feature,
            regionName = feature.getProperty('area1');

        tooltip.css({
            display: '',
            left: e.offset.x,
            top: e.offset.y
        }).text(regionName);

        map.data.overrideStyle(feature, {
            fillOpacity: 0.6,
            strokeWeight: 4,
            strokeOpacity: 1
        });
    });

    map.data.addListener('mouseout', function(e) {
        tooltip.hide().empty();
        map.data.revertStyle();
    });
}