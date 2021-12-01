<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/bootstrap.css">
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/bootstrap.js"></script>
<style type="text/css">
	.diary-wrap {
		background-color: #DEF4F9;
		padding: 80px 0;
	}
	.diary-container {
		padding: 0 80px;
	}
	.diary-box {
		background-color: #B2CCFF;
		width: 300px;
		height: 360px;
		display: flex;
   		justify-content: center;
    	align-items: center;
    	margin: 0 50px;
	}
	.flex-con-be {
		display: flex;
		justify-content: center;
	}
	.diary-box-img {
		width: 200px;
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
<body>
	<jsp:include page="../default/header.jsp"/>
	
	<div class="diary-wrap">
		<div class="diary-container">
			<div>
				<span><b style="font-size: 18px;">닉네임</b></span>
				<span><b style="font-size: 18px;">글 갯수</b></span>
			</div>
			<div class="flex-con-be mt-30">
				<div class="diary-box">
					<a href="#">
						<img src="${contextPath }/resources/diary_plus.png" class="diary-box-img"/>
					</a>
				</div>
				<div class="diary-box">
					<a href="#">
						<img src="${contextPath }/resources/diary_plus.png" class="diary-box-img"/>
					</a>
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