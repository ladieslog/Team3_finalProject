 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.listwrap {
	display:flex;
	justify-content: center;
}
table {
	width: 1000px;
	border-collapse: collapse
}
tr {
	border-bottom: 1px solid #D5D5D5;
	border-top: none;
	height:35px;
}
td {
	height: 35px;
	padding: 0 40px;
	
}
.tableHeader div{
	margin-bottom : -10px !important;
}
td>div{
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	width: 100%;
	
}
tr>td:nth-of-type(4)>.address {
	width: 200px;
}
tr>td:nth-of-type(5)>.address {
	width: 200px;
}
#addressInfo{
	position: absolute;
	margin-top: -10px;
}
body{
	overflow-x: hidden;
}
.tableHeader{
	border-bottom: 1px solid #000;
}
.trHover{
	height:80px;
}
.trHover>div{
	margin-bottom: 20px !important;
	margin-top:-10px;
}

.center>div{
	display:flex;
	justify-content: center;
    align-items: center;
}
</style>
	<script src = "${path }/resources/jquery-3.6.0.min.js">
</script>
<script>
	$(function(){
		$(".address").hover(function(){	
			var adr= document.createElement('div');
			adr.setAttribute("id","addressInfo");
			adr.innerHTML= $(this).attr("value");	
			var idname = $(this).attr("id")+"r";
			this.parentNode.className+="trHover"
		    this.parentNode.appendChild(adr);
		},function(){
			var adrrr = document.getElementById("addressInfo")
			this.parentNode.classList.remove("trHover")
			adrrr.remove()
		})
	});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/default/header.jsp"/>
		<div class="listwrap">
			<table align="center" border="0" bordercolor="white" 
					class="memberList-table">
				<tr class= "tableHeader">
					<td><div>회원ID</div></td> <td><div>회원비번</div></td> <td><div>회원닉네임</div></td> <td><div>회원주소</div></td> <td ><div>회원이메일</div></td> <td><div>게시글수</div></td>				
				</tr>
				<tr>
					<td  class="center"><div>wleodl123</div></td><td class="center"><div>1234</div></td><td  class="center"><div>wleodl123</div></td><td id="addrr"><div id="addr" class="address" value= "서울시 금천구 가산로99 1234동 1234호ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ">서울시 금천구 가산로99 115동 1234호aaaaaaaaaaaaaaaaa</div></td><td id="emailr"><div class="address" id="email" value="wleodl123@naver.comoooooooooooooooooo">wleodl123@naver.comllllllllllll</div></td><td  class="center"><div>33</div></td>
				</tr>
				<tr>
					<td><div>wleodl123</div></td><td><div>1234</div></td><td><div>wleodl123</div></td><td id="addrr"><div id="addr" class="address" value= "서울시 금천구 가산로99 1234동 1234호ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ">서울시 금천구 가산로99 115동 1234호aaaaaaaaaaaaaaaaa</div></td><td id="emailr"><div class="address" id="email" value="wleodl123@naver.comoooooooooooooooooo">wleodl123@naver.comllllllllllll</div></td><td><div>33</div></td>
				</tr>
				
				<tr>
					<td><div>wleodl123</div></td><td><div>1234</div></td><td><div>wleodl123</div></td><td id="addrr"><div id="addr" class="address" value= "서울시 금천구 가산로99 1234동 1234호ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ">서울시 금천구 가산로99 115동 1234호aaaaaaaaaaaaaaaaa</div></td><td id="emailr"><div class="address" id="email" value="wleodl123@naver.comoooooooooooooooooo">wleodl123@naver.comllllllllllll</div></td><td><div>33</div></td>
				</tr>
				<tr>
					<td><div>wleodl123</div></td><td><div>1234</div></td><td><div>wleodl123</div></td><td id="addrr"><div id="addr" class="address" value= "서울시 금천구 가산로99 1234동 1234호ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ">서울시 금천구 가산로99 115동 1234호aaaaaaaaaaaaaaaaa</div></td><td id="emailr"><div class="address" id="email" value="wleodl123@naver.comoooooooooooooooooo">wleodl123@naver.comllllllllllll</div></td><td><div>33</div></td>
				</tr>
				<tr>
					<td><div>wleodl123</div></td><td><div>1234</div></td><td><div>wleodl123</div></td><td id="addrr"><div id="addr" class="address" value= "서울시 금천구 가산로99 1234동 1234호ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ">서울시 금천구 가산로99 115동 1234호aaaaaaaaaaaaaaaaa</div></td><td id="emailr"><div class="address" id="email" value="wleodl123@naver.comoooooooooooooooooo">wleodl123@naver.comllllllllllll</div></td><td><div>33</div></td>
				</tr>
			</table>
		</div>
	<jsp:include page="/WEB-INF/views/default/footer.jsp"/>
</body>
</html>