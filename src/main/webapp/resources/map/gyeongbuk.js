var mapOptions = {
	center: new naver.maps.LatLng(36.37930372760984, 128.9300953750237), //지도의 초기 중심 좌표
	zoom: 9, //지도의 초기 줌 레벨
	minZoom: 9, //지도의 최소 줌 레벨
	maxZoom: 9, //지도의 최소 줌 레벨
};

var map = new naver.maps.Map('map', mapOptions);
var dokdo = new naver.maps.LatLngBounds(
                new naver.maps.LatLng(37.2380651, 131.8562652),
                new naver.maps.LatLng(37.2444436, 131.8786475));

map.setOptions({
	draggable: true,
	keyboardShortcuts: false,
	disableDoubleTapZoom: false,
	disableDoubleClickZoom: false,
	scaleControl: false,
	logoControl: false,
	mapDataControl: false,
});

var regionGeoJson = [],
	loadCount = 0;

naver.maps.Event.once(map, 'init_stylemap', function() {
	for (var i = 1; i < 2; i++) {
		$.ajax({
			url: '../resources/map/detailRegionJson/detail254.json',
			success: function(idx) {
				return function(geojson) {
					regionGeoJson[idx] = geojson;
					loadCount++;

					if (loadCount === 1) {
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
		var styleOptions = {
			fillColor: '#FFA7A7',
			fillOpacity: 0.1,
			strokeColor: '#FF0000',
			strokeWeight: 2,
			strokeOpacity: 1
		}
		return styleOptions;
	});

	regionGeoJson.forEach(function(geojson) {
		map.data.addGeoJson(geojson);
	});
}