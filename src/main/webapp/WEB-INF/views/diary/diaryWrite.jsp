<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 작성페이지</title>
<<<<<<< HEAD
<link rel="stylesheet" href="${contextPath }/resources/diarycss/diaryWriteCss.css?ver=1">

=======
<link rel="stylesheet" href="${contextPath }/resources/diarycss/diaryWriteCss.css?ver=2">
<style>
	.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
>>>>>>> master
</head>
<body style="overflow-x: hidden">
	<% HttpSession session1 = request.getSession();
		if(session1.getAttribute("loginUser") == null){
			response.sendRedirect("error");
		}
	%>
	<jsp:include page="../default/header.jsp"/>
	<div class="writewrap">
	<div class="div">
	
	
	
	<form id="form" action="writeSave" method="post" enctype="multipart/form-data">
	<div class="modal" id="modal" style="display:none;">
		<div class="b">
		<input type="text" id="place" class="te2" readonly>
		<input type="button" value="Search" onclick="mapSearch()" class="sub">
		<input type="button" value="Save" onclick="save()" class="sub">
		<input type="button" value="Cancle" onclick="cancle()" class="sub">
		<input type="hidden" name="place1" id="place1" value="">
		<input type="hidden" name="place2" id="place2" value="">
		<input type="hidden" name="place3" id="place3" value="">
		</div>
	</div>
	<div class="div2">
	<br><br>
	<sapn class="b">Title</sapn> 
	<input type="text" id="title" name="title" class="te1" style="font-family: HCR Batang; font-weight: bold; height: 15px;">&nbsp;&nbsp;
	<sapn class="b">Place</sapn> 
	<input type="text" onclick="placeList()" class="te2" autocomplete="off" id="placeinput" style="font-family: HCR Batang; font-weight: bold; height: 15px;">
	<img class="img2" onclick="modal()" src="${contextPath }/resources/diaryimg/diary_plus.png">
	<sapn class="b">Who</sapn>
	<select name="who" id="who" class="te3" style="font-family: HCR Batang; font-weight: bold; height: 25px;">
		<option value="1">혼자</option>
		<option value="2">가족</option>
		<option value="3">친구</option>
		<option value="4">연인</option>
	</select>&nbsp;&nbsp;
	<sapn class="b">Start Date</sapn> 
	<input type="date" name="indate" id="indate" class="te4" style="font-family: HCR Batang; font-weight: bold; height: 20px;">
	&nbsp;&nbsp;
	<sapn class="b">End Date</sapn> 
	<input type="date" name="outdate" id="outdate" class="te4" style="font-family: HCR Batang; font-weight: bold; height: 20px;">
	</div>
	
	<div class="placeList" id="placeList" style="display: none;">
	<!-- div와 img 태그를 미리 만들어놓음 -->
		<div id="pla1">
			<div id="placename1"></div>
			<img src="${contextPath }/resources/diaryimg/delete.png" class="placedel" id="placedel2" onclick="delete1();"/>
		</div>
		<div id="pla2">
			<div id="placename2"></div>
			<img src="${contextPath }/resources/diaryimg/delete.png" class="placedel" id="placedel2" onclick="delete2();"/>
		</div>
		<div id="pla3">
			<div id="placename3"></div>
			<img src="${contextPath }/resources/diaryimg/delete.png" class="placedel" id="placedel3" onclick="delete3();"/>
		</div>
	</div>
	
		<table class="table"  >
			<tr>
				<th colspan="1" class="tdwr b">
				<input type="button" value="Writing" onclick="content1()" class="btnwi" id="wbtn1">
				<input type="button" value="Writing" onclick="content2()" class="btnwi" id="wbtn2" style="display: none">
				<input type="button" value="Writing" onclick="content3()" class="btnwi" id="wbtn3" style="display: none">
				<input type="button" value="Writing" onclick="content4()" class="btnwi" id="wbtn4" style="display: none">
				<input type="button" value="Writing" onclick="content5()" class="btnwi" id="wbtn5" style="display: none">
				</th>
				<th colspan="1" class="tdwr b">
				<input type="button" value="Image" onclick="image1()" class="btnwi" id="ibtn1">
				<input type="button" value="Image" onclick="image2()" class="btnwi" id="ibtn2" style="display: none">
				<input type="button" value="Image" onclick="image3()" class="btnwi" id="ibtn3" style="display: none">
				<input type="button" value="Image" onclick="image4()" class="btnwi" id="ibtn4" style="display: none">
				<input type="button" value="Image" onclick="image5()" class="btnwi" id="ibtn5" style="display: none">
				</th>
				
			</tr>
			
			<tr>
			<div>
				<td colspan="15" >
				
				<div id="" style="width:1063px; height:435px; ">
			<div id="view1">
					<div id="content1">
							<textarea id="coment1" class='text' style='height:430px; width:1050px; font-family: HCR Batang; font-weight: bold;' name="coment1"></textarea>
					</div>
					
					
					<div id="image1" style="display:none;">
						<input type="file" id="file1" name="image_file_name1" onchange="readURL1(this);" style="display:none;"/>
						<img id="preview1" onclick="document.all.image_file_name1.click();"
							style='height:360px; width:600px;' src='${contextPath }/resources/diaryimg/diary_plus.png'>
							<input type="hidden" value="0" id="imgChk1">
							<input type="hidden" id="fileChk1" name="fileChk1" value="">
						<textarea id="comentimage1" style='width:900px; height: 50px; font-family: HCR Batang; font-weight: bold;'class='text' name="comentimage1"></textarea>
					</div>
			</div>
		<!-- ---------------------------------------------------------------------------------------------------------------- -->			
				<div id="view2" style="display:none;">
						<div id="content2"  >
							<textarea id="coment2" class='text' style='height:430px; width:1050px;  font-family: HCR Batang; font-weight: bold;' name="coment2"></textarea>
					</div>
					
					<div id="image2" style="display:none;">
						<input type="file" id="file2" name="image_file_name2" onchange="readURL2(this);" style="display:none;"/>
						<img id="preview2" onclick="document.all.image_file_name2.click();"
							style='height:360px; width:600px;' src='${contextPath }/resources/diaryimg/diary_plus.png'>
							<input type="hidden" value="0" id="imgChk2">
							<input type="hidden" id="fileChk2" name="fileChk2" value="">
						<textarea id="comentimage2" style='width:900px; height: 50px;  font-family: HCR Batang; font-weight: bold;'class='text' name="comentimage2"></textarea>
					</div>
				</div>
		<!-- ---------------------------------------------------------------------------------------------------------------- -->			
				<div id="view3" style="display:none;">		
						<div id="content3">
							<textarea id="coment3" class='text' style='height:430px; width:1050px;  font-family: HCR Batang; font-weight: bold;' name="coment3"></textarea>
					</div>
					
					<div id="image3" style="display:none;">
						<input type="file" id="file3" name="image_file_name3" onchange="readURL3(this);" style="display:none;"/>
						<img id="preview3" onclick="document.all.image_file_name3.click();"
							style='height:360px; width:600px;' src='${contextPath }/resources/diaryimg/diary_plus.png'>
							<input type="hidden" value="0" id="imgChk3">
							<input type="hidden" id="fileChk3" name="fileChk3" value="">
						<textarea id="comentimage3" style='width:900px; height: 50px;  font-family: HCR Batang; font-weight: bold;' class='text' name="comentimage3"></textarea>
					</div>
					</div>
		<!-- ---------------------------------------------------------------------------------------------------------------- -->			
				<div id="view4" style="display:none;">		
						<div id="content4">
							<textarea id="coment4" class='text' style='height:430px; width:1050px;  font-family: HCR Batang; font-weight: bold;' name="coment4"></textarea>
					</div>
					
					<div id="image4" style="display:none;">
						<input type="file" id="file4" name="image_file_name4" onchange="readURL4(this);" style="display:none;"/>
						<img id="preview4" onclick="document.all.image_file_name4.click();"
							style='height:360px; width:600px;' src='${contextPath }/resources/diaryimg/diary_plus.png'>
							<input type="hidden" value="0" id="imgChk4">
							<input type="hidden" id="fileChk4" name="fileChk4" value="">
						<textarea id="comentimage4" style='width:900px; height: 50px;  font-family: HCR Batang; font-weight: bold;'class='text' name="comentimage4"></textarea>
					</div>
					</div>
		<!-- ---------------------------------------------------------------------------------------------------------------- -->			
				<div id="view5" style="display:none;">		
						<div id="content5">
							<textarea id="coment5" class='text' style='height:430px; width:1050px;  font-family: HCR Batang; font-weight: bold;' name="coment5"></textarea>
					</div>
					
					<div id="image5" style="display:none;">
						<input type="file" id="file5" name="image_file_name5" onchange="readURL5(this);" style="display:none;"/>
						<img id="preview5" onclick="document.all.image_file_name5.click();"
							style='height:360px; width:600px;' src='${contextPath }/resources/diaryimg/diary_plus.png'>
							<input type="hidden" value="0" id="imgChk5">
							<input type="hidden" id="fileChk5" name="fileChk5" value="">
						<textarea id="comentimage5" style='width:900px; height: 50px;  font-family: HCR Batang; font-weight: bold;'class='text' name="comentimage5"></textarea>
					</div>
					</div>			
					
				</div>	
				</td>
			</div>
			</tr>

			<tr>
				<td class="td1">
				<img class="td2" onclick="del1()" src="${contextPath }/resources/diaryimg/delete.png"> 
			 	<img id="previewimage1" style="align-items: center;"onclick="page0()"class="img" src="${contextPath }/resources/diaryimg/trip.png" >
				</td> 
						
				<td class="td1">
				<img class="td2" id="de2" style="display:none;" onclick="del2()" src="${contextPath }/resources/diaryimg/delete.png">
				<img id="previewimage2" style=""onclick="page1()" class="img" src="${contextPath }/resources/diaryimg/diary_plus.png">
				</td> 
				
				<td class="td1" id="pre1"  style="display:none;">
				<img class="td2" id="de3" style="display:none;" onclick="del3()"  src="${contextPath }/resources/diaryimg/delete.png">
				<img id="previewimage3" style=""onclick="page2()" class="img" src="${contextPath }/resources/diaryimg/diary_plus.png">
				</td> 
				
				<td class="td1" id="pre2"  style="display:none;">
				<img class="td2" id="de4" style="display:none;" onclick="del4()"  src="${contextPath }/resources/diaryimg/delete.png">
				<img id="previewimage4" style=" "onclick="page3()" class="img" src="${contextPath }/resources/diaryimg/diary_plus.png">
				</td> 
				
				<td class="td1" id="pre3"  style="display:none;">
				<img class="td2" id="de5" style="display:none;" onclick="del5()"  src="${contextPath }/resources/diaryimg/delete.png">
				<img id="previewimage5" style=""onclick="page4()" class="img" src="${contextPath }/resources/diaryimg/diary_plus.png">
				</td> 
				
				
				<td></td> <td></td> <td></td> <td></td> <td></td>  
				
				<td class="submit">
				<input type="button" value="Cancel" class="sub" onClick="location.href='diaryBoard'">
				</td>
				<td class="submit"><input type="button" onclick="register()" value="Complete" class="sub"></td>
			</tr>
			
			<tr>
			</tr>
		</table>
	</form>
	</div>
	
	
	</div>
	
	<jsp:include page="../default/footer.jsp"/>
<<<<<<< HEAD
	<div class="map_wrap" id="mapwrap" name="mapwrap" style="display: none">
		<div id="map1"
			style="width: 100%; height: 100%; position:absolute; overflow: hidden;"></div>

		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15">
						<button type="submit">검색하기</button>
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>

<script src="<%=request.getContextPath()%>/resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5d72e7cbb7ab20aa12aa5a72991fde0&libraries=services"></script>
<script type="text/javascript" src="${contextPath}/resources/diaryscript/diaryWriteScript.js?ver=1"></script>

=======
	
	<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
<script src="<%=request.getContextPath()%>/resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5d72e7cbb7ab20aa12aa5a72991fde0&libraries=services"></script>
<script type="text/javascript" src="${contextPath}/resources/diaryscript/diaryWriteScript.js?ver=2"></script>
<script>
//마커를 담을 배열입니다
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
>>>>>>> master
</body>
</html>
message.txt
13KB