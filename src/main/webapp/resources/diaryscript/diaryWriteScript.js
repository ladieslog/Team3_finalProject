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
		imgdata1(file)
	}
}
function imgdata1(file){
		data = new FormData()
		data.append("file", file)
		$.ajax({
			url : "imgUp", type : "post", data : data, contentType : false, enctype : 'multipart/form-data', processData : false,
			success : function(a){
				$('#fileChk1').val(a.url)
			}
		})
}

function content1(){
	check1 = 0;
	document.getElementById("content1").style.display='block';
	document.getElementById("image1").style.display='none';
	
	$('#preview1').attr('src', 'resources/diaryimg/diary_plus.png' )
	$('#previewimage1').attr('src', 'resources/diaryimg/trip.png' )
	$('#imgChk1').val('0')
	
	document.getElementById("fileChk1").value="";
	document.getElementById("comentimage1").value="";
}
function image1(){
	check1 = 1;
	document.getElementById("content1").style.display='none';
	document.getElementById("image1").style.display='block';
	$('#previewimage1').attr('src', 'resources/diaryimg/diary_plus.png' )
	document.getElementById("coment1").value="";
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
			if(document.getElementById("coment2").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage2").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("coment3").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage3").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("coment4").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage4").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("coment5").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage5").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
				return ;
			}
		}
	}
	if(check1 == 0){
		$('#previewimage1').attr('src', 'resources/diaryimg/trip.png')
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
			if(document.getElementById("coment1").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage1").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("coment3").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage3").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("coment4").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage4").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("coment5").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage5").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
				return ;
			}
		}
	}
	
	if(check2 == 0){
		$('#previewimage2').attr('src', 'resources/diaryimg/trip.png')
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
		imgdata2(file)
	}
}

function imgdata2(file){
		data = new FormData()
		data.append("file", file)
		$.ajax({
			url : "imgUp", type : "post", data : data, contentType : false, enctype : 'multipart/form-data', processData : false,
			success : function(a){
				$('#fileChk2').val(a.url)
			}
		})
}

function content2(){
	check2 = 0;
	document.getElementById("content2").style.display='block';
	document.getElementById("image2").style.display='none';
	
	$('#preview2').attr('src', 'resources/diaryimg/diary_plus.png' )
	$('#previewimage2').attr('src', 'resources/diaryimg/trip.png' )
	$('#imgChk2').val('0')
	
	document.getElementById("fileChk2").value="";
	document.getElementById("comentimage2").value="";
}
function image2(){
	check2 = 1;
	document.getElementById("content2").style.display='none';
	document.getElementById("image2").style.display='block';
	$('#previewimage2').attr('src', 'resources/diaryimg/diary_plus.png' )
	document.getElementById("coment2").value="";
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
			if(document.getElementById("coment1").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage1").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("coment2").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage2").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("coment4").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage4").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("coment4").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage5").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
				return ;
			}
		}
	}	
	if(check3 == 0){
		$('#previewimage3').attr('src', 'resources/diaryimg/trip.png')
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
		imgdata3(file)
	}
}
function imgdata3(file){
		data = new FormData()
		data.append("file", file)
		$.ajax({
			url : "imgUp", type : "post", data : data, contentType : false, enctype : 'multipart/form-data', processData : false,
			success : function(a){
				$('#fileChk3').val(a.url)
			}
		})
}

function content3(){
	check3 = 0;
	document.getElementById("content3").style.display='block';
	document.getElementById("image3").style.display='none';
	
	$('#preview3').attr('src', 'resources/diaryimg/diary_plus.png' )
	$('#previewimage3').attr('src', 'resources/diaryimg/trip.png' )
	$('#imgChk3').val('0')
	
	document.getElementById("fileChk3").value="";
	document.getElementById("comentimage3").value="";
}
function image3(){
	check3 = 1;
	document.getElementById("content3").style.display='none';
	document.getElementById("image3").style.display='block';
	$('#previewimage3').attr('src', 'resources/diaryimg/diary_plus.png' )
	document.getElementById("coment3").value="";
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
			if(document.getElementById("coment1").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage1").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("coment2").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage2").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("coment3").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage3").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("coment5").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage5").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
				return ;
			}
		}
	}
		if(check4 == 0){
		$('#previewimage4').attr('src', 'resources/diaryimg/trip.png')
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
		imgdata4(file)
	}
}
function imgdata4(file){
		data = new FormData()
		data.append("file", file)
		$.ajax({
			url : "imgUp", type : "post", data : data, contentType : false, enctype : 'multipart/form-data', processData : false,
			success : function(a){
				$('#fileChk4').val(a.url)
			}
		})
}

function content4(){
	check4 = 0;
	document.getElementById("content4").style.display='block';
	document.getElementById("image4").style.display='none';
	
	$('#preview4').attr('src', 'resources/diaryimg/diary_plus.png' )
	$('#previewimage4').attr('src', 'resources/diaryimg/trip.png' )
	$('#imgChk4').val('0')
	
	document.getElementById("fileChk4").value="";
	document.getElementById("comentimage4").value="";
}
function image4(){
	check4 = 1;
	document.getElementById("content4").style.display='none';
	document.getElementById("image4").style.display='block';
	$('#previewimage4').attr('src', 'resources/diaryimg/diary_plus.png' )
	document.getElementById("coment4").value="";
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
			if(document.getElementById("coment1").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage1").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("coment2").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage2").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("coment3").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage3").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("coment4").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage4").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
				return ;
			}
		}
	}
		if(check5 == 0){
		$('#previewimage5').attr('src', 'resources/diaryimg/trip.png')
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
		imgdata5(file)
	}
}
function imgdata5(file){
		data = new FormData()
		data.append("file", file)
		$.ajax({
			url : "imgUp", type : "post", data : data, contentType : false, enctype : 'multipart/form-data', processData : false,
			success : function(a){
				$('#fileChk5').val(a.url)
			}
		})
}

function content5(){
	check5 = 0;
	document.getElementById("content5").style.display='block';
	document.getElementById("image5").style.display='none';
	
	$('#preview5').attr('src', 'resources/diaryimg/diary_plus.png' )
	$('#previewimage5').attr('src', 'resources/diaryimg/trip.png' )
	$('#imgChk5').val('0')
	
	document.getElementById("fileChk5").value="";
	document.getElementById("comentimage5").value="";
}
function image5(){
	check5 = 1;
	document.getElementById("content5").style.display='none';
	document.getElementById("image5").style.display='block';
	$('#previewimage5').attr('src', 'resources/diaryimg/diary_plus.png' )
	document.getElementById("coment5").value="";
}

// ===================================================================== 지우기
function del1(){
	if(document.getElementById("coment2").value == ""){
		if(document.getElementById("fileChk2").value == ""){
			alert('페이지가 하나밖에 없습니다.')
			return ;
		}
	}
	if(pageNum == 2) {
		page0();
	}
	if(pageNum == 3) {
		page1();
	}
	if(pageNum == 4) {
		page2();
	}
	if(pageNum == 5) {
		page3();
	}
	if(check2 == 0){
		if(document.getElementById("coment2").value == ""){
			$('#previewimage1').attr('src', 'resources/diaryimg/diary_plus.png')
		}else{
			$('#previewimage1').attr('src', 'resources/diaryimg/trip.png')
		}
		document.getElementById("coment1").value = document.getElementById("coment2").value
		
		document.getElementById("comentimage1").value="";
		document.getElementById("fileChk1").value="";
		$('#preview1').attr('src', 'resources/diaryimg/diary_plus.png')

		document.getElementById("content1").style.display='block';
		document.getElementById("image1").style.display='none';
		$('#imgChk1').val('0')
		check1 = 0;
		$('#previewimage2').attr('src', 'resources/diaryimg/diary_plus.png')
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
		if(document.getElementById("coment3").value == ""){
			$('#previewimage2').attr('src', 'resources/diaryimg/diary_plus.png')
		}else{
			$('#previewimage2').attr('src', 'resources/diaryimg/trip.png')
		}
		document.getElementById("coment2").value = document.getElementById("coment3").value
		
		document.getElementById("comentimage2").value="";
		document.getElementById("fileChk2").value="";
		$('#preview2').attr('src', 'resources/diaryimg/diary_plus.png')

		document.getElementById("content2").style.display='block';
		document.getElementById("image2").style.display='none';
		$('#imgChk2').val('0')
		check2 = 0;
		$('#previewimage3').attr('src', 'resources/diaryimg/diary_plus.png')
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
		if(document.getElementById("coment4").value == ""){
			$('#previewimage3').attr('src', 'resources/diaryimg/diary_plus.png')
		}else{
			$('#previewimage3').attr('src', 'resources/diaryimg/trip.png')
		}
		document.getElementById("coment3").value = document.getElementById("coment4").value	
		document.getElementById("comentimage3").value="";
		document.getElementById("fileChk3").value="";
		$('#preview3').attr('src', 'resources/diaryimg/diary_plus.png')

		document.getElementById("content3").style.display='block';
		document.getElementById("image3").style.display='none';
		$('#imgChk3').val('0')
		check3 = 0;
		$('#previewimage4').attr('src', 'resources/diaryimg/diary_plus.png')
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
		if(document.getElementById("coment5").value == ""){
			$('#previewimage4').attr('src', 'resources/diaryimg/diary_plus.png')
		}else{
			$('#previewimage4').attr('src', 'resources/diaryimg/trip.png')
		}
		document.getElementById("coment4").value = document.getElementById("coment5").value
		document.getElementById("comentimage4").value="";
		document.getElementById("fileChk4").value="";
		$('#preview4').attr('src', 'resources/diaryimg/diary_plus.png')
	
		document.getElementById("content4").style.display='block';
		document.getElementById("image4").style.display='none';
		$('#imgChk4').val('0')
		document.getElementById("coment5").value="";
		check4 = 0;
		$('#previewimage5').attr('src', 'resources/diaryimg/diary_plus.png')
		
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
		
		$('#preview5').attr('src', 'resources/diaryimg/diary_plus.png')
		$('#previewimage5').attr('src', 'resources/diaryimg/diary_plus.png')
		$('#imgChk4').val('1')
		check4 = 1;
	}
	document.getElementById("content5").style.display='block';
	document.getElementById("image5").style.display='none';
	check5 = 0;
	
	
}
//===================================================================== 지우기
function del2(){
	if(pageNum == 2) {
		page0();
	}
	if(pageNum == 3) {
		page1();
	}
	if(pageNum == 4) {
		page2();
	}
	if(pageNum == 5) {
		page3();
	}
	if(document.getElementById("coment3").value == ""){
		if(document.getElementById("fileChk3").value == ""){
			document.getElementById("pre1").style.display='none';
		}
	}
	if(check3 == 0){
		if(document.getElementById("coment3").value == ""){
			$('#previewimage2').attr('src', 'resources/diaryimg/diary_plus.png')
		}else{
			$('#previewimage2').attr('src', 'resources/diaryimg/trip.png')
		}
		document.getElementById("coment2").value = document.getElementById("coment3").value
		
		document.getElementById("comentimage2").value="";
		document.getElementById("fileChk2").value="";
		$('#preview2').attr('src', 'resources/diaryimg/diary_plus.png')

		document.getElementById("content2").style.display='block';
		document.getElementById("image2").style.display='none';
		$('#imgChk2').val('0')
		check2 = 0;
		$('#previewimage3').attr('src', 'resources/diaryimg/diary_plus.png')
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
		if(document.getElementById("coment4").value == ""){
			$('#previewimage3').attr('src', 'resources/diaryimg/diary_plus.png')
		}else{
			$('#previewimage3').attr('src', 'resources/diaryimg/trip.png')
		}
		document.getElementById("coment3").value = document.getElementById("coment4").value
		
		document.getElementById("comentimage3").value="";
		document.getElementById("fileChk3").value="";
		$('#preview3').attr('src', 'resources/diaryimg/diary_plus.png')

		document.getElementById("content3").style.display='block';
		document.getElementById("image3").style.display='none';
		$('#imgChk3').val('0')
		check3 = 0;
		$('#previewimage4').attr('src', 'resources/diaryimg/diary_plus.png')
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
		if(document.getElementById("coment5").value == ""){
			$('#previewimage4').attr('src', 'resources/diaryimg/diary_plus.png')
		}else{
			$('#previewimage4').attr('src', 'resources/diaryimg/trip.png')
		}
		document.getElementById("coment4").value = document.getElementById("coment5").value
		document.getElementById("comentimage4").value="";
		document.getElementById("fileChk4").value="";
		$('#preview4').attr('src', 'resources/diaryimg/diary_plus.png')

		document.getElementById("content4").style.display='block';
		document.getElementById("image4").style.display='none';
		$('#imgChk4').val('0')
		document.getElementById("coment5").value="";
		check4 = 0;
		$('#previewimage5').attr('src', 'resources/diaryimg/diary_plus.png')
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
		
		$('#preview5').attr('src', 'resources/diaryimg/diary_plus.png')
		$('#previewimage5').attr('src', 'resources/diaryimg/diary_plus.png')
		$('#imgChk4').val('1')
		check4 = 1;
	}
	document.getElementById("content5").style.display='block';
	document.getElementById("image5").style.display='none';
	check5 = 0;
}
//===================================================================== 지우기
function del3(){
	if(pageNum == 3) {
		page1();
	}
	if(pageNum == 4) {
		page2();
	}
	if(pageNum == 5) {
		page3();
	}
	if(document.getElementById("coment4").value == ""){
		if(document.getElementById("fileChk4").value == ""){
			document.getElementById("pre2").style.display='none';	
		}
	}
	if(check4 == 0){
		if(document.getElementById("coment4").value == ""){
			$('#previewimage3').attr('src', 'resources/diaryimg/diary_plus.png')
		}else{
			$('#previewimage3').attr('src', 'resources/diaryimg/trip.png')
		}
		document.getElementById("coment3").value = document.getElementById("coment4").value
		
		document.getElementById("comentimage3").value="";
		document.getElementById("fileChk3").value="";
		$('#preview3').attr('src', 'resources/diaryimg/diary_plus.png')

		document.getElementById("content3").style.display='block';
		document.getElementById("image3").style.display='none';
		$('#imgChk3').val('0')
		check3 = 0;
		$('#previewimage4').attr('src', 'resources/diaryimg/diary_plus.png')
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
		if(document.getElementById("coment5").value == ""){
			$('#previewimage4').attr('src', 'resources/diaryimg/diary_plus.png')
		}else{
			$('#previewimage4').attr('src', 'resources/diaryimg/trip.png')
		}
		document.getElementById("coment4").value = document.getElementById("coment5").value

		document.getElementById("comentimage4").value="";
		document.getElementById("fileChk4").value="";
		$('#preview4').attr('src', 'resources/diaryimg/diary_plus.png')

		document.getElementById("content4").style.display='block';
		document.getElementById("image4").style.display='none';
		$('#imgChk4').val('0')
		document.getElementById("coment5").value="";
		check4 = 0;
		$('#previewimage5').attr('src', 'resources/diaryimg/diary_plus.png')
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
		
		$('#preview5').attr('src', 'resources/diaryimg/diary_plus.png')
		$('#previewimage5').attr('src', 'resources/diaryimg/diary_plus.png')
		$('#imgChk4').val('1')
		check4 = 1;
	}
	document.getElementById("content5").style.display='block';
	document.getElementById("image5").style.display='none';
	check5 = 0;
}
//===================================================================== 지우기
function del4(){
	if(pageNum == 4) {
		page2();
	}
	if(pageNum == 5) {
		page3();
	}
	if(document.getElementById("coment5").value == ""){
		if(document.getElementById("fileChk5").value == ""){
			document.getElementById("pre3").style.display='none';
			
		}
	}
	if(check5 == 0){
		if(document.getElementById("coment5").value == ""){
			$('#previewimage4').attr('src', 'resources/diaryimg/diary_plus.png')
		}else{
			$('#previewimage4').attr('src', 'resources/diaryimg/trip.png')
		}
		document.getElementById("coment4").value = document.getElementById("coment5").value

		document.getElementById("comentimage4").value="";
		document.getElementById("fileChk4").value="";
		$('#preview4').attr('src', 'resources/diaryimg/diary_plus.png')

		document.getElementById("content4").style.display='block';
		document.getElementById("image4").style.display='none';
		$('#imgChk4').val('0')
		document.getElementById("coment5").value="";
		check4 = 0;
		$('#previewimage5').attr('src', 'resources/diaryimg/diary_plus.png')
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
		
		$('#preview5').attr('src', 'resources/diaryimg/diary_plus.png')
		$('#previewimage5').attr('src', 'resources/diaryimg/diary_plus.png')
		$('#imgChk4').val('1')
		check4 = 1;
	}
	document.getElementById("content5").style.display='block';
	document.getElementById("image5").style.display='none';
	check5 = 0;
}
//===================================================================== 지우기
function del5(){
	if(pageNum == 5) {
		page3();
	}
	document.getElementById("pre3").style.display='block';
	
		document.getElementById("coment5").value = "";
		document.getElementById("comentimage5").value="";
		document.getElementById("fileChk5").value="";

		$('#preview5').attr('src', 'resources/diaryimg/diary_plus.png')
		$('#previewimage5').attr('src', 'resources/diaryimg/diary_plus.png')
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
	if(document.getElementById("indate").value == "") {
		alert('여행 시작일을 선택해주세요.');
		return;
	}
	var date1 = new Date(document.getElementById("indate").value );
	var date2 = new Date();
	if(date1 > date2) {
		alert("여행 시작일이 현재 시간보다 빠를 수 없습니다.");
		return;
	} 
	var date3 = new Date(document.getElementById("outdate").value );
	if(document.getElementById("outdate").value == "") {
		alert('여행 종료일을 선택해주세요.');
		return;
	}
	if(date3 > date2) {
		alert('여행 종료일이 현재 시간보다 빠를 수 없습니다.');
		return;
	}
	if(date1 > date3) {
		alert('여행 시작일이 여행 종료일보다 빠를 수 없습니다.');
		return;
	}
	if(pageNum == 1){
		if(check1 == 0){
			if(document.getElementById("coment1").value == ""){
				alert('글 내용이 없습니다.')
				return ;
			}
			if(document.getElementById("coment1").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage1").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("coment2").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage2").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("coment3").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage3").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("coment4").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage4").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("coment5").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
			if(document.getElementById("comentimage5").value.length >= 100) {
				alert('글 내용은 100글자를 초과할 수 없습니다.')
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
	// 저장시 해당하는 div의 값만 바꿔줌
	console.log(document.getElementById("place1").value)
	if(document.getElementById("place1").value == ""){
		document.getElementById("place1").value = document.getElementById("place").value
		document.getElementById("placename1").innerHTML = document.getElementById("place1").value;
	}else if(document.getElementById("place2").value == ""){
		document.getElementById("place2").value = document.getElementById("place").value
		document.getElementById("placename2").innerHTML = document.getElementById("place2").value;
	}else if(document.getElementById("place3").value == ""){
		document.getElementById("place3").value = document.getElementById("place").value
		document.getElementById("placename3").innerHTML = document.getElementById("place3").value;
	}else{
		alert('경유지는 3개만 등록가능합니다')
	}
	document.getElementById("modal").style.display='none';
}


function placeList(){
	// 해당 div에 값이 있다면 디스플레이에 flex값을 줘서 보여줌 (평상시에는 none상태)
	if(document.getElementById("place1").value != ""){
		document.getElementById('pla1').style.display='flex';
	}
	if(document.getElementById("place2").value != ""){
		document.getElementById('pla2').style.display='flex';
	}
	if(document.getElementById("place3").value != ""){
		document.getElementById('pla3').style.display='flex';
	}
	document.getElementById("placeList").style.display='inline-block';
	
}

function delete1(){
	// 삭제시 해당하는 div의 값들을 하나씩 가져와서 마지막 div의 값을 비우고 none시킴
	document.getElementById('place1').value = document.getElementById('place2').value
	document.getElementById('place2').value = document.getElementById('place3').value
	document.getElementById('place3').value = "";
	
	document.getElementById("placename1").innerHTML = document.getElementById('place1').value
	document.getElementById("placename2").innerHTML = document.getElementById('place2').value
	document.getElementById("placename3").innerHTML = document.getElementById('place3').value
	document.getElementById("pla3").style.display='none';
	document.getElementById("placeList").style.display='none';	
}
function delete2(){
	document.getElementById('place2').value = document.getElementById('place3').value
	document.getElementById('place3').value = "";
	
	document.getElementById("placename2").innerHTML = document.getElementById('place2').value
	document.getElementById("placename3").innerHTML = document.getElementById('place3').value
	document.getElementById("pla3").style.display='none';
	document.getElementById("placeList").style.display='none';	
}
function delete3(){
	document.getElementById('place3').value = "";
	document.getElementById("placename3").innerHTML = document.getElementById('place3').value
	document.getElementById("pla3").style.display='none';
	document.getElementById("placeList").style.display='none';	
}

// 다른곳 클릭시 placeList 닫힘
$(document).click(function(e){
// 현재 문서를 클릭했을때 이벤트 발생
    if (!$(e.target).is('#placeList')) { // 클릭한 영역의 id가 placeList가 아니라면
    	if(!$(e.target).is('#placeinput')) // 클릭한 영역의 id가 placeinput이 아니라면 (이거 넣어줘야 input창을 클릭했을때 placeinput가 보여짐)
    	document.getElementById("placeList").style.display='none';
    }

});

function mailnum(){
	new daum.Postcode({
            oncomplete: function(data) {
		var hdr=data.roadAddress;
		$("#place").val(hdr)
            }
        }).open();
}