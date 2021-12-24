<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">w
	*{margin: 0; margin: auto;background-color: white;}
	.wrap{width: 1920px;  height: 0px;}
	.ta{ margin-top: 150px;  }
	.img{ margin-top:60px; width: 70px; height: 70px; position: absolute; left: 1175px; top: 436px; }
	.img1{ width: 700px; height: 700px; position: absolute; left: 502px; top: 141px;}
</style>

</head>
<body style="overflow-x: hidden">
	<div class="wrap">
		<table  class="ta">
			<tr>
				<td rowspan="3"><img src="${contextPath }/resources/tripMain/tripmain.png" class="img1"> </td>	<td></td>
			</tr>
			
			<tr>
				<td>
				<a href="login">
				<img src="${contextPath }/resources/tripMain/open.png" class="img">
				</a>
				</td>
			</tr>
			
			<tr>
				<td></td>
			</tr>
		</table>
	</div>
</body>
</html>