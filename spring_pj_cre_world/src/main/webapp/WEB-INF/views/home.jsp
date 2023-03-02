<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>크레월드</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common.css?version=${System.currentTimeMillis()}" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/home.css?version=${System.currentTimeMillis()}" />
<script src="${pageContext.request.contextPath}/resources/js/home.js"></script>
</head>
<body class="main" style="min-width: 1040px;">
	<%@include file="/WEB-INF/views/header.jsp" %>
	<div class="middle"></div>
	<div class="footer"></div>
</body>
</html>
