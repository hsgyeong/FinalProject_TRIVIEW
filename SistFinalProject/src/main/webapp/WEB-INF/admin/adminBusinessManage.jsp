<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
    <link href="https://webfontworld.github.io/goodchoice/Jalnan.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <title>Insert title here</title>
</head>
<style>
.btn-approval{

	width: 8vh;
	height: 5vh;
	border: 1px solid silver;
	color: black;
	font-weight: bold;
	background-color: white;
	border-radius: 1vh;
	font-size: 0.8em;
}

.btn-approval:hover{

	background-color: rgb(228, 231, 235);
}
</style>
<body>
	<div align="center">
		<h3><b>사업자관리</b></h3>
		<table class="table table-stripped">
			<tr align="center" valign="middle">
				<th width="150">사업자번호</th>
				<th width="100">사업자성함</th>
				<th width="150">사업자번호</th>
				<th width="100">사업자상호</th>
				<th width="150">사업자이메일</th>
				<th width="150">사업자승인</th>
			</tr>
			<c:if test="${totalCount==0 }">
				<tr>
					<td colspan="6" align="center">
						<h3>결제 내역이 없습니다</h3>
					</td>
				</tr>
			</c:if>
			<c:if test="${totalCount>0 }">
				<c:forEach var="list" items="${list }">
					<tr align="center" valign="middle">
						<td>${list.business_id }</td>
						<td>${list.business_name }</td>
						<td>${list.business_hp }</td>
						<td>${list.business_company }</td>
						<td>${list.business_email }</td>
						<td>
							<button type="button" class="btn-approval" onclick="location.href='admin-business-approval?idx=${list.idx}'">승인</button>
							<button type="button" class="btn-approval" onclick="location.href='admin-business-deny?idx=${list.idx}'">거부</button>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		
		<!-- 페이징 -->
		<c:if test="${totalCount>0 }">
			<div style="width: 900px; text-align: center;">
				<ul class="pagination justify-content-center">
					<!-- 이전 -->
					<c:if test="${startPage>1 }">
						<li class="page-item"><a class="page-link" href="admin-business-info-page?currentPage=${startPage-1 }">이전</a></li>
					</c:if>

					<c:forEach var="pp" begin="${startPage }" end="${endPage }">
						<c:if test="${currentPage==pp }">
							<li class="page-item active"><a class="page-link"
								href="admin-business-info-page?currentPage=${pp }">${pp }</a></li>
						</c:if>

						<c:if test="${currentPage!=pp }">
							<li class="page-item"><a class="page-link"
								href="admin-business-info-page?currentPage=${pp }">${pp }</a></li>
						</c:if>
					</c:forEach>

					<!-- 다음 -->
					<c:if test="${endPage<totalPage }">
						<li class="page-item"><a class="page-link"
							href="admin-business-info-page?currentPage=${endPage+1 }">다음</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
	</div>
</body>
</html>