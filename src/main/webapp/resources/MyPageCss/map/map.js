var mapOptions,
	regionGeoJson = [];

initMap();


function initMap() {
	spinner(2000);
	viewSelected(0);
	mapSetOptions();
	regionJsonLoop(1);
}

function spinner(time) {
	LoadingWithMask();
	setTimeout("closeLoadingWithMask()", time);
}

function LoadingWithMask() {
	var maskHeight = $(document).height();
	var maskWidth = window.document.body.clientWidth;

	var mask = "<div id='mask' style='position:absolute; z-index:5000; background-color:#000000; display:none;'></div>";
	var loadingImg = '';

	loadingImg += "<div id='loadingImg'>";
	loadingImg += "<img src='/root/resources/map/img/Spinner.gif' style='position:absolute; left: 50%; top: 50%; transform:translate(-50%, -50%); display: block;'/>";
	loadingImg += "</div>";

	$('body').append(mask).append(loadingImg);

	$('#mask').css({
		'width': maskWidth,
		'height': maskHeight,
		'opacity': '0'
	});

	$('#mask').show();
	$('#loadingImg').show();
}

function closeLoadingWithMask() {
	$('#mask, #loadingImg').hide();
	$('#mask, #loadingImg').empty();
}

var coloringMap = '<button class="mapButton1">Coloring Map</button>';
var tripNoteMap = '<button class="mapButton2">TripNote Map</button>';

naver.maps.Event.once(map, 'init_stylemap', function() {
	//customControl 객체 이용하기
	var coloringMapControl = new naver.maps.CustomControl(coloringMap, {
		position: naver.maps.Position.TOP_LEFT
	});

	var tripNoteMapControl = new naver.maps.CustomControl(tripNoteMap, {
		position: naver.maps.Position.TOP_LEFT
	});

	coloringMapControl.setMap(map);
	tripNoteMapControl.setMap(map);

	naver.maps.Event.addDOMListener(coloringMapControl.getElement(), 'click', function() {
		spinner(2000);
		viewSelected(0);
		mapSetOptions();
		regionJsonLoop(1);
	});

	naver.maps.Event.addDOMListener(tripNoteMapControl.getElement(), 'click', function() {
		spinner(2000);
		viewSelected(0);
		mapSetOptions();
		regionJsonLoop(3);
	});
});

function viewSelected(naverCode) {
	var coordinate,
		zoomLevel;

	if (naverCode === 0) {
		coordinate = [35.797336021559566, 127.61588108068118];
		zoomLevel = 7;
	}

	else if (naverCode === 1) {
		coordinate = [37.77875952149849, 128.45614856831327];
		zoomLevel = 9;
	}

	else if (naverCode === 2) {
		coordinate = [37.58828996787081, 127.13976342063229];
		zoomLevel = 9;
	}

	else if (naverCode === 3) {
		coordinate = [35.312485951670965, 128.35904991977813];
		zoomLevel = 9;
	}

	else if (naverCode === 4) {
		coordinate = [36.43746228571184, 128.8171692594408];
		zoomLevel = 9;
	}

	else if (naverCode === 5) {
		coordinate = [35.161845215083254, 126.85388112266982];
		zoomLevel = 11;
	}

	else if (naverCode === 6) {
		coordinate = [35.8383974839094, 128.5668823913586];
		zoomLevel = 11;
	}

	else if (naverCode === 7) {
		coordinate = [36.34661102368089, 127.40585548936683];
		zoomLevel = 11;
	}

	else if (naverCode === 8) {
		coordinate = [35.173219844383105, 129.04001281778324];
		zoomLevel = 11;
	}

	else if (naverCode === 9) {
		coordinate = [37.558033800475805, 127.00829015424965];
		zoomLevel = 11;
	}

	else if (naverCode === 10) {
		coordinate = [35.55768272122909, 129.25686823889524];
		zoomLevel = 11;
	}

	else if (naverCode === 11) {
		coordinate = [37.59638345853803, 126.57388688320925];
		zoomLevel = 9;
	}

	else if (naverCode === 12) {
		coordinate = [34.85810739384981, 126.80346385232812];
		zoomLevel = 9;
	}

	else if (naverCode === 13) {
		coordinate = [35.6885872249758, 127.15127296373089];
		zoomLevel = 9;
	}

	else if (naverCode === 14) {
		coordinate = [33.376879301851545, 126.57380581097621];
		zoomLevel = 11;
	}

	else if (naverCode === 15) {
		coordinate = [36.50970606936858, 126.91170070309774];
		zoomLevel = 9;
	}

	else if (naverCode === 16) {
		coordinate = [36.640848853510505, 127.99312538689517];
		zoomLevel = 9;
	}

	else if (naverCode === 17) {
		coordinate = [36.569344588666596, 127.24219219853576];
		zoomLevel = 11;
	}


	mapOptions = {
		center: new naver.maps.LatLng(coordinate[0], coordinate[1]),
		mapTypes: new naver.maps.MapTypeRegistry({
			'normal': naver.maps.NaverStyleMapTypeOption.getVectorMap()	// 레이어 없는 지도
		}),

		zoom: zoomLevel,
		maxZoom: 11,
		minZoom: 7,
		zoomControlOptions: {
			zoomControl: true,
			position: naver.maps.Position.TOP_RIGHT
		},
	};

	map = new naver.maps.Map('map', mapOptions);
}

function mapSetOptions() {
	map.setOptions({
		mapDataControl: false,
		zoomControl: true,
		tileTransition: true,
		zoomControlOptions: {
			style: naver.maps.ZoomControlStyle.SMALL,
			position: naver.maps.Position.TOP_RIGHT
		},
	});
}

function regionJsonLoop(mapType) {
	var HOME_PATH = '/root/resources/map',
		urlPrefix = HOME_PATH + '/detailRegionJson/detail',
		urlSuffix = '.json',
		loadCount = 0;

	naver.maps.Event.once(map, 'init_stylemap', function() {
		var keyword;
		spinner(2000);

		for (var i = 1; i < 268; i++) {
			if (mapType === 1 || mapType === 3) {
				keyword = i + '';
			}

			else {
				keyword = (268 - i) + '';
			}

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
						regionGeoJson[idx] = geojson;
						loadCount++;

						if (loadCount === 267) {
							startDataLayer(mapType);
						}
					}
				}(i - 1),
				error: function() {
					//alert("에러");
				}
			});
		}

	});
}

function startDataLayer(mapType) {

	var tooltip = $('<div style="position:absolute;z-index:1000;padding:5px 10px;background-color:#fff;border:solid 2px #000; font-family: HCR Batang; font-weight:bold; font-size:14px;pointer-events:none;display:none;"></div>');
	tooltip.appendTo(map.getPanes().floatPane);

	map.data.setStyle(function(feature) {

		if (mapType === 1 || mapType === 2) {	// 컬러링지도
			if (feature.getProperty('area2') == '') {	// 도, 광역시
				var styleOptions = {
					fillColor: '#F6F6F6',
					fillOpacity: 0,
					strokeColor: '#FFFFFF',
					strokeWeight: 2,
					strokeOpacity: 1
				};
			}

			else if (feature.getProperty('area3') == '') {	// 시군구
				var styleOptions = {
					fillColor: '#F6F6F6',
					fillOpacity: 0,
					strokeColor: '#FFFFFF',
					strokeWeight: 1,
					strokeOpacity: 0.5
				};
			}

			else {
				var styleOptions = {	// 여행간 지역 색칠
					fillColor: '#FF9090',
					fillOpacity: 1,
					strokeColor: '#FFFFFF',
					strokeWeight: 1,
					strokeOpacity: 0.5
				};
			}
		}

		else if (mapType === 3 || mapType === 4) {	// 트립노트지도
			if (feature.getProperty('area2') == '') {	// 도, 광역시
				var styleOptions = {
					fillColor: '#F6F6F6',
					fillOpacity: 0,
					strokeColor: '#FFFFFF',
					strokeWeight: 2,
					strokeOpacity: 1
				};
			}

			else {
				var styleOptions = {	// 시군구
					fillColor: '#F6F6F6',
					fillOpacity: 0,
					strokeColor: '#FFFFFF',
					strokeWeight: 1,
					strokeOpacity: 0.5
				};
			}
		}

		return styleOptions;
	});

	regionGeoJson.forEach(function(geojson) {
		map.data.addGeoJson(geojson);
	});

	map.data.addListener('click', function(e) {
		var feature = e.feature,
			naverCodeInt = parseInt(feature.getProperty('navercode'));

		viewSelected(naverCodeInt);
		mapSetOptions();
		regionGeoJson = [];

		//1:컬러링 도,광역시 / 2:컬러링 시군구 / 3: 트립노트 도,광역시/ 4: 트립노트 시군구
		if (mapType === 1 || mapType === 2) {
			regionJsonLoop(2);
		}

		else {
			regionJsonLoop(4);
		}
	});

	map.data.addListener('mouseover', function(e) { // 마우스 올린 상태
		var feature = e.feature,
			regionName;

		if (feature.getProperty('area3') == '') {
			regionName = feature.getProperty('area1')
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
			fillColor: '#F15F5F',
			fillOpacity: 0.3,
			strokeColor: '#FFFFFF',
			strokeWeight: 1,
			strokeOpacity: 1
		});
	});

	map.data.addListener('mouseout', function(e) {
		tooltip.hide().empty();
		map.data.revertStyle();
	});
}