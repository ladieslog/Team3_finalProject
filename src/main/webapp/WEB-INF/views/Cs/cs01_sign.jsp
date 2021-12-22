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
	href="${contextPath }/resources/CS/css/cs_css.css?ver=1">
</head>
<%
List<NoticeDTO> list = (List<NoticeDTO>) request.getAttribute("list"); // notice 리스트
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
%>
<body style="overflow-x: hidden">
	<div>
		<jsp:include page="../default/header.jsp" />

		<div class="a1">
			<div class="a2">
	<div>
				<div style="align-items: center; display: flex; justify-content: center; height: 60px;">
					<br> <span><b style="font-size: 30px; ">Notice</b></span>

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
							if (list == null) { // 리스트가 없다면 게시글이 0개임
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
								%>
								<span class="page-block" id="<%=i %>" onclick="pageSet(this);">[<%=i %>]</span>
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
	<div style="margin-bottom:10px;">
				<div style="align-items: center; display: flex; justify-content: center; height: 60px;">
					<br> <span>
					<b style="font-size: 30px;">Q & A</b></span>
				</div>
				<div id="id2">
					<textarea rows="7" cols="70" name="comment" class="ach"
						placeholder="글내용을 입력"></textarea>
					<!-- <input type="text" name="" class="ach"> -->
				</div>

				<div class="in3"></div>
			</div>
</div>
		</div>


		<!--<jsp:include page="../Cs/cs_back.jsp"/>-->
		<jsp:include page="../default/footer.jsp" />
	</div>

<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	var test1 = <%=endPage %> // 페이지 묶음의 마지막 페이지 값
	var listSize = <%=list.size() %> // list 사이즈
	
	// 페이지 이동은 ajax로 처리함
	function pageSet(data) {
		var test2 = data.id;
		
		var Num = data.id; // 선택한 페이지 번호의 id값을 가져옴, id값에는 페이지 번호가 들어있음 (ex: 2번 페이지 클릭시 id는 2가 들어온다
		var form = {currentPage:Num}; // form에 num 추가
		
		for(var i=0; i<=listSize; i++) { // 페이지 이동시 리스트를 새로 가져오므로 기존에 있던 게시글 리스트들을 삭제함
			document.getElementById("notice-table").deleteRow(1);
		}
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
				for(int i=startPage; i <= endPage; i++) { 
				%>
				html += "<span class='page-block' id=<%=i %> onclick='pageSet(this);'>" + "[" + <%=i %> + "] " + "</span>";
				<%
				} if(endPage < pageCount) {
				%>
				html += "<span class='page-block'>[다음]</span>";
				<%
				}
				%>
				html += "</td></tr>";
				$("#notice-table").append(html); //새로 추가한 html태그들을 테이블에 적용
				listSize = list.length; // list사이즈를 새로 가져온 리스트 사이즈로 변경
			}, error : function() {
				alert("문제 발생");
			}
		});
	}

	
</script>



</body>
</html>