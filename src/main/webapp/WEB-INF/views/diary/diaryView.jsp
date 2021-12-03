<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>diaryView</title>
<style type="text/css">
	.writewrap{ margin:auto; height: 650px;  background-color: #DEF4F9; color:black;}
	.img{ height: 90px; width: 190px;}
	.div{ text-align: center; display: flex; justify-content: center; align-items: center;}
	.text{font-size: 15px; border-radius: 5px; border-color: white;}
	.table{ margin-top: 60px;}
	.te1{ width:200px; border-radius: 5px; border-color: white;}
	.te2{ width:150px; border-radius: 5px; border-color: white;}
	.te3{ width:150px; border-radius: 5px; border-color: white;}
	.te4{ width:150px; border-radius: 5px; border-color: white;}
	
	.td1{ width: 200px; background-color: #DEF4F9;}
	.submit{ width:80px; height:20px; }
	.sub{ background-color: #DEF4F9 ; font-size: 15px; color:black; border-radius: 5px; border-color: #DEF4F9; font-family: Georgia; margin-bottom:70px; }
	.b{ font-family: Georgia; font-size:20px;}
	
	.divsize{ width: 600px; height: 500px; background-color: white; display: flex; justify-content: center; align-items: center; border-radius: 10px;}
	.imgsize{ width: 550px; height: 400px; margin:auto; background-color: #DEF4F9; display: flex; justify-content: center; align-items: center;}
	.siz{ width:550px; height: 400px; }
	.textbox{ width:550px; height: 60px; margin:auto; background-color:#DEF4F9; display: flex; justify-content: center; align-items: center;}
	.box{ width: 520px; height:30px; border-radius: 5px; border-color: white; }
	td{ height: 100px; }
	.td{ width: 30px; height: 30px; }
</style>
</head>
<body style="overflow-x: hidden ">
	<jsp:include page="../default/header.jsp"/>
	
	<div class="writewrap">
	<div class="div">
	<form action="">
		<table class="table" >
			<tr>
				<td class="b">Title</td> <td><input type="text" name="" class="te1"></td>
				<td class="td" rowspan="5"></td>
				<td class="td" rowspan="5"></td>
				<td rowspan="5" colspan="1">
				<div class="divsize">
				<div>
				<div class="imgsize"><img class="siz" src="${contextPath }/resources/plus.png"></div>
				<div class="textbox"><input type="text" name="" class="box"></div>
				</div>
				</div>
				</td>
				<td class="td"></td>
				<td class="td"></td>
				<td class="td1"><img class="img" src="${contextPath }/resources/ppp.png"></td>
			</tr>
				
			<tr>
				<td class="b">Place</td> <td><input type="text" name="" class="te2"></td>
				<td class="td"></td>
				<td class="td"></td>
				<td class="td1"><img class="img" src="${contextPath }/resources/ppp.png"></td>
			</tr>
				
			<tr>
				<td class="b">Who</td> <td><input type="text" name="" class="te3"></td>
				<td class="td"></td>
				<td class="td"></td>
				<td class="td1"><img class="img" src="${contextPath }/resources/ppp.png"></td>
			</tr>
			
			<tr>
				<td class="b">Date</td> <td><input type="text" name="" class="te4"></td>
				<td class="td"></td>
				<td class="td"></td>
				<td class="td1"><img class="img" src="${contextPath }/resources/ppp.png"></td>
			</tr>
			
			<tr>
				<td class="b">Writing time</td> <td><input type="text" name="" class="te2"></td>
				<td class="td"></td>
				<td class="td"></td>
				<td class="td1"><img class="img" src="${contextPath }/resources/ppp.png"></td>
			
				
			</tr>
			
			<tr>
				<td></td>
				<td></td>
				<td class="td"></td>
				<td class="td"></td>
				<td></td>
				<td></td>
				<td></td>
				<td class="submit"><input type="button" value="Modify" class="sub">
				<input type="button" value="Delete" class="sub">
				<input type="button" value="Cancel" class="sub"></td>
			</tr>
			
						
		</table>
	</form>
	</div>
	
	<!-- 상호 : (주)에이네시아 본사주소 : 전라북도 전주혁신도시 덕진구 중동로 104-10 5층 501호,502호 서울사무소 주소 : 서울특별시 종로구 사직로8길 24 경희궁의아침 2단지 1121호 TEL : 063-212-9076(대표번호) 063-212-9077(고객센터) 사업자 등록번호 : 528-88-01145 -->
	</div>
	
	<jsp:include page="../default/footer.jsp"/>
</body>
</html>