let mapOptions,
	regionGeoJson = [],
	readDBArray = [],
	loactionArray = [],
	geocodeArray = [],
	polyLineArray = [],
	markerInfoArray = [],
	marker,
	markers = [],
	infoWindows = [];



readDB();
initMap();


function readDB() {

	$.ajax({
		url: "/root/ajaxMap.do",
		Type: "POST",
		data: readDBArray,
		dataType: "json",
		success: function(data) {
			if (data.length == 0)
				alert("결과가 없습니다");
			else {
				readDBArray = data;
			}
		},
		error: function() {
			//alert("에러");
		}
	});
}

function makeArrayLocation() {	// ajax로 받은 데이터 중 location1, location2, location3 만 배열로 생성

	let j = 0;

	for (let i = 0; i < readDBArray.length; i++) {
		(readDBArray[i].location1 == null) ?
			(loactionArray[j++] = 'no Location!!') : (loactionArray[j++] = readDBArray[i].location1);

		(readDBArray[i].location2 == null) ?
			(loactionArray[j++] = 'no Location!!') : (loactionArray[j++] = readDBArray[i].location2);

		(readDBArray[i].location3 == null) ?
			(loactionArray[j++] = 'no Location!!') : (loactionArray[j++] = readDBArray[i].location3);
	}
}

function geocoding() {	// 주소를 좌표로 변환 (마커를 찍기 전 좌표 구하기)

	for (let i = 0; i < loactionArray.length; i++) {
		if (loactionArray[i] != 'no Location!!') {
			naver.maps.Service.geocode({
				address: loactionArray[i]
			},

				function(status, response) {
					if (status !== naver.maps.Service.Status.OK) {
						return alert('Something wrong!');
					}

					else {
						let result = response.result, // 검색 결과의 컨테이너
							items = result.items; // 검색 결과의 배열

						geocodeArray[i] = items[0].point;

						if (i == loactionArray.length - 1) {
							markers.push(geocodeArray);
							setTimeout("makeMarkers()", 500);
						}
					}
				});
		}
	}
}

function makeMarkers() {	// 마커 찍기

	let markerURL = "/root/resources/map/img/marker",
		markerTail = ".png",
		markerColor;
	let num = 0;
	markerInfoArray = [];

	for (let i = 0; i < geocodeArray.length; i++) {

		if (i % 3 == 0) {

			if (readDBArray[i / 3].person == 1) {
				markerColor = "Red";
			}

			else if (readDBArray[i / 3].person == 2) {
				markerColor = "Green";
			}

			else if (readDBArray[i / 3].person == 3) {
				markerColor = "Purple";
			}

			else {
				markerColor = "Yellow";
			}
		}

		if (geocodeArray[i] != null) {

			num = parseInt(i / 3);
			marker = new naver.maps.Marker({
				title: readDBArray[num].title,
				position: new naver.maps.LatLng(geocodeArray[i]),
				map: map,
				icon: {
					url: markerURL + markerColor + markerTail,
					anchor: new naver.maps.Point(15, 32)
				},
				zIndex: 800

			});

			markerInfoArray.push(marker);
		}
	}

	drawPolyline();
}

function drawPolyline() {	// 폴리라인 그리기

	let cnt = 1,
		polyLineColor;

	for (let j = 0; j < geocodeArray.length; j++) {

		if (j % 3 == 0) {

			if (readDBArray[j / 3].person == 1) {
				polyLineColor = "#F15F5F";	// with markerRed
			}

			else if (readDBArray[j / 3].person == 2) {
				polyLineColor = "#9FC93C";	//with markerGreen
			}

			else if (readDBArray[j / 3].person == 3) {
				polyLineColor = "#6B66FF";	//with markerPurple
			}

			else {
				polyLineColor = "#FFBB00";	//with markerYellow
			}
		}

		if (cnt % 3 == 0) {

			if (geocodeArray[cnt - 3].x == geocodeArray[cnt - 2].x && geocodeArray[cnt - 3].y == geocodeArray[cnt - 2].y) {	// 등록된 주소가 하나일 경우 화살표 없는 라인으로 그리기
				let polyLine = new naver.maps.Polyline({
					path: [
						new naver.maps.LatLng((geocodeArray[cnt - 3].y), (geocodeArray[cnt - 3].x)),
						new naver.maps.LatLng((geocodeArray[cnt - 2].y), (geocodeArray[cnt - 2].x)),
						new naver.maps.LatLng((geocodeArray[cnt - 1].y), (geocodeArray[cnt - 1].x))
					],
					map: map,
					startIcon: naver.maps.PointingIcon.CIRCLE,
					startIconSize: 12,
					strokeColor: polyLineColor,
					strokeOpacity: 1,
					strokeWeight: 3,
				})
			}

			else {
				let polyLine = new naver.maps.Polyline({	// 화살표를 포함한 라인으로 그리기
					path: [
						new naver.maps.LatLng((geocodeArray[cnt - 3].y), (geocodeArray[cnt - 3].x)),
						new naver.maps.LatLng((geocodeArray[cnt - 2].y), (geocodeArray[cnt - 2].x)),
						new naver.maps.LatLng((geocodeArray[cnt - 1].y), (geocodeArray[cnt - 1].x))
					],
					map: map,
					startIcon: naver.maps.PointingIcon.CIRCLE,
					startIconSize: 12,
					endIcon: naver.maps.PointingIcon.BLOCK_ARROW,
					endIconSize: 12,
					strokeColor: polyLineColor,
					strokeOpacity: 1,
					strokeWeight: 3,
				})
			}
		}

		cnt++;
	}

	console.log(markerInfoArray);
}

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

	let maskHeight = $(document).height();
	let maskWidth = window.document.body.clientWidth;

	let mask = "<div id='mask' style='position:absolute; z-index:5000; background-color:#000000; display:none;'></div>";
	let loadingImg = '';

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

const coloringMap = '<button class="mapButton1">Coloring Map</button>';
const tripNoteMap = '<button class="mapButton2">Tripnote Map</button>';

naver.maps.Event.once(map, 'init_stylemap', function() {

	let coloringMapControl = new naver.maps.CustomControl(coloringMap, {
		position: naver.maps.Position.TOP_LEFT
	});

	let tripNoteMapControl = new naver.maps.CustomControl(tripNoteMap, {
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

	let coordinate,
		zoomLevel;

	if (naverCode == 0) {
		coordinate = [35.797336021559566, 127.61588108068118];
		zoomLevel = 7;
	}

	else if (naverCode == 1) {
		coordinate = [37.77875952149849, 128.45614856831327];
		zoomLevel = 9;
	}

	else if (naverCode == 2) {
		coordinate = [37.58828996787081, 127.13976342063229];
		zoomLevel = 9;
	}

	else if (naverCode == 3) {
		coordinate = [35.312485951670965, 128.35904991977813];
		zoomLevel = 9;
	}

	else if (naverCode == 4) {
		coordinate = [36.43746228571184, 128.8171692594408];
		zoomLevel = 9;
	}

	else if (naverCode == 5) {
		coordinate = [35.161845215083254, 126.85388112266982];
		zoomLevel = 11;
	}

	else if (naverCode == 6) {
		coordinate = [35.8383974839094, 128.5668823913586];
		zoomLevel = 11;
	}

	else if (naverCode == 7) {
		coordinate = [36.34661102368089, 127.40585548936683];
		zoomLevel = 11;
	}

	else if (naverCode == 8) {
		coordinate = [35.173219844383105, 129.04001281778324];
		zoomLevel = 11;
	}

	else if (naverCode == 9) {
		coordinate = [37.558033800475805, 127.00829015424965];
		zoomLevel = 11;
	}

	else if (naverCode == 10) {
		coordinate = [35.55768272122909, 129.25686823889524];
		zoomLevel = 11;
	}

	else if (naverCode == 11) {
		coordinate = [37.59638345853803, 126.57388688320925];
		zoomLevel = 9;
	}

	else if (naverCode == 12) {
		coordinate = [34.85810739384981, 126.80346385232812];
		zoomLevel = 9;
	}

	else if (naverCode == 13) {
		coordinate = [35.6885872249758, 127.15127296373089];
		zoomLevel = 9;
	}

	else if (naverCode == 14) {
		coordinate = [33.376879301851545, 126.57380581097621];
		zoomLevel = 11;
	}

	else if (naverCode == 15) {
		coordinate = [36.50970606936858, 126.91170070309774];
		zoomLevel = 9;
	}

	else if (naverCode == 16) {
		coordinate = [36.640848853510505, 127.99312538689517];
		zoomLevel = 9;
	}

	else if (naverCode == 17) {
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

	let urlPrefix = '/root/resources/map/detailRegionJson/detail',
		urlSuffix = '.json',
		loadCount = 0;

	spinner(2000);

	naver.maps.Event.once(map, 'init_stylemap', function() {
		let keyword;

		for (let i = 1; i < 268; i++) {
			if (mapType == 1 || mapType == 3) {
				keyword = i + '';
			}

			else {
				keyword = (268 - i) + '';
			}

			if (keyword.length == 1) {
				keyword = '00' + keyword;
			}

			else if (keyword.length == 2) {
				keyword = '0' + keyword;
			}

			$.ajax({
				url: urlPrefix + keyword + urlSuffix,
				success: function(idx) {
					return function(geojson) {
						regionGeoJson[idx] = geojson;
						loadCount++;

						if (loadCount == 267) {
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

	const tooltip = $('<div style="position:absolute;z-index:1000;padding:5px 10px;background-color:#fff;border:solid 2px #000; font-family: HCR Batang; font-weight:bold; font-size:14px;pointer-events:none;display:none;"></div>');
	tooltip.appendTo(map.getPanes().floatPane);
	makeArrayLocation();

	map.data.setStyle(function(feature) {

		if (mapType == 1 || mapType == 2) {	// Coloring Map

			if (feature.getProperty('area2') == '') {	// 도, 광역시
				var styleOptions = {
					fillColor: '#F6F6F6',
					fillOpacity: 0,
					strokeColor: '#FFFFFF',
					strokeWeight: 2,
					strokeOpacity: 1,
					zIndex : 500
				};
			}

			else {	// 시군구
				var styleOptions = {
					fillColor: '#F6F6F6',
					fillOpacity: 0,
					strokeColor: '#FFFFFF',
					strokeWeight: 1,
					strokeOpacity: 0.5,
					zIndex : 500
				};
			}

			for (let i = 0; i < loactionArray.length; i++) { // 여행기록이 있는 지역 색칠

				if (feature.getProperty('area3') != '') {
					if (loactionArray[i].indexOf(feature.getProperty('area3')) != -1
						&& loactionArray[i].indexOf(feature.getProperty('area2')) != -1) {

						var styleOptions = {
							fillColor: '#FF9090',
							fillOpacity: 1,
							strokeColor: '#FFFFFF',
							strokeWeight: 1,
							strokeOpacity: 0.5,
							zIndex : 500
						};
					}
				}

				else if (feature.getProperty('area2') != '') {
					if (loactionArray[i].indexOf(feature.getProperty('area2')) != -1
						&& loactionArray[i].indexOf(feature.getProperty('area1')) != -1) {

						var styleOptions = {
							fillColor: '#FF9090',
							fillOpacity: 1,
							strokeColor: '#FFFFFF',
							strokeWeight: 1,
							strokeOpacity: 0.5,
							zIndex : 500
						};
					}
				}
			}
		}

		else if (mapType == 3 || mapType == 4) {	// TripNote Map
			if (feature.getProperty('area2') == '') {	// 도, 광역시
				var styleOptions = {
					fillColor: '#F6F6F6',
					fillOpacity: 0,
					strokeColor: '#FFFFFF',
					strokeWeight: 2,
					strokeOpacity: 1,
					zIndex : 500
				};
			}
			else {
				var styleOptions = {	// 시군구
					fillColor: '#F6F6F6',
					fillOpacity: 0,
					strokeColor: '#FFFFFF',
					strokeWeight: 1,
					strokeOpacity: 0.5,
					zIndex : 500
				};
			}
		}

		return styleOptions;
	});

	regionGeoJson.forEach(function(geojson) {
		map.data.addGeoJson(geojson);
	});

	if (mapType == 3 || mapType == 4) {
		geocoding();
	}

	if (mapType != 4) {

		map.data.addListener('click', function(e) {
			let feature = e.feature,
				naverCodeInt = parseInt(feature.getProperty('navercode'));

			console.log(feature);

			viewSelected(naverCodeInt);
			mapSetOptions();
			regionGeoJson = [];

			//1:컬러링 도,광역시 / 2:컬러링 시군구 / 3: 트립노트 도,광역시/ 4: 트립노트 시군구

			if (mapType == 1) {
				regionJsonLoop(2);
			}

			else if (mapType == 2) {
				regionJsonLoop(4);
			}

			else {
				regionJsonLoop(4);
			}
		});
	}

	else {
		// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
		for (let i = 0; i < markerInfoArray.length; i++) {
			naver.maps.Event.addListener(markerInfoArray[i], 'click', getClickHandler(i));
		}
	}

	map.data.addListener('mouseover', function(e) { // 마우스 올린 상태
		let feature = e.feature,
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
			strokeOpacity: 1,
		});
	});

	map.data.addListener('mouseout', function(e) {
		tooltip.hide().empty();
		map.data.revertStyle();
	});

	naver.maps.Event.addListener(map, 'idle', function() {
		updateMarkers(map, markerInfoArray);
	});
}

function updateMarkers(map, markers) {

	let mapBounds = map.getBounds();
	let marker, position;

	for (let i = 0; i < markerInfoArray.length; i++) {
		marker = markers[i]
		position = marker.getPosition();

		if (mapBounds.hasLatLng(position)) {
			showMarker(map, marker);
		}

		else {
			hideMarker(map, marker);
		}
	}
}

function showMarker(map, marker) {

	if (marker.setMap()) return;
	marker.setMap(map);
}

function hideMarker(map, marker) {

	if (!marker.setMap()) return;
	marker.setMap(null);
}



function getClickHandler(seq) {
	console.log("clickclickclickclickclick");
	console.log(seq);

	return function(e) {
		let testmarker = markerInfoArray[seq],
			infoWindow = infoWindows[seq];
		console.log("markerInfoArray[i]markerInfoArray[i]markerInfoArray[i]");
		/*if (infoWindow.getMap()) {
			infoWindow.close();
		} else {
			infoWindow.open(map, testmarker);
		}*/
	}
}