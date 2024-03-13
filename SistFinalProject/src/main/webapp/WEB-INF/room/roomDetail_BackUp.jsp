<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--	pageEncoding="UTF-8"%>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--<meta charset="UTF-8">--%>
<%--<link--%>
<%--	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"--%>
<%--	rel="stylesheet">--%>
<%--<link href="https://fonts.googleapis.com/css2?family=VT323&display=swap"--%>
<%--	rel="stylesheet">--%>
<%--<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css">--%>
<%--<script src="https://code.jquery.com/jquery-3.7.0.js"></script>--%>
<%--<title>Insert title here</title>--%>
<%--</head>--%>
<%--<style>--%>
<%--.detail_box {--%>

<%--	width: 100%;--%>
<%--}--%>

<%--.detail_content {--%>

<%--	width: 100%;--%>
<%--	height: 55vh;--%>
<%--}--%>

<%--.detail_info {--%>

<%--	width: 45%;--%>
<%--	position: relative;--%>
<%--	left: 55%;--%>
<%--	top: -93%;--%>
<%--}--%>

<%--.detail_img {--%>

<%--	width: 50%;--%>
<%--	height: 40vh;--%>
<%--}--%>

<%--.detail_img img {--%>

<%--	width: 100%;--%>
<%--	height: 40vh;--%>
<%--	border-radius: 2px;--%>
<%--	box-shadow: 5px 5px 5px silver;--%>
<%--}--%>

<%--.detail_imgs {--%>

<%--	width: 50%;--%>
<%--	margin-top: 1%;--%>
<%--	overflow: hidden;--%>
<%--}--%>

<%--.detail_imgs img {--%>

<%--	width: 15vh;--%>
<%--	max-width: 15vh;--%>
<%--	height: 10vh;--%>
<%--	max-height: 10vh;--%>
<%--}--%>

<%--.detail_imgs ul {--%>

<%--	list-style: none;--%>
<%--	display: flex;--%>
<%--	justify-content: center;--%>
<%--	align-items: center;--%>
<%--	width: 100%;--%>
<%--	margin: 0;--%>
<%--	padding: 0;--%>
<%--}--%>

<%--.detail_imgs ul li:first-child {--%>

<%--	margin-left: 0.6vh;--%>
<%--}--%>

<%--.detail_imgs ul li img {--%>

<%--	max-width: 100%;--%>
<%--	max-height: 110%;--%>
<%--	border-radius: 1px;--%>
<%--	margin: 1vh 0.5vh 1vh 0.5vh;--%>
<%--	box-shadow: 3px 3px 3px silver;--%>
<%--}--%>

<%--.detail_room_name {--%>

<%--	width: 100%;--%>
<%--	bottom: 39vh;--%>
<%--	font-weight: bold;--%>
<%--	font-size: 3vh;--%>
<%--}--%>

<%--.detail_asr {--%>

<%--	width: 100%;--%>
<%--	display: flex;--%>
<%--	margin: 1vh 0px 2vh 0px;--%>
<%--}--%>

<%--.detail_accom_score {--%>

<%--	width: 10%;--%>
<%--	border-radius: 5px;--%>
<%--	color: white;--%>
<%--	background-color: orange;--%>
<%--	text-align: center;--%>
<%--	margin-right: 1vh;--%>
<%--}--%>

<%--.detail_score_result {--%>

<%--	width: 15%;--%>
<%--	color: orange;--%>
<%--	font-size: 2vh;--%>
<%--	font-weight: 650;--%>
<%--	margin-right: 0.5vh;--%>
<%--	text-align: center;--%>
<%--}--%>

<%--.detail_review_count {--%>

<%--	width: 20%;--%>
<%--	color: silver;--%>
<%--	font-size: 2vh;--%>
<%--	font-weight: 500;--%>
<%--	margin-left: 0.5vh;--%>
<%--}--%>

<%--.detail_accom_location {--%>

<%--	width: 100%;--%>
<%--	color: gray;--%>
<%--	font-size: 2vh;--%>
<%--	margin: 1vh 0px 2vh 0px;--%>
<%--}--%>

<%--.detail_accom_hashtag {--%>

<%--	width: 100%;--%>
<%--	color: gray;--%>
<%--	font-size: 2vh;--%>
<%--	margin: 1vh 0px 2vh 0px;--%>
<%--}--%>

<%--.detail_room_info {--%>

<%--	width: 100%;--%>
<%--	color: gray;--%>
<%--	font-size: 2vh;--%>
<%--	background-color: #FAFAFA;--%>
<%--	padding: 2vh 2vh 2vh 2vh;--%>
<%--	border: 1px solid silver;--%>
<%--}--%>

<%--.detail_room_info b {--%>

<%--	color: black;--%>
<%--	font-size: 2vh;--%>
<%--	font-weight: 600;--%>
<%--}--%>

<%--.detail_room_info_coment {--%>

<%--	margin: 2vh 0px 0px 0px;;--%>
<%--}--%>

<%--.detail_select {--%>

<%--	width: 100%;--%>
<%--	margin-top: 5vh;--%>
<%--}--%>

<%--.detail_select ul {--%>

<%--	list-style: none;--%>
<%--	margin-left: -2%;--%>
<%--}--%>

<%--.detail_select ul li {--%>

<%--	display: inline-block;--%>
<%--	color: silver;--%>
<%--	font-size: 2.3vh;--%>
<%--	text-align: center;--%>
<%--	padding-bottom: 1vh;--%>
<%--	cursor: pointer;--%>
<%--	margin-right: 3%;--%>
<%--}--%>

<%--.detail_room_select {--%>

<%--	border: 1px solid silver;--%>
<%--	border-radius: 1px;--%>
<%--	margin-top: 3vh;--%>
<%--	display: flex;--%>
<%--	box-shadow: 0 0.5px 0 silver;--%>
<%--	--%>
<%--}--%>

<%--.detail_room_select_img {--%>

<%--	width: 60%;--%>
<%--	margin: 2vh 2vh 2vh 2vh;--%>
<%--}--%>

<%--.detail_room_select_img img {--%>

<%--	width: 100%;--%>
<%--	height: 35vh;--%>
<%--	box-shadow: 2px 2px 2px silver;--%>
<%--}--%>

<%--.detail_room_reserve {--%>

<%--	width: 40%;--%>
<%--	height: 30vh;--%>
<%--	margin: 2vh 2vh 2vh 0px;--%>
<%--	padding: 0px 2vh;--%>
<%--}--%>

<%--.detail_room_select_name {--%>

<%--	font-weight: bold;--%>
<%--	font-size: 2.2vh;--%>
<%--	margin-bottom: 1.5vh;--%>
<%--}--%>

<%--.detail_room_select_suk {--%>

<%--	font-weight: bold;--%>
<%--	font-size: 2vh;--%>
<%--}--%>

<%--.detail_room_select_price {--%>

<%--	font-weight: bold;--%>
<%--	font-size: 2.5vh;--%>
<%--	box-shadow: 0 0.5px 0 silver;--%>
<%--	margin-bottom: 1vh;--%>
<%--}--%>

<%--.detail_room_select_checkin>b, .detail_room_select_checkout>b {--%>

<%--	text-align: right;--%>
<%--	display: block;--%>
<%--}--%>

<%--.room_detail_reserve_btn {--%>

<%--	color: white;--%>
<%--	background-color: #f7323f;--%>
<%--	border: none;--%>
<%--	border-radius: 3px;--%>
<%--	width: 100%;--%>
<%--	height: 7vh;--%>
<%--	margin-top: -2vh;--%>
<%--	box-shadow: 2px 2px 2px silver;--%>
<%--}--%>

<%--.detail_suk_info{--%>

<%--	width: 100%;--%>
<%--	border: 1px solid silver;--%>
<%--}--%>

<%--#map {--%>

<%--    width: 100%;--%>
<%--    height: 70vh;--%>
<%--}--%>

<%--#address {--%>

<%--    width: 11%;--%>
<%--    padding: 1vh;--%>
<%--    border: 1px solid black;--%>
<%--    border-radius: 5px;--%>
<%--    background-color: white;--%>
<%--    text-align: center;--%>
<%--    font-size: 2vh;--%>
<%--    position: absolute;--%>
<%--    top: 50%;--%>
<%--    left: 44.5%;--%>
<%--    z-index: 1;--%>
<%--}--%>

<%--.detail_room_count{--%>

<%--	color:red;--%>
<%--	font-size: 0.8em;--%>
<%--	float: right;--%>
<%--}--%>

<%--.detail_review{--%>

<%--	width: 80%;--%>
<%--	margin-left: 10%;--%>
<%--}--%>

<%--.detail_review_result{--%>
<%--	--%>
<%--	width: 100%;--%>
<%--	margin-bottom: 5vh;--%>
<%--	font-size: 0.9em;--%>
<%--}--%>

<%--.detail_review_input{--%>

<%--	width: 80%;--%>
<%--	margin-top: 10vh;--%>
<%--	margin-left: 10%;--%>
<%--}--%>

<%--.detail_review_input textarea{--%>

<%--	width: 98%;--%>
<%--	height: 25vh;--%>
<%--	border-radius: 5px;--%>
<%--	border:none;--%>
<%--	margin-top: 1vh;--%>
<%--}--%>

<%--.rate { display: inline-block;border: 0;margin-right: 15px;}--%>
<%--.rate > input {display: none;}--%>
<%--.rate > label {float: right;color: #ddd}--%>
<%--.rate > label:before {display: inline-block;font-size: 1rem;padding-top: 0.2rem; padding-right: .2rem;margin: 0;cursor: pointer;font-family: FontAwesome;content: "\f005 ";}--%>
<%--.rate .half:before {content: "\f089 "; position: absolute;padding-right: 0;}--%>
<%--.rate input:checked ~ label, --%>
<%--.rate label:hover,.rate label:hover ~ label { color: #f73c32 !important;  } --%>
<%--.rate input:checked + .rate label:hover,--%>
<%--.rate input input:checked ~ label:hover,--%>
<%--.rate input:checked ~ .rate label:hover ~ label,  --%>
<%--.rate label:hover ~ input:checked ~ label { color: #f73c32 !important;  } --%>

<%--.detail_review_input_submit{--%>

<%--	width: 8vh;--%>
<%--	height: 5vh;--%>
<%--	border: 1px solid silver;--%>
<%--	color: black;--%>
<%--	font-weight: bold;--%>
<%--	background-color: white;--%>
<%--	border-radius: 1vh;--%>
<%--	font-size: 0.8em;--%>
<%--}--%>

<%--.detail_review_input_reset{--%>

<%--	width: 8vh;--%>
<%--	height: 5vh;--%>
<%--	border: 1px solid silver;--%>
<%--	color: black;--%>
<%--	font-weight: bold;--%>
<%--	background-color: white;--%>
<%--	border-radius: 1vh;--%>
<%--	font-size: 0.8em;--%>
<%--}--%>

<%--.detail_review_input_submit:hover,--%>
<%--.detail_review_input_reset:hover{--%>

<%--	background-color: rgb(228, 231, 235);--%>
<%--}--%>

<%--.room_detail_x_btn{--%>

<%--	color: white;--%>
<%--	background-color: gray;--%>
<%--	border: none;--%>
<%--	border-radius: 3px;--%>
<%--	width: 100%;--%>
<%--	height: 7vh;--%>
<%--	margin-top: -2vh;--%>
<%--	box-shadow: 2px 2px 2px silver;--%>
<%--}--%>
<%--.createChatRoomBtn{--%>
<%--	position: fixed;--%>
<%--	bottom: 100px;--%>
<%--	right: 100px;--%>

<%--}--%>

<%--</style>--%>
<%--<script type="text/javascript">--%>
<%--	$(document).ready(function() {--%>
<%--		// 페이지 로딩 시 실행되는 함수--%>
<%--		(function() {--%>
<%--			$(".detail_suk_info").hide();--%>
<%--			$(".detail_review").hide();--%>
<%--			$(".detail_select_1").css({--%>
<%--				--%>
<%--				"color" : "#f7323f",--%>
<%--				"border-bottom" : "5px solid #f7323f",--%>
<%--				"font-weight" : "bold"--%>
<%--			});--%>
<%--		})();--%>

<%--		// 탭 클릭 시 이벤트 처리--%>
<%--		$(".detail_select_1").click(function() {--%>

<%--			$(this).css({--%>

<%--				"color" : "#f7323f",--%>
<%--				"border-bottom" : "5px solid #f7323f",--%>
<%--				"font-weight" : "bold"--%>
<%--			})--%>

<%--			$(".detail_select_2, .detail_select_3").css({--%>
<%--				"color" : "",--%>
<%--				"border-bottom" : "",--%>
<%--				"font-weight" : ""--%>
<%--			});--%>

<%--			$(".detail_room_select").show();--%>
<%--			$(".detail_suk_info").hide();--%>
<%--			$(".detail_review").hide();--%>
<%--		});--%>

<%--		$(".detail_select_2").click(function() {--%>

<%--			$(this).css({--%>

<%--				"color" : "#f7323f",--%>
<%--				"border-bottom" : "5px solid #f7323f",--%>
<%--				"font-weight" : "bold"--%>
<%--			})--%>

<%--			$(".detail_select_1, .detail_select_3").css({--%>
<%--				"color" : "",--%>
<%--				"border-bottom" : "",--%>
<%--				"font-weight" : ""--%>
<%--			});--%>
<%--			$(".detail_room_select").hide();--%>
<%--			$(".detail_suk_info").show();--%>
<%--			$(".detail_review").hide();--%>
<%--		});--%>

<%--		$(".detail_select_3").click(function() {--%>

<%--			$(this).css({--%>

<%--				"color" : "#f7323f",--%>
<%--				"border-bottom" : "5px solid #f7323f",--%>
<%--				"font-weight" : "bold"--%>
<%--			})--%>

<%--			$(".detail_select_1, .detail_select_2").css({--%>
<%--				"color" : "",--%>
<%--				"border-bottom" : "",--%>
<%--				"font-weight" : ""--%>
<%--			});--%>

<%--			$(".detail_room_select").hide();--%>
<%--			$(".detail_suk_info").hide();--%>
<%--			$(".detail_review").show();--%>
<%--		});--%>

<%--	// 	채팅 채팅 채팅--%>
<%--		$("#createRoomBtn").click(function (){--%>
<%--			var accom_num=$(this).attr("accom_num");--%>
<%--			// alert(accom_num);--%>


<%--			$.ajax({--%>
<%--				type:"post",--%>
<%--				url:"/chat/createRoom",--%>
<%--				data:{"accom_num":accom_num},--%>
<%--				dataType:"html",--%>
<%--				success:function (res){ // 여기서 res == room_num 입니다.--%>
<%--					alert(res);--%>
<%--					// alert("1"+res.accom_num); // 여기가 문제. 즉--%>
<%--					// alert("2"+res);--%>
<%--					// alert(accom_num);--%>
<%--					if (res==0){--%>
<%--						alert("자신이 판매하는 상품은 구매할 수 없습니다.");--%>
<%--						location.href="/chat/goSellerRooms?accom_num="+accom_num;--%>
<%--					} else if (res!=null){--%>
<%--						// location.href="/chat/goSellerRooms?room_num="+res;--%>
<%--						location.href="/chat/goSellerRooms?room_num="+res+"&accom_num="+accom_num;--%>
<%--					}--%>
<%--				}--%>
<%--			});--%>

<%--		});--%>

<%--	});--%>
<%--</script>--%>
<%--<body>--%>
<%--	<div class="detail_box">--%>

<%--		<div class="detail_content">--%>

<%--			<div class="detail_img">--%>
<%--				<img src="../accomsave/${dto.accom_photo }" alt="">--%>
<%--			</div>--%>

<%--			<div class="detail_imgs">--%>
<%--				<ul>--%>

<%--					<c:forEach var="photo" items="${photoList}">--%>
<%--						<li><img src="../roomsave/${photo}" alt=""></li>--%>
<%--					</c:forEach>--%>

<%--				</ul>--%>
<%--			</div>--%>

<%--			<script>--%>
<%--				var clickTimer;--%>

<%--				$(".detail_imgs ul li img").click(function () {--%>
<%--				    var selectImg = $(this).attr('src');--%>

<%--				    // 제거--%>
<%--				    $(".detail_imgs ul li img").css({--%>
<%--				        "transform": "none"--%>
<%--				    });--%>

<%--				    // 효과 생성--%>
<%--				    $(this).css({--%>
<%--				        "transform": "scale(1.05)"--%>
<%--				    });--%>

<%--				    $(".detail_img img").fadeOut(300, function () {--%>
<%--				        $(this).attr('src', selectImg);--%>
<%--				        $(this).fadeIn(300);--%>
<%--				    });--%>

<%--				    // 타이머가 이미 설정되어 있다면 해제--%>
<%--				    if (clickTimer) {--%>
<%--				        clearTimeout(clickTimer);--%>
<%--				    }--%>

<%--				    // 2초 후에 초기 이미지로 돌아가기--%>
<%--				    clickTimer = setTimeout(function () {--%>
<%--				        $(".detail_imgs ul li img").css({--%>
<%--				            "transform": "none"--%>
<%--				        });--%>
<%--				        $(".detail_img img").fadeOut(300, function () {--%>
<%--				            $(this).attr('src', "../accomsave/${dto.accom_photo}");--%>
<%--				            $(this).fadeIn(300);--%>
<%--				        });--%>
<%--				    }, 2000);--%>
<%--				});--%>
<%--			</script>--%>

<%--			<div class="detail_info">--%>

<%--				<div class="detail_room_name">${dto.accom_name }</div>--%>

<%--				<div class="detail_asr">--%>
<%--					<div class="detail_accom_score">${avgscore}</div>--%>
<%--					<div class="detail_score_result"></div>--%>

<%--					<script>--%>
<%--						$(document).ready(function() {--%>
<%--							var accomScore = ${dto.accom_score }--%>

<%--							if (accomScore > 9) {--%>
<%--								$(".detail_score_result").text("최고예요");--%>
<%--							}--%>

<%--							else if (accomScore >= 8 && accomScore <= 9) {--%>
<%--								$(".detail_score_result").text("좋아요");--%>
<%--							}--%>

<%--							else if (accomScore >= 7 && accomScore <= 8) {--%>
<%--								$(".detail_score_result").text("괜찮아요");--%>
<%--							}--%>

<%--							else {--%>
<%--								$(".detail_score_result").text("아쉬워요");--%>
<%--							}--%>
<%--						});--%>
<%--					</script>--%>
<%--					<div class="detail_review_count">리뷰 ${count }개</div>--%>
<%--				</div>--%>
<%--				<div class="detail_accom_location">${dto.accom_location }</div>--%>
<%--				<div class="detail_accom_hashtag">${dto.accom_hashtag }</div>--%>
<%--				<div class="detail_room_info">--%>
<%--					<b>사장님의 한마디</b> <br>--%>
<%--					<div class="detail_room_info_coment">${dto.accom_info }</div>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>

<%--		<div class="detail_select">--%>
<%--			<ul>--%>
<%--				<li class="detail_select_1">객실안내/예약</li>--%>
<%--				<li class="detail_select_2">숙소위치</li>--%>
<%--				<li class="detail_select_3">리뷰</li>--%>
<%--			</ul>--%>
<%--		</div>--%>
<%--	</div>--%>
<%--	--%>
<%--	<c:forEach items="${list }" var="rdto">--%>
<%--	--%>
<%--		<div class="detail_room_select" style="border: 1px solid black;">--%>

<%--			<div class="detail_room_select_img">--%>
<%--				<img src="../roomsave/${rdto.room_photo.split(',')[0]}" alt="">--%>
<%--			</div>--%>
<%--			<div class="detail_room_reserve">--%>
<%--				<div class="detail_room_select_name">${rdto.room_name } <span--%>
<%--                    class="detail_room_count">남은 객실--%>
<%--                <c:set value="${rdto.room_count}" var="roomExist"/>--%>
<%--               <c:forEach items="${reserveCount}" var="reserveCount">--%>
<%--                        <c:if test="${reserveCount.room_num==rdto.room_num}">--%>
<%--                            <c:set value="${roomExist-1}" var="roomExist"/>--%>
<%--                        </c:if>--%>
<%--                    </c:forEach>${roomExist}개</span></div>--%>
<%--				<div class="detail_room_select_suk">기준${rdto.room_minpeople }인 · 최대${rdto.room_maxpeople }인 / ${sleep }박</div>--%>
<%--				<div class="detail_room_select_price" align="right">--%>
<%--					<fmt:formatNumber value="${rdto.room_price*sleep }" />--%>
<%--					원--%>
<%--				</div>--%>
<%--				<div class="detail_room_select_checkin">--%>
<%--					입실시간 <b>${rdto.room_checkin }시부터</b>--%>
<%--				</div>--%>
<%--				<div class="detail_room_select_checkout">--%>
<%--					퇴실시간 <b>익일 ${rdto.room_checkout }시</b>--%>
<%--				</div>--%>
<%--				<div align="center">--%>
<%--					<br>--%>
<%--					--%>

<%--					--%>
<%--						<c:if test="${roomExist > 0 }">--%>
<%--						<button type="button" class="room_detail_reserve_btn"--%>
<%--							onclick="location.href='/reserve/reserve-form?room_num=${rdto.room_num}&checkin=${checkin }&checkout=${checkout }&sleep=${sleep }&accom_name=${accom_name}&room_name=${rdto.room_name }&accom_num=${rdto.accom_num }'">예약</button>--%>
<%--						</c:if>--%>
<%--						--%>
<%--						<c:if test="${roomExist == 0 }">--%>
<%--						<button type="button" id="detail_alert" class="room_detail_x_btn" >숙소에 문의</button>--%>
<%--						</c:if>--%>

<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</c:forEach>--%>
<%--	--%>
<%--	<script>--%>
<%--	$("#detail_alert").click(function() {--%>
<%--		--%>
<%--		alert("객실이 품절되었습니다 숙소에 문의해주세요");--%>
<%--	})--%>
<%--	</script>--%>

<%--	<div class="detail_suk_info">--%>
<%--		--%>
<%--		<div id="map"></div>--%>
<%--		<div id="address"></div>--%>

<%--		<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=c1b8de800495871b37c96707bbc9b0cb&libraries=services"></script>--%>
<%--		<script src="app.js"></script>--%>

<%--		<script>--%>
<%--		    document.addEventListener("DOMContentLoaded", function () {--%>
<%--		        // 여기에 위도와 경도를 가져오는 로직을 추가하세요.--%>
<%--		        var latitude = ${dto.accom_latitude};--%>
<%--		        var longitude = ${dto.accom_longitude};--%>
<%--				--%>
<%--		        // 카카오 지도 API 초기화--%>
<%--		        kakao.maps.load(function () {--%>
<%--		            var container = document.getElementById('map');--%>
<%--		            var options = {--%>
<%--		                center: new kakao.maps.LatLng(latitude, longitude),--%>
<%--		                disableDoubleClickZoom: true,--%>
<%--		                draggable: false,--%>
<%--		                level: 2,--%>
<%--		                --%>
<%--		            };--%>
<%--		--%>
<%--		            var map = new kakao.maps.Map(container, options);--%>
<%--		            --%>
<%--		--%>
<%--		            // 마커 추가--%>
<%--		            var markerPosition = new kakao.maps.LatLng(latitude, longitude);--%>
<%--		            var marker = new kakao.maps.Marker({--%>
<%--		                position: markerPosition--%>
<%--		            });--%>
<%--		--%>
<%--		            marker.setMap(map);--%>

<%--		            // 지도의 중심 좌표를 얻어옵니다 --%>
<%--		            var center = map.getCenter(); --%>
<%--		            // 마커에 표시할 인포윈도우를 생성합니다--%>
<%--		            var infowindow = new kakao.maps.InfoWindow({--%>
<%--					    position: center,--%>
<%--					    content: '<div id="address">도로명주소: 검색 후 표시됩니다.</div>'--%>
<%--					});--%>

<%--		            // 지도에 클릭 이벤트를 등록합니다--%>
<%--		            kakao.maps.event.addListener(map, 'click', function(mouseEvent) { --%>

<%--		                // 클릭한 위도, 경도 정보를 가져옵니다 --%>
<%--		                var latlng = mouseEvent.latLng;--%>

<%--		                // 지도의 중심 좌표를 변경합니다--%>
<%--		                map.setCenter(latlng);--%>
<%--		                // 마커 위치를 클릭한 위치로 옮깁니다--%>
<%--		                marker.setPosition(latlng);--%>

<%--		                // 클릭한 위치에 인포윈도우를 열어줍니다--%>
<%--		                infowindow.open(map, marker);--%>

<%--		                // 지도를 클릭할 때마다 호출하여 클릭한 위치의 주소를 표시합니다--%>
<%--		                searchAddrFromCoords(map.getCenter(), displayCenterInfo);--%>

<%--		            });--%>

<%--		            // 주소-좌표 변환 객체를 생성합니다--%>
<%--		            var geocoder = new kakao.maps.services.Geocoder();--%>

<%--		            // 지도의 중심 좌표에 대한 주소를 얻어옵니다--%>
<%--		            searchAddrFromCoords(map.getCenter(), displayCenterInfo);--%>

<%--		            function searchAddrFromCoords(coords, callback) {--%>
<%--		                // 좌표로 행정동 주소 정보를 요청합니다--%>
<%--		                geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         --%>
<%--		            }--%>

<%--		         	// 주소 정보를 실제 지도에 표시하는 함수입니다--%>
<%--		            function displayCenterInfo(result, status) {--%>
<%--		                if (status === kakao.maps.services.Status.OK) {--%>
<%--		                    var infoDiv = document.getElementById('address');--%>

<%--		                    for (var i = 0; i < result.length; i++) {--%>
<%--		                        // 행정동의 region_type 값은 'H' 이므로--%>
<%--		                        if (result[i].region_type === 'H') {--%>
<%--		                            var fullAddress = result[i].address_name + " " + "${dto.accom_address}";--%>
<%--		                            infoDiv.innerHTML = fullAddress;--%>
<%--		                            break;--%>
<%--		                        }--%>
<%--		                    }--%>
<%--		                }--%>
<%--		            }--%>
<%--		        });--%>
<%--		    });--%>
<%--		</script>--%>
<%--    --%>
<%--	</div>--%>
<%--	<div class="detail_review">--%>
<%--	--%>
<%--		<div style="margin: 5vh 0px;">--%>
<%--		<h3 style="border-bottom: 2px solid silver; padding-bottom: 3vh; margin-bottom: 10vh;">총 ${count }개의 리얼 리뷰</h3>--%>
<%--		</div>--%>
<%--		<c:if test="${totalCount>0 }">--%>
<%--		<div class="pagingbox">--%>

<%--		<c:forEach items="${pplist}" var="list">--%>
<%--		--%>
<%--		<div class="detail_review_result">--%>
<%--		<table class="table table-bordered" style="width: 80%; margin-left: 10%;">--%>
<%--		<tr>--%>
<%--				<td align="center" valign="middle" style="width: 25%;">${list.info_id }</td>--%>
<%--				--%>
<%--				<td align="center" valign="middle" style="width: 20%;">--%>
<%--				<span>별점 ${list.review_score }</span>--%>
<%--    			</td>--%>
<%--    			--%>
<%--    			<td align="center" valign="middle" style="width: 25%;">--%>
<%--    			<span>${dto.accom_name }</span>--%>
<%--    			</td>--%>
<%--				--%>
<%--				<td align="center" valign="middle" style="width: 30%;">--%>
<%--    			<span><fmt:formatDate value="${list.review_write }" pattern="yyyy-MM-dd"/></span>--%>
<%--				</td>--%>
<%--		</tr>--%>
<%--		--%>
<%--		<tr>--%>
<%--			<td colspan="4" align="center" style="padding: 5vh 3%;">--%>
<%--					<div style="width: 100%;">--%>
<%--					${list.review_info }--%>
<%--					</div>--%>
<%--			</td>--%>
<%--		</tr>--%>
<%--		</table>--%>
<%--		</div>--%>
<%--		</c:forEach>--%>
<%--					<ul class="pagination justify-content-center">--%>
<%--					--%>
<%--	    <!-- 이전 -->--%>
<%--		    <c:if test="${startPage > 1 }">--%>
<%--		        <li class="page-item"><a class="page-link" href="${pagingUrl}${startPage-1 }">이전</a></li>--%>
<%--		    </c:if>--%>
<%--		--%>
<%--		    <c:forEach var="pp" begin="${startPage }" end="${endPage }">--%>
<%--		        <c:if test="${currentPage == pp }">--%>
<%--		            <li class="page-item active"><a class="page-link" href="${pagingUrl}${pp }">${pp }</a></li>--%>
<%--		        </c:if>--%>
<%--		--%>
<%--		        <c:if test="${currentPage != pp }">--%>
<%--		            <li class="page-item"><a class="page-link" href="${pagingUrl}${pp }">${pp }</a></li>--%>
<%--		        </c:if>--%>
<%--		    </c:forEach>--%>
<%--		--%>
<%--		    <!-- 다음 -->--%>
<%--		    <c:if test="${endPage < totalPage }">--%>
<%--		        <li class="page-item"><a class="page-link" href="${pagingUrl}${endPage+1 }">다음</a></li>--%>
<%--		    </c:if>--%>
<%--		</ul>--%>
<%--		</div>--%>
<%--		</c:if>--%>
<%--		--%>
<%--		<c:if test="${info_id != null and reviewcount==0 and '예약완료'.equals(reservecheck)}">--%>
<%--		<div class="detail_review_input" style="margin-bottom: -3vh;">--%>
<%--		--%>
<%--		<form action="review-insert" method="post">--%>
<%--		<input type="hidden" name="accom_num" value="${dto.accom_num }">--%>
<%--		<input type="hidden" name="info_id" value="${info_id }">--%>
<%--		<input type="hidden" name="sleep" value="${sleep}">--%>
<%--		<input type="hidden" name="checkin" value="${checkin}">--%>
<%--		<input type="hidden" name="checkout" value="${checkout}">--%>
<%--		--%>
<%--		<table class="table table-bordered">--%>
<%--			<tr>--%>
<%--				<td align="center" valign="middle" style="width: 25%;">${info_id }</td>--%>
<%--				<td align="center" valign="middle" style="width: 10%;">별점</td>--%>
<%--				<td align="center" valign="middle" style="width: 25%; padding-left: 4%;">--%>
<%--				<div class="rate">--%>
<%--                                <input type="radio" id="rating10" name="review_score" value="10"><label for="rating10" title="10점"></label>--%>
<%--                                <input type="radio" id="rating9" name="review_score" value="9"><label class="half" for="rating9" title="9점"></label>--%>
<%--                                <input type="radio" id="rating8" name="review_score" value="8"><label for="rating8" title="8점"></label>--%>
<%--                                <input type="radio" id="rating7" name="review_score" value="7"><label class="half" for="rating7" title="7점"></label>--%>
<%--                                <input type="radio" id="rating6" name="review_score" value="6"><label for="rating6" title="6점"></label>--%>
<%--                                <input type="radio" id="rating5" name="review_score" value="5"><label class="half" for="rating5" title="5점"></label>--%>
<%--                                <input type="radio" id="rating4" name="review_score" value="4"><label for="rating4" title="4점"></label>--%>
<%--                                <input type="radio" id="rating3" name="review_score" value="3"><label class="half" for="rating3" title="3점"></label>--%>
<%--                                <input type="radio" id="rating2" name="review_score" value="2"><label for="rating2" title="2점"></label>--%>
<%--                                <input type="radio" id="rating1" name="review_score" value="1"><label class="half" for="rating1" title="1점"></label>--%>
<%--                            </div>--%>
<%--				</td>--%>
<%--				<td align="center" valign="middle" style="width: 10%">숙소</td>--%>
<%--				<td align="center" valign="middle" style="width: 25%">${dto.accom_name }</td>--%>
<%--			</tr>--%>
<%--			<tr>--%>
<%--				<td colspan="5" align="center" valign="middle">--%>
<%--					<textarea placeholder="멋진 후기를 댓글에 남겨주세요!" name="review_info" required="required"></textarea>--%>
<%--				</td>--%>
<%--			</tr>--%>
<%--			<tr>--%>
<%--				<td colspan="5" align="right" valign="middle">--%>
<%--					<button type="submit" class="detail_review_input_submit">등록</button>--%>
<%--					<button type="button" class="detail_review_input_reset" onclick="">취소</button>--%>
<%--				</td>--%>
<%--			</tr>--%>
<%--		</table>--%>
<%--		</form>--%>

<%--		--%>
<%--		<script>--%>
<%--		$(".detail_review_input_submit").click(function() {--%>
<%--			--%>
<%--		    var reviewInfo = $("textarea[name='review_info']").val();--%>

<%--		    if (reviewInfo !== "") {--%>
<%--		        alert("등록이 완료되었습니다.");--%>
<%--		    } else {--%>
<%--		        alert("별점을 입력하고 후기를 작성해주세요.");--%>
<%--		    }--%>
<%--		});--%>
<%--		--%>
<%--    	function resetReviewInput() {--%>
<%--		        // 별점 초기화--%>
<%--		        $("input[name='accom_count']").prop("checked", false);--%>
<%--		        --%>
<%--		        // textarea 초기화--%>
<%--		        $("textarea[name='review_info']").val('');--%>
<%--		    }--%>
<%--		--%>
<%--		    $(document).ready(function() {--%>
<%--		        $(".detail_review_input_reset").click(function() {--%>
<%--		            resetReviewInput();--%>
<%--		        });--%>
<%--		    });--%>
<%--		</script>--%>

<%--		</div>--%>
<%--		</c:if>--%>
<%--	</div>--%>

<%--<div class="createChatRoomBtn">--%>
<%--	<button class="btn btn-dark" id="createRoomBtn" accom_num="${dto.accom_num}" >숙소에 문의</button>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>