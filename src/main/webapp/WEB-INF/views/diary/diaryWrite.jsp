<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>diaryWrite</title>
<style type="text/css">
	.writewrap{ margin:auto; height: 650px;  background-color: #DEF4F9; color:black;}
	.img{height: 50px; width: 80px;}
	.img2{right: 28px; height: 20px; width: 20px; position: relative; top: 6px}
	.div{ text-align: center;}
	.div2{ margin-right: 105px;}
	.text{font-size: 15px; border-radius: 5px; border-color: white;}
	.table{display: flex; justify-content: center; align-items: center; margin-top: 20px;}
	.te1{ width:300px; border-radius: 5px; border-color: white;}
	.te2{ width:150px; border-radius: 5px; border-color: white;}
	.te3{ width:100px; border-radius: 5px; border-color: white;}
	.te4{ width:125px; border-radius: 5px; border-color: white;}
	
	.td1{ width: 110px; height: 50px;   text-align: center;}
	.td2{ height: 0px; width: 0px; }
	.td1:hover>.td2{ height: 15px; width: 15px; text-align:left; }
	
	.submit{ width:80px; height:20px; }
	.sub{ background-color: #DEF4F9 ; font-size: 15px; color:black; border-radius: 5px; border-color: #DEF4F9; font-family: Georgia; }
	.b{ font-family: Georgia; font-size:20px;}
	
	.tdwr{ width:80px; height:20px; }
	.btnwi{ background-color: #DEF4F9 ; color:black; border-radius: 5px; border-color: #DEF4F9; 
			font-family: Georgia; font-size:18px;}
	
	.modal{   position: fixed;  top: 29%;  left: 37.28%; }
	.placeList{ width: 158px;  background-color: white;  left: 37.3%;  border-radius: 5px;  position: absolute; }
	.placeList>div{ display: flex; justify-content: space-between;  align-items: center; }
	.placeList>div:nth-of-type(1){ border-bottom: 3px solid #DEF4F9; }
	.placeList>div:nth-of-type(2){ border-bottom: 3px solid #DEF4F9; }
	.placeList>div:nth-of-type(3){ border-bottom: 3px solid #DEF4F9; }
	.placeList>div:hover>.placedel{ height: 10px; width: 10px; }
	
	.placedel{ height: 0px; width: 0px; }

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.7.min.js"></script>

<script type="text/javascript">
	var check1 = 0;
	var check2 = 0;
	var check3 = 0;
	var check4 = 0;
	var check5 = 0;
	var pageNum = 1;
function readURL1(input) {	
	var file = input.files[0] 
	console.log(file)
	if (file != '') {
		var reader = new FileReader();
		reader.readAsDataURL(file); 
		reader.onload = function(e) { 
			$('#preview1').attr('src', e.target.result);
			$('#previewimage1').attr('src', e.target.result);
			$('#imgChk1').val('1')
			$('#fileChk1').val(e.target.result);
		}
	}
}

function content1(){
	check1 = 0;
	document.getElementById("content1").style.display='block';
	document.getElementById("image1").style.display='none';
	
	$('#preview1').attr('src', '${contextPath }/resources/diary_plus.png' )
	$('#previewimage1').attr('src', '${contextPath }/resources/diary_plus.png' )
	$('#imgChk1').val('0')
	
	document.getElementById("coment1").value="";
}
function image1(){
	check1 = 1;
	document.getElementById("content1").style.display='none';
	document.getElementById("image1").style.display='block';
	
	document.getElementById("comentimage1").value="";
}
function page0(){
	if(pageNum == 1){
		return;
	}
	if(pageNum == 2){
		if(check2 == 0){
			if(document.getElementById("coment2").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk2").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage2").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	if(pageNum == 3){
		if(check3 == 0){
			if(document.getElementById("coment3").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk3").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage3").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	if(pageNum == 4){
		if(check4 == 0){
			if(document.getElementById("coment4").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk4").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage4").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	if(pageNum == 5){
		if(check5 == 0){
			if(document.getElementById("coment5").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk5").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage5").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	document.getElementById("view1").style.display='block';
	document.getElementById("view2").style.display='none';
	document.getElementById("view3").style.display='none';
	document.getElementById("view4").style.display='none';
	document.getElementById("view5").style.display='none';
	document.getElementById("wbtn1").style.display='revert';
	document.getElementById("ibtn1").style.display='revert';
	document.getElementById("wbtn2").style.display='none';
	document.getElementById("ibtn2").style.display='none';
	document.getElementById("wbtn3").style.display='none';
	document.getElementById("ibtn3").style.display='none';
	document.getElementById("wbtn4").style.display='none';
	document.getElementById("ibtn4").style.display='none';
	document.getElementById("wbtn5").style.display='none';
	document.getElementById("ibtn5").style.display='none';
	pageNum = 1;
}

function page1(){
	if(pageNum == 2){
		return;
	}
	
	if(pageNum == 1){
		if(check1 == 0){
			if(document.getElementById("coment1").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk1").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage1").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	if(pageNum == 3){
		if(check3 == 0){
			if(document.getElementById("coment3").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk3").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage3").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	if(pageNum == 4){
		if(check4 == 0){
			if(document.getElementById("coment4").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk4").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage4").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	if(pageNum == 5){
		if(check5 == 0){
			if(document.getElementById("coment5").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk5").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage5").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	document.getElementById("pre1").style.display='revert';
	
	document.getElementById("view1").style.display='none';
	document.getElementById("view2").style.display='block';
	document.getElementById("view3").style.display='none';
	document.getElementById("view4").style.display='none';
	document.getElementById("view5").style.display='none';
	document.getElementById("wbtn1").style.display='none';
	document.getElementById("ibtn1").style.display='none';
	document.getElementById("wbtn2").style.display='revert';
	document.getElementById("ibtn2").style.display='revert';
	document.getElementById("wbtn3").style.display='none';
	document.getElementById("ibtn3").style.display='none';
	document.getElementById("wbtn4").style.display='none';
	document.getElementById("ibtn4").style.display='none';
	document.getElementById("wbtn5").style.display='none';
	document.getElementById("ibtn5").style.display='none';
	document.getElementById("de2").style.display='revert';
	
	pageNum = 2;
}
// -------------------------------------------------------------- 2번째
function readURL2(input) {	
	var file = input.files[0] 
	console.log(file)
	if (file != '') {
		var reader = new FileReader();
		reader.readAsDataURL(file); 
		reader.onload = function(e) { 
			$('#preview2').attr('src', e.target.result);
			$('#previewimage2').attr('src', e.target.result);
			$('#imgChk2').val('1')
			$('#fileChk2').val(e.target.result);
		}
	}
}

function content2(){
	check2 = 0;
	document.getElementById("content2").style.display='block';
	document.getElementById("image2").style.display='none';
	
	$('#preview2').attr('src', '${contextPath }/resources/diary_plus.png' )
	$('#previewimage2').attr('src', '${contextPath }/resources/diary_plus.png' )
	$('#imgChk2').val('0')
	
	document.getElementById("coment2").value="";
}
function image2(){
	check2 = 1;
	document.getElementById("content2").style.display='none';
	document.getElementById("image2").style.display='block';
	
	document.getElementById("comentimage2").value="";
}

function page2(){
	if(pageNum == 3){
		return;
	}
	
	if(pageNum == 1){
		if(check1 == 0){
			if(document.getElementById("coment1").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk1").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage1").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	if(pageNum == 2){
		if(check2 == 0){
			if(document.getElementById("coment2").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk2").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage2").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	if(pageNum == 4){
		if(check4 == 0){
			if(document.getElementById("coment4").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk4").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage4").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	if(pageNum == 5){
		if(check5 == 0){
			if(document.getElementById("coment5").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk5").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage5").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	document.getElementById("pre2").style.display='revert';
	
	document.getElementById("view1").style.display='none';
	document.getElementById("view2").style.display='none';
	document.getElementById("view3").style.display='block';
	document.getElementById("view4").style.display='none';
	document.getElementById("view5").style.display='none';
	document.getElementById("wbtn1").style.display='none';
	document.getElementById("ibtn1").style.display='none';
	document.getElementById("wbtn2").style.display='none';
	document.getElementById("ibtn2").style.display='none';
	document.getElementById("wbtn3").style.display='revert';
	document.getElementById("ibtn3").style.display='revert';
	document.getElementById("wbtn4").style.display='none';
	document.getElementById("ibtn4").style.display='none';
	document.getElementById("wbtn5").style.display='none';
	document.getElementById("ibtn5").style.display='none';
	document.getElementById("de3").style.display='revert';
	
	pageNum = 3;
}
//-------------------------------------------------------------- 3번째
function readURL3(input) {	
	var file = input.files[0] 
	console.log(file)
	if (file != '') {
		var reader = new FileReader();
		reader.readAsDataURL(file); 
		reader.onload = function(e) { 
			$('#preview3').attr('src', e.target.result);
			$('#previewimage3').attr('src', e.target.result);
			$('#imgChk3').val('1')
			$('#fileChk3').val(e.target.result);
		}
	}
}

function content3(){
	check3 = 0;
	document.getElementById("content3").style.display='block';
	document.getElementById("image3").style.display='none';
	
	$('#preview3').attr('src', '${contextPath }/resources/diary_plus.png' )
	$('#previewimage3').attr('src', '${contextPath }/resources/diary_plus.png' )
	$('#imgChk3').val('0')
	
	document.getElementById("coment3").value="";
}
function image3(){
	check3 = 1;
	document.getElementById("content3").style.display='none';
	document.getElementById("image3").style.display='block';
	
	document.getElementById("comentimage3").value="";
}

function page3(){
	if(pageNum == 4){
		return;
	}
	
	if(pageNum == 1){
		if(check1 == 0){
			if(document.getElementById("coment1").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk1").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage1").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	if(pageNum == 2){
		if(check2 == 0){
			if(document.getElementById("coment2").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk2").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage2").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	if(pageNum == 3){
		if(check3 == 0){
			if(document.getElementById("coment3").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk3").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage3").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	if(pageNum == 5){
		if(check5 == 0){
			if(document.getElementById("coment5").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk5").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage5").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	document.getElementById("pre3").style.display='revert';
	
	document.getElementById("view1").style.display='none';
	document.getElementById("view2").style.display='none';
	document.getElementById("view3").style.display='none';
	document.getElementById("view4").style.display='block';
	document.getElementById("view5").style.display='none';
	document.getElementById("wbtn1").style.display='none';
	document.getElementById("ibtn1").style.display='none';
	document.getElementById("wbtn2").style.display='none';
	document.getElementById("ibtn2").style.display='none';
	document.getElementById("wbtn3").style.display='none';
	document.getElementById("ibtn3").style.display='none';
	document.getElementById("wbtn4").style.display='revert';
	document.getElementById("ibtn4").style.display='revert';
	document.getElementById("wbtn5").style.display='none';
	document.getElementById("ibtn5").style.display='none';
	document.getElementById("de4").style.display='revert';
	
	pageNum = 4;
}
//-------------------------------------------------------------- 4번째
function readURL4(input) {	
	var file = input.files[0] 
	console.log(file)
	if (file != '') {
		var reader = new FileReader();
		reader.readAsDataURL(file); 
		reader.onload = function(e) { 
			$('#preview4').attr('src', e.target.result);
			$('#previewimage4').attr('src', e.target.result);
			$('#imgChk4').val('1')
			$('#fileChk4').val(e.target.result);
		}
	}
}

function content4(){
	check4 = 0;
	document.getElementById("content4").style.display='block';
	document.getElementById("image4").style.display='none';
	
	$('#preview4').attr('src', '${contextPath }/resources/diary_plus.png' )
	$('#previewimage4').attr('src', '${contextPath }/resources/diary_plus.png' )
	$('#imgChk4').val('0')
	
	document.getElementById("coment4").value="";
}
function image4(){
	check4 = 1;
	document.getElementById("content4").style.display='none';
	document.getElementById("image4").style.display='block';
	
	document.getElementById("comentimage4").value="";
}

function page4(){
	if(pageNum == 5){
		return;
	}
	
	if(pageNum == 1){
		if(check1 == 0){
			if(document.getElementById("coment1").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk1").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage1").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	if(pageNum == 2){
		if(check2 == 0){
			if(document.getElementById("coment2").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk2").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage2").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	if(pageNum == 3){
		if(check3 == 0){
			if(document.getElementById("coment3").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk3").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage3").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	if(pageNum == 4){
		if(check4 == 0){
			if(document.getElementById("coment4").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk4").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage4").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	document.getElementById("view1").style.display='none';
	document.getElementById("view2").style.display='none';
	document.getElementById("view3").style.display='none';
	document.getElementById("view4").style.display='none';
	document.getElementById("view5").style.display='block';
	document.getElementById("wbtn1").style.display='none';
	document.getElementById("ibtn1").style.display='none';
	document.getElementById("wbtn2").style.display='none';
	document.getElementById("ibtn2").style.display='none';
	document.getElementById("wbtn3").style.display='none';
	document.getElementById("ibtn3").style.display='none';
	document.getElementById("wbtn4").style.display='none';
	document.getElementById("ibtn4").style.display='none';
	document.getElementById("wbtn5").style.display='revert';
	document.getElementById("ibtn5").style.display='revert';
	document.getElementById("de5").style.display='revert';
	
	pageNum = 5;
}
//-------------------------------------------------------------- 4번째
function readURL5(input) {	
	var file = input.files[0] 
	console.log(file)
	if (file != '') {
		var reader = new FileReader();
		reader.readAsDataURL(file); 
		reader.onload = function(e) { 
			$('#preview5').attr('src', e.target.result);
			$('#previewimage5').attr('src', e.target.result);
			$('#imgChk5').val('1')
			$('#fileChk5').val(e.target.result);
		}
	}
}

function content5(){
	check5 = 0;
	document.getElementById("content5").style.display='block';
	document.getElementById("image5").style.display='none';
	
	$('#preview5').attr('src', '${contextPath }/resources/diary_plus.png' )
	$('#previewimage5').attr('src', '${contextPath }/resources/diary_plus.png' )
	$('#imgChk5').val('0')
	
	document.getElementById("coment5").value="";
}
function image5(){
	check5 = 1;
	document.getElementById("content5").style.display='none';
	document.getElementById("image5").style.display='block';
	
	document.getElementById("comentimage5").value="";
}

// ===================================================================== 지우기
function del1(){
	if(document.getElementById("coment2").value == ""){
		if(document.getElementById("fileChk2").value == ""){
			alert('페이지가 하나밖에 없습니다.')
			return ;
		}
	}
	if(check2 == 0){
		document.getElementById("coment1").value = document.getElementById("coment2").value
		
		document.getElementById("comentimage1").value="";
		document.getElementById("fileChk1").value="";
		$('#preview1').attr('src', '${contextPath }/resources/diary_plus.png')
		$('#previewimage1').attr('src', '${contextPath }/resources/diary_plus.png')
		document.getElementById("content1").style.display='block';
		document.getElementById("image1").style.display='none';
		$('#imgChk1').val('0')
		check1 = 0;
	}else{
		document.getElementById("comentimage1").value = document.getElementById("comentimage2").value
		document.getElementById("fileChk1").value = document.getElementById("fileChk2").value
		$('#preview1').attr('src', document.getElementById("preview2").src)
		$('#previewimage1').attr('src', document.getElementById("previewimage2").src)
		
		document.getElementById("coment1").value="";
		document.getElementById("content1").style.display='none';
		document.getElementById("image1").style.display='block';
		
		$('#imgChk1').val('1')
		check1 = 1;
	}
	if(document.getElementById("coment3").value == ""){
		if(document.getElementById("fileChk3").value == ""){
			document.getElementById("pre1").style.display='none';
			
		}
	}
	
	if(check3 == 0){
		document.getElementById("coment2").value = document.getElementById("coment3").value
		
		document.getElementById("comentimage2").value="";
		document.getElementById("fileChk2").value="";
		$('#preview2').attr('src', '${contextPath }/resources/diary_plus.png')
		$('#previewimage2').attr('src', '${contextPath }/resources/diary_plus.png')
		document.getElementById("content2").style.display='block';
		document.getElementById("image2").style.display='none';
		$('#imgChk2').val('0')
		check2 = 0;
	}else{
		document.getElementById("comentimage2").value = document.getElementById("comentimage3").value
		document.getElementById("fileChk2").value = document.getElementById("fileChk3").value
		$('#preview2').attr('src', document.getElementById("preview3").src)
		$('#previewimage2').attr('src', document.getElementById("previewimage3").src)
		document.getElementById("coment2").value="";
		document.getElementById("content2").style.display='none';
		document.getElementById("image2").style.display='block';
		$('#imgChk2').val('1')
		check2 = 1;
	}
	if(document.getElementById("coment4").value == ""){
		if(document.getElementById("fileChk4").value == ""){
			document.getElementById("pre2").style.display='none';	
		}
	}
	if(check4 == 0){
		document.getElementById("coment3").value = document.getElementById("coment4").value	
		document.getElementById("comentimage3").value="";
		document.getElementById("fileChk3").value="";
		$('#preview3').attr('src', '${contextPath }/resources/diary_plus.png')
		$('#previewimage3').attr('src', '${contextPath }/resources/diary_plus.png')
		document.getElementById("content3").style.display='block';
		document.getElementById("image3").style.display='none';
		$('#imgChk3').val('0')
		check3 = 0;
	}else{
		document.getElementById("comentimage3").value = document.getElementById("comentimage4").value
		document.getElementById("fileChk3").value = document.getElementById("fileChk4").value
		$('#preview3').attr('src', document.getElementById("preview4").src)
		$('#previewimage3').attr('src', document.getElementById("previewimage4").src)	
		document.getElementById("coment3").value="";
		document.getElementById("content3").style.display='none';
		document.getElementById("image3").style.display='block';
		$('#imgChk3').val('1')
		check3 = 1;
	}
	if(document.getElementById("coment5").value == ""){
		if(document.getElementById("fileChk5").value == ""){
			document.getElementById("pre3").style.display='none';		
		}
	}	
	if(check5 == 0){
		document.getElementById("coment4").value = document.getElementById("coment5").value
		document.getElementById("comentimage4").value="";
		document.getElementById("fileChk4").value="";
		$('#preview4').attr('src', '${contextPath }/resources/diary_plus.png')
		$('#previewimage4').attr('src', '${contextPath }/resources/diary_plus.png')
		document.getElementById("content4").style.display='block';
		document.getElementById("image4").style.display='none';
		$('#imgChk4').val('0')
		document.getElementById("coment5").value="";
		check4 = 0;
	}else{
		document.getElementById("comentimage4").value = document.getElementById("comentimage5").value
		document.getElementById("fileChk4").value = document.getElementById("fileChk5").value
		$('#preview4').attr('src', document.getElementById("preview5").src)
		$('#previewimage4').attr('src', document.getElementById("previewimage5").src)
		document.getElementById("comentimage5").value="";
		document.getElementById("fileChk5").value="";
		
		document.getElementById("coment4").value="";
		document.getElementById("content4").style.display='none';
		document.getElementById("image4").style.display='block';
		
		$('#preview5').attr('src', '${contextPath }/resources/diary_plus.png')
		$('#previewimage5').attr('src', '${contextPath }/resources/diary_plus.png')
		$('#imgChk4').val('1')
		check4 = 1;
	}
	document.getElementById("content5").style.display='block';
	document.getElementById("image5").style.display='none';
	check5 = 0;
}
//===================================================================== 지우기
function del2(){
	if(document.getElementById("coment3").value == ""){
		if(document.getElementById("fileChk3").value == ""){
			document.getElementById("pre1").style.display='none';
		}
	}
	if(check3 == 0){
		document.getElementById("coment2").value = document.getElementById("coment3").value
		
		document.getElementById("comentimage2").value="";
		document.getElementById("fileChk2").value="";
		$('#preview2').attr('src', '${contextPath }/resources/diary_plus.png')
		$('#previewimage2').attr('src', '${contextPath }/resources/diary_plus.png')
		document.getElementById("content2").style.display='block';
		document.getElementById("image2").style.display='none';
		$('#imgChk2').val('0')
		check2 = 0;
	}else{
		document.getElementById("comentimage2").value = document.getElementById("comentimage3").value
		document.getElementById("fileChk2").value = document.getElementById("fileChk3").value
		$('#preview2').attr('src', document.getElementById("preview3").src)
		$('#previewimage2').attr('src', document.getElementById("previewimage3").src)
		
		document.getElementById("coment2").value="";
		document.getElementById("content2").style.display='none';
		document.getElementById("image2").style.display='block';
		$('#imgChk2').val('1')
		check2 = 1;
	}
	if(document.getElementById("coment4").value == ""){
		if(document.getElementById("fileChk4").value == ""){
			document.getElementById("pre2").style.display='none';	
		}
	}
	if(check4 == 0){
		document.getElementById("coment3").value = document.getElementById("coment4").value
		
		document.getElementById("comentimage3").value="";
		document.getElementById("fileChk3").value="";
		$('#preview3').attr('src', '${contextPath }/resources/diary_plus.png')
		$('#previewimage3').attr('src', '${contextPath }/resources/diary_plus.png')
		document.getElementById("content3").style.display='block';
		document.getElementById("image3").style.display='none';
		$('#imgChk3').val('0')
		check3 = 0;
	}else{
		document.getElementById("comentimage3").value = document.getElementById("comentimage4").value
		document.getElementById("fileChk3").value = document.getElementById("fileChk4").value
		$('#preview3').attr('src', document.getElementById("preview4").src)
		$('#previewimage3').attr('src', document.getElementById("previewimage4").src)
		
		document.getElementById("coment3").value="";
		document.getElementById("content3").style.display='none';
		document.getElementById("image3").style.display='block';
		$('#imgChk3').val('1')
		check3 = 1;
	}
	if(document.getElementById("coment5").value == ""){
		if(document.getElementById("fileChk5").value == ""){
			document.getElementById("pre3").style.display='none';
			
		}
	}
	if(check5 == 0){
		document.getElementById("coment4").value = document.getElementById("coment5").value
		document.getElementById("comentimage4").value="";
		document.getElementById("fileChk4").value="";
		$('#preview4').attr('src', '${contextPath }/resources/diary_plus.png')
		$('#previewimage4').attr('src', '${contextPath }/resources/diary_plus.png')
		document.getElementById("content4").style.display='block';
		document.getElementById("image4").style.display='none';
		$('#imgChk4').val('0')
		document.getElementById("coment5").value="";
		check4 = 0;
	}else{
		document.getElementById("comentimage4").value = document.getElementById("comentimage5").value
		document.getElementById("fileChk4").value = document.getElementById("fileChk5").value
		$('#preview4').attr('src', document.getElementById("preview5").src)
		$('#previewimage4').attr('src', document.getElementById("previewimage5").src)
		document.getElementById("comentimage5").value="";
		document.getElementById("fileChk5").value="";
		
		document.getElementById("coment4").value="";
		document.getElementById("content4").style.display='none';
		document.getElementById("image4").style.display='block';
		
		$('#preview5').attr('src', '${contextPath }/resources/diary_plus.png')
		$('#previewimage5').attr('src', '${contextPath }/resources/diary_plus.png')
		$('#imgChk4').val('1')
		check4 = 1;
	}
	document.getElementById("content5").style.display='block';
	document.getElementById("image5").style.display='none';
	check5 = 0;
}
//===================================================================== 지우기
function del3(){
	if(document.getElementById("coment4").value == ""){
		if(document.getElementById("fileChk4").value == ""){
			document.getElementById("pre2").style.display='none';	
		}
	}
	if(check4 == 0){
		document.getElementById("coment3").value = document.getElementById("coment4").value
		
		document.getElementById("comentimage3").value="";
		document.getElementById("fileChk3").value="";
		$('#preview3').attr('src', '${contextPath }/resources/diary_plus.png')
		$('#previewimage3').attr('src', '${contextPath }/resources/diary_plus.png')
		document.getElementById("content3").style.display='block';
		document.getElementById("image3").style.display='none';
		$('#imgChk3').val('0')
		check3 = 0;
	}else{
		document.getElementById("comentimage3").value = document.getElementById("comentimage4").value
		document.getElementById("fileChk3").value = document.getElementById("fileChk4").value
		$('#preview3').attr('src', document.getElementById("preview4").src)
		$('#previewimage3').attr('src', document.getElementById("previewimage4").src)
		
		document.getElementById("coment3").value="";
		document.getElementById("content3").style.display='none';
		document.getElementById("image3").style.display='block';
		$('#imgChk3').val('1')
		check3 = 1;
	}
	if(document.getElementById("coment5").value == ""){
		if(document.getElementById("fileChk5").value == ""){
			document.getElementById("pre3").style.display='none';
			
		}
	}
	if(check5 == 0){
		document.getElementById("coment4").value = document.getElementById("coment5").value

		document.getElementById("comentimage4").value="";
		document.getElementById("fileChk4").value="";
		$('#preview4').attr('src', '${contextPath }/resources/diary_plus.png')
		$('#previewimage4').attr('src', '${contextPath }/resources/diary_plus.png')
		document.getElementById("content4").style.display='block';
		document.getElementById("image4").style.display='none';
		$('#imgChk4').val('0')
		document.getElementById("coment5").value="";
		check4 = 0;
	}else{
		document.getElementById("comentimage4").value = document.getElementById("comentimage5").value
		document.getElementById("fileChk4").value = document.getElementById("fileChk5").value
		$('#preview4').attr('src', document.getElementById("preview5").src)
		$('#previewimage4').attr('src', document.getElementById("previewimage5").src)
		document.getElementById("comentimage5").value="";
		document.getElementById("fileChk5").value="";
		
		document.getElementById("coment4").value="";
		document.getElementById("content4").style.display='none';
		document.getElementById("image4").style.display='block';
		
		$('#preview5').attr('src', '${contextPath }/resources/diary_plus.png')
		$('#previewimage5').attr('src', '${contextPath }/resources/diary_plus.png')
		$('#imgChk4').val('1')
		check4 = 1;
	}
	document.getElementById("content5").style.display='block';
	document.getElementById("image5").style.display='none';
	check5 = 0;
}
//===================================================================== 지우기
function del4(){
	if(document.getElementById("coment5").value == ""){
		if(document.getElementById("fileChk5").value == ""){
			document.getElementById("pre3").style.display='none';
			
		}
	}
	if(check5 == 0){
		document.getElementById("coment4").value = document.getElementById("coment5").value

		document.getElementById("comentimage4").value="";
		document.getElementById("fileChk4").value="";
		$('#preview4').attr('src', '${contextPath }/resources/diary_plus.png')
		$('#previewimage4').attr('src', '${contextPath }/resources/diary_plus.png')
		document.getElementById("content4").style.display='block';
		document.getElementById("image4").style.display='none';
		$('#imgChk4').val('0')
		document.getElementById("coment5").value="";
		check4 = 0;
	}else{
		document.getElementById("comentimage4").value = document.getElementById("comentimage5").value
		document.getElementById("fileChk4").value = document.getElementById("fileChk5").value
		$('#preview4').attr('src', document.getElementById("preview5").src)
		$('#previewimage4').attr('src', document.getElementById("previewimage5").src)
		document.getElementById("comentimage5").value="";
		document.getElementById("fileChk5").value="";
		
		document.getElementById("coment4").value="";
		document.getElementById("content4").style.display='none';
		document.getElementById("image4").style.display='block';
		
		$('#preview5').attr('src', '${contextPath }/resources/diary_plus.png')
		$('#previewimage5').attr('src', '${contextPath }/resources/diary_plus.png')
		$('#imgChk4').val('1')
		check4 = 1;
	}
	document.getElementById("content5").style.display='block';
	document.getElementById("image5").style.display='none';
	check5 = 0;
}
//===================================================================== 지우기
function del5(){
	document.getElementById("pre3").style.display='block';
	
		document.getElementById("coment5").value = "";
		document.getElementById("comentimage5").value="";
		document.getElementById("fileChk5").value="";

		$('#preview5').attr('src', '${contextPath }/resources/diary_plus.png')
		$('#previewimage5').attr('src', '${contextPath }/resources/diary_plus.png')
		document.getElementById("content5").style.display='block';
		document.getElementById("image5").style.display='none';
		document.getElementById("de5").style.display='none';
		$('#imgChk5').val('0')
		
	check5 = 0;
}

function register(){
	if(document.getElementById("title").value == ""){
		alert('제목을 입력해주세요'); return;
	}
	if(document.getElementById("title").value.length >= 20){
		alert('제목을 20자 이내로 작성해주세요'); return;
	}
	if(document.getElementById("place").value == ""){
		alert('지역을 입력해주세요'); return;
	}
	if(document.getElementById("place").value.length >= 10){
		alert('지역을 10자 이내로 작성해주세요'); return;
	}
	if(pageNum == 1){
		if(check1 == 0){
			if(document.getElementById("coment1").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk1").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage1").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	if(pageNum == 2){
		if(check2 == 0){
			if(document.getElementById("coment2").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk2").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage2").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	if(pageNum == 3){
		if(check3 == 0){
			if(document.getElementById("coment3").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk3").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage3").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	if(pageNum == 4){
		if(check4 == 0){
			if(document.getElementById("coment4").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk4").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage4").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	if(pageNum == 5){
		if(check5 == 0){
			if(document.getElementById("coment5").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}else{
			if(document.getElementById("imgChk5").value == '0'){
				alert('이미지가 없습니다.')
				return ;
			}if(document.getElementById("comentimage5").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
		}
	}
	document.getElementById("form").submit()
}

function modal(){
	document.getElementById("modal").style.display='block';
	document.getElementById("place").value = "";
}

function cancle(){
	document.getElementById("modal").style.display='none';
}

function save(){
	if(document.getElementById("place1").value == ""){
		document.getElementById("place1").value = document.getElementById("place").value
	}else if(document.getElementById("place2").value == ""){
		document.getElementById("place2").value = document.getElementById("place").value
	}else if(document.getElementById("place3").value == ""){
		document.getElementById("place3").value = document.getElementById("place").value
	}else{
		alert('경유지는 3개만 등록가능합니다')
	}
	document.getElementById("modal").style.display='none';
}

var end = 0;

function placeList(){
	if(end == 1){
		end = 0
		document.getElementById('placeList').style.display='none';
		return;
	}
	if(document.getElementById('placename1') != null){
		document.getElementById('pla1').remove();
	
	}
	if(document.getElementById('placename2') != null){
		document.getElementById('pla2').remove();
		
	}
	if(document.getElementById('placename3') != null){
		document.getElementById('pla3').remove();
	
	}
	end = 1;
		
	var pla1 = "";
	var pla2 = "";
	var pla3 = "";
	
	if(document.getElementById("place1").value != ""){
		pla1 = document.createElement('div')
		pla1.setAttribute('id', 'pla1')
		pla1.setAttribute('class', 'pla')
		var place1 = "";
		var placedel1 = "";
		place1 = document.createElement('div')
		place1.innerHTML = document.getElementById("place1").value
		place1.setAttribute('id', 'placename1')
		placedel1 = document.createElement('img')
		placedel1.setAttribute('src', '${contextPath }/resources/delete.png')
		placedel1.setAttribute('class', 'placedel')
		placedel1.setAttribute('id', 'placedel1')	
		placedel1.setAttribute('onclick', 'delete1()')
		
		document.getElementById("pla1").appendChild(place1)
		document.getElementById("pla1").appendChild(placedel1)
	}
	if(document.getElementById("place2").value != ""){
		pla2 = document.createElement('div')
		pla2.setAttribute('id', 'pla2')
		pla2.setAttribute('class', 'pla')
		var place2 = "";
		var placedel2 = "";
		place2 = document.createElement('div')
		place2.innerHTML = document.getElementById("place2").value
		place2.setAttribute('id', 'placename2')
		placedel2 = document.createElement('img')
		placedel2.setAttribute('src', '${contextPath }/resources/delete.png')
		placedel2.setAttribute('class', 'placedel')
		placedel1.setAttribute('id', 'placedel2')
		placedel2.setAttribute('onclick', 'delete2()')
		
		document.getElementById("pla2").appendChild(place2)
		document.getElementById("pla2").appendChild(placedel2)
	}
	if(document.getElementById("place3").value != ""){
		pla3 = document.createElement('div')
		pla3.setAttribute('id', 'pla3')
		pla3.setAttribute('class', 'pla')
		var place3 = "";
		var placedel3 = "";
		place3 = document.createElement('div')
		place3.innerHTML = document.getElementById("place3").value
		place3.setAttribute('id', 'placename3')
		placedel3 = document.createElement('img')
		placedel3.setAttribute('src', '${contextPath }/resources/delete.png')
		placedel3.setAttribute('class', 'placedel')
		placedel1.setAttribute('id', 'placedel3')
		placedel3.setAttribute('onclick', 'delete3()')
		
		document.getElementById("pla3").appendChild(place3)
		document.getElementById("pla3").appendChild(placedel3)
	}
	document.getElementById("placeList").style.display='inline-block';
	document.getElementById('placeList').appendChild(pla1)
	document.getElementById('placeList').appendChild(pla2)
	document.getElementById('placeList').appendChild(pla3)
}

function delete1(){
	document.getElementById('place1').value = document.getElementById('place2').value
	document.getElementById('place2').value = document.getElementById('place3').value
	document.getElementById('place3').value = "";
	document.getElementById('pla1').remove();
	document.getElementById("placeList").style.display='none';
	end = 0;
}
function delete2(){
	document.getElementById('place2').value = document.getElementById('place3').value
	document.getElementById('place3').value = "";
	document.getElementById('pla2').remove();
	document.getElementById("placeList").style.display='none';
	end = 0;
}
function delete3(){
	document.getElementById('place3').value = "";
	document.getElementById('pla3').remove();
	document.getElementById("placeList").style.display='none';	
	end = 0;
}

</script>

</head>
<body style="overflow-x: hidden">
	<jsp:include page="../default/header.jsp"/>
	<div class="writewrap">
	<div class="div">
	<form id="form" action="" method="post">
	<div class="modal" id="modal" style="display:none;">
		<div class="b">
		<input type="text" id="place" class="te2">
		<input type="button" value="Save" onclick="save()" class="sub">
		<input type="button" value="Cancle" onclick="cancle()" class="sub">
		<input type="hidden" name="place1" id="place1" value="">
		<input type="hidden" name="place2" id="place2" value="">
		<input type="hidden" name="place3" id="place3" value="">
		</div>
	</div>
	<div class="div2">
	<br><br>
	<sapn class="b">Title</sapn> <input type="text" id="title"name="title" class="te1">&nbsp;&nbsp;
	<sapn class="b">Place</sapn> <input type="text" onclick="placeList()" class="te2" autocomplete="off">
	<img class="img2" onclick="modal()" src="${contextPath }/resources/diary_plus.png">
	<sapn class="b">Who</sapn> <!--<input type="text" name="" class="te3"> -->
	<select name="who" id="who" class="te3">
		<option value="1">혼자</option>
		<option value="2">가족</option>
		<option value="3">친구</option>
		<option value="4">연인</option>
	</select>&nbsp;&nbsp;
	<sapn class="b">Start Date</sapn> <input type="date" name="" class="te4">
	<sapn class="b">End Date</sapn> <input type="date" name="" class="te4">
	</div>
	
	<div class="placeList" id="placeList" style="display: none;">
		<div id="pla1"></div>
		<div id="pla2"></div>
		<div id="pla3"></div>
	</div>
	
		<table class="table" border="1px;" >
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
					<div id="content1" style="" >
							<textarea id="coment1" class='text' style='height:430px; width:1050px;'></textarea>
					</div>
					
					<div id="image1" style="display:none;">
						<input type="file" id="file1" name="image_file_name1" onchange="readURL1(this);" style="display:none;"/>
						<img id="preview1" onclick="document.all.image_file_name1.click();"
							style='height:360px; width:600px;' src='${contextPath }/resources/diary_plus.png'>
							<input type="hidden" value="0" id="imgChk1">
							<input type="hidden" id="fileChk1">
						<textarea id="comentimage1" style='width:900px; height: 50px;'class='text'></textarea>
					</div>
			</div>
		<!-- ---------------------------------------------------------------------------------------------------------------- -->			
				<div id="view2" style="display:none;">
						<div id="content2"  >
							<textarea id="coment2" class='text' style='height:430px; width:1050px;'></textarea>
					</div>
					
					<div id="image2" style="display:none;">
						<input type="file" id="file2" name="image_file_name2" onchange="readURL2(this);" style="display:none;"/>
						<img id="preview2" onclick="document.all.image_file_name2.click();"
							style='height:360px; width:600px;' src='${contextPath }/resources/diary_plus.png'>
							<input type="hidden" value="0" id="imgChk2">
							<input type="hidden" id="fileChk2">
						<textarea id="comentimage2" style='width:900px; height: 50px;'class='text'></textarea>
					</div>
				</div>
		<!-- ---------------------------------------------------------------------------------------------------------------- -->			
				<div id="view3" style="display:none;">		
						<div id="content3"  >
							<textarea id="coment3" class='text' style='height:430px; width:1050px;'></textarea>
					</div>
					
					<div id="image3" style="display:none;">
						<input type="file" id="file3" name="image_file_name3" onchange="readURL3(this);" style="display:none;"/>
						<img id="preview3" onclick="document.all.image_file_name3.click();"
							style='height:360px; width:600px;' src='${contextPath }/resources/diary_plus.png'>
							<input type="hidden" value="0" id="imgChk3">
							<input type="hidden" id="fileChk3">
						<textarea id="comentimage3" style='width:900px; height: 50px;'class='text'></textarea>
					</div>
					</div>
		<!-- ---------------------------------------------------------------------------------------------------------------- -->			
				<div id="view4" style="display:none;">		
						<div id="content4"  >
							<textarea id="coment4" class='text' style='height:430px; width:1050px;'></textarea>
					</div>
					
					<div id="image4" style="display:none;">
						<input type="file" id="file4" name="image_file_name4" onchange="readURL4(this);" style="display:none;"/>
						<img id="preview4" onclick="document.all.image_file_name4.click();"
							style='height:360px; width:600px;' src='${contextPath }/resources/diary_plus.png'>
							<input type="hidden" value="0" id="imgChk4">
							<input type="hidden" id="fileChk4">
						<textarea id="comentimage4" style='width:900px; height: 50px;'class='text'></textarea>
					</div>
					</div>
		<!-- ---------------------------------------------------------------------------------------------------------------- -->			
				<div id="view5" style="display:none;">		
						<div id="content5"  >
							<textarea id="coment5" class='text' style='height:430px; width:1050px;'></textarea>
					</div>
					
					<div id="image5" style="display:none;">
						<input type="file" id="file5" name="image_file_name5" onchange="readURL5(this);" style="display:none;"/>
						<img id="preview5" onclick="document.all.image_file_name5.click();"
							style='height:360px; width:600px;' src='${contextPath }/resources/diary_plus.png'>
							<input type="hidden" value="0" id="imgChk5">
							<input type="hidden" id="fileChk5">
						<textarea id="comentimage5" style='width:900px; height: 50px;'class='text'></textarea>
					</div>
					</div>			
					
				</div>	
				</td>
			</div>
			</tr>

			<tr>
				<td class="td1" style="">
				<img class="td2" onclick="del1()" src="${contextPath }/resources/delete.png" style=""> 
			 	<img id="previewimage1" style="align-items: center;"onclick="page0()"class="img" src="${contextPath }/resources/diary_plus.png" >
				</td> 
						
				<td class="td1" style="">
				<img class="td2" id="de2" style="display:none;" onclick="del2()" src="${contextPath }/resources/delete.png">
				<img id="previewimage2" style=""onclick="page1()" class="img" src="${contextPath }/resources/diary_plus.png">
				</td> 
				
				<td class="td1" id="pre1"  style="display:none;">
				<img class="td2" id="de3" style="display:none;" onclick="del3()"  src="${contextPath }/resources/delete.png">
				<img id="previewimage3" style=""onclick="page2()" class="img" src="${contextPath }/resources/diary_plus.png">
				</td> 
				
				<td class="td1" id="pre2"  style="display:none;">
				<img class="td2" id="de4" style="display:none;" onclick="del4()"  src="${contextPath }/resources/delete.png">
				<img id="previewimage4" style=" "onclick="page3()" class="img" src="${contextPath }/resources/diary_plus.png">
				</td> 
				
				<td class="td1" id="pre3"  style="display:none;">
				<img class="td2" id="de5" style="display:none;" onclick="del5()"  src="${contextPath }/resources/delete.png">
				<img id="previewimage5" style=""onclick="page4()" class="img" src="${contextPath }/resources/diary_plus.png">
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
</body>
</html>