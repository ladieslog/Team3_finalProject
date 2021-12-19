var mapOptions,
	regionGeoJson = [];

spinner();
viewSelected(0);
mapSetOptions();
regionJsonLoop(0);

function spinner() {
	LoadingWithMask();
	setTimeout("closeLoadingWithMask()", 2000);
}

function LoadingWithMask() {
	//화면의 높이와 너비를 구합니다.
	var maskHeight = $(document).height();
	var maskWidth = window.document.body.clientWidth;

	//화면에 출력할 마스크를 설정해줍니다.
	var mask = "<div id='mask' style='position:absolute; z-index:5000; background-color:#000000; display:none;'></div>";
	var loadingImg = '';

	loadingImg += "<div id='loadingImg'>";
	loadingImg += "<img src='/root/resources/map/img/Spinner.gif' style='position:absolute; left: 50%; top: 50%; transform:translate(-50%, -50%); display: block;'/>";
	loadingImg += "</div>";

	$('body').append(mask).append(loadingImg);
	//화면에 레이어 추가

	$('#mask').css({
		'width': maskWidth,
		'height': maskHeight,
		'opacity': '0.3'
	});

	$('#mask').show();
	$('#loadingImg').show();
}

function closeLoadingWithMask() {
	$('#mask, #loadingImg').hide();
	$('#mask, #loadingImg').empty();
}

function viewSelected(naverCode) {
	var coordinate = [];
	var zoomLevel = 11;

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
	}

	else if (naverCode === 6) {
		coordinate = [35.8383974839094, 128.5668823913586];
	}

	else if (naverCode === 7) {
		coordinate = [36.34661102368089, 127.40585548936683];
	}

	else if (naverCode === 8) {
		coordinate = [35.173219844383105, 129.04001281778324];
	}

	else if (naverCode === 9) {
		coordinate = [37.558033800475805, 127.00829015424965];
	}

	else if (naverCode === 10) {
		coordinate = [35.55768272122909, 129.25686823889524];
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
	}

	mapOptions = {
		center: new naver.maps.LatLng(coordinate[0], coordinate[1]),
		mapTypes: new naver.maps.MapTypeRegistry({
			'normal': naver.maps.NaverStyleMapTypeOption.getVectorMap()	// 레이어 없는 지도
		}),
		zoom: zoomLevel,
		minZoom: (zoomLevel - 1),
		maxZoom: (zoomLevel + 1),

		zoomControlOptions: {
			zoomControl: true,
			position: naver.maps.Position.TOP_RIGHT
		}
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

function regionJsonLoop(selectedCity) {
	var HOME_PATH = '../resources/map',
		urlPrefix = HOME_PATH + '/detailRegionJson/detail',
		urlSuffix = '.json',
		loadCount = 0;

	naver.maps.Event.once(map, 'init_stylemap', function() {
		var keyword;
		spinner();
		for (var i = 1; i < 268; i++) {
			if (selectedCity === 0) {
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
							startDataLayer(selectedCity);
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

function startDataLayer(selectedCity) {

	var tooltip = $('<div style="position:absolute;z-index:1000;padding:5px 10px;background-color:#fff;border:solid 2px #000;font-size:14px;pointer-events:none;display:none;"></div>');
	tooltip.appendTo(map.getPanes().floatPane);

	map.data.setStyle(function(feature) {
		if (selectedCity === 0) {
			if (feature.getProperty('area2') == '') {
				var styleOptions = {
					fillColor: '#FFD8D8',
					fillOpacity: 0,
					strokeColor: '#8C8C8C',
					strokeWeight: 2,
					strokeOpacity: 1
				};
			}

			else if (feature.getProperty('area3') == '') {
				var styleOptions = {
					fillColor: '#F6F6F6',
					fillOpacity: 1,
					strokeColor: '#8C8C8C',
					strokeWeight: 1,
					strokeOpacity: 1
				};
			}
			else {
				var styleOptions = {	// 여행간 지역 색칠
					fillColor: '#FFC19E',
					fillOpacity: 1,
					strokeColor: '#8C8C8C',
					strokeWeight: 1,
					strokeOpacity: 1
				};
			}
		}
		else {
			if (feature.getProperty('navercode') == selectedCity
				&& feature.getProperty('area2') == '') { // 선택한 도시
				var styleOptions = {
					fillColor: '#FFD8D8',
					fillOpacity: 0.3,
					strokeColor: '#F15F5F',
					strokeWeight: 2,
					strokeOpacity: 1
				};
			}

			else {
				var styleOptions = {	// 나머지 도시
					fillColor: '#FFC19E',
					fillOpacity: 0,
					strokeColor: '#8C8C8C',
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
		regionJsonLoop(naverCodeInt);

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
			fillOpacity: 0.5,
			strokeColor: '#F15F5F',
			strokeWeight: 2,
			strokeOpacity: 1
		});
	});

	map.data.addListener('mouseout', function(e) {
		tooltip.hide().empty();
		map.data.revertStyle();
	});
}