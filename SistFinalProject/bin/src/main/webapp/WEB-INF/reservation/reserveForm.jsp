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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	div.right-side{
		width: 30%;
		height: 80%;
		float: right;
		background-color: #FAFAFA;
	}
	div.right-inside{
		padding: 20px 10px 0px 10px;
	}
	div.right-category{
		color: #CFCFCF;
	}
	span.vat{
		color: #333333;
		font-size: 0.9em;
	}
	b.totalpay{
		color: #DB0F56;
		font-size: 1.4em;
	}
	p.explain{
		color: #9C9C9C;
		font-size: 0.8em;
	}
	button.btnpay{
		background-color: #EE0057;
		width: 100%;
		height: 50px;
		color: white;
		border: none;
		font-size: 0.8em;
	}
	
	div.left-side{
		float: left;
		width: 65%;
	}
	
	div.left-side input::placeholder {
 		color: #BDBDBD;
	}
	
	.left-category{
		color: #707070;
	}
	
	.btn-discount, .btn-point, .btn-giftcard, .payment{
		border: 1px solid lightgray;
		padding: 10px 10px 10px 10px;
		border-radius: 5px;
		background-color: #FAFAFA;
		color: #707070;
	}
	
	span.count {
		margin-left: 5px;
	}
	
	input.point{
		border: 1px solid lightgray;
		padding: 10px 10px 10px 10px;
		color: #707070;
		width: 18.75vh;
	}
	
	a.modal-link{
		color: #707070;
		cursor: pointer;
		text-decoration: underline;
	}
	
	.modal-title{
		position: absolute;
		left: 40%;
	}
	
	.modal-title2{
		position: absolute;
		left: 5%;
		font-weight: bold;
		
	}
	
	.mention{
		text-align: center;
		padding: 50px 30px 50px 30px;
		color: #BDBDBD;
	}
	
	#pay-confirm-btn{
		color: #A748FF;
		background-color: white;
		border: none;
		font-weight: bold;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		$(".btn-discount, .btn-point, .btn-giftcard").click(function(){
			
			var pay=$(".buypay").text();
			
			$(".totalpay").text(pay);
		});
		
		/* $(".allcheck").click(function(){
			
			var chk=$(this).is(":checked");
			//console.log(chk);
			
			$(".check").prop("checked",chk);
		}); */
		$(document).ready(function () {
		    $(".allcheck").click(function () {
		        var chk = $(this).is(":checked");
		        $(".check").prop("checked", chk);
		    });

		    $(".check").click(function () {
		        var allChecked = $(".check:checked").length === $(".check").length;
		        $("input.allcheck").prop("checked", allChecked);
		    });
		});
	});
	
	function reservechk() {
	    // 이름이 비어있는지 확인
	    if ($(".name").val() == '') {
	        // 이름이 비어있으면 알림 표시하고 함수 종료
	        alert("이름을 입력해주세요.");
	        return false;
	    } else {
	        // 이름이 비어있지 않으면 휴대폰 번호가 비어있는지 확인
	        if ($(".phone").val() == '') {
	            // 휴대폰 번호가 비어있으면 알림 표시하고 함수 종료
	            alert("휴대폰 번호를 입력해주세요.");
	            return false;
	        } else {
	            // 휴대폰 번호도 비어있지 않으면 동의 체크박스를 확인
	            for (var i = 0; i < 3; i++) {
	                // 동의 체크박스 중 하나라도 체크되어 있지 않으면 알림 표시하고 함수 종료
	                if (!($(".check:eq(" + i + ")").is(":checked"))) {
	                    alert("필수 이용 동의 항목에 동의(체크)해주세요.");
	                    return false;
	                }
	            }
	        }
	    }
	    
	    $("#pay-modal").modal("show");
	}
</script>
</head>
<body>
	<form action="#" method="post">
		<div class="left-side">
			<div>
				<b>예약자 정보</b>
			</div>
			<br>

			<div class="left-category">예약자 이름</div>
			<input type="text" class="form-control name" placeholder="체크인시 필요한 정보입니다"
				style="height: 50px;"> <br>
			<br>

			<div class="left-category">
				휴대폰 번호<br>
				<div style="font-size: 0.8em;">개인 정보 보호를 위해 안심번호로 숙소에 전송됩니다.</div>
			</div>
			<br> <input type="text" class="form-control phone" style="height: 50px;"
				value="01097737503"> <br>
			<hr>
			<br> <b>할인 수단 선택</b> <br>
			<br>

			<div>
				<span class="left-category">구매 총액</span> <span style="float: right;"><b
					class="buypay">199,100원</b></span>
			</div>
			<br>

			<div>
				<button type="button" class="btn-discount" data-bs-toggle="modal" data-bs-target="#coupon-modal">
					사용 가능 쿠폰<span class="count">0장</span>
				</button>
				<span style="float: right;"><b>-</b></span>
			</div>
			<br>

			<div class="left-category">
				<span style="font-size: 15px;">일반쿠폰</span> <span
					style="float: right;">-</span>
			</div>
			<br>

			<div class="left-category">
				<span style="font-size: 15px;">더하기 쿠폰</span> <span
					style="float: right;">-</span>
			</div>
			<br>

			<div>
				<button type="button" class="btn-point">
					포인트 사용<span class="count">0장</span>
				</button>
				<span style="float: right;"> <input type="text" value="0"
					style="text-align: right;" class="point">&nbsp;<b>P</b>
				</span>
			</div>
			<br>

			<br>
			<hr>
			<br> <b>결제수단 선택</b> <br>
			<br>

			<div>
				<select class="payment">
					<option value="kakaopay">카카오페이</option>
					<option value="tosspay">토스페이</option>
					<option value="card">신용/체크 카드</option>
					<option value="account">간편계좌이체</option>
					<option value="payco">페이코</option>
					<option value="phonepay">휴대폰결제</option>
				</select>
			</div>
			<br>

			<div>
				<input type="checkbox" class="allcheck">&nbsp;<b>전체동의</b> <br>
				<br> <input type="checkbox" class="check">&nbsp;
					<a class="modal-link" data-bs-toggle="modal" data-bs-target="#refund-rule">
						숙소이용규칙 및 취소/환불규정 동의</a> <span style="color: #EE0057;">(필수)</span><br>
				<br> <input type="checkbox" class="check">&nbsp;
					<a class="modal-link" data-bs-toggle="modal" data-bs-target="#personal-information">
						개인정보 수집 및 이용 동의</a> <span style="color: #EE0057;">(필수)</span><br>
				<br> <input type="checkbox" class="check">&nbsp;
					<a class="modal-link" data-bs-toggle="modal" data-bs-target="#third-parties">
						개인정보 제 3자 제공 동의</a> <span style="color: #EE0057;">(필수)</span>
			</div>
		</div>

		<div class="right-side">
			<div class="right-inside">
				<div class="right-category">숙소이름</div>
				<div>숙소이름 넣을 곳</div>
				<br>

				<div class="right-category">객실타입/기간</div>
				<div>숙소타입 넣을 곳 / 기간</div>
				<br>

				<div class="right-category">체크인</div>
				<div>체크인시간</div>
				<br>

				<div class="right-category">체크아웃</div>
				<div>체크아웃시간</div>
				<br>

				<hr style="width: 95%; margin-left: 5px;">
				<br> <b>총 결제 금액</b><span class="vat">(VAT포함)</span> <br> <b
					class="totalpay">원</b> <br> <br>

				<p class="explain">
					• 해당 객실가는 세금, 봉사료가 포함된 금액입니다 <br>
					• 결제완료 후 <span style="color: #DB0F56;">예약자 이름</span>으로 바로 <span style="color: #DB0F56;">체크인</span> 하시면 됩니다
				</p>
				<br>
			</div>

			<button type="button" class="btnpay" onclick="reservechk()">결제하기</button>
			
			
			<!-- 결제 확인 Modal -->
			<div class="modal fade" id="pay-modal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						
						<div class="modal-body">
							숙소이름<br>
							숙소타입 넣을 곳 / 기간<br>
							<br>
							
							<span style="color: #CFCFCF;">체크인</span><span style="float: right; font-weight: bold;">체크인시간</span><br>
							<span style="color: #CFCFCF;">체크아웃</span><span style="float: right; font-weight: bold;">체크아웃시간</span>
							<hr>
							
							<p>
								• 19세 미만 청소년은 보호자 동반 시 투숙이 가능합니다.<br>
								• <span style="font-weight: bold; color: red;">취소 및 환불 규정</span>에 따라 앱내에서 예약취소 가능한 상품입니다. 예약취소 시 취소수수료 가 발생할 수 있습니다.
							</p>
						</div>
						
						<div class="modal-footer">
							<button type="button" id="pay-confirm-btn">확인 및 결제진행</button>
							
							<!-- 카카오페이 api -->
							<script>
								IMP.init("imp06867735");
								
								$(document).ready(function () {
								    $("#pay-confirm-btn").click(onClickPay);
								});

								function generateReservationNumber() {
								    // 예약 번호의 형식을 정의하고, 각 자리의 값을 랜덤으로 생성
								    return 'xxxx-xxxx-xxxx'.replace(/x/g, function() {
								        var r = Math.random() * 16 | 0; // 16진수로 표현된 난수 생성 (0 ~ 15)
								        return r.toString(16); // 16진수로 변환하여 반환
								    });
								}
								
								function onClickPay() {
									
									var reservationNumber = generateReservationNumber();
									//alert(reservationNumber);
									
								    IMP.init("imp06867735");

								    IMP.request_pay({
								        pg: "kakaopay",
								        pay_method: "card",
								        amount: "60000",
								        name: "매운 라면",
								        merchant_uid: reservationNumber
								    }, function (rsp) {
								        if (rsp.success) {
								            // 결제 성공 시 서버로 데이터 전송
								            sendPaymentData(reservationNumber);
								        } else {
								            // 결제 실패 시 처리
								            alert("결제를 취소했습니다");
								        }
								    });
								}
								
								function sendPaymentData(reservationNumber) {
								    $.ajax({
								        type: "POST",
								        url: "/reserve/insert",
								        data: {
								            reservationNumber: reservationNumber
								        },
								        success: function (response) {
								            // 서버에서 Success 응답을 받으면 추가적인 로직을 수행할 수 있습니다.
								            
								            window.location.href = "/payment/pay-success";
								        },
								        error: function (error) {
								            // 에러 시 처리
								            console.log(error);
								        }
								    });
								}
							</script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>



	<!-- 쿠폰 Modal -->
	<div class="modal" id="coupon-modal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" style="align-items: center;">쿠폰 적용</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<h5><b>일반쿠폰 <span>0</span>장</b></h5>
					<div class="mention">
						사용 가능한 쿠폰이 없습니다.
					</div>
					
					<h5><b>더하기 쿠폰 <span>0</span>장</b></h5>
					<div class="mention">
						사용 가능한 쿠폰이 없습니다.
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal" style="width: 100%; height: 50px; font-size: 20px;"><span>0</span>원 적용하기</button>
				</div>

			</div>
		</div>
	</div>
	
	
	<!-- 숙소이용규칙 및 취소/환불규정 동의 Modal -->
	<div class="modal" id="refund-rule">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title2">숙소이용규칙 및 취소/환불 규정(필수)</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<p>
						<h4><b>이용규칙</b></h4><br>
						• 최대 인원 초과 시 입실 불가합니다.<br>
						• 정원 기준 요금 외 인원 추가 요금은 현장결제입니다.<br>
						• 제공 이미지는 배정된 객실과 다를 수 있습니다.<br>
						• 제공 정보는 숙소의 사정에 따라 변경될 수 있습니다.<br>
						• 미성년자는 보호자 동반 시 투숙이 가능합니다.<br>
						• 업체 현장에서 객실 컨디션 및 서비스로 인해 발생된 분쟁은 TRIVIEW에서 책임지지 않습니다.<br><br>
						<h4><b>취소/환불규정</b></h4><br>
						• TRIVIEW에서 판매되는 국내 호텔/리조트/펜션/게스트하우스/캠핑/홈앤빌라 상품은예약/결제 후 10분 이내에는 무료취소 가능합니다. (단, 체크인 시간 경과 시 취소불가)<br>
						• 숙소 사정에 의해 취소 발생 시 100% 환불이 가능합니다.<br>
						• 예약 상품 별 숙소 정보에 기재된 취소, 환불 규정을 반드시 확인 후 이용해주시기 바랍니다.<br>
						• 예약/결제 10분 이후의 취소는 업체의 취소/환불 규정에 의거하여 적용됩니다.<br>
						• 취소, 변경 불가 상품은 규정과 상관없이 취소, 변경이 불가합니다.<br>
						• 당일 결제를 포함한 체크인 당일 취소는 취소, 변경이 불가합니다.<br>
						• 예약 취소가 불가능한 시간에 고객 사정에 의한 취소 시, TRIVIEW가 제공하는 모든 혜택에서 제외될 수 있으며 (혜택받기 포인트 미지급, 할인 쿠폰 미제공, 이벤트 대상자 제외), 본 예약 시 사용한 쿠폰은 소멸됩니다.<br>
						• 단! 숙소의 객실 정보가 수시로 변경될 수 있으며 이로 인한 불이익은 여기어 때가 책임지지 않습니다.<br>
					</p>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 개인정보 수집 및 이용 동의 Modal -->
	<div class="modal" id="personal-information">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title2">개인정보 수집 및 이용 동의</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<table class="table table-bordered">
						<tr align="center">
							<th style="background-color: #EBEBEB; color: #939393;" width="30" valign="middle">구분</th>
							<th style="background-color: #EBEBEB; color: #939393;" width="150" valign="middle">수집/이용 목적</th>
							<th style="background-color: #EBEBEB; color: #939393;" width="200" valign="middle">수집 항목</th>
							<th style="background-color: #EBEBEB; color: #939393;" width="300" valign="middle">보유 및 이용기간</th>
						</tr>
						<tr align="center" valign="middle">
							<td style="color: #939393;">필수</td>
							<td style="color: #939393;">
								<p>
									- 예약/결제 서비스 이용 <br>
									- 상담 밑 부정 거래 기록 확인
								</p>
							</td>
							<td style="color: #939393;">
								<p>
									- 예약서비스이용: 예약자 이름,휴대폰 번호, CI<br>
									- 결제서비스이용: <br>
									(카드 결제 시)<br> 카드사명,카드번호,유효 기간, 이메일<br>
									(휴대폰 결제 시)<br>
									휴대폰 번호, 통신사, 결제 승인번호<br>
									(계좌이체 시)<br>
									은행명, 계좌번호, 예금주<br>
									(현금 영수증 발급 시)<br>
									휴대폰 번호, 이메일<br> (취소•환불을 위한 대급 지급 요청 시)<br>
									은행명, 계좌번호, 예금주명
								</p>
							</td>
							<td style="color: #939393;">
								<h5 style="font-weight: bold; text-decoration: underline;">
									<b>
										<p>전자상거래 상 소비자 보호에 관한 법률에 따라 5년간 보관</p>
									</b>
								</h5>
							</td>
						</tr>
					</table>
					<h5 style="color: #939393;">
						※ 위 동의 내용을 거부하실 수 있으나, 동의를 거부하실 경우 서비스를 이용하실 수 없습니다.<br>
						※ 개인정보 처리와 관련된 상세 내용은 '개인정보처리방침'을 참고
					</h5>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<!-- 개인정보 제 3자 제공 동의 Modal -->
	<div class="modal" id="third-parties">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title2">개인정보 제 3자 제공 동의</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<table class="table table-bordered">
						<tr align="center">
							<th style="background-color: #EBEBEB; color: #939393;" width="50" valign="middle">제공받는 자</th>
							<th style="background-color: #EBEBEB; color: #939393;" width="50" valign="middle">제공 목적</th>
							<th style="background-color: #EBEBEB; color: #939393;" width="50" valign="middle">제공하는 항목</th>
							<th style="background-color: #EBEBEB; color: #939393;" width="50" valign="middle">제공받는 자의 개인정보 보유 및 이용기간</th>
						</tr>
						<tr align="center" valign="middle">
							<td style="color: #939393; font-weight: bold;">
								숙소명
							</td>
							<td style="color: #939393; font-weight: bold;">
								숙박예약서비스 이용계약 이행(서비스 제공, 확인, 이용자 정보 확인)
							</td>
							<td style="color: #939393;">
								예약한 숙박서비스의 이용자 정보(예약자 이름, 휴대폰번호, 예약번호, 예약한 업체명, 예약한 객실명, 결제금액)
							</td>
							<td style="color: #939393; font-weight: bold;">
								예약서비스 제공 완료 후 6개월
							</td>
						</tr>
					</table>
					<h5 style="color: #939393;">
						※ 위 동의 내용을 거부하실 수 있으나, 동의를 거부하실 경우 서비스를 이용하실 수 없습니다.<br>
						※ 개인정보 처리와 관련된 상세 내용은 '개인정보처리방침'을 참고
					</h5>
				</div>
			</div>
		</div>
	</div>
</body>
</html>