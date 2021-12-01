<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%page import="join.ZipcodeBean" %>
<%page import="java.util.Vector" %>
<jsp:useBean id="mMgr" class=com.care.dare.join.controller.join" />
<!DOCTYPE html>
<%
	request.setCharacterEncoding("EUC-KR");
	String check = request.getParameter("search");
	Stringa area3 = null;
	Vector<zipcodeBean> Vlist= null;
	if(check.equals("y")){
		area3 = request.getParameter("area3");
		vlist = mMgr.zipcodeRead(area3);
		}
%>
<html>
<head>
<meta charset="UTF-8">
<title>우편 번호 검색</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function loadSearch(){
	frm= document.zipFrm;
	if(frm.area3.value=""){
		alert("도로명을 입력하세요.");
		frm.area3.focus();
		return;
		}
			frm.action="zipSearch.jsp";
			frm.submit();
	}
fucntion sendAdd(zipcode, adds){
	opener.document.regFrm.zipcode.value=zipcode;
	opener.document.refFrm.address.value=adds;
	self.close();
}
</script>
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
	<br/>
	<form name="zipFrm" method="post">
	<table>
		<tr>
			<td><br/>도로명 입력 : <input name="area3">
				<input type="button" value="검색" onclick="loadSearch();">
				</td>
			</tr>
			<!-- 검색결과 시작 -->
			<%
				if(search.equals("y")){
					if(vlist.isEmpty()){
		    %>
			<tr>
				<td align="center"><br/>검색된 결과가 없습니다.</td>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</table>
	</form>
	
	</div>

</body>
</html>