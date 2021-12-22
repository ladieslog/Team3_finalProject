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

<link href="<c:url value="/resources/membership/login.css" />"
    rel="stylesheet">



</head>
<body onLoad="reFrm.id.focus()">
	<div class="container membership-form">
		<div>
			<img src="<%=request.getContextPath()%>/resources/화살표.png" style="width: 60px; margin-top: 295px;">
		</div>
		<br />
		<br />

			<form name="reFrm" method="post" action="loginproc" id="form">			
					
					
							<table cellspacing="0"  cellpadding="2" align="center" class="membership-table">

								<tr>
									<td >아이디</td>
									<td><input name="id" id="id" size="15">
										</td>
									<td rowspan ="2" ><button type="button" onClick="logincheck()"
											class="but">로그인</button></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="password" id="pwd" name="pwd" size="20"></td>
								</tr>
								<tr>
									<td colspan="3" align="center"><button type="button"
											onclick="join()"
											style="margin-right: 80px; width: 100px; height: 30px;"
											class="but">회원가입</button></td>
								</tr>
							</table>
						
			</form>


	</div>
</body>
</html>