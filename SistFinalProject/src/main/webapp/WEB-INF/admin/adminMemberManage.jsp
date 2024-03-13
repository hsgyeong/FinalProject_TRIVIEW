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
<body>
	<div align="center">
		<h3><b>회원관리</b></h3>
		<table class="table table-stripped">
			<tr align="center" valign="middle">
				<th width="150">아이디</th>
				<th width="100">성함</th>
				<th width="150">닉네임</th>
				<th width="100">휴대폰번호</th>
				<th width="150">이메일</th>
				<th width="150">가입일</th>
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
						<td>${list.info_id }</td>
						<td>${list.info_name }</td>
						<td>${list.info_nickname }</td>
						<td>${list.info_hp }</td>
						<td>${list.info_email }</td>
						<td>
							<fmt:formatDate value="${list.info_gaipday }" pattern="yyyy-MM-dd HH:mm"/>
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
						<li class="page-item"><a class="page-link" href="admin-member-info-page?currentPage=${startPage-1 }">이전</a></li>
					</c:if>

					<c:forEach var="pp" begin="${startPage }" end="${endPage }">
						<c:if test="${currentPage==pp }">
							<li class="page-item active"><a class="page-link"
								href="admin-member-info-page?currentPage=${pp }">${pp }</a></li>
						</c:if>

						<c:if test="${currentPage!=pp }">
							<li class="page-item"><a class="page-link"
								href="admin-member-info-page?currentPage=${pp }">${pp }</a></li>
						</c:if>
					</c:forEach>

					<!-- 다음 -->
					<c:if test="${endPage<totalPage }">
						<li class="page-item"><a class="page-link"
							href="admin-member-info-page?currentPage=${endPage+1 }">다음</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
	</div>
</body>
</html>