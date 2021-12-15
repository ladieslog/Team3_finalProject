<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/bootstrap.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/CS/css/cs_css.css" />">
</head>
<body>
<div>
	<jsp:include page="../default/header.jsp"/>
	<br><br>
	<div class="in1">		
		<div class="in2">
					
		<div class="nal">
		<br><br>
			<div class="in3">
				<div class="in4">
					<b class="lb">Q&A</b><br><br>
				</div>		
			</div>
		
		<!--  
			<div class="in4">
						 
				<input type="text" name="" placeholder="제목" class="che"><br>
				<input type="text" name="" placeholder="작성자 시간" class="che"><br>				
				<input type="text" name="" placeholder="내용" class="ch"><br><hr>
			</div> 
			<div class="in4">
				<input type="text" name="" placeholder="제목" class="che"><br>			
				<input type="text" name="" placeholder="작성자 시간" class="che"><br>
				<input type="text" name="" placeholder="내용" class="chl"><br><hr>
			</div>
			-->
			<table class="in3">
				<tr>
					<td class="bl"></td>
					<td align="middle"><input type="text" name="" class="dchg"></td>
				</tr>
				<tr>
					<td class="bl"></td>
					<td align="middle"><input type="text" name="" placeholder="답변" class="dcha"></td>
				</tr>
				<tr>
					<td class="bl"></td>
					<td align="middle"><button name="" class="dchn">제출</button></td>
				</tr>	
			</table>	
		</div>
		</div>

	</div>
	

	<jsp:include page="../Cs/cs_back.jsp"/>
	<jsp:include page="../default/footer.jsp"/>
</div>
	
	
	


</body>
</html>