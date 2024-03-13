<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<title>Insert title here</title>
</head>
<style>
	body {
		display: flex;
		flex-direction: column;
		bottom: 0;margin: 0;
		padding: 0;
		min-height: 100vh;
	}
	footer{
		padding-top: 50px;
		padding-bottom: 30px;
		font-size: 13px;
		color: #777879;
	}
	div.footercontent{
		width: 70%;
		margin-left: auto;
		margin-right: auto;
	}

	ul,ol,li{
		list-style: none;
	}
	li.linklist a{
		text-decoration: none;
		color: #777879;
		font-size: 13px;
		margin-left: 1%;
		margin-right: 1%;
	}
	li.linklist{
		color: #777879;
		font-size: 13px;

	}
	li a i{
		color: #777879;
		font-size: 30px;
		margin-left: 1%;
	}

</style>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
	<footer>
		<div class="footercontent">
			<ul>
				<li class="linklist">
					<a href="#">회사소개</a><span>|</span>
					<a href="#">이용약관</a><span>|</span>
					<a href="#">개인정보처리방침</a><span>|</span>
					<a href="#">소비자 분쟁해결 기준</a><span>|</span>
					<a href="#">사업자 정보확인</a><span>|</span>
				</li>
				<li class="linklist">
					<a href="#">TREVIEW 마케팅센터</a><span>|</span>
					<a href="#">액티비니 호스트센터</a><span>|</span>
					<a href="#">콘텐츠산업진흥법에 의한 표시</a>
					<c:if test="${sessionScope.loginok == null}">
						<span>|</span>
						<a href="/admin/admin-loginform">관리자로그인</a>
					</c:if>
					<c:if test="${sessionScope.loginok != null && sessionScope.admin_id != null }">
						<span>|</span>
						<a href="/admin/admin-accom-approval-page?currentPage=1">관리자페이지</a>
					</c:if>
				</li>
				<br>
				<li style="margin-left: 1%">
					<p><b>고객행복센터 1234-5678</b>&nbsp; 오전 9시 ~ 오후 6시</p>
				</li>
				<li style="margin-left: 1%">
					<span>TREVIEW</span><br>
					주소 : 서울특별시 강남구 테헤란로 132(역삼동) 한독약품빌딩 8층 쌍용교육센터<br>
					TREVIEW는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.
				</li>
			</ul>
			<hr>
			<ul><li><a href="https://github.com/dawn-sh/sist_FinalProject.git" class="snslink"><i class="bi bi-github"></i></a></li></ul>
		</div>
	</footer>
</body>
</html>