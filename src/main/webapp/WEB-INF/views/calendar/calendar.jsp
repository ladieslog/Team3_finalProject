<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>calendar</title>
<link href="<c:url value="/resources/calendar/calendarStyle.css" />"
	rel="stylesheet">
</head>
<body>
	<div class="calendar-wrap">
		<jsp:include page="../default/header.jsp" />
		<div class="background">
			<div class="frame">
				<div class="title">
					<table class = "table">
						<tr>
							<th align="left" width="30%"><div class="year"></div></th>
							<th align="center" width="40%"><div class="month"></div></th>
							<th align="right" width="30%">
								<div class="nav">
									<button class="nav-btn go-prevYear" onclick="prevYear()">&lt;&lt;</button>
									<button class="nav-btn go-prevMonth" onclick="prevMonth()">&nbsp;&lt;</button>
									<button class="nav-btn go-today" onclick="goToday()">Today</button>
									<button class="nav-btn go-nextMonth" onclick="nextMonth()">&gt;</button>
									<button class="nav-btn go-nextYear" onclick="nextYear()">&nbsp;&gt;&gt;</button>
								</div>
							</th>
						</tr>
					</table>
				</div>
				<div class="main">
					<div class="days">
						<div class="day">SUN</div>
						<div class="day">MON</div>
						<div class="day">TUE</div>
						<div class="day">WED</div>
						<div class="day">THU</div>
						<div class="day">FRI</div>
						<div class="day">SAT</div>
					</div>
					<div class="dates"></div>
				</div>
			</div>
			<jsp:include page="../default/footer.jsp" />
		</div>
	</div>
</body>
<script src="<c:url value="/resources/calendar/calendar.js" />"></script>
</html>