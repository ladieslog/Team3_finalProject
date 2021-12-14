<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/CS/css/cs_css.css">
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/bootstrap.js"></script>


</head>
<body>
<div>
	<jsp:include page="../default/header.jsp"/>
	
	<div class="a1">
		<div class="a2">
		
			<div>
			<br>
				<span><b style="font-size: 30px;">notice</b></span>
				
			</div>
				<input type="text" name="" class="ach">	
			
				
			
			<div>
				<br>
				<span><b style="font-size: 30px;">Q & N</b></span>
				
			</div>
				<input type="text" name="" class="ach">
			<div class="in3">
				
			</div>
		</div>
	
	</div>
	

	<jsp:include page="../Cs/cs_back.jsp"/>
	<jsp:include page="../default/footer.jsp"/>
</div>
	
	
	


</body>
</html>