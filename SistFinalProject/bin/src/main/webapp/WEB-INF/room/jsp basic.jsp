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
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <title>Insert title here</title>
</head>
<body>
<table>
    <tr>
        <td align="center" valign="middle"><b>예약 불가능&nbsp; 날짜 선택</b>
            <br><br>
            <button type="button" class="btn btn-outline-danger addDate">날짜 추가</button>
        </td>
        <td>
            <h4><b>불가능 날짜</b></h4>
            <div id="div-nonDate" style="width: 400px;">
                    <span class="d-inline-flex nonDate" id="nonDate1">
                    <input type="date" id="non_checkin1" name="checkin[]" min=""
                           class="form-control" style="width: 150px; margin-right: 20px;"> ~
                    <input type="date" id="non_checkout1" name="checkout[]" min=""
                           class="form-control" style="width: 150px; margin-left: 20px;">
					</span><br><br>
            </div>
            <div style="margin-left: 15%">
                <button type="button" class="btn btn-outline-danger"
                        onclick="checkDate()">중복 체크
                </button>
                <button type="button" class="btn btn-danger"
                        onclick="resetDate()">다시 설정
                </button>
            </div>
            <input type="hidden" id="checkDuplicate" value="0">
        </td>
    </tr>
</table>

<script type="text/javascript">
    /*성신 추가 기능*/

    let today = new Date();
    let getYear = today.getFullYear();
    let getMonth = today.getMonth() + 1;
    let getDay = today.getDate();
    let date = getYear + "-" + getMonth + "-" + getDay;
    let totCount = 1;
    let count = 1;
    $("#non_checkin1").attr("min", date);
    $("#non_checkout1").attr("min", date);

    $(".addDate").click(function () {
        if (totCount > 4) {
            alert("5개 이상 등록할 수 없습니다.");
            return;
        }
        totCount++;
        count++;
        var s = "";
        s += "<span class='d-inline-flex nonDate newNonDate' id='nonDate" + count + "'>";
        s += "<input type='date' id='non_checkin" + count + "' name='checkin[]' min='" + date + "'";
        s += "class='form-control' style='width: 150px; margin-right: 20px;'> ~"
        s += "<input type='date' id='non_checkout" + count + "' name='checkout[]' min='" + date + "'";
        s += "class='form-control' style='width: 150px; margin-left: 20px;'>";
        s += "<button type='button' class='delDate btn btn-danger sm' style='margin-left: 10px;' "
        s += "idx='" + count + "'>x</button>"
        s += "</span><span class='br br" + count + "'><br><br>";
        $("#div-nonDate").append(s);
    })

    $(document).on("click", ".delDate", function () {
        var idx = $(this).attr("idx");
        $("#nonDate" + idx).remove();
        $(".br" + idx).remove();
        totCount--;
    })

    function checkDate() {
        var cnt = count;
        var checkin = [];
        var checkout = [];
        var idx = [];
        for (var index = 0; index <= cnt; index++) {
            var checkinValue = $("#non_checkin" + index).val();
            var checkoutValue = $("#non_checkout" + index).val();

            if (checkinValue != null && checkoutValue != null) {
                checkin.push(checkinValue);
                checkout.push(checkoutValue);
                idx.push(index);
            }
        }

        $.ajax({
            type: "get",  // 메소드를 명시적으로 지정합니다
            url: "duplicate-date",
            traditional: true,
            dataType: "json",
            data: {"checkin": checkin, "checkout": checkout, "idx": idx},
            success: function (data) {
                if (data.flag == 1) {
                    alert(data.index);
                }
                if (data.flag == 0) {
                    alert("중복된 날짜가 없습니다.");
                    $("span.nonDate").children().prop('disabled', true);
                    $("#checkDuplicate").val(1);
                }
            }
        });
    }

    function resetDate() {
        var flag = $("#checkDuplicate").val();
        if (flag == 0) {
            alert("날짜를 입력하지 않았습니다.");
        }
        if (flag == 1) {
            $("#checkDuplicate").val(0);
            $("span.nonDate").children().prop('disabled', false);
            $("span.newNonDate").remove();
            $("span.br").remove();
            $("#non_checkin1").val("");
            $("#non_checkout1").val("");

        }
    }

    function checkDuplicateDate() {
        var flag = $("#checkDuplicate").val();
        if (flag == 0) {
            alert("중복 날짜를 체크해주세요.");
            return false;
        }
        return true;
    }
</script>

</body>
</html>