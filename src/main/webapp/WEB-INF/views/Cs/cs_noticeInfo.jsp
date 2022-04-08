<%@page import="com.care.dare.join.controller.MemberDTO"%>
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
<style type="text/css">

</style>
</head>
<%
	NoticeDTO dto = (NoticeDTO) request.getAttribute("noticeInfo"); // 해당 게시글 데이터
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // 시간 형식 포맷
	MemberDTO userDto = (MemberDTO) session.getAttribute("loginUser");
	
	%>
<body style="overflow-x: hidden;">
	<jsp:include page="../default/header.jsp"/>
	
	<div class="notice-view-wrap">
		<div>
			<div class="notice-view-title">
				<div style="margin-left: 14px; font-weight: bold; font-family: HCR Batang;"><%=dto.getNum() %> | <%=dto.getTitle() %></div>
				<div style="font-weight: bold; font-family: HCR Batang; margin-left: 14px;">
					관리자 | <%=sdf.format(dto.getTime()) %> | <%=dto.getHit() %>
				</div>
			</div>
			<div class="notice-view-content">
			<%=dto.getContent() %>
			</div>
			<div class="notice-view-bottom" align="right">
				<button type="button" class="wd-85" onclick="listPage();">목록으로</button>
				<%
					if(userDto.getId().equals("3333")) {
				%>
					<form action="noticeModifyForm" method="post" id="noticeModifyForm">
						<button type="button" class="wd-60" onclick="modifyPage();">수정</button>
						<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
					</form>
					<form action="noticeDelete" method="post" id="noticeDelete">
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
	function modifyPage() {
		document.getElementById("noticeModifyForm").submit();
	}
	function deletePage() {
		if(confirm("정말 게시글을 삭제하시겠습니까?")) {
			document.getElementById("noticeDelete").submit();
		}
	}
</script>
</body>
</html>