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
		<h3><b>결제정보창</b></h3>
		<table class="table table-stripped">
			<tr align="center" valign="middle">
				<th width="50">번호</th>
				<th width="150">예약번호</th>
				<th width="100">아이디</th>
				<th width="100">예약자이름</th>
				<th width="150">예약자번호</th>
				<th width="150">숙소이름</th>
				<th width="150">방이름</th>
				<th width="150">결제가격</th>
				<th width="150">예약상태</th>
				<th width="150">예약일</th>
			</tr>
			<c:if test="${totalCount==0 }">
				<tr>
					<td colspan="10" align="center">
						<h3>결제 내역이 없습니다</h3>
					</td>
				</tr>
			</c:if>
			<c:if test="${totalCount>0 }">
				<c:forEach var="list" items="${list }">
					<tr align="center" valign="middle">
						<td>${startNum+1 }</td>
						<c:set var="startNum" value="${startNum+1 }"/>
						<td>${list.reserve_id }</td>
						<td>${list.info_id }</td>
						<td>${list.reserve_name }</td>
						<td>${list.reserve_hp }</td>
						<td>${list.accom_name }</td>
						<td>${list.room_name }</td>
						<td>
							<fmt:formatNumber value="${list.reserve_amount }" type="currency"/>
						</td>
						<td>${list.reserve_status }</td>
						<td>
							<fmt:formatDate value="${list.reserve_day }" pattern="yyyy-MM-dd HH:mm"/>
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
						<li class="page-item"><a class="page-link" href="admin-pay-info-page?currentPage=${startPage-1 }">이전</a></li>
					</c:if>

					<c:forEach var="pp" begin="${startPage }" end="${endPage }">
						<c:if test="${currentPage==pp }">
							<li class="page-item active"><a class="page-link"
								href="admin-pay-info-page?currentPage=${pp }">${pp }</a></li>
						</c:if>

						<c:if test="${currentPage!=pp }">
							<li class="page-item"><a class="page-link"
								href="admin-pay-info-page?currentPage=${pp }">${pp }</a></li>
						</c:if>
					</c:forEach>

					<!-- 다음 -->
					<c:if test="${endPage<totalPage }">
						<li class="page-item"><a class="page-link"
							href="admin-pay-info-page?currentPage=${endPage+1 }">다음</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
	</div>
</body>
</html>