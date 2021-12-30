<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500에러페이지</title>
</head>
<body>
<hr style="margin-top: 300px; border: 1px solid gray; width: 1000px; margin-bottom: 30px;">
<div style="margin-left: 466px; width: 1000px; 
    display: flex; justify-content: center; align-items: center;">	
<div>
	<div>
	<span style="font-size: 40px; font-weight: bold; color: #6E94CC;">죄송합니다.</span>&nbsp; 
    <span style="font-size: 23px; font-weight: bold;">Internet Server Error.</span>
	</div><br>
	<div>서비스 이용에 불편을 드려 죄송합니다.</div><br>
	<div>시스템 에러가 발생하여 페이지를 표시할 수 없습니다.</div><br>
	<div>HTTP 500 - 내부 서버 오류</div><br>
	<div><b>관리자에게 문의하시거나 잠시 후 다시 시도하세요.</b></div>
	<div style="margin-top: 10px; margin-left: 157px;">
	<input type="button" value="홈으로" onClick="location.href='first'" style="width: 80px; color: white; background-color: gray; 
	border: none; height: 35px; margin-left: 40px; font-weight: bold; margin-top: 5px;">
	<input type="button" value="돌아가기" onClick="history.back()" style="width: 80px; color: white; background-color: gray; 
	border: none; height: 35px; margin-left: 10px; font-weight: bold; margin-top: 5px;">
	</div>
</div>
<div>
	<img style="width: 160px; height: 140px;" src="${contextPath}/resources/tripMain/yeeroor.PNG">
</div>	
</div>
<hr style="border: 1px solid gray; width: 1000px; margin-top: 25px;">	
</body>
</html>