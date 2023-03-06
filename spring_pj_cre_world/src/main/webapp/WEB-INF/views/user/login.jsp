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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/login.js?version=${System.currentTimeMillis()}"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="middle">
		<div class="login">
			<form id="form_norm_login" method="get" action="/user/login.do">
				<h1 style="font-size: 1.8em;">로그인</h1>
				<br>
				<table class="login_form">
					<tr>
						<td style="width: 100px;">이메일</td>
						<td><input id="email" type="email" name='email'></td>
						<td rowspan="2"><input style="height: 70px; width: 70px;"
							id="norm_login_btn" type="button" value="로그인"></td>
					</tr>
					<tr>
						<td style="width: 100px;">비밀번호</td>
						<td><input id="pw" type="password" name='pw'></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2" id="confirm"><!-- 로그인 안내메시지 출력 위치 --></td>
					</tr>
					<tr>
						<td></td>
						<td><a id="btn_kakao_login"><img
								src="/resources/img/kakao_login_medium_narrow.png"></a></td>
					</tr>
				</table>
			</form>
			<form id="form_kakao_login" method="post" action="/user/kakaoLogin">
				<input type="hidden" name='nickname' /> <input type="hidden"
					name='email' /> <input type="hidden" name='prof_img' /> <input
					type="hidden" name='login_type' value="kakao" />
			</form>
		</div>
	</div>
</body>
</html>