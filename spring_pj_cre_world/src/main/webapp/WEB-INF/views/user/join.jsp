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
	src="${pageContext.request.contextPath}/resources/js/join.js?version=${System.currentTimeMillis()}"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="middle">
		<div class="join">
			<form id="form_join" action="/user/join.do" method="post">
				<h1 style="font-size: 1.8em;">회원가입</h1>
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
						<td style="width: 100px;">* 이메일</td>
						<td><input id="email" type="email" name='email' required>
							<input style="width: 70px; height: 30px;" type="button"
							id="email_confirm_btn" value="중복 확인"></td>
						<td id="email_confirm">
							<!-- 이메일 중복 여부 안내 출력 위치 --> <input type="hidden" id="email_check"
							value="N">
						</td>
					</tr>
					<tr>
						<td>* 비밀번호</td>
						<td><input id="pw" type="password" name='pw' required></td>
					</tr>
					<tr>
						<td>* 비밀번호 확인</td>
						<td><input id="pwCheck" type="password" required></td>
						<td id="pw_confirm">
							<!-- 비번 일치 여부 안내 출력 위치 --> <input type="hidden" id="pw_check"
							value="N">
						</td>
					</tr>
					<tr>
						<td>* 별명 (2~6자)</td>
						<td><input id="nickname" type="text" name='nickname' required
							maxlength="6"></td>
					</tr>
					<tr>
						<td>프로필사진(url)</td>
						<td colspan="2"><textarea id="prof_img" name='prof_img'
								style="width: 400px; height: 40px; resize: none;"></textarea></td>
					</tr>
					<tr></tr>
					<tr>
						<td colspan="3" style="text-align: center;"><input
							type="hidden" name='login_type' value="normal"><input
							style="height: 30px;" id="form_join_btn" type="button"
							value="회원가입"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>