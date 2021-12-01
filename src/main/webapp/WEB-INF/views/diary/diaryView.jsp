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
	.img{height: 40px; width: 40px;}
	.div{ text-align: center;}
	.div2{ margin-right: 120px;}
	.text{font-size: 15px; border-radius: 5px; border-color: white;}
	.table{display: flex; justify-content: center; align-items: center; margin-top: 20px;}
	.te1{ width:300px; border-radius: 5px; border-color: white;}
	.te2{ width:150px; border-radius: 5px; border-color: white;}
	.te3{ width:100px; border-radius: 5px; border-color: white;}
	.te4{ width:100px; border-radius: 5px; border-color: white;}
	
	.td1{ width: 200px; background-color: blue;}
	.submit{ width:80px; height:20px; }
	.sub{ background-color: #DEF4F9 ; font-size: 15px; color:black; border-radius: 5px; border-color: #DEF4F9; font-family: Georgia; }
	.b{ font-family: Georgia; font-size:20px;}
</style>
</head>
<body style="overflow-x: hidden ">
	<jsp:include page="../default/header.jsp"/>
	
	<div class="writewrap">
	
	<div class="div">
	<form action="">
	<div class="div2">

	</div>
	
		<table class="table" border="1px">
			<tr>
				<td class="b">Title</td> <td><input type="text" name="" class="te1"></td>
				<td rowspan="5" colspan="1">
				<div><img class="img" src="${contextPath }/resources/ppp.png"></div>
				</td>
				<td class="td1"><img class="img" src="${contextPath }/resources/ppp.png"></td>
			</tr>
				
			<tr>
				<td class="b">Place</td> <td><input type="text" name="" class="te2"></td>
				<td class="td1"><img class="img" src="${contextPath }/resources/ppp.png"></td>
			</tr>
				
			<tr>
				<td class="b">Who</td> <td><input type="text" name="" class="te3"></td>
				<td class="td1"><img class="img" src="${contextPath }/resources/ppp.png"></td>
			</tr>
			
			<tr>
				<td class="b">Date</td> <td><input type="text" name="" class="te4"></td>
				<td class="td1"><img class="img" src="${contextPath }/resources/ppp.png"></td>
			</tr>
			
			<tr>
				<td class="b">Writing time</td> <td><input type="text" name="" class="te2"></td>
				<td class="td1"><img class="img" src="${contextPath }/resources/ppp.png"></td>
				<td class="submit"><input type="button" value="Modify" class="sub"></td>
				<td class="submit"><input type="button" value="Delete" class="sub"></td>
				<td class="submit"><input type="button" value="Cancel" class="sub"></td>
			</tr>
			
						
		</table>
	</form>
	</div>
	
	<!-- 상호 : (주)에이네시아 본사주소 : 전라북도 전주혁신도시 덕진구 중동로 104-10 5층 501호,502호 서울사무소 주소 : 서울특별시 종로구 사직로8길 24 경희궁의아침 2단지 1121호 TEL : 063-212-9076(대표번호) 063-212-9077(고객센터) 사업자 등록번호 : 528-88-01145 -->
	</div>
	
	<jsp:include page="../default/footer.jsp"/>
</body>
</html>