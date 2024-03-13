<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@2.0/nanumsquare.css">
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d8615c9af3b1b87d93e4b6344af3f2a7&libraries=services"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <title>Insert title here</title>
</head>
<style type="text/css">

    .amount-bar-wrap {
        font-weight: bold;
        
    }

    div.btn-date {
        padding: 10px;
        border: 2px solid gainsboro;
        border-radius: 5px;
        cursor: pointer;
    }

    div.filter-border-box {
        font-family: 'NanumSquare', serif;
        padding: 20px;
        margin: 30px;
        border: 1px solid gainsboro;

    }

    div.search-box {
        font-family: 'NanumSquare', serif;
        padding: 20px;
        margin: 30px;
        border: 1px solid gainsboro;
    }

    div.filter-box {
        position: relative;
    }

    section.Type-of-accom {
        color: dimgray;
    }

    .calendar {
        position: absolute;
        width: 300px;
        background-color: #fff;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
        top: 25%; /* 추가된 부분: 상위 요소의 하단을 기준으로 위치 조정 */
        left: 0; /* 추가된 부분: 상위 요소의 왼쪽을 기준으로 위치 조정 */
        z-index: 3; /* 추가된 부분: 다른 요소들보다 위에 위치하도록 함 */
    }

    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
        background-color: #f7323f;
        color: #fff;
    }

    .prev, .next {
        cursor: pointer;
        font-size: 1.1em;
        font-weight: bold;
    }

    .days {
        display: grid;
        grid-template-columns: repeat(7, 1fr);
        padding: 10px;
    }

    .weekend {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 40px;
        border-radius: 4px;
    }

    .day {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 40px;
        border-radius: 4px;
        cursor: pointer;
    }

    .day:hover {
        background-color: #e0e0e0;
    }

    .selected:hover {
        background-color: #AA323F;
    }

    .day.disabled {
        color: #ccc;
        cursor: not-allowed;
    }

    .selected {
        background-color: #f7323f;
        color: #fff;
    }

    .middle {
        position: relative;
        width: 80%;
        max-width: 400px;
    }

    .slider {
        position: relative;
        z-index: 1;
        height: 10px;
        margin: 0 15px;
    }

    .slider > .track {
        position: absolute;
        z-index: 1;
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
        border-radius: 5px;
        background-color: #c6aee7;
    }

    .slider > .range {
        position: absolute;
        z-index: 2;
        left: 25%;
        right: 25%;
        top: 0;
        bottom: 0;
        border-radius: 5px;
        background-color: #f7323f;
    }

    .slider > .thumb {
        position: absolute;
        z-index: 3;
        width: 30px;
        height: 30px;
        background-color: #f7323f;
        border: 2px solid white;
        border-radius: 50%;
        box-shadow: 0 0 0 0 rgba(98, 0, 238, .1);
        transition: box-shadow .3s ease-in-out;
    }

    .slider > .thumb.left {
        left: 25%;
        transform: translate(-15px, -10px);
    }

    .slider > .thumb.right {
        right: 25%;
        transform: translate(15px, -10px);
    }

    input[type=range] {
        position: absolute;
        pointer-events: none;
        -webkit-appearance: none;
        z-index: 2;
        height: 10px;
        width: 100%;
        opacity: 0;
    }

    input[type=range]::-webkit-slider-thumb {
        pointer-events: all;
        width: 30px;
        height: 30px;
        border-radius: 0;
        border: 0 none;
        background-color: red;
        -webkit-appearance: none;
    }

    div.sort-each-box {
        border: 1px solid gainsboro;
        width: 50%;
        text-align: center;
        vertical-align: middle;
        padding-top: 1vh;
        height: 5vh;
        cursor: pointer;
        border-radius: 5px;
    }

    .accom-list {
        padding: 10px;
        cursor: pointer;
        display: flex;
        align-items: center;
    }

    .accom-image {
        margin-right: 10px;
    }

    .info-container {
        margin-top: 10px;
        display: flex;
        flex-direction: column; /* 아래로 정렬 */
        flex-grow: 1;
        width: 43%;
        margin-top: -2vh;
    }

    .accom-info {
        width: 100%;
        height: 160px;
        
    }

    .room-amount {
        width: 100%;
        height: 40px;
        text-align: right;
    }

    .accom-image img {
        width: 50vh;
        height: 30vh;
        object-fit: cover;
        border:1px solid black;
    }

    .detail_accom_name {
        width: 100%;
        bottom: 39vh;
        font-weight: bold;
        font-size: 3vh;
    }

    .detail_asr {
        width: 100%;
        display: flex;
        margin: 1vh 0px 2vh 0px;
    }

    .detail_accom_score {
        width: 15%;
        border-radius: 5px;
        color: white;
        background-color: orange;
        text-align: center;
        margin-right: 1vh;
    }

    .detail_score_result {
        width: 25%;
        color: orange;
        font-size: 2vh;
        font-weight: 650;
        margin-right: 0.5vh;
        text-align: center;
    }

    .detail_review_count {
        width: 35%;
        color: silver;
        font-size: 2vh;
        font-weight: 500;
        margin-left: 0.5vh;
    }
	.search_list_none{
		list-style: none;
		margin-left: -11%;
	}
</style>
<body>
<script type="text/javascript">
    $(function () {
        $(".calendar").hide();

        $(".btn-date").click(function () {
            $(".calendar").toggle();
        })
        $(".price-bar-container").show();

    })
</script>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<c:if test="${mySurrounding==null && sortSurrounding==null}">
    <caption><b style="font-size: 40px; width: 120%; margin-left:-10%; font-family: 'NanumSquare', serif;">검색 : '${keyword}'</b></caption>
</c:if>
<c:if test="${mySurrounding!=null || sortSurrounding!=null}">
    <caption><b style="font-size: 40px; font-family: 'NanumSquare', serif;">'내 근처'</b></caption>
</c:if>
<br><br>
<div style="width: 120%; margin-left:-10%; border: 2px solid gray;" class="d-inline-flex">
    <div class="filter-border-box" style="width: 33%">
        <div class="filter-box">
            <section class="date-wrap">
                <h4><b>날짜</b></h4>
                <div class="btn-date d-inline-flex" style="width: 100%;">
                    <i class="bi bi-calendar-check" style="margin-right: 10px;"></i>
                    <span class="date-view">
                            <c:if test="${firstYear==null}">
                                <b class="firstDate">11.15 ~ 11.16</b>
                                <em>&nbsp;·&nbsp;1박</em>
                            </c:if>
                            <c:if test="${firstYear!=null}">
                                <b>${firstMonth}.${firstDay} ~ ${secondMonth}.${secondDay}</b>
                                <em>&nbsp;·&nbsp;${sleep}박</em>
                            </c:if>
                        <input type="hidden" id="selDate1" value="${selDate1}">
                        <input type="hidden" id="selDate2" value="${selDate2}">
                        </span>
                </div>
                <div class="calendar">
                    <div class="header">
                        <div class="prev" onclick="prevMonth()">&#9665;</div>
                        <div class="current-month"></div>
                        <div class="next" onclick="nextMonth()">&#9655;</div>
                    </div>
                    <div class="days" id="calendar-days"></div>
                    <button class="calendar-setting btn btn-outline-danger" style="margin-left: 35%">선택 완료</button>
                </div>

                <script>
                    const today = new Date();
                    let count = 1;
                    <c:if test="${firstYear==null}">
                    let firstClickDay = today.getDate();
                    let lastClickDay = firstClickDay + 1;
                    let firstMonth = today.getMonth();
                    let lastMonth = today.getMonth();
                    let currentMonth = today.getMonth();
                    let firstYear = today.getFullYear();
                    let lastYear = today.getFullYear();
                    let currentYear = today.getFullYear();
                    if (firstClickDay == today.getDay()) {
                        lastClickDay = 1;
                        lastMonth = firstMonth + 1;
                        if (firstMonth == 11) {
                            lastMonth = 0;
                            lastYear = firstYear + 1;
                        }
                    }
                    </c:if>
                    let asc = true;
                    let start = false;
                    let flag = false;
                    let sleep = 1;
                    <c:if test="${firstYear!=null}">
                    let firstClickDay = ${firstDay};
                    let lastClickDay = ${secondDay};
                    let firstMonth = ${firstMonth-1};
                    let lastMonth = ${secondMonth-1};
                    let firstYear = ${firstYear};
                    let lastYear = ${secondYear};
                    let currentMonth = ${firstMonth-1};
                    let currentYear = ${firstYear};
                    </c:if>
                    const weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
                    $(".firstDate").html((firstMonth + 1) + "." + firstClickDay + " ~ " + (lastMonth + 1) + "." +
                        lastClickDay)

                    function updateCalendar() {
                        let otherDay = new Date(currentYear, currentMonth, 0);
                        //alert(currentYear + "," + currentMonth);
                        if (currentMonth == 0) {
                            otherDay = new Date((currentYear - 1), 12, 0);
                            //alert(otherDay.getDay());
                        }
                        //alert(otherDay.getDay());
                        const currentDay = new Date(currentYear, currentMonth + 1, 0);
                        const lastDay = new Date(lastYear, lastMonth + 1, 0);
                        const firstDay = new Date(firstYear, firstMonth + 1, 0);
                        //alert(count);
                        //alert(firstMonth + "," + currentMonth);
                        //alert(firstClickDay + "," + lastClickDay);
                        if (count == 0) {
                            lastClickDay = null;
                        }
                        //alert(flag && start);
                        if (flag && start) {
                            if (count == 1) {
                                //alert(firstDay.getDate() - firstClickDay + lastClickDay);
                                if (firstYear < lastYear) {
                                    if (lastMonth > 0) {
                                        alert("7일까지 예약 가능합니다.");
                                        lastClickDay = null;
                                        lastMonth = null;
                                        count--;
                                        return;
                                    }
                                    if (firstDay.getDate() - firstClickDay + lastClickDay > 6) {
                                        alert("7일까지 예약 가능합니다.");
                                        lastClickDay = null;
                                        lastMonth = null;
                                        count--;
                                        return;
                                    }
                                }
                                if (firstYear > lastYear) {
                                    if (lastMonth < 11) {
                                        alert("7일까지 예약 가능합니다.");
                                        lastClickDay = null;
                                        lastMonth = null;
                                        count--;
                                        return;
                                    }
                                    if (lastDay.getDate() - lastClickDay + firstClickDay > 6) {
                                        alert("7일까지 예약 가능합니다.");
                                        lastClickDay = null;
                                        lastMonth = null;
                                        count--;
                                        return;
                                    }
                                }
                                if (firstYear == lastYear) {
                                    if (firstMonth < lastMonth) {
                                        if (firstMonth + 1 < lastMonth) {
                                            alert("7일까지 예약 가능합니다.");
                                            lastClickDay = null;
                                            lastMonth = null;
                                            count--;
                                            return;
                                        }
                                        if (firstDay.getDate() - firstClickDay + lastClickDay > 6) {
                                            //alert("7일이상");
                                            alert("7일까지 예약 가능합니다");
                                            lastClickDay = null;
                                            lastMonth = null;
                                            count--;
                                            return;
                                        }
                                    }
                                    if (firstMonth > lastMonth) {
                                        if (firstMonth > lastMonth + 1) {
                                            alert("7일까지 예약 가능합니다.");
                                            lastClickDay = null;
                                            lastMonth = null;
                                            count--;
                                            return;
                                        }
                                    }
                                    //alert(lastClickDay + "," + firstClickDay);
                                    if (firstMonth == lastMonth) {
                                        if (lastClickDay > firstClickDay) {
                                            if (lastClickDay - firstClickDay > 6) {
                                                alert("7일까지 예약 가능합니다.");
                                                lastClickDay = null;
                                                lastMonth = null;
                                                count--;
                                                return;
                                            }
                                        }
                                        if (lastClickDay < firstClickDay) {
                                            if (firstClickDay - lastClickDay > 6) {
                                                alert("7일까지 예약 가능합니다.");
                                                lastClickDay = null;
                                                lastMonth = null;
                                                count--;
                                                return;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        //alert(currentMonth + "," + today.getMonth());
                        $(".prev").attr('onclick', "prevMonth()").css({
                            "color": "white",
                            "cursor": "pointer"
                        });
                        if (currentMonth == today.getMonth()) {
                            $(".prev").attr("onclick", "").css({
                                "color": "#ccc",
                                "cursor": "none"
                            });
                        }
                        /*const firstDay = new Date(currentYear, currentMonth, 1);
                        const lastDay = new Date(currentYear, currentMonth + 1, 0);*/
                        /*const currentMonthContainer = document.querySelector('.current-month');*/
                        $(".current-month").html(currentYear + "년 " + (currentMonth + 1) + "월");
                        const daysContainer = document.getElementById('calendar-days');
                        daysContainer.innerHTML = '';
                        //alert(currentMonth + "," + firstMonth);
                        //alert(currentMonth);
                        for (let i = 0; i < weekdays.length; i++) {
                            //alert(weekdays[i]);
                            const weekdayLabel = document.createElement('div');
                            weekdayLabel.textContent = weekdays[i];
                            weekdayLabel.classList.add('weekend');
                            daysContainer.appendChild(weekdayLabel);
                        }
                        for (let i = 1; i <= otherDay.getDay() + 1; i++) {
                            const lastdayLabel = document.createElement('div');
                            lastdayLabel.textContent = -((otherDay.getDay() - i) - (otherDay.getDate() - 1));
                            lastdayLabel.classList.add('day', 'disabled');
                            lastdayLabel.style.pointerEvents = 'none'; // Disable click event
                            lastdayLabel.style.opacity = '0.5'; // Apply visual effect for disabled date
                            daysContainer.appendChild(lastdayLabel);

                        }

                        for (let i = 1; i <= currentDay.getDate(); i++) {
                            const dayElement = document.createElement('div');
                            dayElement.textContent = i;
                            dayElement.classList.add('day');

                            if (i < today.getDate() && currentMonth === today.getMonth() && currentYear === today.getFullYear()) {
                                dayElement.classList.add('disabled');
                                dayElement.style.pointerEvents = 'none'; // Disable click event
                                dayElement.style.opacity = '0.5'; // Apply visual effect for disabled date
                            }

                            if (currentMonth == firstMonth) {
                                if (lastClickDay == null) {
                                    if (firstClickDay == i) {
                                        dayElement.classList.add('selected');
                                    }
                                }
                                if (lastClickDay != null) {
                                    //alert(firstYear + "," + lastYear);
                                    if (firstYear == lastYear) {
                                        if (firstMonth == lastMonth) {
                                            if (firstClickDay < lastClickDay) {
                                                asc = true;
                                                if (i >= firstClickDay && i <= lastClickDay) {
                                                    dayElement.classList.add('selected');

                                                }
                                            }
                                            if (firstClickDay > lastClickDay) {

                                                asc = false;
                                                if (i >= lastClickDay && i <= firstClickDay) {
                                                    dayElement.classList.add('selected');
                                                }
                                            }
                                        }
                                        if (firstMonth < lastMonth) {

                                            asc = true;
                                            if (i >= firstClickDay && i <= lastDay.getDate()) {
                                                dayElement.classList.add('selected');
                                            }

                                        }
                                        if (firstMonth > lastMonth) {

                                            asc = false;
                                            if (i <= firstClickDay && i >= 1) {
                                                dayElement.classList.add('selected');
                                            }

                                        }
                                    }
                                    if (firstYear < lastYear) {
                                        if (firstYear == currentYear) {
                                            if (i >= firstClickDay && i <= firstDay.getDate()) {
                                                dayElement.classList.add('selected');
                                            }
                                        }
                                        asc = true;
                                    }
                                    if (firstYear > lastYear) {
                                        //alert("첫번째>나중")
                                        asc = false;
                                        if (firstYear == currentYear) {
                                            if (i <= firstClickDay && i >= 1) {
                                                dayElement.classList.add('selected');
                                            }
                                        }
                                        if (lastYear == currentYear) {
                                            if (i >= lastClickDay && i <= lastDay.getDate()) {
                                                dayElement.classList.add('selected');
                                            }
                                        }
                                    }
                                }
                            }
                            if (currentMonth == lastMonth) {
                                if (lastClickDay != null) {
                                    if (firstYear == lastYear) {
                                        if (firstMonth > lastMonth) {
                                            if (i >= lastClickDay && i <= lastDay.getDate()) {
                                                dayElement.classList.add('selected');
                                            }
                                            asc = false;

                                        }
                                        if (firstMonth < lastMonth) {
                                            if (i <= lastClickDay && i >= 1) {
                                                dayElement.classList.add('selected');
                                            }
                                            asc = true;
                                        }
                                    }
                                    if (firstYear < lastYear) {
                                        if (lastYear == currentYear) {
                                            if (i <= lastClickDay && i >= 1) {
                                                dayElement.classList.add('selected');
                                            }
                                        }
                                        asc = true;
                                    }
                                    if (firstYear > lastYear) {
                                        if (lastYear == currentYear) {
                                            if (i >= lastClickDay && i <= lastDay.getDate()) {
                                                dayElement.classList.add('selected');
                                            }
                                        }
                                        asc = false;
                                    }

                                }
                            }

                            daysContainer.appendChild(dayElement);

                            dayElement.addEventListener('click', () => selectDate(i));
                        }
                    }

                    function prevMonth() {
                        if (currentMonth > 0) {
                            currentMonth--;
                        } else {
                            currentMonth = 11;
                            currentYear--;
                        }
                        updateCalendar();
                    }

                    function nextMonth() {
                        if (currentMonth < 11) {
                            currentMonth++;
                        } else {
                            currentMonth = 0;
                            currentYear++;
                        }
                        updateCalendar();
                    }

                    function selectDate(day) {
                        //alert(day + "," + firstClickDay)
                        if (day == firstClickDay && firstMonth == currentMonth) {
                            return false;
                        }
                        //alert('Selected Date:' + day);
                        count++;
                        if (count == 2) {
                            firstClickDay = day;
                            firstMonth = currentMonth;
                            firstYear = currentYear;
                            flag = false;
                            start = true;

                            count = 0;
                        }
                        if (count == 1) {
                            lastClickDay = day;
                            lastMonth = currentMonth;
                            lastYear = currentYear;
                            flag = true;
                        }
                        //alert(count);
                        //alert(firstClickDay + "," + lastClickDay);
                        updateCalendar();
                    }

                    updateCalendar()

                    $(".calendar-setting").click(function () {
                        let firstDay;
                        let secondDay;
                        if (count == 0) {
                            alert("날짜를 선택해주세요.");
                            return;
                        }
                        //alert(asc);
                        if (asc) {
                            firstDay = firstYear + "-" + (firstMonth + 1) + "-" + firstClickDay;
                            secondDay = lastYear + "-" + (lastMonth + 1) + "-" + lastClickDay;
                        }
                        if (!asc) {
                            firstDay = lastYear + "-" + (lastMonth + 1) + "-" + lastClickDay;
                            secondDay = firstYear + "-" + (firstMonth + 1) + "-" + firstClickDay;
                            //alert(firstDay + "," + secondDay);
                        }
                        <c:if test="${mySurrounding!=null || sortSurrounding!=null}">
                        location.href = "msr?selDate1=" + firstDay + "&selDate2="
                            + secondDay + "&latitude=${latitude}&longitude=${longitude}";
                        </c:if>
                        <c:if test="${mySurrounding==null && sortSurrounding==null}">
                        location.href = "search-main?keyword=${keyword}&selDate1=" + firstDay + "&selDate2=" + secondDay;
                        </c:if>

                    })


                </script>
            </section>
            <br>
            <hr>
            <br>
            <section class="Type-of-accom">
                <h5><b>숙소 유형</b></h5>
                <ul>
                    <li style="line-height: 2" class="d-inline-flex search_list_none">
                        <input type="checkbox" style="margin-right: 10px;"
                               value="모텔" name="category"
                        <c:forEach items="${selCate}" var="cate" varStatus="i">
                        <c:if test="${cate=='모텔'}">
                               checked
                        </c:if>
                        </c:forEach>>
                        <span class="category">모텔</span>
                    </li>
                    <br>
                    <li style="line-height: 2" class="d-inline-flex search_list_none">
                        <input type="checkbox" style="margin-right: 10px;"
                               value="호텔" name="category"
                        <c:forEach items="${selCate}" var="cate" varStatus="i">
                        <c:if test="${cate=='호텔'}">
                               checked
                        </c:if>
                        </c:forEach>>
                        <span class="category">호텔</span>
                    </li>
                    <br>
                    <li style="line-height: 2" class="d-inline-flex search_list_none">
                        <input type="checkbox" style="margin-right: 10px;"
                               value="펜션" name="category"
                        <c:forEach items="${selCate}" var="cate" varStatus="i">
                        <c:if test="${cate=='펜션'}">
                               checked
                        </c:if>
                        </c:forEach>>
                        <span class="category">펜션</span>
                    </li>
                    <br>
                </ul>
            </section>
            <br>
            <section class="amount-bar-wrap">
                <div class="middle" style="margin-bottom: 30px;">
                    가격 : <span class="amount-min"></span><span class="amount-max"></span>
                    <br>
                    <div class="multi-range-slider" style="margin-top: 15px;">
                        <c:if test="${minPrice==null}">
                            <input type="range" id="input-left" min="1" max="30" value="1">
                            <input type="range" id="input-right" min="1" max="30" value="30">
                        </c:if>
                        <c:if test="${minPrice!=null}">
                            <input type="range" id="input-left" min="1" max="30" value="${minPrice/10000}">
                            <input type="range" id="input-right" min="1" max="30" value="${maxPrice/10000}">
                        </c:if>
                        <div class="slider">
                            <div class="track"></div>
                            <div class="range"></div>
                            <div class="thumb left"></div>
                            <div class="thumb right"></div>
                        </div>
                    </div>
                    <div class="amount-text" style="margin-top: 15px">
                        <span class="min-amount" style="float: left">1만원</span>
                        <span class="max-amount" style="float: right">30만원</span>
                    </div>
                </div>
                <script type="text/javascript">
                    var inputLeft = document.getElementById("input-left");
                    var inputRight = document.getElementById("input-right");
                    let minValue;
                    let maxValue;

                    var thumbLeft = document.querySelector(".slider > .thumb.left");
                    var thumbRight = document.querySelector(".slider > .thumb.right");
                    var range = document.querySelector(".slider > .range");

                    function setLeftValue() {

                        var _this = inputLeft,
                            min = parseInt(_this.min),
                            max = parseInt(_this.max);

                        _this.value = Math.min(parseInt(_this.value), parseInt(inputRight.value) - 2);

                        var percent = ((_this.value - min) / (max - min)) * 100;

                        thumbLeft.style.left = percent + "%";
                        range.style.left = percent + "%";
                        var minAmount = $("#input-left").val();
                        //alert(minAmount);
                        $(".amount-min").html(minAmount + " 만원 ");
                    }

                    setLeftValue();

                    function setRightValue() {
                        var _this = inputRight,
                            min = parseInt(_this.min),
                            max = parseInt(_this.max);

                        _this.value = Math.max(parseInt(_this.value), parseInt(inputLeft.value) + 2);

                        var percent = ((_this.value - min) / (max - min)) * 100;

                        thumbRight.style.right = (100 - percent) + "%";
                        range.style.right = (100 - percent) + "%";
                        var maxAmount = $("#input-right").val();
                        //alert(minAmount);
                        if (maxAmount == 30) {
                            $(".amount-max").html(" 이상 ");
                        }
                        if (maxAmount != 30) {
                            $(".amount-max").html("~ " + maxAmount + " 만원 ");
                        }
                    }

                    setRightValue();

                    inputLeft.addEventListener("input", setLeftValue);
                    inputRight.addEventListener("input", setRightValue);

                </script>
            </section>
        </div>
        <br>
        <section class="setting-btn-box">
            <h6><b>상세 조건</b></h6>
            <button type="button" class="btn btn-outline-danger setting-btn" style="width: 100%;">적용</button>
            <script type="text/javascript">
                $(".setting-btn").click(function () {
                    var cateArray = $('input:checkbox[name=category]:checked').map(function () {
                        return this.value;
                    }).get().join(', ');
                    cateArray = cateArray.replace(/[\[\]']/g, '');
                    var keyword = '${keyword}';
                    var selDate1 = '${selDate1}';
                    var selDate2 = '${selDate2}';
                    //alert(selDate1 + "," + selDate2 + "," + cateArray);
                    var minPrice = $("#input-left").val() * 10000;
                    var maxPrice = $("#input-right").val() * 10000;
                    <c:if test="${mySurrounding!=null || sortSurrounding!=null}">
                    location.href = "/product/msr?selCate=" + cateArray + "&selDate1=" +
                        selDate1 + "&selDate2=" + selDate2 + "&minPrice=" + minPrice + "&maxPrice=" + maxPrice +
                        "&latitude=" + ${latitude} +"&longitude=" + ${longitude};
                    </c:if>
                    <c:if test="${mySurrounding==null && sortSurrounding==null}">
                    location.href = "/product/search-main?keyword=" + keyword + "&selCate=" + cateArray + "&selDate1=" +
                        selDate1 + "&selDate2=" + selDate2 + "&minPrice=" + minPrice + "&maxPrice=" + maxPrice;
                    </c:if>
                })
            </script>
        </section>
    </div>

    <div class="search-box" style="width: 65%">
        <div class="sort-box" style="display: flex;" align="center">
            <c:if test="${mySurrounding==null && sortSurrounding==null}">
                <div class="sort-each-box" id="sort-distance">거리순</div>
            </c:if>
            <div class="sort-each-box" id="sort-low-price">낮은가격순</div>
            <div class="sort-each-box" id="sort-score">별점순</div>
        </div>
        <br>
        <c:if test="${productList.size()!=null}">

            <c:forEach items="${productList}" var="list" varStatus="i">
                <div class="accom-list" idx="${list.accom_num}">
                    <div class="accom-image" style="width: 60%;">
                        <img src="../accomsave/${list.accom_photo}">
                    </div>
                    <div class="info-container">
                        <div class="accom-info">

                            <div class="detail_accom_name">${list.accom_name }</div>
                            <div class="detail_accom_category">${list.accom_category}</div>
                            <div class="detail_asr">
                                <div class="detail_accom_score">${list.accom_score }</div>
                                <div class="detail_score_result result${i.count}"></div>

                                <script>
                                    $(document).ready(function () {
                                        //alert(size);
                                        var accomScore =${list.accom_score };

                                        if (accomScore > 9) {
                                            $(".result${i.count}").text("최고예요");
                                        } else if (accomScore >= 8 && accomScore <= 9) {
                                            $(".result${i.count}").text("좋아요");
                                        } else if (accomScore >= 7 && accomScore <= 8) {
                                            $(".result${i.count}").text("괜찮아요");
                                        } else {
                                            $(".result${i.count}").text("아쉬워요");
                                        }
                                    });
                                </script>
                                <div class="detail_review_count">${list.accom_count }개</div>
                            </div>
                            <div class="detail_accom_location" style="font-size: 0.9em;">${list.accom_location }</div>
                            <div class="detail_accom_hashtag" style="font-size:0.9em;">${list.accom_hashtag }</div>
                            <c:if test="${sort=='distance'||mySurrounding!=null}">
                                <c:if test="${list.distance<1000}">
                                    <fmt:formatNumber value="${list.distance}" pattern="###"/>m
                                </c:if>
                                <c:if test="${list.distance>=1000}">
                                    <fmt:formatNumber value="${list.distance/1000}" pattern="###.#"/>km
                                </c:if>
                            </c:if>
                        </div>
                        <div class="room-amount">
                            <b><fmt:formatNumber value="${list.room_price*sleep}" pattern="###,###"/>원</b>
                        </div>
                    </div>
                </div>
                <hr class="div-hr">
            </c:forEach>
            <script type="text/javascript">
                $(".accom-list").click(function () {
                    var selDate1 = '${selDate1}';
                    var selDate2 = '${selDate2}';
                    //alert(selDate2);
                    var sleep = '${sleep}';
                    var accom_num = $(this).attr("idx");
                    location.href = "/room/room-detail?accom_num=" + accom_num + "&checkin=" + selDate1 +
                        "&checkout=" + selDate2 + "&sleep=" + sleep;
                })
            </script>
        </c:if>
        <script type="text/javascript">
            var cateArray = $('input:checkbox[name=category]:checked').map(function () {
                return this.value;
            }).get().join(', ');
            var keyword = '${keyword}';
            var selDate1 = '${selDate1}';
            var selDate2 = '${selDate2}';
            //alert(selDate1 + "," + selDate2);
            var minPrice = $("#input-left").val() * 10000;
            var maxPrice = $("#input-right").val() * 10000;
            $("#sort-distance").click(function () {
                if (${productList.size() == 0}) {
                    alert("정렬할 데이터가 없습니다.");
                    return;
                }
                alert("거리순으로 나열하고 싶은 위치를 입력하세요.");
                sample4_execDaumPostcode();
            })
            $("#sort-low-price").click(function () {
                if (${productList.size() == 0}) {
                    alert("정렬할 데이터가 없습니다.");
                    return;
                }
                <c:if test="${mySurrounding!=null || sortSurrounding!=null}">
                location.href = "/product/msr?sort=lowprice&selCate=" + cateArray + "&selDate1=" +
                    selDate1 + "&selDate2=" + selDate2 + "&minPrice=" + minPrice + "&maxPrice=" + maxPrice +
                    "&latitude=" + ${latitude} +"&longitude=" + ${longitude};
                </c:if>
                <c:if test="${mySurrounding==null && sortSurrounding==null}">
                location.href = "/product/search-main?sort=lowprice&keyword=" + keyword + "&selCate=" + cateArray + "&selDate1=" + selDate1 +
                    "&selDate2=" + selDate2 + "&minPrice=" + minPrice + "&maxPrice=" + maxPrice;
                </c:if>

            })
            $("#sort-score").click(function () {
                if (${productList.size() == 0}) {
                    alert("정렬할 데이터가 없습니다.");
                    return;
                }
                <c:if test="${mySurrounding!=null || sortSurrounding!=null}">
                location.href = "/product/msr?sort=score&selCate=" + cateArray + "&selDate1=" +
                    selDate1 + "&selDate2=" + selDate2 + "&minPrice=" + minPrice + "&maxPrice=" + maxPrice +
                    "&latitude=" + ${latitude} +"&longitude=" + ${longitude};
                </c:if>
                <c:if test="${mySurrounding==null && sortSurrounding==null}">
                location.href = "/product/search-main?sort=score&keyword=" + keyword + "&selCate=" + cateArray + "&selDate1=" + selDate1 +
                    "&selDate2=" + selDate2 + "&minPrice=" + minPrice + "&maxPrice=" + maxPrice;
                </c:if>
            })

            function settingSortDistance() {
                var lat = $("#accom_latitude").val();
                var long = $("#accom_longitude").val();
                location.href = "/product/search-main?sort=distance&keyword=" + keyword + "&selCate=" + cateArray + "&selDate1=" + selDate1 +
                    "&selDate2=" + selDate2 + "&minPrice=" + minPrice + "&maxPrice=" + maxPrice + "&latitude="
                    + lat + " &longitude=" + long;
            }
        </script>
    </div>

    <input type="hidden" data-bs-toggle="modal" data-bs-target="#myModal" id="modal-btn">
    <!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">현재 위치 등록하기</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <div id="map" style="width: 100%; height: 400px;"></div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal"
                            onclick="settingSortDistance()">위치 선택
                    </button>
                    <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal"
                            onclick="sample4_execDaumPostcode()">위치 다시 찾기
                    </button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        let modalFlag = false;

        function sample4_execDaumPostcode() {
            modalFlag = false;
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var geocoder = new kakao.maps.services.Geocoder();
                    geocoder.addressSearch(data.address, function (result, status) {
                        //alert("등록");
                        // 정상적으로 검색이 완료됐으면
                        if (status === kakao.maps.services.Status.OK) {
                            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                            var message = 'latlng: new kakao.maps.LatLng(' + result[0].y + ', ';
                            message += result[0].x + ')';
                            //alert(result[0].y + "," + result[0].x);
                            $("#accom_latitude").val(result[0].y);
                            $("#accom_longitude").val(result[0].x);
                            modalFlag = true;
                            $("#modal-btn").click();
                        }
                    });
                }
            }).open();
        }

        $("#modal-btn").click(function () {
            if (modalFlag == true) {
                var lat = $("#accom_latitude").val();
                var long = $("#accom_longitude").val();
                //alert(lat + "," + long);
                $("#map").empty();

                var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                    mapOption = {

                        center: new kakao.maps.LatLng(lat, long), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    };
                var map = new kakao.maps.Map(mapContainer, mapOption);

                var markerPosition = new kakao.maps.LatLng(lat, long);

                var marker = new kakao.maps.Marker({
                    position: markerPosition
                });
                marker.setMap(map);
                loadKakaoMap();
            }

        })
    </script>
    <input type="hidden" id="accom_latitude">
    <input type="hidden" id="accom_longitude">
</div>

</body>
</html>