<%@page import="com.care.dare.CS.DTO.QnaDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.care.dare.CS.DTO.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.notice-view-wrap {
		background-color: #DEF4F9;
		/* height: 650px; */
		padding: 28px 600px 28px 299px;
	}
	.notice-view-title {
		border-bottom: 1px solid black;
	}
	.notice-view-title>div {
		margin: 10px 0;
	}
	.notice-view-content {
		padding: 20px 15px;
		/*height: 450px; 
		overflow: auto;*/
		min-height: 450px;
		background: #EFFBFB;
	}
	.notice-view-bottom {
		border-top: 1px solid black;
 		padding-top: 10px;
 		padding-right: 15px;
	}
	.notice-view-bottom button {
		background-color: #DEF4F9;
    	border-color: #DEF4F9;
    	border-radius: 6px;
    	height: 30px;
	}
	.wd-85 {
		width: 85px;
	}
	.wd-60 {
		width: 60px;
	}
	form {
		display: inline;
	}
</style>
</head>
<%
	QnaDTO dto = (QnaDTO) request.getAttribute("qna"); // 해당 게시글 데이터
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // 시간 형식 포맷
%>
<body style="overflow-x: hidden;">
	<jsp:include page="../default/header.jsp"/>
	
	<div class="notice-view-wrap">
		<div>
			<div class="notice-view-title">
				<div style="margin-top: 0;"><%=dto.getNum() %> | <%=dto.getQuestionTitle() %></div>
				<div>
					관리자 | <%=sdf.format(dto.getQuestionTime()) %> | 
					<%
						if(dto.getStatus().equals("0")) {
					%>
					답변 대기
					<%
						} else {
					%>
					답변 완료
					<%
						}
					%>
				</div>
			</div>
			<div class="notice-view-content">
			<%=dto.getQuestionContent() %>
			</div>
			<div class="notice-view-bottom" align="right">
				<button type="button" class="wd-85" onclick="listPage();">목록으로</button>
				<form action="qnaModifyForm" method="post" id="qnaModifyForm">
					<button type="button" class="wd-60" onclick="modifyPage();">수정</button>
					<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
				</form>
				<form action="qnaDelete" method="post" id="qnaDelete">
					<button type="button" class="wd-60" onclick="deletePage();">삭제</button>
					<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="../default/footer.jsp"/>
	
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function listPage() {
		location.href = "csMain";
	}
	function modifyPage() {
		document.getElementById("qnaModifyForm").submit();
	}
	function deletePage() {
		if(confirm("정말 게시글을 삭제하시겠습니까?")) {
			document.getElementById("qnaDelete").submit();
		}
	}
</script>
</body>
	

</html>