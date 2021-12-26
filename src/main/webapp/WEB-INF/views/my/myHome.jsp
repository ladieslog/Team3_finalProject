<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="${contextPath }/resources/MyPageCss/MyPageCss.css?ver=3">
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body style="overflow-x: hidden;">
<%
	if(request.getParameter("error") != null) {
		if(request.getParameter("error").equals("1491184513467160054")) {
			System.out.println("실행");
			response.sendRedirect("error");
		}
		
	}
%>
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
					<button type="button" onclick="accountDelete();">회원 탈퇴</button>
				</div>
				
			</form>
		</div>
		
		<div class="email-model" id="email-model">
			<div>
				<form action="emailCertified" method="post" id="model-form">
					<div class="email-model-delete-box">
						<img src="${contextPath }/resources/diaryimg/delete.png" class="cursor" id="email-model-delete" onclick="modelExit();"/>
					</div>
					<div>
						등록된 회원 이메일로 인증번호를 보냈습니다. 이메일을 확신하신 후 인증번호를 입력하시고 탈퇴 버튼을 누르면 탈퇴가 완료됩니다.<br/>
						인증 번호 : <input type="text" name="certified" id="certified"/> 남은 시간 : <span id="time">3 : 0</span>
					</div>
					<div>
						<button type="button" onclick="emailCertified();">탈퇴하기</button>
					</div>
				</form>
			</div>
		</div>
	<jsp:include page="../default/footer.jsp"/>
<script src="${contextPath }/resources/MyPageScript/MyPageScript.js?ver=7"></script>
<script type="text/javascript">
	//탈퇴 버튼 클릭시 이메일 전송 메소드
	var certifiedNum = "";
	function accountDelete() {
		if(confirm("정말로 탈퇴하시겠습니까?")) {
			$.ajax({
				url : "accountDelete",
				type : "GET",
				dataType : "json",
				success : function(list) {
					$("#email-model").css('display', 'block');
					certifiedNum = list[0];
					TimerStart();
				}, error : function() {
					alert("문제 발생");
				}
			})
		}
	}
	
	function emailCertified() {
		if(SetTime < 0) {
			alert("인증 시간이 지났습니다. 창 종료후 다시 진행해주세요.");
			return;
		}
		if(document.getElementById("certified").value == "" || document.getElementById("certified").value.replace(blank_pattern1, '') == "") {
			alert("인증번호를 입력해 주세요.");
			document.getElementById("certified").focus();
			return;
		}
		if(document.getElementById("certified").value != certifiedNum) {
			alert("인증번호가 틀립니다.");
			return;
		}
		document.getElementById("model-form").submit();
	}
</script>
</body>
</html>