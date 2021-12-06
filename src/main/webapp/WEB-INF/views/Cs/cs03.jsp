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
.in1{ background-color: gray; padding: 100px 0 140px 0}
.in2{ padding: 0 450px}

.n1{font-size: 20px; border-radius: 5px; border-color:white; background-color: black;}
.n2{ width:80px; height:20px; }
.n3{display: flex; justify-content: center; align-items: center; margin-top: 20px;}

.ch{background-color: skyblue; width :200px; height:20px; }
.chb{background-color: black; width :1000px; height:300px; }
.in3{ margin-right: 150px;}
.b{ font-family: Georgia; font-size:20px;}


</style>
</head>
<body>
<div>
	<jsp:include page="../default/header.jsp"/>
	<div class="in1">
		<div class="in2">	 
			<table class="n3">
				<tr> 
					<td><b class="b">작성 제목</b> </td>
					<td><input type="text" name="" class="ch"></td>
					<td><b class="b">작성 날짜</b> </td>
					<td><input type="text" name="" class="ch"></td>
				</tr>
				<tr>	
					<td><b class="b">공지내용</b> </td>
				</tr>
				<tr> 
					<td colspan="15">
						<input type="text" name="" class="chb">
					</td>
				</tr>
				<tr>
					<td></td> <td></td> <td></td> <td></td> <td></td> <td></td>
					<td class="n2"><input type="submit" value="작성 완료" class="n4"></td>
				</tr>
					
			</table>	
		</div>

	</div>
	

	<jsp:include page="../Cs/cs_back.jsp"/>
	<jsp:include page="../default/footer.jsp"/>
</div>
	
	
	


</body>
</html>