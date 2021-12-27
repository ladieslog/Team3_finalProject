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
				 <form action="qnaWrite" method="post" id="form">
				<table class="bn3">
				<tr>
					<td class="wb"colspan="2"> <b class="bh2">Q&A class &nbsp;</b> </td>
					<td class="wb"colspan="1"> <input type="text" id="cla" class="ch2"></td>
					<td class="ws"colspan="1"> </td>
					<td class="wb"colspan="2"> <b class="bh2">&nbsp; writer &nbsp;</b></td>
					<td class="wb"colspan="1"> <input type="text" id="writer" name="writer" class="ch2"></td>
				</tr>
				<tr>
					<td class="wb"colspan="2"> <b class="bh2">Q&A title &nbsp;</b>  </td>
					<td class="wb"colspan="1"> <input type="text" id="title" name="title" class="ch2"></td>
					<td class="ws"colspan="1"> </td>
					<td class="wb"colspan="2">	</td>
					<td class="wb"colspan="1"> </td>
				</tr>
			
				<tr>
					<td colspan="2" class="hb"><b class="bh2">Q&A content &nbsp;</b> </td>
				</tr>
				<tr> 
					<td colspan="15">
						<textarea name="content" class="chb2" id="editor"></textarea>
					</td>
				</tr>
					
		</table>	
		</form>
			<div class="eh1">
				<input type="button" value="작성"
								class="cn4 mb-none mt-15 notice-btn" style="margin-right: 20px;" onclick="writeCheck();">
				<button type="button" class="cn4 mb-none notice-btn" onclick="location.href='csMain'">돌아가기</button>
			</div>
		</div>
	</div>
	<jsp:include page="../default/footer.jsp"/>
</div>
	
		<script
		src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>
	<script>
	// ckEditor를 textarea태그에 적용 및 사이즈 조절
		window.onload = function() {
			ck = CKEDITOR.replace("editor", {
				height : 250,
				width : 1000
			});
		}
	</script>
	<script
		src="<%=request.getContextPath()%>/resources/CS/script/notice_js.js"></script>
	


</body>
</html>