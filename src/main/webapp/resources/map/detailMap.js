var mapOptions,
	regionGeoJson = [];

viewSelected(0);
mapSetOptions();
regionJsonLoopSelected(0);

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
		minZoom: (zoomLevel-1), 
		maxZoom: (zoomLevel+1), 
		
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

function regionJsonLoop(startRegion, endRegion, regionCount, naverCode) {
	var HOME_PATH = '../resources/map',
		urlPrefix = HOME_PATH + '/detailRegionJson/detail',
		urlSuffix = '.json',
		loadCount = 0,
		flag = 0;

	naver.maps.Event.once(map, 'init_stylemap', function() {
		for (var i = startRegion; i < endRegion + 1; i++) {

			if (naverCode !== 0) {	// 도, 광역시 지도 로드할 경우
				if (i === startRegion && flag === 0) {	// 맨 처음에 경계 지도를 로드하기 위함
					keyword = 250 + naverCode + '';	//251~267: 경계지도
					flag = 1;
					i--;
				}

				else {	// 나머지 시군구 지도 로드
					var keyword = i + '';
				}
			}

			else {	// 전국 지도 로드할 경우
				var keyword = i + '';
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

						if (loadCount === regionCount + 1) {
							startDataLayer(naverCode);
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

function regionJsonLoopSelected(navercode) {
	if (navercode === 0) {	// 전국
		regionJsonLoop(1, 267, 266, navercode);
	}

	if (navercode === 1) {
		// 강원: detail60.json~detail77.json, 총 18개, naverCode=01;
		regionJsonLoop(60, 77, 18, navercode);
	}

	else if (navercode === 2) {
		// 경기: detail209.json~detail250.json, 총 42개, naverCode=02;
		regionJsonLoop(209, 250, 42, navercode);
	}

	else if (navercode === 3) {
		// 경남: detail163.json~detail184.json, 총 22개, naverCode=03;
		regionJsonLoop(163, 184, 22, navercode);
	}

	else if (navercode === 4) {
		// 경북: detail185.json~detail208.json, 총 24개, naverCode=04;
		regionJsonLoop(185, 208, 24, navercode);
	}

	else if (navercode === 5) {
		// 광주: detail078.json~detail082.json, 총 5개, naverCode=05;
		regionJsonLoop(78, 82, 5, navercode);
	}

	else if (navercode === 6) {
		// 대구: detail047.json~detail054.json, 총 8개, naverCode=06;
		regionJsonLoop(47, 54, 8, navercode);
	}

	else if (navercode === 7) {
		// 대전: detail055.json~detail059.json, 총 5개, naverCode=07;
		regionJsonLoop(55, 59, 5, navercode);
	}

	else if (navercode === 8) {
		// 부산: detail001.json~detail016.json, 총 16개, naverCode=08;
		regionJsonLoop(1, 16, 16, navercode);
	}

	else if (navercode === 9) {
		// 서울: detail084.json~detail108.json, 총 25개, naverCode=09;
		regionJsonLoop(84, 108, 25, navercode);
	}

	else if (navercode === 10) {
		// 울산: detail111.json~detail115.json, 총 5개, naverCode=10;
		regionJsonLoop(111, 115, 5, navercode);
	}

	else if (navercode === 11) {
		// 인천: detail116.json~detail125.json, 총 10개, naverCode=11;
		regionJsonLoop(116, 125, 10, navercode);
	}

	else if (navercode === 12) {
		// 전남: detail141.json~detail162.json, 총 22개, naverCode=12;
		regionJsonLoop(141, 162, 22, navercode);
	}

	else if (navercode === 13) {
		// 전북: detail126.json~detail140.json, 총 15개, naverCode=13;
		regionJsonLoop(126, 140, 15, navercode);
	}

	else if (navercode === 14) {
		// 제주: detail109.json~detail110.json, 총 2개, naverCode=14;
		regionJsonLoop(109, 110, 2, navercode);
	}

	else if (navercode === 15) {
		// 충남: detail031.json~detail046.json, 총 16개, naverCode=15;
		regionJsonLoop(31, 46, 16, navercode);
	}

	else if (navercode === 16) {
		// 충남: detail017.json~detail030.json, 총 14개, naverCode=16;
		regionJsonLoop(17, 30, 14, navercode);
	}

	else if (navercode === 17) {
		// : detail083.json~detail083.json, 총 14개, naverCode=17;
		regionJsonLoop(83, 83, 1, navercode);
	}
}


var tooltip = $('<div style="position:absolute;z-index:1000;padding:5px 10px;background-color:#fff;border:solid 2px #000;font-size:14px;pointer-events:none;display:none;"></div>');

tooltip.appendTo(map.getPanes().floatPane);

function startDataLayer(naverCode) {
	map.data.setStyle(function(feature) {
		if (naverCode === 0) {
			if (feature.getProperty('area2') == '') {
				var styleOptions = {
					fillColor: '#FFD8D8',
					fillOpacity: 0,
					strokeColor: '#8C8C8C',
					strokeWeight: 1,
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
				var styleOptions = {
					fillColor: '#FFC19E',
					fillOpacity: 1,
					strokeColor: '#8C8C8C',
					strokeWeight: 1,
					strokeOpacity: 1
				};
			}
		}
		else {
			var styleOptions = {
				fillColor: '#F6F6F6',
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
		var feature = e.feature,
			naverCodeInt = parseInt(feature.getProperty('navercode'));

		viewSelected(naverCodeInt);
		mapSetOptions();
		regionGeoJson = [];
		regionJsonLoopSelected(naverCodeInt);

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