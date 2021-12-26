<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />

<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8' />

<title>캘린더</title>

<link href="<c:url value="/resources/calendar/calendarStyle.css" />"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="${contextPath}/resources/calendar/getEvent.js"></script>
</head>
<body>
	<div class="calendar-wrap">
		<jsp:include page="../default/header.jsp" />
		<div class="background">
			<div class="frame">
				<div id='calendar'></div>
			</div>
		</div>
		<jsp:include page="../default/footer.jsp" />
	</div>
</body>
<script src="${contextPath}/resources/calendar/fullCalendar.js"></script>
</html>