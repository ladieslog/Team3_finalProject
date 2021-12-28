<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 미리보기</title>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="${contextPath }/resources/diarycss/diaryBoardCss.css">
</head>

<c:set var="diaryList" value="${diaryList}" />
<c:set var="currentPage" value="${currentPage }" />
<c:set var="pageSize" value="${pageSize }" />
<c:set var="search" value="${search }" />
<c:set var="count" value="1"/>
<c:if test="${currentPage==1 }">
	<c:set var="count" value="2"/>
</c:if>


<body style="overflow-x: hidden;">
	<jsp:include page="../default/header.jsp"/>
	
	<div class="diary-wrap">
		<div class="diary-container">
			<div style="display: flex;">
				<span><b style="font-size: 15px; font-family: HCR Batang; font-weight: bold;">${loginUser.nickname}님의 </b></span>
				<span><b style="font-size: 15px; margin-left: 15px; font-family: HCR Batang; font-weight: bold;">${diaryCount}가지 추억</b></span>
				&nbsp;&nbsp;
				<form action="diaryBoard" style="display: flex;">
				<input type="text" id="search" name="search" value="${search }" style="border: 1px solid white; border-radius: 6px;">
				<input type="submit" value="♥" style="border: none; background: #DEF4F9; color: gray;">
				</form>
			</div>
			<div class="flex-con-be mt-30">
			<c:if test="${currentPage == 1 }">
			<div class="diary-box">
					<a href="diaryWrite">
						<img src="${contextPath }/resources/diaryimg/diary_plus.png" class="diary-box-img"/>
					</a>
				</div>
			</c:if>
			
		 	<c:if test="${empty diaryList and pageChk == null}">
				<script type="text/javascript">
					alert('해당페이지는 존재하지 않습니다')
					location.href="diaryBoard"
				</script>
			</c:if>
				<c:forEach var="dto" items="${diaryList}">
				<div class="diary-box">
					<div>
						<a href="diaryView?num=${dto.num}" style="text-decoration: none; color:black;">
						<div style="font-family: HCR Batang; font-weight: bold;">${dto.title}</div>
						<div style="width: 220px; height:256px; background-color: white; margin:15px;">
						<c:choose>
							<c:when test="${dto.image1 == null}">
								<img style="width: 220px; height:256px;" src="${contextPath }/resources/diaryimg/note.png" class="diary-box-img"/>
							</c:when>
							<c:otherwise>
								<img style="width: 220px; height:256px;" src="<spring:url value='/image/${dto.image1}'/>">
							</c:otherwise>
						</c:choose>	
						<c:set var="count" value="${count+1}"/>
						</div>
						<div>
							<span class="fl">${dto.indatestr} ~ ${dto.outdatestr}</span>
							<c:if test="${dto.person == 1}">
								<span class="fr">혼자</span>
							</c:if>
							<c:if test="${dto.person == 2}">
								<span class="fr">가족</span>
							</c:if>
							<c:if test="${dto.person == 3}">
								<span class="fr">친구</span>
							</c:if>
							<c:if test="${dto.person == 4}">
								<span class="fr">연인</span>
							</c:if>
						</div>
						</a>
					</div>
				</div>
					</c:forEach>	
			</div>
			<div style="text-align: center; margin-top: 59px;">
			<c:set var="diaryCount" value="${diaryCount}"/>
				<fmt:parseNumber var="pageCount" integerOnly="true" value="${diaryCount/4+1}"/>				
				<c:set var="pageBlock" value="10"/>
				<fmt:parseNumber var="startPage1" integerOnly="true" value="${(currentPage-1)/pageBlock}"/>	
				<fmt:parseNumber var="startPage" integerOnly="true" value="${startPage1*pageBlock+1}"/>	
				<c:set var="endPage" value="${startPage+pageBlock-1}"/>
				<c:if test="${endPage > pageCount }">
					<c:set var="endPage" value="${pageCount }"/>
				</c:if>
				<c:if test="${startPage> pageBlock }">
					<a style="font-size:18px; text-decoration: none; color:black" href="diaryBoard?currentPage=${startPage-10 }&search=${search}">←</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<c:choose>
				<c:when test="${i == currentPage }">
					<a class="page" href="#">●</a>
				</c:when>
				<c:otherwise>
					<a class="page" href="diaryBoard?currentPage=${i}&search=${search}">○</a>				
				</c:otherwise>
			</c:choose>
				</c:forEach>
				<c:if test="${endPage < pageCount }">
					<a style="font-size:18px; text-decoration: none; color:black" href="diaryBoard?currentPage=${startPage+10 }&search=${search}">→</a>
				</c:if>
			</div>

		</div>
	</div>
	
	<jsp:include page="../default/footer.jsp"/>

</body>
</html>