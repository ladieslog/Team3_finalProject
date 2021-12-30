<%@page import="com.care.dare.join.controller.MemberDTO"%>
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
		background-color: #F6F6F6;
		/* height: 650px; */
		padding: 28px 391px 28px 423px;
		
	}
	.notice-view-title {
		border-bottom: 1px solid #FFA7A7;
	}
	.notice-view-title>div {
		margin: 10px 0;
	}
	.notice-view-content {
		padding: 20px 15px;
		min-height: 450px;
		background: #FFFFF9; font-weight: bold;
  	    font-family: HCR Batang; overflow-x: auto;
	}
	.notice-view-bottom {
		border-top: 1px solid #FFA7A7;
 		padding-top: 10px;
	}
	.notice-view-bottom button {
		background-color: #F6F6F6;
    	border-color: #F6F6F6;
    	border-radius: 6px;
    	height: 30px; font-weight: bold;
    font-family: HCR Batang;
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
	img {
		max-width: 100%;
	}
</style>
</head>
<%
	QnaDTO dto = (QnaDTO) request.getAttribute("qna"); // 해당 게시글 데이터
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // 시간 형식 포맷
	MemberDTO userDto = (MemberDTO) session.getAttribute("loginUser");
%>
<body style="overflow-x: hidden;">
	<jsp:include page="../default/header.jsp"/>
	
	<div class="notice-view-wrap">
		<div>
			<div class="notice-view-title">
				<div style="margin-top: 0;margin-left: 14px;font-weight: bold;font-family: HCR Batang;"><%=dto.getNum() %> | <%=dto.getQuestionTitle() %></div>
				<div style="margin-left: 14px; font-weight: bold; font-family: HCR Batang;">
					<%=dto.getQuestionId() %> | <%=sdf.format(dto.getQuestionTime()) %> | 
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
				<%
					if(userDto.getId().equals("3333")) {
				%>
				<button type="button" class="wd-85" onclick="AnswerPage();">답변하기</button>
				<%
					}
				%>
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
	function AnswerPage() {
		location.href = "qnaAnswer";
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