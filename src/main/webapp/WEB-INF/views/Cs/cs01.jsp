<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/bootstrap.css">
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/bootstrap.js"></script>
<style type ="text/css">
.in1{background-position: center center; height: 650px;  background-color: #DEF4F9;}
.in2{ padding: 0 180px}

.che{ 
	background-color: white; width :1300px; height:250px; 
}



</style>
</head>
<body>
<div>
	<jsp:include page="../default/header.jsp"/>
	<div class="in1">
		<div class="in2">
		
			<div>
			<br>
				<span><b style="font-size: 30px;">notice</b></span>
				
			</div>
				<input type="text" name="" class="che">	
			
				
			
			<div>
				<br>
				<span><b style="font-size: 30px;">Q & N</b></span>
				
			</div>
				<input type="text" name="" class="che">
			<div class="in3">
				
			</div>
		</div>
	
	</div>
	

	<jsp:include page="../Cs/cs_back.jsp"/>
	<jsp:include page="../default/footer.jsp"/>
</div>
	
	
	


</body>
</html>