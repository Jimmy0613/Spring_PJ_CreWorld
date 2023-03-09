<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>크레월드</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common.css?version=${System.currentTimeMillis()}" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/home.css?version=${System.currentTimeMillis()}" />
</head>
<body class="main" style="min-width: 1040px;">
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="middle">
		<div class="dropdown_menu">
			<div class="dropdown_btns">
				<button>이용정보</button>
				<button>통합예약</button>
				<button>즐길거리</button>
				<button>고객센터</button>
			</div>
			<div class="dropdown_content">
				<div>
					<a>뉴스공지</a> <a>이용방법</a> <a>운영시간</a> <a>편의시설</a><a>이용정보</a>
				</div>
				<div>
					<a>객실현황</a> <a>객실예약</a> <a>패키지예약</a> <a>쿠폰구매</a> <a>체험 프로그램</a>
				</div>
				<div>
					<a>추천코스</a> <a>주변식당</a> <a>해수욕장</a> <a>기념품점</a> <a>크레식당</a>
				</div>
				<div>
					<a>FAQ</a> <a>채팅상담</a> <a>고객의소리</a>
				</div>
			</div>
		</div>
		<div class="wrap">
			<img id="beach"
				src="${pageContext.request.contextPath}/resources/img/beach_big.jpg">
			<div id="quickReserv">
				<div id="calendar">
					<%@include file="/WEB-INF/views/calendar.jsp"%>
				</div>
				<div id="reserv" style="font-size: 1.3em;">
					<table class="quickReserv">
						<thead>
							<tr>
								<th>빠른 예약 서비스</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>인원수(최대 4인)</td>
								<td id="numOfPeople">1</td>
								<td>명</td>
								<td><input type="button" onclick="count('plus');" value="추가"></td>
								<td><input type="button" onclick="count('minus');" id="plus_btn" value="빼기"></td>
							</tr>
							<tr>
								<td>시작일(check-in)</td>
								<td></td>
								<td>~</td>
							</tr>
							<tr>
								<td>종료일(check-out)</td>
								<td></td>
								<td><input type="button" value="검색"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="footer"></div>
</body>
</html>
