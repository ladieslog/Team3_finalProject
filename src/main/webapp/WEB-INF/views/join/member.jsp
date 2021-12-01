<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join us!</title>
<link href="style.css" rel="stylesheet" type="text/css">


<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
	funtion idCheck(id) {
		frm= document.regFrm;
		if (id=""){
			alert("아이디를 입력해 주세요.");
			frm.id.focus();
			return;
		}
		url = "idCheck.jsp?id=" + id;
		window
			.open(url, "IDCheck", "width=300, height=150");
	}

	function zipCheck(){
		url = "zipSearch.jsp?check=n";
		window
			.open(url, "ZipCodeSearch",
					"width=500, height=300, scrollbars=yes");
	}
</script>
</head>
<body bgcolor="#FFFFCC" onLoad="reFrm.id.focus()">
	<div align="center">
		<br /><br />
		<form name="reFrm" method="post" action="memberProc.jsp">
			<table align="center" border="0" cellspacing="0" cellpadding="5">
				<tr>
					<td align="center" valign="middle" bgcolor="#FFFFCC">
						<table border="1" cellspacing="0" cellpadding="2" align="center" width="600">
							<tr align="center" bgcolor="#996600">
								<td colspan="3"><font color="#FFFFFF"><b>회원 가입</b></font></td>
							</tr>
							<tr>
								<td width="20%">ID</td>
								<td width="50%"><input name="id" size="15">
									<input type="button" value="ID 중복확인"
									onClick="idCheck(this.form.id.value)"></td>
								<td width="30%">아이디를 적어 주세요</td>
								</tr>
								<tr>
									<td>Password</td>
									</tr>
									<tr>
									<td>Password 확인</td>
									<td><input type="password" name="repwd" size="15"></td>
									<td>비밀번호를 확인합니다</td>
								</tr>
								<tr>
									<td>Name</td>
									<td><input name="name" size="15">
									</td>
									<td>닉네임을 적어주세요</td>
								</tr>
								<tr>
								 <td>Mail number</td>
								 <td><input name="zipcode" size="5" readonly>
								 	<input type="button" value="우편번호 찾기" onClick="zipCheck()">
								 </td>
								 <td>우편번호를 검색하세요	</td>
								</tr>
								<tr>														
									<td>Address</td>
									<td><input name="adress" size="45"></td>
									<td>주소를 적어주세요</td>
								</tr>
								<tr>
									<td>Email</td>
									<td><input name="email" size="30">
									</td>
									<td>이메일을 적어 주세요</td>
								</tr>
								<tr>
									<td colspan="3" align="center"><input type="button"
									value="회원가입" onclick="inputCheck()"> &nbsp; &nbsp; <input
									type="reset" value="다시쓰기">&bnsp; &nbsp; <input
									type="button" value="Login"
									onClick="javascript:location.href='login.jsp'"></td>
								</tr>														
							</table>
						</td>
					</tr>
				</table>
			</form>
	</div>
</body>
</html>