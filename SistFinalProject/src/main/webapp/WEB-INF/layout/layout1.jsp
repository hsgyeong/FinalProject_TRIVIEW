<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <title>Insert title here</title>
</head>
<style>
    div.layout {
        position: relative;
        display: flex;
        align-items: center;
        justify-content: center;
        width: 100%;

    }

    div.title {
        top: 0;
        position: fixed;
        width: 100%;
        height: 72px;
        background-color: #f7323f;
        /*border-bottom: 1px solid #777879;*/
        box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.1);
        z-index: 5;
    }

    div.main {

        margin-top: 120px;
        margin-bottom: 400px;
        /*align-items: center;*/
        width: 65%;


        /* margin-top: -2.3vh; */
    }

    div.footer {
        position: absolute;
        bottom: 0;
        width: 100%;
        /*height: 300px;*/
        border-top: 1px solid rgba(0, 0, 0, 0.08);
        background: #F5F5F5;
    }


</style>
<body>
<div class="layout">
    <div class="title">
        <tiles:insertAttribute name="title"/>
    </div>
    <br>
    <div class="main">
        <tiles:insertAttribute name="main"/>
    </div>
    <br>
    <div class="footer">
        <tiles:insertAttribute name="footer"/>
    </div>

</div>
</body>
</html>