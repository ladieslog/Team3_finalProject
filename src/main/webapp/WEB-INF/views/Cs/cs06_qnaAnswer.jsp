<%@page import="com.care.dare.join.controller.MemberDTO"%>
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
<link rel="stylesheet" href="${contextPath }/resources/CS/css/cs_css.css?ver=8">
</head>
<body>
<div>
<%
	MemberDTO dto = (MemberDTO) session.getAttribute("loginUser");

%>
	<jsp:include page="../default/header.jsp"/>
	<div class="c1 mr-auto notice-wrap qna-wrap">
		<div class="c2 pd-none">
			<br>			
				<br>
				 <form action="answerWrite" method="post" id="form">
				 <input type="hidden" name="num" value="<%=request.getAttribute("num") %>"/>
				<table border="1px;">
				<tr>
					<td class="wb"colspan="2" style="width: 80px;"> <b class="bh2">답변제목 &nbsp;</b></td>
					<td class="wb"colspan="1"> <input type="text" id="title" class="ch2" value="<%=request.getAttribute("title") %>" readonly/></td>
					<td class="ws"colspan="1"> </td>
					<td class="wb"colspan="2"> <b class="bh2">&nbsp; 답변자 &nbsp;</b></td>
					<td class="wb"colspan="1"> <input type="text" id="writer" name="writer" class="ch2" value="관리자" readonly></td>
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
				<button type="button" class="cn4 mb-none notice-btn" onclick="history.back()">돌아가기</button>
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
				height : 350,
				width : 1000
			});
		}
	</script>
	<script
		src="<%=request.getContextPath()%>/resources/CS/script/notice_js.js"></script>
	


</body>
</html>