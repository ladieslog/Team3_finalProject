
<%@page import="com.care.dare.join.controller.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.care.dare.CS.DTO.QnaDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.care.dare.CS.DTO.NoticeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet"
	href="${contextPath }/resources/CS/css/cs_css.css?ver=4">
</head>
<%
List<NoticeDTO> list = (List<NoticeDTO>) request.getAttribute("list"); // notice 리스트
List<QnaDTO> list2 =(List<QnaDTO>) request.getAttribute("list2");

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // 시간 형식 포맷
int currentPage = (Integer) request.getAttribute("currentPage"); // 현재 페이지
int count = (Integer) request.getAttribute("count"); // 총 게시글 수
int pageCount = count / 10 + (count%10 == 0 ? 0 : 1); // 총 페이지수
int pageBlock = 10; // 페이지 묶음
int startPage = ((currentPage-1)/pageBlock)*pageBlock+1; // 페이지 시작 번호
int endPage = startPage + pageBlock - 1; // 페이지 마지막 번호

if(endPage > pageCount) {
	endPage = pageCount; // 총 페이지가 페이지 블럭의 마지막 페이지 보다 작다면 마지막 페이지에 전체 페이지의 값 대입
}

int currentPage2 = (Integer) request.getAttribute("currentPage2"); // 현재 페이지
int count2 = (Integer) request.getAttribute("count2"); // 총 게시글 수
int pageCount2 = count2 / 10 + (count2 %10 == 0 ? 0 : 1); // 총 페이지수
int pageBlock2 = 10; // 페이지 묶음
int startPage2 = ((currentPage2-1)/pageBlock2)*pageBlock2+1; // 페이지 시작 번호
int endPage2 = startPage2 + pageBlock2 - 1; // 페이지 마지막 번호

if(endPage2 > pageCount2) {
	endPage2 = pageCount2; // 총 페이지가 페이지 블럭의 마지막 페이지 보다 작다면 마지막 페이지에 전체 페이지의 값 대입
}
	MemberDTO userDto = (MemberDTO) session.getAttribute("loginUser");
%>
<body style="overflow-x: hidden">
	<div>
		<jsp:include page="../default/header.jsp" />

		<div class="a1">
			<div class="a2">
	<div style="margin-top: -20px;">
				<div style="align-items: center; display: flex; justify-content: center; height: 60px;">
					<br> <span><b style="font-size: 30px; ">Notice</b></span>
					<%
						if(userDto.getId().equals("3333")) {
					%>
						<button type="button" style="margin-left: 1113px; width: 60px;" class="cn4 mb-none notice-btn" onclick="location.href='notice'">글작성</button>
					<%
						}
					%>
					

				</div>
				<div id="id1">
					<div class="notice-box">
						<table  bordercolor="white" class="notice-table" id="notice-table">
							<tr>
								<th style="width: 8%;">글번호</th>
								<th style="width: 62%;">제목</th>
								<th style="width: 22%;">작성시간</th>
								<th style="width: 8%;">조회수</th>
							</tr>
							<%
							if (list.isEmpty()) { // 리스트가 없다면 게시글이 0개임
							%>
							<tr>
								<td colspan="4">작성된 공지사항이 없습니다.</td>
							</tr>
							<%
							} else {
							for (int i = 0; i < list.size(); i++) { // 게시글이 있다면 해당 페이지의 게시글 수 만큼 for문 실행
							%>
							<tr>
								<td style="width: 8%;"><%=list.get(i).getNum() %></td>
								<td style="width: 62%;"><a href="noticeInfo?num=<%=list.get(i).getNum()%>"><%=list.get(i).getTitle() %></a></td>
								<td style="width: 22%;"><%=sdf.format(list.get(i).getTime()) %></td>
								<td style="width: 8%;"><%=list.get(i).getHit() %></td>
							</tr>
							<%
							}
							}
							%>
							<tr style="display: revert">
								<td colspan="4" align="center">
								<%
								if(startPage > pageBlock) {
								%>
									<span class="page-block">[이전]</span> <!-- 이전 페이지 묶음이 있다면 -->
								<%
								}
								
								for(int i=startPage; i <= endPage; i++) {
									if(i == currentPage) {
								%>
									<span class="page-block" style="color: black;;">[<%=i %>]</span>
								<%
									} else {
								%>
									<span class="page-block" id="<%=i %>" onclick="pageSet(this);" style="color: gray;">[<%=i %>]</span>
								<%
									}
								%>
								
								 <!-- 현 페이지 묶음의 시작번호부터 끝번호 까지 출력 -->
								<%
								}
								
								if(endPage < pageCount) {
								%>
								<span class="page-block">[다음]</span> <!-- 다음 페이지 묶음이 있다면 -->
								<%
								}
								%>
								</td>
							</tr>
						</table>
					</div>
				</div>
	</div>
	<div>
				<div style="align-items: center; display: flex; justify-content: center; height: 60px;">
					<br> <span>
					<b style="font-size: 30px;">Q & A</b></span>
					<%
						if(!(userDto.getId().equals("3333"))) {
					%>
						<button type="button" style="margin-left: 1113px; width: 60px;" class="cn4 mb-none notice-btn" onclick="location.href='qna'">글작성</button>
					<%
						}
					%>
				</div>
					</div>
						<div id="id1">
					<div class="notice-box">
					
						<table border="1" bordercolor="white" class="notice-table" id="qna-table">
							<tr>
								<th style="width: 8%;">글번호</th>
								<th style="width: 8%;">아이디</th>
								<th style="width: 54%;">제목</th>
								<th style="width: 22%;">작성시간</th>
								<th style="width: 8%;">답변확인</th>
							</tr>
							<%
							if (list2.isEmpty()) { // 리스트가 없다면 게시글이 0개임
							%>
							<tr>
								<td colspan="5">작성된 Q&A가 없습니다.</td>
							</tr>
							<%
							} else {
							for (int j = 0; j < list2.size(); j++) { // 게시글이 있다면 해당 페이지의 게시글 수 만큼 for문 실행
							%>
							<tr>
								<td style="width: 8%;"><%=list2.get(j).getNum() %></td>
								<td style="width: 8%;" ><%= list2.get(j).getQuestionId() %></td>
								<td style="width: 54%;"><a href="qnaInfo?num=<%=list2.get(j).getNum()%>"><%=list2.get(j).getQuestionTitle() %></a></td>
								<td style="width: 22%;"><%=list2.get(j).getQuestionTimeStr() %></td>
								<td style="width: 8%;"><%=list2.get(j).getStatusStr() %></td>
							</tr>
							<% 
							}

							}
							%>
							<tr style="display: revert" class="table-last-tr">
								<td colspan="5" align="center">
								<%
								if(startPage2 > pageBlock2) {
								%>
									<span class="page-block">[이전]</span> <!-- 이전 페이지 묶음이 있다면 -->
								<%
								}
								
								for(int j=startPage2; j <= endPage2; j++) {
									if(j == currentPage2) {
								%>
								<span class="page-block" style="color:black;">[<%=j %>]</span> <!-- 현 페이지 묶음의 시작번호부터 끝번호 까지 출력 -->
								<%
									} else {
								%>
								<span class="page-block" id="<%=j %>" onclick="pageSet2(this);" style="color:gray;">[<%=j %>]</span> <!-- 현 페이지 묶음의 시작번호부터 끝번호 까지 출력 -->
								<%
									}
								%>
								
								<%
								}
								
								if(endPage2 < pageCount2) {
								%>
								<span class="page-block">[다음]</span> <!-- 다음 페이지 묶음이 있다면 -->
								<%
								}
								%>
								</td>
							</tr>
						</table>
			 

				<div class="in3"></div>
			</div>
			</div>
		</div>


		
		
	</div>
	<jsp:include page="../default/footer.jsp" />

<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	var test1 = <%=endPage %> // 페이지 묶음의 마지막 페이지 값
	var listSize = <%=list.size() %> // list 사이즈
	
	// 페이지 이동은 ajax로 처리함
	function pageSet(data) {
		var test2 = data.id;
		
		var Num = data.id; // 선택한 페이지 번호의 id값을 가져옴, id값에는 페이지 번호가 들어있음 (ex: 2번 페이지 클릭시 id는 2가 들어온다
		var form = {currentPage:Num}; // form에 num 추가
		
		$.ajax({
			url : "pageSet",
			type : "POST",
			data : JSON.stringify(form), //form을 json타입으로 변경
			dataType : "json",
			contentType : "application/json; charset=utf-8",
			success : function(list) {
				let html = ""; // 새로 생성한 html태그들을 저장할 변수
				for(var i=0; i<list.length; i++) { // 가져온 리스트의 사이즈 만큼 게시글 출력해서 태그로 만듦(html변수에 저장) 
					html += "<tr><td style='width: 8%;'>" + list[i].num + "</td>";
					html += "<td style='width: 62%;'>" + "<a href='noticeInfo?num=" + list[i].num + "'>" + list[i].title + "</a></td>";
					html += "<td style='width: 22%;'>" + list[i].timestr + "</td>";
					html += "<td style='width: 8%;'>" + list[i].hit + "</td></tr>";
				}
				html += "<tr style='display: revert'><td colspan='4' align='center'>"; // 페이지 리스트 윗 html 코드와 동일함
				<% if(startPage > pageBlock) {
				%>
				 html += "<span class='page-block'>[이전]</span>";
				<%	
				} 
				%>
				for(var i=<%=startPage%>; i <= <%=endPage%>; i++) { 
					if(i == Num) {
						html += "<span class='page-block' style='color: black;'>" + "[" + i + "] " + "</span>";
					} else {
						html += "<span class='page-block' id=" + i +" onclick='pageSet(this);' style='color: gray;'>" + "[" + i + "] " + "</span>";
					}
				
				}
				<%
				 if(endPage < pageCount) {
				%>
				html += "<span class='page-block'>[다음]</span>";
				<%
				}
				%>
				html += "</td></tr>";
				$("#notice-table").append(html); //새로 추가한 html태그들을 테이블에 적용
				for(var i=0; i<=listSize; i++) { // 페이지 이동시 리스트를 새로 가져오므로 기존에 있던 게시글 리스트들을 삭제함
					document.getElementById("notice-table").deleteRow(1);
				}
				listSize = list.length; // list사이즈를 새로 가져온 리스트 사이즈로 변경
			}, error : function() {
				alert("문제 발생");
			}
		});
	}
	
	
	
	
	
	
	
	
	
	var test2 = <%=endPage2%> // 페이지 묶음의 마지막 페이지 값
	var listSize2 = <%=list2.size() %> // list 사이즈
	
	// 페이지 이동은 ajax로 처리
	
	function pageSet2(data2) {
		var test2 = data2.id;
		console.log(test2);
		var Num2 = data2.id; // 선택한 페이지 번호의 id값을 가져옴, id값에는 페이지 번호가 들어있음 (ex: 2번 페이지 클릭시 id는 2가 들어온다
		var form2 = {currentPage2:Num2}; // form에 num 추가
		
		
		$.ajax({
			url : "pageSet2",
			type : "POST",
			data : JSON.stringify(form2), //form을 json타입으로 변경
			dataType : "json",
			contentType : "application/json; charset=utf-8",
			success : function(list2) {
				let html = ""; // 새로 생성한 html태그들을 저장할 변수
				for(var j=0; j<list2.length; j++) { // 가져온 리스트의 사이즈 만큼 게시글 출력해서 태그로 만듦(html변수에 저장) 
					html += "<tr><td style='width: 8%;'>" + list2[j].num + "</td>";
					html += "<td style='width: 8%;'>" + list2[j].questionId + "</td>";
					html += "<td style='width: 54%;'>" + "<a href='qnaInfo?num=" + list2[j].num + "'>" + list2[j].questionTitle + "</a></td>";
					html += "<td style='width: 22%;'>" + list2[j].questionTimeStr + "</td>";
					html += "<td style='width: 8%;'>" + list2[j].statusStr + "</td></tr>";
				}
				html += "<tr style='display: revert'><td colspan='5' align='center'>"; // 페이지 리스트 윗 html 코드와 동일함
				<% if(startPage2 > pageBlock2) {
				%>
				 html += "<span class='page-block'>[이전]</span>";
				<%	
				}
				%>
				for(var j=<%=startPage2%>; j <= <%=endPage2%>; j++) { 
				if(j == Num2) {
					html += "<span class='page-block' style='color: black;'>" + "[" + j + "] " + "</span>";
				} else {
					html += "<span class='page-block' id=" + j + " onclick='pageSet2(this);' style='color: gray;'>" + "[" + j + "] " + "</span>";
				}
				
				}
				<%
				if(endPage2 < pageCount2) {
				%>
				html += "<span class='page-block'>[다음]</span>";
				<%
				}
				%>
				html += "</td></tr>";
				$("#qna-table").append(html); //새로 추가한 html태그들을 테이블에 적용
				for(var j=0; j<=listSize2; j++) { // 페이지 이동시 리스트를 새로 가져오므로 기존에 있던 게시글 리스트들을 삭제함
					document.getElementById("qna-table").deleteRow(1);
				}
				listSize2 = list2.length; // list사이즈를 새로 가져온 리스트 사이즈로 변경
			}, error : function() {
				alert("문제 발생");
			}
		});
	}
	
	
</script>



</body>
</html>
