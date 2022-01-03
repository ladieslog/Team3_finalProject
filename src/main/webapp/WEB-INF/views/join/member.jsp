<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap.css">
<script src="<%=request.getContextPath()%>/resources/bootstrap.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/MailNumber.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

	var blank_pattern1 = /^\s+|\s+$/g; // 공백만 있을 경우
	var regType1 = /^[A-Za-z0-9+]*$/;
	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/; // 이메일 체크

	
	function idsearch(){
		if(document.getElementById("id").value == "" || document.getElementById("id").value.replace(blank_pattern1, '') == "") {
			alert("아이디를 입력해 주세요.");
			document.getElementById("id").focus();
			return;
		}
		
		if(document.getElementById("id").value.length > 12 || 4 > document.getElementById("id").value.length) {
			alert("아이디는 4~12자 사이로 입력해 주세요.");
			document.getElementById("id").focus();
			return;
		} 
		if(!(regType1.test(document.getElementById("id").value))) {
			alert("아이디에 한글, 특수문자는 입력하실 수 없습니다.");
			document.getElementById("id").focus();
			return;
		}
		
		var id= document.getElementById("id").value
		var form={id:id}
		$.ajax({
			url: "idcheck", type: "post", data: JSON.stringify(form), dataType: "json", contentType : "application/json; charset=utf-8",
			success: function(map){
				if (map.idcheck!= null){
					alert("중복된 ID입니다.")
				}else{
					alert("사용 가능한 ID입니다.")
					document.getElementById("idcheck").value = document.getElementById("id").value
					document.getElementById("idCk").value = "1";
				}
			}, error: function(){
				alert("error")
			}
			
		})
		
		
	}
	function resister(){
		if(document.getElementById("idCk").value == "0" || document.getElementById("id").value != document.getElementById("idcheck").value) {
			alert("아이디 중복 확인을 해주세요.");
			return;
		}
		
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
		
		
		
		document.getElementById("form").submit()
		
	}
</script>

<link href="<c:url value="/resources/membership/member.css?ver=1"/>"
    rel="stylesheet">
<style> 
	.membership-form {
	background-image:
		url("<%=request.getContextPath()%>/resources/joinImage/membership2.png");
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 740px;
	height: 620px;
	display: flex;
	margin-top: 140px;
	}
</style>

</head>
<body onLoad="reFrm.id.focus()">
	<div class="container membership-form">
		<div>
		<a href="login">
			<img src="<%=request.getContextPath()%>/resources/joinImage/화살표.png" style="width: 60px; margin-top: 324px; margin-left: 120px;">
		</a>	
		</div>
		<br />
		<br />
		<div class="membership-box">
			<form name="reFrm" method="post" action="memberProc" id="form">
				<table align="center" border="0" cellspacing="0" cellpadding="5"
					class="membership-table">
					<tr>
						<td align="center" valign="middle">
							<table cellspacing="0" cellpadding="2" align="center" width="600">

								<tr>
									<th width="20%">아이디</th>
									<td width="50%"><input name="id" size="10" id="id">
										<button type="button" onClick="idsearch()"
											class="but" style="margin-left: 5px;">중복확인</button></td>
											<input type="hidden" id="idcheck" value=""/>
											<input type="hidden" id="idCk" value="0"/>
								</tr>
								<tr>

									<th>비밀번호</th>
									<td><input type="password" name="pwd" id="pwd" size="20"></td>
								</tr>
								<tr>
									<th>비밀번호 확인</th>
									<td><input type="password" name="repwd" id="repwd" size="20"></td>

								</tr>
								<tr>
									<th>닉네임</th>
									<td><input name="nickname" id="nickname" size="20"></td>


								</tr>
								<tr>
									<th>우편번호</th>
									<td><input name="zipcode" id="zipcode" size="5" readonly>
										<button type="button" onClick="mailnum()" class="but" style="margin-left: 12px;">우편번호
											찾기</button></td>

								</tr>
								<tr>
									<th>주소</th>
									<td><input name="address" size="20" id="address" readonly></td>									
								</tr>
								
								<tr>

									<th>상세주소</th>
									<td><input name="detailaddress" size="20" id="detailaddress"></td>	
								</tr>
								<tr>
									<th>이메일</th>
									<td><input type="email" id="email" name="email" size="20"></td>

								</tr>
								<tr>
									<td colspan="3" align="center"><button type="button"
											onclick="resister()"
											style="margin-right: 185px; width: 100px; height: 30px;"
											class="but">회원가입</button></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</form>
		</div>

	</div>
</body>
</html>