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
</head>
<body>
	<jsp:include page="../default/header.jsp"/>
	
	<div class="diary-wrap">
		<div>
			<span>닉네임</span>
			<span>글 갯수</span>
		</div>
		<div>
			<div>
				
			</div>
			<div>
				
			</div>
			<div>
				
			</div>
			<div>
				
			</div>
		</div>
	</div>
	
	<jsp:include page="../default/footer.jsp"/>
</body>
</html>