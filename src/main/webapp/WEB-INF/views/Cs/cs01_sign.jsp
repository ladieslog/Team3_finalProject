<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath }/resources/CS/css/cs_css.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/javascript" src="${contextPath }/resources/diaryscript/diaryscript.js"></script>

</head>
<body style="overflow-x: hidden">
<div>
	<jsp:include page="../default/header.jsp"/>
	
	<div class="a1">
		<div class="a2">
		
			<div>
			<br>
				<span><b style="font-size: 30px;">notice</b></span>
				
			</div>
			<div id="id1">
				<textarea rows="7" cols="70" name="comment" class="ach"></textarea>
			</div>		
			<div>
				<br>
				<span><b style="font-size: 30px;">Q & N</b></span>
				
			</div>
			<div id="id2">
				<textarea rows="7" cols="70" name="comment" class="ach" placeholder="글내용을 입력"></textarea>
				<!-- <input type="text" name="" class="ach"> -->	
			</div>
				
			<div class="in3">
				
			</div>
		</div>
	
	</div>
	

	<jsp:include page="../Cs/cs_back.jsp"/>
	<jsp:include page="../default/footer.jsp"/>
</div>
	
	
	


</body>
</html>