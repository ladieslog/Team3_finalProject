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
	.div{ text-align: center;}
	.div2{ margin-right: 105px;}
	.text{font-size: 15px; border-radius: 5px; border-color: white;}
	.table{display: flex; justify-content: center; align-items: center; margin-top: 20px;}
	.te1{ width:300px; border-radius: 5px; border-color: white;}
	.te2{ width:150px; border-radius: 5px; border-color: white;}
	.te3{ width:100px; border-radius: 5px; border-color: white;}
	.te4{ width:100px; border-radius: 5px; border-color: white;}
	
	.td1{ width: 110px; height: 50px;}
	.td2{ height: 0px; width: 0px; }
	.td1:hover>.td2{ height: 15px; width: 15px; text-align:left; }
	
	.submit{ width:80px; height:20px; }
	.sub{ background-color: #DEF4F9 ; font-size: 15px; color:black; border-radius: 5px; border-color: #DEF4F9; font-family: Georgia; }
	.b{ font-family: Georgia; font-size:20px;}
	
	.tdwr{ width:80px; height:20px; }
	.btnwi{ background-color: #DEF4F9 ; color:black; border-radius: 5px; border-color: #DEF4F9; 
			font-family: Georgia; font-size:18px;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/javascript">
function func1() {

	var tag1 = "<textarea type='text' style='height:430px; width:1000px;'></textarea>";
	document.getElementById("test1").innerHTML = tag1;	
	
}	
function func2() {

	var stg1 = "<img style='height:300px; width:1000px;' src='${contextPath }/resources/diary_plus.png'>";
	var stg2 = "<textarea style='width:900px; height: 80px;'class='text'></textarea>";


	document.getElementById("test2").innerHTML = stg1;			
	document.getElementById("test3").innerHTML = stg2;
}	

function test1(){
	document.getElementById("test1").style.display='block';
	document.getElementById("test2").style.display='none';

}
function test2(){
	document.getElementById("test1").style.display='none';
	document.getElementById("test2").style.display='block';
}

</script>
</head>
<body style="overflow-x: hidden">
	<jsp:include page="../default/header.jsp"/>
	
	<div class="writewrap">
	
	<div class="div">
	<form action="">
	<div class="div2">
	<br><br><!-- 
	<b class="b">Title</b> <input type="text" name="" class="te1">
	<b class="b">Place</b> <input type="text" name="" class="te2">
	<b class="b">Who</b> <input type="text" name="" class="te3">
	<b class="b">Date</b> <input type="text" name="" class="te4"> -->
	<sapn class="b">Title</sapn> <input type="text" name="" class="te1">&nbsp;&nbsp;
	<sapn class="b">Place</sapn> <input type="text" name="" class="te2">&nbsp;&nbsp;
	<sapn class="b">Who</sapn> <!--<input type="text" name="" class="te3"> -->
	<select name="who" class="te3">
		<option value="1">혼자</option>
		<option value="2">가족</option>
		<option value="3">친구</option>
		<option value="4">연인</option>
	</select>&nbsp;&nbsp;
	
	<sapn class="b">Date</sapn> <!--<input type="text" name="" class="te4">-->
	<select name="who" class="te4">
		<option value="1">당일치기</option>
		<option value="2">1박2일</option>
		<option value="3">2박3일</option>
		<option value="4">3박4일</option>
		<option value="5">4박5일</option>
		<option value="6">5박6일</option>
		<option value="7">6박7일</option>
		<option value="8">7박8일</option>
		<option value="9">8박9일</option>
		<option value="10">9박10일</option>
		<option value="11">10일 ~ </option>
	</select>
	</div>
	
		<table class="table" border="1px">
			<tr>
				
				<td colspan="1" class="tdwr b"><button  value="Writing" onclick="test1()" class="btnwi">Writing</button></td>
				<td colspan="1" class="tdwr b"><button value="Image" onclick="test2()" class="btnwi">Image</button></td>
			</tr>
			
			<tr>
			<div>
				<td colspan="15" >
				
				<div id="" style="width:1063px; height:435px;">
					
				
				<div id="test1" style="" >
					<textarea class='text' style='height:430px; width:1050px;'></textarea>
				</div>
				<div id="test2" style="">
					<img style='height:300px; width:1000px;' src='${contextPath }/resources/diary_plus.png'>
					<textarea style='width:900px; height: 80px;'class='text'></textarea>
				</div>
				</div>	
				
				</td>
			</div>
			</tr>
			
			<tr>
				<td class="td1" style="display:flex; justify-content: center;">
				<img class="td2" src="${contextPath }/resources/delete.png">
				<img style="align-items: center;"class="img" src="${contextPath }/resources/diary_plus.png">
				</td> 
				<td class="td1"><img class="img" src="${contextPath }/resources/diary_plus.png"></td> 
				<td class="td1"><img class="img" src="${contextPath }/resources/diary_plus.png"></td> 
				<td class="td1"><img class="img" src="${contextPath }/resources/diary_plus.png"></td> 
				<td class="td1"><img class="img" src="${contextPath }/resources/diary_plus.png"></td> 
				<td></td> <td></td> <td></td> <td></td> <td></td>  
				<td class="submit"><input type="button" value="Cancel" class="sub"></td>
				<td class="submit"><input type="submit" value="Complete" class="sub"></td>
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