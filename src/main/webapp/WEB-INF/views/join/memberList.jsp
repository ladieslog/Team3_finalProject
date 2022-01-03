<%@page import="java.util.ArrayList"%>
<%@page import="com.care.dare.join.controller.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>

<html>
<head>

<link href="<c:url value="/resources/membership/memberList.css?ver=2" />"
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
<% 
HttpSession session1 = request.getSession();
MemberDTO dto = (MemberDTO)session1.getAttribute("loginUser");
		if(!(dto.getId().equals("3333"))){
			response.sendRedirect("error");
		}
	%>
<%ArrayList<MemberDTO> list=(ArrayList<MemberDTO>)request.getAttribute("list"); %>
	<jsp:include page="/WEB-INF/views/default/header.jsp"/>
	
	<c:set var="search" value="${search1 }" />
	<div style="height: 650px;">
	<div>
		<form action="memberList" style="display: flex; margin-left: 1215px;">
				<span style="font-weight: bold; color: gray;">아이디 검색</span>&nbsp;
				<input type="text" id="search" name="search" value="${search1 }" style="border: 1px solid gray; border-radius: 6px;">
				<input type="submit" value="♥" style="border: none; background: white; color: gray;">
		</form>
		</div>
		<div class="listwrap" style="margin-top: 5px;">
		
			<table align="center" border="0" bordercolor="white" 
					class="memberList-table">
				<tr class= "tableHeader">
					<th><div>회원 아이디</div></th> <th><div>회원비번</div></th> <th><div>회원닉네임</div></th> <th><div>회원주소</div></th> <th><div>회원이메일</div></th> <th><div>게시글수</div></th>				
				</tr>
				<%if(list.isEmpty()){
					%>
					<tr>
					<td colspan="6">등록된 회원아이디가 없습니다.</td>
					 
					</tr>
					<%} else{
						for(MemberDTO DTO:list){
							
					%>
					<tr>
					<td  class="center"><div><%=DTO.getId() %></div></td><td class="center"><div>********</div></td><td  class="center"><div><%=DTO.getNickname() %></div></td><td id="addrr"><div id="addr" class="address" value= "<%=DTO.getAddr()%> <%=DTO.getDetailaddr()%>"><%=DTO.getAddr()%> <%=DTO.getDetailaddr() %></div></td><td id="emailr"><div class="address" id="email" value="<%=DTO.getEmail()%>"><%=DTO.getEmail() %></div></td><td  class="center"><div><%=DTO.getDiaryCount() %></div></td>
				</tr>
					<%}}
				%>
				
			</table>
		</div>
		</div>
	<jsp:include page="/WEB-INF/views/default/footer.jsp"/>
</body>
</html>