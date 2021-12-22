<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="${contextPath }/resources/MyPageCss/MyPageCss.css">
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
			<form action="">
			<div class="st">회원정보</div>
		<hr class="hr" style="margin-top: 37px;">
				<div class="input-box">
					<div>
						<div class="left-text">아이디</div>
						<div><input type="text" name="id" class="fontname" readonly/></div>
					</div>
					<div>
						<div class="right-text">우편번호</div>
						<div><input type="text" id="mailNum" name="mailNum" readonly style="width: 140px;"/></div>
						<div class="btn-box"><button type="button" onclick="addrSearch();">주소찾기</button></div>
					</div>
				</div>
			<hr class="hr">
				<div class="input-box">
					<div>
						<div class="left-text">비밀번호</div>
						<div><input type="password" name="pwd" class="fontname"/></div>
					</div>
					<div>
						<div class="right-text">주소</div>
						<div><input type="text" id="addr" name="addr" readonly class="fontname"/></div>
					</div>
				</div>
			<hr class="hr">
				<div class="input-box">
					<div>
						<div class="left-text">비밀번호 확인</div>
						<div><input type="password" name="pwdCk" class="fontname"/></div>
					</div>
					<div>
						<div class="right-text">상세주소</div>
						<div><input type="text" name="infoAddr" class="fontname"/></div>
					</div>
				</div>
			<hr class="hr">
				<div class="input-box">
					<div>
						<div class="left-text">닉네임</div>
						<div><input type="text" name="nickname" class="fontname"/></div>
					</div>
					<div>
						<div class="right-text">이메일</div>
						<div><input type="email" name="email" class="fontname"/></div>
					</div>
				</div>
			<hr class="hr">
				<div align="center" style="margin-top: 32px; margin-left: 542px;" class="btn-div">
					<button type="button">수정 완료</button>
					<button type="button">회원 탈퇴</button>
				</div>
				
			</form>
		</div>
	<jsp:include page="../default/footer.jsp"/>
</body>
</html>