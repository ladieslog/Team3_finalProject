<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>

<html>
<head>

<link href="<c:url value="/resources/membership/memberList.css" />"
    rel="stylesheet">

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