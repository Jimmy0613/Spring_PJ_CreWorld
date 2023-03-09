<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/header.js?version=${System.currentTimeMillis()}"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/login.js?version=${System.currentTimeMillis()}"></script>
</head>
<body>
	<div class="header">
		<div class="t_menu1">
			<div id="logoTime"></div>
			<div class="t_mid">
				<button onclick="location.href='/'">크레월드</button>
				<button>첨벙첨벙</button>
				<button>홈브리지</button>
			</div>
			<div class="reserv">
				<button style="background-color: orange; color: white;">스마트예약</button>
				<button style="background-color: cornflowerblue; color: white;">학생단체예약</button>
				<button style="background-color: rgb(198, 104, 241); color: white;">기업단체예약</button>
			</div>
		</div>
		<div class="t_menu2">
			<div class="search">
				<input>🔍
			</div>
			<div class="logoName2">
				<a href='/'><img src="/resources/img/logoName.jpg"></a>
			</div>
			<div class="loginEtc">
				<c:if test="${LOGIN_USER==null}">
					<a href="/user/login">로그인</a> / <a href="/user/join">회원가입</a>
				</c:if>
				<c:if test="${LOGIN_USER!=null}">
					<img src="${LOGIN_USER.prof_img}">&nbsp;${LOGIN_USER.user_name}
				님 &nbsp;&nbsp;
				<c:if test="${LOGIN_USER.login_type eq 'kakao'}">
						<a
							href="https://kauth.kakao.com/oauth/logout?client_id=20e2c80133ed378957f5189bbfbdb63b
&logout_redirect_uri=http://localhost:8080/user/kakaoLogout">로그아웃</a>
					</c:if>
					<c:if test="${LOGIN_USER.login_type eq 'normal'}">
						<a href="/user/logout">로그아웃</a>
					</c:if>
				</c:if>
			</div>
		</div>
	</div>

</body>
</html>