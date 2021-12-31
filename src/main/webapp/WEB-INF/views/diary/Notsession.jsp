<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404에러페이지</title>
</head>
<body>
<hr style="margin-top: 300px; border: 1px solid gray; width: 1000px; margin-bottom: 30px;">
<div style="margin-left: 466px; width: 1000px; 
    display: flex; justify-content: center; align-items: center;">	
<div>
	<div>
	<span style="font-size: 40px; font-weight: bold; color: #6E94CC;">죄송합니다.</span>&nbsp; 
    <span style="font-size: 23px; font-weight: bold;">요청하신 페이지를 찾을 수 없습니다.</span>
	</div><br>
	<div>요청하신 페이지를 찾을수가 없습니다.</div><br>
	<div>찾으시려는 페이지는 주소를 잘못 입력하였거나</div><br>
	<div>페이지 주소의 변경 또는 삭제 등의 이유로 페이지를 찾을수 없습니다.</div><br>
	<div><b>입력하신 페이지의 주소와 경로가 정확한지 한번더 확인 후 이용하시기 바랍니다.</b></div>
	<div style="margin-top: 10px; margin-left: 218px;">
	<input type="button" value="홈으로" onClick="location.href='first'" style="width: 80px; color: white; background-color: gray; 
	border: none; height: 35px; margin-left: 40px; font-weight: bold; margin-top: 5px;">
	<input type="button" value="돌아가기" onClick="history.back()" style="width: 80px; color: white; background-color: gray; 
	border: none; height: 35px; margin-left: 10px; font-weight: bold; margin-top: 5px;">
	</div>
</div>
<div>
	<img style="width: 160px; height: 140px;" src="${contextPath}/resources/tripMain/rederror.PNG">
</div>	
</div>
<hr style="border: 1px solid gray; width: 1000px; margin-top: 30px;">	
</body>
</html>