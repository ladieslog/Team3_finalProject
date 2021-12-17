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
	<div class="c1">
		<div class="c2">			
			<table class="cn3">	
				<tr></tr>			
				<tr> 
					<td>
						<b class="bh3">  write title &nbsp;</b>	
					</td>
					<td colspan="14">
						<input type="text" name="" class="cha3">	
					</td>
					<!--<td  class="tb"> <b class="b">write date</b></td>  -->				
				</tr>
				<tr>
					<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
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
					<td class="nb"><b class="bh3">notice content</b> </td>
				</tr>
				<tr> 
					<td colspan="15">
						<input type="text" name="" class="chb3">
					</td>
				</tr>
				<tr>
					<td colspan="14"></td>
					<td class="eh1"><input type="submit" value="answer_list" class="cn4"></td>
				</tr>				
			</table>	
		</div>
	</div>
	

	<jsp:include page="../Cs/cs_back.jsp"/>
	<jsp:include page="../default/footer.jsp"/>
</div>

</body>
</html>