<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{margin: 0; margin: auto;background-color: white;}
	.wrap{width: 1920px;  height: 0px;}
	.ta{ margin-top: 150px;  }
	.b1{ display:flex; justify-content: flex-end; margin-bottom: 50px;}
	
</style>

</head>
<body>
	<div class="wrap">
		<table  class="ta" >
			<tr>
				<td rowspan="3"><img src="${contextPath }/resources/tripmain.png" class="img1"> </td>	<td></td>
			</tr>
			
			<tr>
						<td><a href=""><img src="${contextPath }/resources/open.png" class="img"></a></td>
			</tr>
			
			<tr>
						<td></td>
			</tr>
		</table>
	</div>
		<h3 class="b1">
		<a href="http://localhost:8081/root/cs">돌아가기</a>
	</h3>
</body>
</html></html>