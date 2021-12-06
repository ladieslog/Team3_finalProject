<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
	funtion idCheck(id) {
		
		/*
		frm= document.regFrm;
		if (id=""){
			alert("아이디를 입력해 주세요.");
			frm.id.focus();
			return;
		}
		url = "idCheck.jsp?id=" + id;
		window
			.open(url, "IDCheck", "width=300, height=150");
	*/
	}
/*
	function zipCheck(){
		url = "zipSearch.jsp?check=n";
		window
			.open(url, "ZipCodeSearch",
					"width=500, height=300, scrollbars=yes");
	}
*/
</script>
<style type="text/css">
td {
	height: 50px;
}

.membership-form {
	background-image:
		url("<%=request.getContextPath()%>/resources/membership.png");
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 820px;
	height: 620px;
	display: flex;
}
.membership-box {
	display: flex;
    justify-content: center;
    width: 100%;
    padding-right: 10px;
    padding-top: 20px;
}

.membership-table {
	position: relative;
	left: 60px;
	top: 130px;
}

input {
	border-radius: 5px;
	border: none;
}

.but {
	border-color: #B0C6E7;
	border-radius: 5px;
	background-color: #B0C6E7;
}
</style>
</head>
<body onLoad="reFrm.id.focus()">
	<div class="container membership-form">
		<div>
			<img src="<%=request.getContextPath()%>/resources/화살표.png" style="width: 60px; margin-top: 295px;">
		</div>
		<br />
		<br />
		<div class="membership-box">
			<form name="reFrm" method="post" action="memberProc.jsp" id="form">
				<table align="center" border="0" cellspacing="0" cellpadding="5"
					class="membership-table">
					<tr>
						<td align="center" valign="middle">
							<table cellspacing="0" cellpadding="2" align="center" width="600">

								<tr>
									<td width="20%">ID</td>
									<td width="50%"><input name="id" size="20">
										<button type="button" onClick="idCheck(this.form.id.value)"
											class="but">ID 중복확인</button></td>

								</tr>
								<tr>
									<td>Password</td>
									<td><input type="password" name="repwd" size="20"></td>
								</tr>
								<tr>
									<td>Password 확인</td>
									<td><input type="password" name="repwd" size="20"></td>

								</tr>
								<tr>
									<td>Nickname</td>
									<td><input name="name" size="15"></td>

								</tr>
								<tr>
									<td>Mail number</td>
									<td><input name="zipcode" id="zipcode" size="5" readonly>
										<button type="button" onClick="mailnum()" class="but">우편번호
											찾기</button></td>

								</tr>
								<tr>
									<td>Address</td>
									<td><input name="address" size="30" id="address"></td>									
								</tr>
								
								<tr>
									<td>Detailed Address</td>
									<td><input name="address" size="20" id="detailed address"></td>	
								</tr>
								<tr>
									<td>Email</td>
									<td><input name="email" size="30"></td>

								</tr>
								<tr>
									<td colspan="3" align="center"><button type="button"
											onclick="idCheck()"
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