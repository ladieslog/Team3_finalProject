<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script type="text/javascript">

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
	
/*
	function zipCheck(){
		url = "zipSearch.jsp?check=n";
		window
			.open(url, "ZipCodeSearch",
					"width=500, height=300, scrollbars=yes");
	}
*/


function join(){
	location.href="membership"
}
function logincheck(){
	document.getElementById("form").submit()
}

</script>

<link href="<c:url value="/resources/membership/login.css?ver=1"/>"
    rel="stylesheet">
<style type="text/css">

		
.table{	text-align:	center;	display: flex;	justify-content: center; margin-top:160px;}

td{	height:100px;	width:290px;}

.membership-box {	display: flex;	height: 500px;    justify-content: center;    width: 100%;
    padding-right: 110px;    padding-top: 40px;    background-color:black;}

input {	border-radius: 21px;	border: none;	font-family: HCR Batang; font-weight: bold;width: 238px;
    height: 50px; }

.but {	border-color: #B0C6E7;	border-radius: 10px;	background-color: #B0C6E7; width: 100px; font-size: 16px;
    font-weight: bold; height: 40px; margin-bottom: 60px;}

#form{	display:flex;	justify-content:center;	align-items:center;	margin-top: 150px;}
</style>


</head>
<body onLoad="reFrm.id.focus()">
	<div class="container membership-form">
		<div>
		<a href="first">
			<img src="<%=request.getContextPath()%>/resources/화살표.png" style="width: 60px; margin-top: 396px; margin-left:235px;">
		</a>	
		</div>
		<br />
		<br />

			<form name="reFrm" method="post" action="loginproc" id="form">			
					
					
							<table cellspacing="0" cellpadding="2" style="text-align: center; margin-left:135px;">

								<tr>
									<td><input name="id" id="id" placeholder="아이디" size="10"></td>
								</tr>
								<tr>
									<td><input type="password" placeholder="비밀번호" id="pwd" name="pwd" size="10"></td>
								</tr>
								<tr>
									
									<td colspan="2" style="display: flex; justify-content: center; align-items: center;">
									<button type="button" onclick="join()" class="but">회원가입</button>
								<button type="button" onClick="logincheck()" class="but" style="margin-left: 37px;">로그인</button></td>
								</tr>
							</table>
						
			</form>


	</div>
</body>
</html>