<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

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

.membership-form {
	background-image:
		url("<%=request.getContextPath()%>/resources/welcome.png");
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 820px;
	height: 620px;
	margin-top: 50px;
	display:flex;
	
}
.table{
	text-align:
	center;
	display: flex;
	justify-content: center;
	margin-top:160px;

}
td{
	height:70px;
	width:200px;
}
.membership-box {
	display: flex;
	height: 500px;
    justify-content: center;
    width: 100%;
    padding-right: 110px;
    padding-top: 40px;
    background-color:black;
}

.membership-table {
	position: relative;
	left: 10px;
	top: 80px;
	width:400px;
	height:150px;
	
	
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
#form{
	display:flex;
	justify-content:center;
	align-items:center;
	width:100%; 
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

			<form name="reFrm" method="post" action="memberProc.jsp" id="form">			
					
					
							<table cellspacing="0"  cellpadding="2" align="center" class="membership-table">

								<tr>
									<td >ID</td>
									<td><input name="id" size="15">
										</td>
									<td rowspan ="2" ><button type="button" onClick="idCheck(this.form.id.value)"
											class="but">로그인</button></td>
								</tr>
								<tr>
									<td>Password</td>
									<td><input type="password" name="repwd" size="20"></td>
								</tr>
								<tr>
									<td colspan="3" align="center"><button type="button"
											onclick="idCheck()"
											style="margin-right: 80px; width: 100px; height: 30px;"
											class="but">회원가입</button></td>
								</tr>
							</table>
						
			</form>


	</div>
</body>
</html>