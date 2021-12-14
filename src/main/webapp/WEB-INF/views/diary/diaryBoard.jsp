<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		padding: 98px 0 138px 0;
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
		margin-top: 30px;
	}
	.fl {
		float: left;
	}
	.fr {
		float: right;
	}
</style>
</head>
<c:set var="pageSize" value="10"/> <!-- 한 페이지에 출력할 게시글 수 -->
<c:set var="currentPage" value="${requestScope.currentPage }"/>
<c:if test="${currentPage eq null }">
	<c:set var="currentPage" value="1"/>
</c:if>
<fmt:formatNumber var="pageNum" type="number" value="${currentPage }"/>
<c:set var="startRow" value="${(pageNum - 1) * pageSize + 1 }"/>
<c:set var="endRow" value="${pageNum *  pageSize}"/>
<body style="overflow-x: hidden;">
	<jsp:include page="../default/header.jsp"/>
	${currentPage } <br/>
	${startRow }<br/>
	${endRow }
	<div class="diary-wrap">
		<div class="diary-container">
			<div>
				<span><b style="font-size: 15px;">닉네임</b></span>
				<span><b style="font-size: 15px; margin-left: 15px;">추억</b></span>
			</div>
			<div class="flex-con-be mt-30">
				<div class="diary-box">
					<a href="#">
						<img src="${contextPath }/resources/diaryimg/diary_plus.png" class="diary-box-img"/>
					</a>
				</div>
				<div class="diary-box">
					<a href="#">
						<img src="${contextPath }/resources/diaryimg/diary_plus.png" class="diary-box-img"/>
					</a>
				</div>
				<div class="diary-box">
					<div>
						<div>제목</div>

						<div style="width: 220px; height:256px; background-color: #FAED7D; margin:15px;"></div>

						<div>
							<span class="fl">몇월몇일</span>
							<span class="fr">누구랑</span>
						</div>
					</div>
				</div>
				<div class="diary-box">
					<div>
						제목
						<div style="width: 200px; height:200px; background-color: #FAED7D;"></div>
						<div>
							<span class="fl">몇월몇일</span>
							<span class="fr">누구랑</span>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	
	<jsp:include page="../default/footer.jsp"/>

</body>
</html>