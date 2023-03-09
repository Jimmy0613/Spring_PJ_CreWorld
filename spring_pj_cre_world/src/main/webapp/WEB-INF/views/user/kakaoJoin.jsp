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
	href="${pageContext.request.contextPath}/resources/css/join.css?version=${System.currentTimeMillis()}" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/kakao_join.js?version=${System.currentTimeMillis()}"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="middle">
		<div class="join">
			<form id="form_kakao_join" action="/user/kakaoJoin.do" method="post">
				<h1 style="font-size: 1.8em;">회원가입</h1>
				<b>카카오 계정으로 로그인을 시도하셨습니다. 간단한 가입 절차 후 바로 서비스를 이용하실 수 있습니다.</b>
				<br>
				<table class="join_form">
					<tr>
						<td colspan="3" style="font-size: 1.4em;"><b>이용 약관</b></td>
					</tr>
					<tr>
						<td colspan="3"><%@include file="/WEB-INF/views/user/tos.jsp"%></td>
					</tr>
					<tr>
						<td colspan="3" style="font-weight: bolder; font-size: 1.2em;"><input
							style="width: 20px;" id="agree" type="checkbox"> 약관에
							동의합니다.(필수)</td>
					</tr>
					<tr>
						<td>* 이름 </td>
						<td><input id="user_name" type="text" name='user_name' value="${KAKAO_LOGIN.user_name}" required
							maxlength="6"></td>
						<td>(카카오 계정 닉네임이 실명이 아닐 경우 실명으로 변경을 권장합니다.)</td>
					</tr>
					<tr>
						<td>프로필사진</td>
						<td><img style="width:110px;" src="${KAKAO_LOGIN.prof_img}"></td>
						<td>(추후 마이페이지에서 프로필사진을 삭제하거나 변경할 수 있습니다.)</td>
					</tr>
					<tr></tr>
					<tr>
						<td colspan="3" style="text-align: center;"><input
							type="hidden" name='login_type' value="${KAKAO_LOGIN.login_type}"><input
							type="hidden" name='user_id' value="${KAKAO_LOGIN.user_id}"><input
							type="hidden" name='user_pw' value="${KAKAO_LOGIN.user_pw}"><input
							type="hidden" name='prof_img' value="${KAKAO_LOGIN.prof_img}"><input
							style="height: 30px;" id="form_kakao_join_btn" type="button"
							value="회원가입"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>