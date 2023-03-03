<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common.css?version=${System.currentTimeMillis()}" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/home.css?version=${System.currentTimeMillis()}" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/login.css?version=${System.currentTimeMillis()}" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>				
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/kakaoLogin.js?version=${System.currentTimeMillis()}"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="middle">
		<div class="login">
			<div class="norm_login">
				<form id="form_norm_login" method="post" action="/user/login">
					아이디 <input type="text" name='user_id'><br> 비밀번호 <input
						type="text" name='user_pw'> <input type="submit"
						value="로그인">
				</form>
			</div>
			<button onclick="window.open('/user/join')">회원가입</button>
			<p>SNS 로그인</p>
			<div>
				<div id="alert_kakao_login">오류 메시지</div>
				<a id="btn_kakao_login"><img
					src="/resources/img/kakao_login_medium_narrow.png"></a>
			</div>
			<form id="form_kakao_login" method="post" action="/user/kakaoLogin">
				<input type="hidden" name='nickname' /> <input type="hidden"
					name='email' /> <input type="hidden" name='prof_img' />
			</form>
		</div>

	</div>
</body>
</html>