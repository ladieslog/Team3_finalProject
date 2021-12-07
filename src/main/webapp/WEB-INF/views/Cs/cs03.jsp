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
.in1{ margin:auto; height: 650px;  background-color: #DEF4F9;}
.in2{ padding: 0 450px;}

.n1{font-size: 20px; border-radius: 5px; border-color:white; background-color: black;}
.n2{ width:120px; height:30px; }
.n3{display: flex; justify-content: center;}
.n4{background-color: #DEF4F9 ; font-size: 15px; color:black; border-radius: 5px; border-color: #DEF4F9; font-family: Georgia; margin-bottom:70px;}

.ch{background-color: white; width :200px; height:25px; border-radius: 5px; border-color: #DEF4F9;}
.chb{background-color: white; width :1200px; height:450px; border-radius: 5px; border-color: #DEF4F9;}
.in3{ margin-right: 150px;}
.b{ font-family: Georgia; font-size:24px; text-align: center;}
.rb{height: 30px;}


</style>
</head>
<body>
<div>
	<jsp:include page="../default/header.jsp"/>
	<div class="in1">
		<div class="in2">
			<br><br>
				<b class="b">  write title &nbsp;</b>
				<input type="text" name="" class="ch">
			<table class="n3">				
				<tr> 
					<!--<td  class="tb"> <b class="b">write date</b></td>  -->				
				</tr>
				<tr class="rb"></tr>
				<!--
				<tr>  
					<td><b class="b"  colspan="1">write title</b> </td>
					<td><input type="text" name="" class="ch"></td>
					<td><b class="b"  colspan="1">write date</b> </td> <td  colspan="12"></td>
					<td><input type="text" name="" class="ch"></td> 
				</tr>-->
				<tr>	
					<td class="nb"><b class="b">notice content</b> </td>
				</tr>
				<tr> 
					<td colspan="15">
						<input type="text" name="" class="chb">
					</td>
				</tr>
				<tr>
					<td></td> <td></td> <td></td> <td></td> <td></td> <td></td>
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