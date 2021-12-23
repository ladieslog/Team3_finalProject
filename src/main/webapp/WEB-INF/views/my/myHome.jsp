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
	          	
	          	$("#zipcode").val(data.zonecode);
	          	$("#address").val(addr);
	        }
	    }).open();
	}
	
	var blank_pattern1 = /^\s+|\s+$/g; // 공백만 있을 경우
	var regType1 = /^[A-Za-z0-9+]*$/;
	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/; // 이메일 체크

	
	function modify(){
		if(document.getElementById("pwd").value == "" || document.getElementById("pwd").value.replace(blank_pattern1, '') == "") {
			alert("패스워드를 입력해 주세요.");
			document.getElementById("pwd").focus();
			return;
		}
		if(document.getElementById("pwd").value.length > 16 || 8 > document.getElementById("pwd").value.length) {
			alert("패스워드는 8~16자 사이로 입력해 주세요.");
			document.getElementById("pwd").focus();
			return;
		}
		if(document.getElementById("pwd").value != document.getElementById("repwd").value) {
			document.getElementById("repwd").focus();
			alert("패스워드가 일치하지 않습니다.");
			return;
		}
		
		if(document.getElementById("nickname").value == "" || document.getElementById("nickname").value.replace(blank_pattern1, '') == "") {
			alert("닉네임을 입력해 주세요.");
			document.getElementById("nickname").focus();
			return;
		}
		if(document.getElementById("nickname").value.length > 12 || 2 > document.getElementById("nickname").value.length) {
			alert("닉네임은 2~12자 사이로 입력해 주세요.");
			document.getElementById("nickname").focus();
			return;
		}
		if(document.getElementById("zipcode").value == "" || document.getElementById("zipcode").value.replace(blank_pattern1, '') == "") {
			alert("주소를 입력해 주세요.");
			return;
		}
		
		if(document.getElementById("detailaddress").value == "" || document.getElementById("detailaddress").value.replace(blank_pattern1, '') == "") {
			alert("상세주소를 입력해 주세요.");
			document.getElementById("detailaddress").focus();
			return;
		}
		if(document.getElementById("detailaddress").value.length > 30) {
			alert("상세주소는 30자 이내로 입력해 주세요.");
			document.getElementById("detailaddress").focus();
			return;
		}
		
		if(document.getElementById("email").value == "" || document.getElementById("email").value.replace(blank_pattern1, '') == "") {
			alert("이메일을 입력해 주세요.");
			document.getElementById("email").focus();
			return;
		}
		
		if(!(reg_email.test(document.getElementById("email").value))) {
			alert("이메일 형식에 맞게 입력해 주세요.");
			document.getElementById("email").focus();
			return;
		}
		
		
		if(document.getElementById("email").value.length > 30 || 10 > document.getElementById("email").value.length) {
			alert("이메일은 10~30자 사이로 입력해 주세요.");
			document.getElementById("email").focus();
			return;
		}
		
		document.getElementById("mod").submit()
	}
</script>
</head>
<body style="overflow-x: hidden;">

	<jsp:include page="../default/header.jsp"/>
		<div class="my-wrap">
			<form id="mod" action="myUpdate" method="post">
			<div class="st">회원정보</div>
		<hr class="hr" style="margin-top: 37px;">
				<div class="input-box">
					<div>
						<div class="left-text">아이디</div>
						<div><input type="text" id="id" name="id" class="fontname" value="${myHome.id}" readonly/></div>
					</div>
					<div>
						<div class="right-text">우편번호</div>
						<div><input type="text" id="zipcode" name="zipcode" value="${myHome.mailnumber}" readonly style="width: 140px;"/></div>
						<div class="btn-box"><button type="button" onclick="addrSearch();">주소찾기</button></div>
					</div>
				</div>
			<hr class="hr">
				<div class="input-box">
					<div>
						<div class="left-text">비밀번호</div>
						<div><input type="password" id="pwd" name="pwd" value="${myHome.pwd}" class="fontname"/></div>
					</div>
					<div>
						<div class="right-text">주소</div>
						<div><input type="text" id="address" name="address" value="${myHome.addr}" readonly class="fontname"/></div>
					</div>
				</div>
			<hr class="hr">
				<div class="input-box">
					<div>
						<div class="left-text">비밀번호 확인</div>
						<div><input type="password" id="repwd" name="pwdCk"  class="fontname"/></div>
					</div>
					<div>
						<div class="right-text">상세주소</div>
						<div><input type="text" id="detailaddress" name="detailaddress" value="${myHome.detailaddr}" class="fontname"/></div>
					</div>
				</div>
			<hr class="hr">
				<div class="input-box">
					<div>
						<div class="left-text">닉네임</div>
						<div><input type="text" id="nickname" name="nickname" value="${myHome.nickname}" class="fontname"/></div>
					</div>
					<div>
						<div class="right-text">이메일</div>
						<div><input type="email" id="email" name="email" value="${myHome.email}" class="fontname"/></div>
					</div>
				</div>
			<hr class="hr">
				<div align="center" style="margin-top: 32px; margin-left: 542px;" class="btn-div">
					<button type="button" onclick="modify()">수정 완료</button>
					<button type="button">회원 탈퇴</button>
				</div>
				
			</form>
		</div>
	<jsp:include page="../default/footer.jsp"/>
</body>
</html>