<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://webfontworld.github.io/goodchoice/Jalnan.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <title>Insert title here</title>
    <style type="text/css">
        .mainbox{
            width: 100%;
            /*height: 300vh;*/
            /*border: 3px solid red;*/
            /*margin: 6vh 17.5%;*/
        }

        .mainad{
            width: 100%;
            /*height: 65vh;*/
            /*border: 3px solid orange;*/
            margin-bottom: 50px;
        }

        .maincategory{
            width: 100%;
            /*height: 20vh;*/
            /*border: 3px solid blue;*/
            padding: 10px 15% 10px 15%;
            font-family: 'Jalnan';
            display: flex;
            justify-content: space-between;
            margin-bottom: 50px;
        }
        div.maincategory img{
            width: 100px;
            /*margin: 0 20% 0 20%;*/
            /*margin-right: 20%;*/
            /*margin-left: 20%;*/
        }
        div.maincategory a{
            text-decoration: none;
            color: black;
            display: flex;
            justify-content: space-between;
        }

        div.newsmain{
            font-family: Jalnan;
            width: 100%;
        }
        .newsmaintitle{
            display: flex;
            width: 100%;
            float: left;
            margin-bottom: 20px;
        }
        div.newssub{
            width: 100%;

        }
        ul.newssubul{
            width: 100%;
            height: 152px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            /*margin-right: auto;*/
            /*margin-left: auto;*/
        }

        li.newsbox{
            /*border: 1px solid rgba(0,0,0,0.1);*/
            border: 1px solid rgba(0,0,0,0.08);
            /*margin: 30px 10px 0px 10px;*/
            width: 100%;
            height: 150px;
            display: flex;
            align-items: center;
            overflow: hidden; /* 해당 범위 넘어가는 이미지 등의 내용은 숨기기 */
        }
        a>p{
            color: black;
            font-family: 'arial';
            display: flex;
            align-items: center;
            flex-grow: 1; /* 텍스트가 남은 공간을 차지하도록 허용 */
        }
        .newsbox a{
            font-family: Arial;
            color: black;
            display: flex;
            align-items: center;
            text-decoration: none;
        }
        .newsbox img{
            height: 150px;
            object-fit: cover; /* 필요에 따라 여백 조정 */
            margin-right: 15px; /* 필요에 따라 여백 조정 */
        }
        .newsbox p{
            width: 100%;
            text-align: center;
        }
        p.newstext1{
            color: #f7323f;
            font-weight: bold;
            font-size: 20px;
            margin-bottom: 5px;
        }
        div.textbox{
            width: 100%;
            height: 100%;
        }

    </style>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
<div class="mainbox" align="center">

    <div class="mainad">
        <img src="${root}/seoul.png" style="width: 100%;">
    </div>
    
${sessionScope.nickname}<br>
    <div class="maincategory d-inline-flex">
        <a href="#"><figure><img src="${root}/hotel.png"><figcaption>호텔</figcaption></figure></a>
        <a href="#"><figure><img src="${root}/bed.png"><figcaption>모텔</figcaption></figure></a>
        <a href="#"><figure><img src="${root}/pension.png"><figcaption>펜션</figcaption></figure></a>
    </div>

    <div class="newsmain">
        <h3 class="newsmaintitle">TREVIEW 소식</h3>
        <div class="newssub">
            <ul class="d-inline-flex newssubul">
                <li class="newsbox">
                    <a href="#">
                        <img src="${root}/ad.png">&nbsp;&nbsp;&nbsp;
                        <div class="textbox">
                            <p class="newstext1">TREVIEW 광고신청하기</p>
                            <p class="newstext2">고정고객 확보,신규회원 유치 가능합니다.</p>
                        </div>

                    </a>
                </li>
                &nbsp;&nbsp;&nbsp;
                <li class="newsbox" style="margin-right: 3%;">
                    <a href="/accom/accom-insert">
                        <img src="${root}/registration.png">&nbsp;&nbsp;&nbsp;
                        <div class="textbox">
                            <p class="newstext1">TREVIEW 숙소등록하기</p>
                            <p class="newstext2">숙소 등록하고 더 많은 고객 확보하세요!</p>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div></div>
</div>
</body>
</html>