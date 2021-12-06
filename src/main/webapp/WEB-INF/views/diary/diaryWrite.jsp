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
	.img{height: 40px; width: 40px;}
	.div{ text-align: center;}
	.div2{ margin-right: 130px;}
	.text{font-size: 15px; border-radius: 5px; border-color: white;}
	.table{display: flex; justify-content: center; align-items: center; margin-top: 20px;}
	.te1{ width:300px; border-radius: 5px; border-color: white;}
	.te2{ width:150px; border-radius: 5px; border-color: white;}
	.te3{ width:100px; border-radius: 5px; border-color: white;}
	.te4{ width:100px; border-radius: 5px; border-color: white;}
	
	.td1{ width: 100px;}
	.submit{ width:80px; height:20px; }
	.sub{ background-color: #DEF4F9 ; font-size: 15px; color:black; border-radius: 5px; border-color: #DEF4F9; font-family: Georgia; }
	.b{ font-family: Georgia; font-size:20px;}
	
	.tdwr{ width:80px; height:20px; }
	.btnwi{ background-color: #DEF4F9 ; color:black; border-radius: 5px; border-color: #DEF4F9; 
			font-family: Georgia; font-size:18px;}
</style>
</head>
<body style="overflow-x: hidden">
	<jsp:include page="../default/header.jsp"/>
	
	<div class="writewrap">
	
	<div class="div">
	<form action="">
	<div class="div2">
	<br><br><br><!-- 
	<b class="b">Title</b> <input type="text" name="" class="te1">
	<b class="b">Place</b> <input type="text" name="" class="te2">
	<b class="b">Who</b> <input type="text" name="" class="te3">
	<b class="b">Date</b> <input type="text" name="" class="te4"> -->
	<sapn class="b">Title</sapn> <input type="text" name="" class="te1">
	<sapn class="b">Place</sapn> <input type="text" name="" class="te2">
	<sapn class="b">Who</sapn> <input type="text" name="" class="te3">
	<sapn class="b">Date</sapn> <input type="text" name="" class="te4">
	</div>
	
		<table class="table">
			<tr>
				
				<td colspan="1" class="tdwr b"><input type="button" value="Writing" class="btnwi"></td>
				<td colspan="1" class="tdwr b"><input type="button" value="Image" class="btnwi"></td>
			</tr>
			
			<tr>
				<td colspan="15"><textarea class="text" name="" rows="25" cols="130"></textarea></td>
			</tr>
			
			<tr>
				<td class="td1"><img class="img" src="${contextPath }/resources/diary_plus.png"></td> 
				<td class="td1"><img class="img" src="${contextPath }/resources/diary_plus.png"></td> 
				<td class="td1"><img class="img" src="${contextPath }/resources/diary_plus.png"></td> 
				<td class="td1"><img class="img" src="${contextPath }/resources/diary_plus.png"></td> 
				<td class="td1"><img class="img" src="${contextPath }/resources/diary_plus.png"></td> 
				<td></td> <td></td> <td></td> <td></td> <td></td>  
				<td class="submit"><input type="button" value="Cancel" class="sub"></td>
				<td class="submit"><input type="submit" value="Complete" class="sub"></td>
			</tr>
			
			<tr></tr>
		</table>
	</form>
	</div>
	
	
	</div>
	
	<jsp:include page="../default/footer.jsp"/>
</body>
</html>