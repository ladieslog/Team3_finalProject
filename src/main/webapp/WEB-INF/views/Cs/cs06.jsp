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
.in1{ height: 650px;  background-color: #DEF4F9;}
.in2{ padding: 0 450px;  }

.n1{font-size: 15px; border-radius: 5px; border-color: white;}
.n2{ width:80px; height:20px; }
.n3{display: flex; justify-content: center; align-items: center; margin-top: 20px;}
.n4{background-color: #DEF4F9 ; font-size: 15px; color:black; border-radius: 5px; border-color: #DEF4F9; font-family: Georgia; margin-bottom:70px;}

.ch{background-color: skyblue; width :250px; height:25px; }
.chb{background-color: white; width :1000px; height:300px; }

.b{ font-family: Georgia; font-size:24px;}


</style>
</head>
<body>
<div>
	<jsp:include page="../default/header.jsp"/>
	<div class="in1">
		<div class="in2">
			<br><br></br>			
				<br>
			 
				<table class="n3">
				<tr>
					<td colspan="1"> <b class="b">Q&A class &nbsp;</b> </td>
					<td colspan="1"> <input type="text" name="" class="ch"></td>
					<td colspan="1"> <b class="b">&nbsp; writer &nbsp;</b></td>
					<td colspan="1"> <input type="text" name="" class="ch"></td>
				</tr>
				<tr>
					<td colspan="1"> <b class="b">Q&A title &nbsp;</b>  </td>
					<td colspan="1"> <input type="text" name="" class="ch"></td>
					<td colspan="1"><b class="b">&nbsp; write date &nbsp;</b> </td>
					<td colspan="1"> <input type="text" name="" class="ch"></td>
				</tr>
				<tr></tr>
				<tr>
					<td colspan="1"><b class="b">Q&A answer &nbsp;</b> </td>
				</tr>
				<tr> 
					<td colspan="15">
						<input type="text" name="" class="chb">
					</td>
				</tr>
				<tr>
					<td></td> <td></td> <td></td> <td></td> <td></td>  
					<td class="n2"><input type="button" value="view list" class="n4"></td>
					<td class="n2"><input type="submit" value="commit" class="n4"></td>
				</tr>
					
		</table>	
		</div>

	</div>
	

	<jsp:include page="../Cs/cs_back.jsp"/>
	<jsp:include page="../default/footer.jsp"/>
</div>
	
	
	


</body>
</html>