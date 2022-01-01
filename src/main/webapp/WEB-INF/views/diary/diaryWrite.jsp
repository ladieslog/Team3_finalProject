<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 작성페이지</title>


<link rel="stylesheet" href="${contextPath }/resources/diarycss/diaryWriteCss.css?ver=1">

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
	<div class="modal" id="modal" style="visibility: hidden;">
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

<div id="non" style="visibility: hidden;">
	<div class="map_wrap" id="mapwrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;display: none;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;" style="display: flex; align-items: center;margin-left: 5px;font-weight: bold;">
                    키워드 : &nbsp;<input type="text" value="KG아이티뱅크" id="keyword" size="15" style="border: 1px solid gray; border-radius: 5px;"> 
                    <button type="submit" style="border: none; color:gray;">♥</button> 
                    <img src="${contextPath }/resources/diaryimg/delete.png" style="height: 10px; width: 10px; margin-left: 124px; margin-bottom: 10px;" onclick="mapnone()">
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
</div>

<script src="<%=request.getContextPath()%>/resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5d72e7cbb7ab20aa12aa5a72991fde0&libraries=services"></script>
<script type="text/javascript" src="${contextPath}/resources/diaryscript/diaryWriteScript.js?ver=2"></script>
</body>
</html>
