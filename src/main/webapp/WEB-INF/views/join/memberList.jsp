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
<% 
HttpSession session1 = request.getSession();
MemberDTO dto = (MemberDTO)session1.getAttribute("loginUser");
		if(!(dto.getId().equals("3333"))){
			response.sendRedirect("error");
		}
	%>
<%ArrayList<MemberDTO> list=(ArrayList<MemberDTO>)request.getAttribute("list"); %>
	<jsp:include page="/WEB-INF/views/default/header.jsp"/>
		<div class="listwrap" style="margin-top: 20px;">
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
					<td  class="center"><div><%=DTO.getId() %></div></td><td class="center"><div><%=DTO.getPwd() %></div></td><td  class="center"><div><%=DTO.getNickname() %></div></td><td id="addrr"><div id="addr" class="address" value= "<%=DTO.getAddr()%>"><%=DTO.getAddr()%></div></td><td id="emailr"><div class="address" id="email" value="<%=DTO.getEmail()%>"><%=DTO.getEmail() %></div></td><td  class="center"><div><%=DTO.getDiaryCount() %></div></td>
				</tr>
					<%}}
				%>
				
			</table>
		</div>
	<jsp:include page="/WEB-INF/views/default/footer.jsp"/>
</body>
</html>