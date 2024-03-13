<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d8615c9af3b1b87d93e4b6344af3f2a7&libraries=services"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <style type="text/css">
        .accom_insert_box {
            width: 100%;
            height: 73vh;
            margin-top: 3.5vh;
        }

        .accom_insert_box table {
            width: 80vh;
        }

        .accom_insert_box table tr td {
            padding: 2.5vh 2.5vh;
        }

        .accom_insert_box textarea {
            width: 55vh;
            height: 25vh;
        }

        .accom_insert_btn1 {
            width: 11vh;
            height: 6vh;
            border: none;
            color: white;
            font-weight: bold;
            background-color: rgb(23, 93, 238);
            border-radius: 1vh;
            margin-right: 1vh;
        }

        .accom_insert_btn2 {
            width: 11vh;
            height: 6vh;
            border: 1px solid silver;
            color: black;
            font-weight: bold;
            background-color: white;
            border-radius: 1vh;
        }

        .accom_search_btn1 {
            width: 20vh;
            height: 5vh;
            border: 0.5px solid silver;
            color: black;
            background-color: rgb(246, 247, 249);
            font-size: 2vh;
            border-radius: 1vh;
            margin-right: 1vh;
        }

        .accom_search_btn2 {
            width: 18vh;
            height: 5vh;
            border: 0.5px solid silver;
            color: black;
            background-color: rgb(246, 247, 249);
            font-size: 2vh;
            border-radius: 1vh;
        }

        .accom_search_btn1:hover,
        .accom_search_btn2:hover {
            background-color: rgb(228, 231, 235);
        }

        #accom_category:hover {
            background-color: rgb(228, 231, 235);
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            width: 80%;
            max-width: 300px;
            max-height: 100vh;
            background-color: #fff;
            border-radius: 10px;
            text-align: center;
        }

        .modal input {
            width: 70%;
            height: 5vh;
        }

        .modal-inputbox {
            margin-top: 2vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .detailAddressInputbtn {
            width: 8vh;
            height: 5vh;
            border: 1px solid silver;
            color: black;
            background-color: rgb(246, 247, 249);
            font-size: 2vh;
            border-radius: 1vh;
            margin-left: 1vh;
        }

        .hashtag_result {
            margin-bottom: 1vh;
            font-size: 0.8em;
        }

        .hashtagremovebtn {
            width: 2vh;
            height: 2vh;
            margin: 0px -0.5vh 0.4vh 0.4vh;
            filter: grayscale(100%);
            cursor: pointer;
        }

        .hashtagremovebtn:hover {
            filter: none;
        }
    </style>
    <script type="text/javascript">
        //높이를 업데이트하는 함수
        function updateHeight() {

            var accomInsertBox = document.querySelector(".accom_insert_box");
            var accomHashtagInput = document.getElementById("accom_hashtag");
            var searchDetailResult = document.getElementById("search_detailresult").innerHTML.trim();
            var hashtagResultDiv = document.getElementById("hashtag_result");

            // 초기 높이를 설정
            currentHeight = 72;

            if (document.getElementById("accom_location").value !== "") {
                // 도로명 주소가 있으면 6vh를 추가하여 설정
                currentHeight += 6;
            }

            if (searchDetailResult !== "") {
                // 상세주소가 있으면 6vh를 추가하여 설정
                currentHeight += 6;
            }

            if (hashtagResultDiv.innerHTML.trim() !== "") {
                // 해쉬태그가 있으면 6vh를 추가하여 설정
                currentHeight += 6;
            }

            // 전역 변수를 업데이트합니다.
            accomInsertBox.style.height = currentHeight + 'vh';
        }
    </script>
    <title>Insert title here</title>
</head>
<body>
	<form action="insert" method="post" enctype="multipart/form-data">
		<div class="accom_insert_box" align="center">
			<!-- 사업자 번호 넘기기 fk -->
			<input type="hidden" name="business_id" value="${dto.business_id }">
			
			<table class="table table-bordered">

            <tr>
                <td align="center" valign="middle" colspan="2"
                    style="font-size: 1.5em;"><b>숙소정보등록</b></td>
            </tr>
            <tr>
                <td align="center" valign="middle"><b>숙소이름</b></td>
                <td valign="middle"><input type="text" class="form-control"
                                           name="accom_name" required="required" placeholder="ex)신라호텔, 조선호텔"
                                           style="width: 30vh; height: 5vh;"></td>
            </tr>

            <tr>
                <td align="center" valign="middle"><b>카테고리</b></td>
                <td valign="middle"><select class="form-control"
                                            name="accom_category" id="accom_category" required="required"
                                            style="width: 8vh; height: 5vh;">
                    <option value="호텔">호텔</option>
                    <option value="모텔">모텔</option>
                    <option value="펜션">펜션</option>
                </select></td>
            </tr>

            <tr>
                <td align="center" valign="middle"><b>숙소사진</b></td>
                <td valign="middle"><input type="file" class="form-control"
                                           name="photo" required="required" style="width: 40vh; height: 5vh;">
                </td>
            </tr>

            <tr>
                <td align="center" valign="middle"><b>위치</b></td>
                <td valign="middle">

                    <!-- 도로명주소 출력 -->
                    <div id="search_result"></div>
                    <!-- 상세주소 출력 -->
                    <div id="search_detailresult"></div>
                    <!-- 도로명 주소 넘기기 -->
                    <input type="hidden" name="accom_location" id="accom_location">
                    <input type="hidden" name="accom_latitude" id="accom_latitude">
                    <input type="hidden" name="accom_longitude" id="accom_longitude">
                    <!-- 상세주소 주소 넘기기 -->
                    <input type="hidden" name="accom_address" id="accom_address">
                    <!-- 도로명주소 검색 API -->
                    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                    <script>
                        window.onload = function () {
                            document.getElementById("address_kakao").addEventListener("click", function () {
                                new daum.Postcode({
                                    oncomplete: function (data) {
                                        var detailAddressInput = document.getElementById("detailAddressInput").value;
                                        var searchResultDiv = document.getElementById("search_result");
                                        var searchDetailResultDiv = document.getElementById("search_detailresult");
                                        var accomLocationInput = document.getElementById("accom_location"); // 수정된 부분
                                        var accomAddressInput = document.getElementById("accom_address"); // 추가된 부분
                                        var accomInsertBox = document.querySelector(".accom_insert_box");

                                        // 주소 넣기
                                        searchResultDiv.innerHTML = data.address;

                                        var geocoder = new kakao.maps.services.Geocoder();
                                        geocoder.addressSearch(data.address, function (result, status) {
                                            //alert("등록");
                                            // 정상적으로 검색이 완료됐으면
                                            if (status === kakao.maps.services.Status.OK) {
                                                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                                                var message = 'latlng: new kakao.maps.LatLng(' + result[0].y + ', ';
                                                message += result[0].x + ')';

                                                $("#accom_latitude").val(result[0].y);
                                                $("#accom_longitude").val(result[0].x);

                                            }
                                        });

                                        // accom_location input에 주소 값 넣기
                                        if (accomLocationInput) {
                                            accomLocationInput.value = data.address;
                                            accomAddressInput.value = detailAddressInput; // 추가된 부분

                                            // 주소가 있을 때 스타일 설정
                                            searchResultDiv.style.width = '60vh';
                                            searchResultDiv.style.height = '5vh';
                                            searchResultDiv.style.marginBottom = '0.5vh';
                                            searchResultDiv.style.marginLeft = '0.6vh';
                                            updateHeight();
                                        }
                                    }
                                }).open();
                            });
                        }
                    </script>

                    <button type="button" class="accom_search_btn1" id="address_kakao">도로명주소 검색</button>
                    <button type="button" class="accom_search_btn2" id="address_detail">상세주소 입력</button>

                    <!-- 모달창 -->
                    <div class="modal" id="myModal">
                        <div class="modal-content">
                            <h5>상세주소 입력</h5>
                            <div class="modal-inputbox">
                                <input type="text" id="detailAddressInput" class="form-control">
                                <button type="button" class="detailAddressInputbtn" onclick="saveDetailAddress()">확인
                                </button>
                            </div>
                        </div>
                    </div>
                    <!-- 모달창 끝 -->

                    <script>
                        // 모달창 보이기
                        $("#address_detail").click(function () {
                            // 검색 결과가 없으면 모달창을 열지 않고 알림창을 띄웁니다.
                            var searchDetailResult = document.getElementById("search_result").innerHTML.trim();
                            if (searchDetailResult === "") {
                                alert("도로명 주소를 먼저 검색해주세요.");
                            } else {
                                $("#myModal").show();
                            }
                        });

                        // 모달창 숨기기
                        function closeModal() {
                            $("#myModal").hide();
                        }

                        // 입력 확인 시 동작
                        function saveDetailAddress() {
                            var detailAddressInput = document.getElementById("detailAddressInput").value;
                            var searchDetailResultDiv = document.getElementById("search_detailresult");
                            var accomLocationInput = document.getElementById("accom_location"); // 수정된 부분
                            var accomAddressInput = document.getElementById("accom_address"); // 추가된 부분
                            var accomInsertBox = document.querySelector(".accom_insert_box");

                            // 도로명 주소 가져오기
                            var roadAddress = document.getElementById("search_result").innerHTML.trim();

                            // 상세 주소가 있을 때 스타일 설정
                            if (detailAddressInput) {
                                // accom_location에 도로명 주소와 새로운 상세 주소를 추가
                                accomLocationInput.value = roadAddress; // 수정된 부분
                                accomAddressInput.value = detailAddressInput; // 추가된 부분

                                // search_detailresult를 비우고, 새로운 상세 주소를 추가
                                searchDetailResultDiv.innerHTML = '';
                                var newDetailElement = document.createElement("div");
                                newDetailElement.innerHTML = detailAddressInput;
                                newDetailElement.style.width = '60vh';
                                newDetailElement.style.height = '5vh';
                                newDetailElement.style.marginBottom = '0.5vh';
                                newDetailElement.style.marginLeft = '0.6vh';
                                searchDetailResultDiv.appendChild(newDetailElement);
                            }

                            closeModal(); // 모달창 닫기
                            updateHeight();
                        }
                    </script>

                </td>
            </tr>

            <tr>
                <td align="center" valign="middle"><b>해쉬태그</b></td>
                <td>
                    <!-- 해쉬태그 출력 -->
                    <div id="hashtag_result"></div>
                    <input type="hidden" name="accom_hashtag" id="accom_hashtag">
                    <input type="text" class="form-control" id="hashtag_input" placeholder="키워드 입력"
                           style="width: 40vh; height: 5vh;" onkeypress="handleHashtagInput(event)">

                    <script>

                        function handleHashtagInput(event) {
                            if (event.key === "Enter") {
                                event.preventDefault();
                                var hashtagInput = document.getElementById("hashtag_input");
                                var hashtagResultDiv = document.getElementById("hashtag_result");
                                var accomHashtagInput = document.getElementById("accom_hashtag");
                                var accomInsertBox = document.querySelector(".accom_insert_box");

                                var newHashtag = hashtagInput.value.trim();

                                if (newHashtag !== "") {
                                    // 최대 5개까지만 허용
                                    var currentHashtags = accomHashtagInput.value.split(',').map(tag => tag.trim());
                                    if (currentHashtags.length >= 5) {
                                        alert("해쉬태그는 최대 5개까지 등록할 수 있습니다.");
                                        return;
                                    }

                                    if (newHashtag !== "" && (newHashtag.length - (newHashtag.startsWith("#") ? 1 : 0)) > 3) {
                                        alert("해시태그는 최대 3글자까지 입력해 주세요.");
                                        return;
                                    }

                                    if (!newHashtag.startsWith("#")) {
                                        newHashtag = "#" + newHashtag;
                                    }

                                    if (accomHashtagInput.value === "") {
                                        accomHashtagInput.value = newHashtag;
                                    } else {
                                        accomHashtagInput.value += ', ' + newHashtag;
                                    }

                                    var newHashtagDiv = document.createElement("div");
                                    newHashtagDiv.innerHTML = newHashtag +
                                        ("<img src='../accomimage/x.png' onclick='removeHashtag(this)' class='hashtagremovebtn'>");
                                    newHashtagDiv.style.display = "inline-block";
                                    newHashtagDiv.style.padding = "0.3vh 1.25vh";
                                    newHashtagDiv.style.marginRight = "4px";
                                    newHashtagDiv.style.border = "1px solid #ccc";
                                    newHashtagDiv.style.borderRadius = "4px";
                                    newHashtagDiv.style.marginBottom = "2vh";

                                    // 해시태그 결과를 갱신하고, 입력란 비우기
                                    hashtagResultDiv.appendChild(newHashtagDiv);
                                    hashtagInput.value = "";

                                    updateHeight();
                                }
                            }
                        }

                        function removeHashtag(button) {
                            var hashtagResultDiv = document.getElementById("hashtag_result");
                            var accomHashtagInput = document.getElementById("accom_hashtag");
                            var accomInsertBox = document.querySelector(".accom_insert_box");

                            // 부모 엘리먼트를 찾아 삭제
                            var hashtagDiv = button.parentNode;
                            hashtagResultDiv.removeChild(hashtagDiv);

                            // 해시태그 결과를 갱신하고, 입력란이 업데이트되었을 때 accomInsertBox의 높이 조절
                            accomHashtagInput.value = Array.from(hashtagResultDiv.children)
                                .map(tagDiv => tagDiv.textContent.replace('x', '').trim())
                                .join(', ');
                            updateHeight();
                        }
                    </script>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <!-- 해쉬태그 이벤트 때문에 submit이 아니고 button 여기에 submit 메서드 추가 -->
                    <button type="button" class="accom_insert_btn1" onclick="submitForm()">등록</button>
                    <button type="button" class="accom_insert_btn2" onclick="Back()">취소</button>
                    <script>
                        function submitForm() {
                            // 폼 요소 가져오기
                            var form = document.forms[0];

                            // 필수 필드에 대한 유효성 검사
                            var requiredFields = form.querySelectorAll('[required]');
                            for (var i = 0; i < requiredFields.length; i++) {
                                if (!requiredFields[i].value) {
                                    // 필수 필드 중 하나라도 값이 없으면 제출을 막고 오류 메시지를 표시합니다.
                                    alert('비어있는 항목을 입력해주세요.');
                                    return false;
                                }
                            }

                            // 모든 필수 필드에 값이 있는 경우 폼 제출
                            form.submit();
                        }

                        // 취소시 뒤로가기
                        function Back() {
                            window.history.back();
                        }
                    </script>
                </td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>