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
<link rel="stylesheet" href="${contextPath }/resources/CS/css/cs_css.css">
</head>
<body>
<div>
	<jsp:include page="../default/header.jsp"/>
	<div class="b1">
		<div class="b2">
			<br>			
				<br>
			 
				<table class="bn3">

				<tr>
					<td class="wb"colspan="2"> <b class="bh2">Q&A title &nbsp;</b>  </td>
					<td class="wb"colspan="1"> <input type="text" name="" class="ch2"></td>
					<td class="ws"colspan="1"> </td>
					<td class="wb"colspan="2"> </td>
					<td class="wb"colspan="1"></td>
				</tr>
				<tr class ="hb"></tr>
			
				<tr>
					<td colspan="2"><b class="bh2">Q&A answer &nbsp;</b> </td>
				</tr>
				<tr> 
					<td colspan="15">
						<input type="text" name="" class="chb2">
					</td>
				</tr>
					
		</table>	
			<div class="eh1">
				<input type="button" value="view list" class="bn4">
				<input type="submit" value="작성하기" class="bn4">
			</div>
		</div>

	</div>
	
	<jsp:include page="../default/footer.jsp"/>
</div>
	
	
	


</body>
</html>