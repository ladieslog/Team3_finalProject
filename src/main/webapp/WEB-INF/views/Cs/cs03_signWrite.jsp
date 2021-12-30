<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script> <!-- 제이 쿼리 -->
<script src="${contextPath }/resources/bootstrap.js"></script> <!-- 부트스트랩 (미사용) -->
<link rel="stylesheet"
	href="${contextPath }/resources/CS/css/cs_css.css?ver=2">
</head>
<body>
	<div>
		<jsp:include page="../default/header.jsp" />
		<div class="c1 mr-auto notice-wrap">
			<div class="c2 pd-none">
				<form action="noticeWrite" method="post" id="form">
				<div style="height: 38px;"></div>
					<table class="cn3">
						<tr>
							<td class="write-title"><b class="bh3 fs-20"> Notice
									Title &nbsp;</b></td>
							<td colspan="14"><input type="text" name="title"
								class="cha3 title-input" id="title"></td>
							<!--<td  class="tb"> <b class="b">write date</b></td>  -->
						</tr>
						<tr class="rb"></tr>

						<tr>
							<td colspan="15">
								<!-- <input type="text" name="" class="chb3"> --> <textarea
									name="content" class="chb3" id="editor"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="14"></td>
							<td class="eh1"><input type="button" value="작성"
								class="cn4 mb-none mt-15 notice-btn" style="margin-right: 20px;" onclick="writeCheck();">
								<button type="button" class="cn4 mb-none notice-btn" onclick="location.href='csMain'">돌아가기</button>
							</td>
						</tr>
					</table>
					
				</form>
			</div>
		</div>


		<%-- <jsp:include page="../Cs/cs_back.jsp"/> --%>
		<jsp:include page="../default/footer.jsp" />
	</div>
	<!-- ckeditor.js 연결 -->
	<script
		src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>
	<script>
	// ckEditor를 textarea태그에 적용 및 사이즈 조절
		window.onload = function() {
			ck = CKEDITOR.replace("editor", {
				height : 350,
				width : 1000
			});
		}
	</script>
	<script
		src="<%=request.getContextPath()%>/resources/CS/script/notice_js.js?ver=3"></script>
	
</body>
</html>