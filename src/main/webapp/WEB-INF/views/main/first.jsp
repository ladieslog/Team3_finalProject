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
	*{margin: 0; margin: auto;background-color: gray;}
	.wrap{width: 1920px; background-color: gray; height: 0px;}
	.ta{ margin-top: 300px;  }
</style>

</head>
<body>
	<div class="wrap">
		<table border="1px" class="ta" >
			<tr>
				<td rowspan="3"><img src="${contextPath }/resources/tripmain.png"> </td>	<td>1</td>
			</tr>
			
			<tr>
						<td>2</td>
			</tr>
			
			<tr>
						<td>3</td>
			</tr>
		</table>
	</div>
</body>
</html>