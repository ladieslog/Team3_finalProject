<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<title>지도</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="<c:url value="/resources/map/mapStyle.css" />"
	rel="stylesheet">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=hd20qegxv4"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=hd20qegxv4&submodules=geocoder"></script>

</head>

<body>
	<div class="map-wrap">
		<jsp:include page="../default/header.jsp" />
		<div class="background">
			<div class="frame">
				<div id="map"></div>
			</div>
		</div>
		<jsp:include page="../default/footer.jsp" />
	</div>
</body>
<script src="<c:url value="/resources/map/map.js" />"></script>
</html>


