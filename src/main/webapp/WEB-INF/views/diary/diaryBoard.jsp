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
<title>Insert title here</title>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<style type="text/css">
	.diary-wrap {
		background-color: #DEF4F9;
		padding: 59px 0 70px 0;
	}
	.diary-container {
		padding: 0 80px;
	}
	.diary-box {
		background-color: white;
		width: 300px;
		height: 360px;
		display: flex;
   		justify-content: center;
    	align-items: center;
    	margin: 0 50px;
    	border-radius: 10px;
	}
	.flex-con-be {
		display: flex;
		justify-content: center;
	}
	.diary-box-img {
		width: 100px;
	}
	.mt-30 {
		margin-top: 60px;
	}
	.fl {
		float: left;
	}
	.fr {
		float: right;
	}
	.page{ text-decoration: none; text-align: center; color:black; }
</style>
</head>

<c:set var="diaryList" value="${diaryList}" />
<c:set var="currentPage" value="${currentPage }" />
<c:set var="pageSize" value="${pageSize }" />
<c:set var="count" value="1"/>
<c:if test="${currentPage==1 }">
	<c:set var="count" value="2"/>
</c:if>


<body style="overflow-x: hidden;">
	<jsp:include page="../default/header.jsp"/>
	
	<div class="diary-wrap">
		<div class="diary-container">
			<div>
				<span><b style="font-size: 15px;">닉네임님의 </b></span>
				<span><b style="font-size: 15px; margin-left: 15px;">${diaryCount}가지 추억</b></span>
			</div>
			<div class="flex-con-be mt-30">
			<c:if test="${currentPage == 1 }">
			<div class="diary-box">
					<a href="diaryWrite">
						<img src="${contextPath }/resources/diaryimg/diary_plus.png" class="diary-box-img"/>
					</a>
				</div>
			</c:if>
			<c:if test="${empty diaryList}">
				<script type="text/javascript">
					alert('해당페이지는 존재하지 않습니다')
					location.href="diaryBoard"
				</script>
			</c:if>
				<c:forEach var="dto" items="${diaryList}">
				<div class="diary-box">
					<div>
						<a href="diaryView?num=${dto.num}" style="text-decoration: none; color:black;">
						<div>${dto.title}</div>
						<div style="width: 220px; height:256px; background-color: white; margin:15px;">
						<c:choose>
							<c:when test="${dto.image1 == null}">
								<img style="width: 220px; height:256px;" src="${contextPath }/resources/diaryimg/diary_plus.png" class="diary-box-img"/>
							</c:when>
							<c:otherwise>
								<img style="width: 220px; height:256px;" src="<spring:url value='/image/${count}.png'/>">
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
					<a href="diaryBoard?currentPage=${startPage-10 }">이전</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<c:choose>
				<c:when test="${i == currentPage }">
					<a class="page" href="diaryBoard?currentPage=${i}">●</a>
				</c:when>
				<c:otherwise>
					<a class="page" href="diaryBoard?currentPage=${i}">○</a>				
				</c:otherwise>
			</c:choose>
				</c:forEach>
				<c:if test="${endPage < pageCount }">
					<a href="diaryBoard?currentPage=${startPage+10 }">다음</a>
				</c:if>
			</div>

		</div>
	</div>
	
	<jsp:include page="../default/footer.jsp"/>

</body>
</html>