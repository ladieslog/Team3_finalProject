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

.n1{font-size: 15px; border-radius: 5px; border-color: white;}
.n2{ width:80px; height:20px; }
.n3{display: flex; justify-content: center; align-items: center; margin-top: 20px;}

.ch{background-color: skyblue; width :250px; height:25px; }
.chb{background-color: white; width :1000px; height:300px; }
.in3{ margin-right: 150px;}
.b{ font-family: Georgia; font-size:24px;}


</style>
</head>
<body>
<div>
	<jsp:include page="../default/header.jsp"/>
	<div class="in1">
		<div class="in2">
			<div class="in3">
				<b class="b">Q&A 분류 &nbsp;</b> 
				<input type="text" name="" class="ch">
				<b class="b">&nbsp; 작성자 &nbsp;</b> 
				<input type="text" name="" class="ch"><br>
				<b class="b">Q&A 제목 &nbsp;</b> 
				<input type="text" name="" class="ch">
				<b class="b">&nbsp; 작성날짜 &nbsp;</b> 
				<input type="text" name="" class="ch"><br><br>				
				<b class="b">Q&A 내용 &nbsp;</b> <br>
			</div> 
				<table class="n3">
				<tr> 
					<td colspan="15">
						<input type="text" name="" class="chb">
					</td>
				</tr>
				<tr>
					<td></td> <td></td> <td></td> <td></td> <td></td>  
					<td class="n2"><input type="button" value="목록보기" class="n4"></td>
					<td class="n2"><input type="submit" value="등  록" class="n4"></td>
				</tr>
					
		</table>	
		</div>

	</div>
	

	<jsp:include page="../Cs/cs_back.jsp"/>
	<jsp:include page="../default/footer.jsp"/>
</div>
	
	
	


</body>
</html>