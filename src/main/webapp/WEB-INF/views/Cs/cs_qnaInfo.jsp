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
<link rel="stylesheet"
	href="${contextPath }/resources/CS/css/cs_css.css">

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
			<h1>QUESTION</h1>
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
			<%
				if(dto.getStatus().equals("1")) {	
			%>
			<div id="answer-box" style="margin-top: 30px; display: none;">
				<h1>Answer</h1>
				<div class="notice-view-title">
					<div>관리자 | <%=sdf.format(dto.getAnswerTime()) %></div>
				</div>
				<div class="notice-view-content answer-content">
				<%=dto.getAnswerContent() %>
				</div>
			</div>
			<%
				}
			%>
			<div class="notice-view-bottom" align="right">
				<%
					if(userDto.getId().equals("3333") && dto.getStatus().equals("0")) {
				%>
				<form action="qnaAnswer" method="post" id="qnaAnswer">
					<button type="button" class="wd-85" onclick="AnswerPage();">답변하기</button>
					<input type="hidden" name="title" value="<%=dto.getQuestionTitle() %>"/>
					<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
				</form>
				
				<%
					}
					if(dto.getStatus().equals("1")) {
				%>
					<button type="button" class="wd-85" onclick="answerInfo();" id="answerBtn">답변보기</button>
				<%
					}
				%>
				<button type="button" class="wd-85" onclick="listPage();">목록으로</button>
				<%
					if(dto.getStatus().equals("0") && dto.getQuestionId().equals(userDto.getId())) {
				%>
					<form action="qnaModifyForm" method="post" id="qnaModifyForm">
						<button type="button" class="wd-60" onclick="modifyPage();">수정</button>
						<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
					</form>
				<%
					}
				%>
				
				<%
					if(dto.getStatus().equals("0") || userDto.getId().equals("3333")) {
				%>
					<form action="qnaDelete" method="post" id="qnaDelete">
						<button type="button" class="wd-60" onclick="deletePage();">삭제</button>
						<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
					</form>
				<%
					}
				%>
				
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
		document.getElementById("qnaAnswer").submit();
	}
	function modifyPage() {
		document.getElementById("qnaModifyForm").submit();
	}
	function deletePage() {
		if(confirm("정말 게시글을 삭제하시겠습니까?")) {
			document.getElementById("qnaDelete").submit();
		}
	}
	
	var answerSwitch = 1;
	function answerInfo() {
		$("#answer-box").slideToggle(500);
		answerSwitch = answerSwitch * -1;
		if(answerSwitch == -1) {
			document.getElementById("answerBtn").innerText = "답변닫기";
		} else {
			document.getElementById("answerBtn").innerText = "답변보기";
		}
	}
</script>
</body>
	

</html>