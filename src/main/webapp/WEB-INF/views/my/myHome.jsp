<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.input-box {
		width: 1000px;
		display: flex;
		justify-content: space-between;
		margin: 70px 0;
	}
	.my-wrap {
		background-color: #D5D5D5;
		display: flex;
		justify-content: center;
		height: 655.7px;
    	align-items: center;
	}
	.input-box>div {
		display: flex;
		font-size: 20px;
	}
	.input-box>div:last-child {
		width: 465px;
	}
	.left-text {
		width: 150px;
	}
	.right-text {
		width: 100px;
	}
	.btn-box {
		padding-left: 10px;
	}
	input, button {
		border-radius: 5px;
		border-color: #fff;
		font-size: 20px;
	}
	button {
		background-color: #D5D5D5;
	}
	.btn-div>button {
		margin: 0 30px;
    	width: 130px;
	}
</style>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function addrSearch() {
		new daum.Postcode({
	        oncomplete: function(data) {
	        	// R : 도로명, J : 지번
	          	console.log("data.userSelectedType : " + data.userSelectedType);
	          	console.log("data.roadAddress : " + data.roadAddress);
	          	console.log("data.jibunAddress : " + data.jibunAddress);
	          	console.log("data.zonecode : " + data.zonecode);
	          	var addr = data.roadAddress;
	          	
	          	$("#mailNum").val(data.zonecode);
	          	$("#addr").val(addr);
	        }
	    }).open();
	}
</script>
</head>
<body style="overflow-x: hidden;">
	<jsp:include page="../default/header.jsp"/>
		<div class="my-wrap">
			<form style="padding-bottom: 50px;">
				<div class="input-box">
					<div>
						<div class="left-text">아이디</div>
						<div><input type="text" name="id" readonly/></div>
					</div>
					<div>
						<div class="right-text">우편번호</div>
						<div><input type="text" id="mailNum" name="mailNum" readonly/></div>
						<div class="btn-box"><button type="button" onclick="addrSearch();">주소찾기</button></div>
					</div>
				</div>
				<div class="input-box">
					<div>
						<div class="left-text">비밀번호</div>
						<div><input type="password" name="pwd"/></div>
					</div>
					<div>
						<div class="right-text">주소</div>
						<div><input type="text" id="addr" name="addr" readonly/></div>
					</div>
				</div>
				<div class="input-box">
					<div>
						<div class="left-text">비밀번호 확인</div>
						<div><input type="password" name="pwdCk"/></div>
					</div>
					<div>
						<div class="right-text">상세주소</div>
						<div><input type="text" name="infoAddr" readonly/></div>
					</div>
				</div>
				<div class="input-box" style="margin-bottom: 100px;">
					<div>
						<div class="left-text">닉네임</div>
						<div><input type="text" name="nickname"/></div>
					</div>
					<div>
						<div class="right-text">이메일</div>
						<div><input type="email" name="email"/></div>
					</div>
				</div>
				<div align="center" style="margin-top: 50px;" class="btn-div">
					<button type="button">수정 완료</button>
					<button type="button">회원 탈퇴</button>
				</div>
			</form>
		</div>
	<jsp:include page="../default/footer.jsp"/>
</body>
</html>