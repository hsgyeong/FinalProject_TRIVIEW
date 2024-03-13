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
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
        top: 30%; /* 추가된 부분: 상위 요소의 하단을 기준으로 위치 조정 */
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
        width: 33%;
        text-align: center;
        vertical-align: middle;
        padding-top: 1vh;
        height: 5vh;
        cursor: pointer;
        border-radius: 5px;
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
<caption><b style="font-size: 40px; font-family: 'NanumSquare', serif;">검색 : '${keyword}'</b></caption>
<br><br>
<div style="width: 100%; border: 2px solid gray;" class="d-inline-flex">
    <div class="filter-border-box" style="width: 33%">
        <div class="filter-box">
            <section class="date-wrap">
                <h4><b>날짜</b></h4>
                <div class="btn-date d-inline-flex">
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
                        </span>
                </div>
                <div class="calendar">
                    <div class="header">
                        <div class="prev" onclick="prevMonth()">&#9665;</div>
                        <div class="current-month"></div>
                        <div class="next" onclick="nextMonth()">&#9655;</div>
                    </div>
                    <div class="days" id="calendar-days"></div>
                    <button class="calendar-setting btn btn-outline-danger">선택 완료</button>
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
                        location.href = "search-main?keyword=${keyword}&selDate1=" + firstDay + "&selDate2=" + secondDay;
                    })


                </script>
            </section>
            <br>
            <hr>
            <br>
            <section class="Type-of-accom">
                <h5><b>숙소 유형</b></h5>
                <ul>
                    <c:forEach items="${category}" var="list" varStatus="i">
                        <li style="line-height: 2" class="d-inline-flex">
                            <input type="checkbox" id="category${i.count}" style="margin-right: 10px;">
                            <span class="category${i.count}">${list}</span>
                        </li>
                        <br>
                    </c:forEach>
                </ul>
            </section>
            <br>
            <section class="amount-bar-wrap">
                <div class="middle" style="margin-bottom: 30px;">
                    가격 : <span class="amount-min"></span><span class="amount-max"></span>
                    <br>
                    <div class="multi-range-slider" style="margin-top: 15px;">
                        <input type="range" id="input-left" min="1" max="30" value="0">
                        <input type="range" id="input-right" min="1" max="30" value="30">

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
            <button type="button" class="btn btn-outline-danger setting-btn" style="width: 200px;">적용</button>
            <script type="text/javascript">
                $(".setting-btn").click(function () {
                    location.href = "/product/search-main?"
                })
            </script>
        </section>
    </div>

    <div class="search-box" style="width: 65%">
        <div class="sort-box" style="display: flex;">
            <div class="sort-each-box">거리순</div>
            <div class="sort-each-box">낮은가격순</div>
            <div class="sort-each-box">높은가격순</div>
        </div>

        <c:if test="${listCategory.size()!=null}">

            <c:forEach items="${listCategory}" var="list" varStatus="i">
                <table>
                    <tr>
                        <td>
                            <img src="../roomsave/${list.accom_photo}">
                        </td>
                    </tr>
                </table>
            </c:forEach>

        </c:if>
    </div>
</div>
</body>
</html>