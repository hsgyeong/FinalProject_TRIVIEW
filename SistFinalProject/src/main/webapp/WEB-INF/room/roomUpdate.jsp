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
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <style type="text/css">
        .room_insert_box {
            width: 100%;
            margin-top: 3.5vh;
        }

        .room_insert_box table {
            width: 80vh;
        }

        .room_insert_box table tr td {
            padding: 2.5vh 2.5vh;
        }

        .room_insert_box textarea {
            width: 55vh;
            height: 25vh;
        }

        .room_insert_btn1 {
            width: 11vh;
            height: 6vh;
            border: none;
            color: white;
            font-weight: bold;
            background-color: rgb(23, 93, 238);
            border-radius: 1vh;
        }

        .room_insert_btn2 {
            width: 11vh;
            height: 6vh;
            border: 1px solid silver;
            color: black;
            font-weight: bold;
            background-color: white;
            border-radius: 1vh;
            margin-left: 1vh;
        }
    </style>
    <script>
        //이벤트 핸들러
        $(document).ready(function () {

            $("select[name='room_minpeople']").change(function () {
                var minPeople = parseInt($(this).val());
                var maxPeople = parseInt($("select[name='room_maxpeople']").val());

                if (minPeople > maxPeople) {
                    $("select[name='room_maxpeople']").val(minPeople);
                }
            });

            $("select[name='room_maxpeople']").change(function () {
                var maxPeople = parseInt($(this).val());
                var minPeople = parseInt($("select[name='room_minpeople']").val());

                if (maxPeople < minPeople) {
                    $("select[name='room_minpeople']").val(maxPeople);
                }
            });
        });
    </script>
    <title>Insert title here</title>
</head>
<body>
<form action="update" method="post" enctype="multipart/form-data">
<input type="hidden" name="room_num" value="${dto.room_num }">
<!-- redirect -->
<input type="hidden" name="accom_num" value="${dto.accom_num }">
<div class="room_insert_box" align="center">
<table class="table table-bordered">
	<tr>
		<td align="center" valign="middle" colspan="2" style="font-size: 1.5em;"><b>방정보수정</b></td>
	</tr>
	<tr>
		<td align="center" valign="middle"><b>방이름</b></td>
		<td valign="middle">
			<input type="text" class="form-control" name="room_name" required="required"
			placeholder="ex)디럭스, 스탠다드" style="width: 30vh; height: 5vh;" value="${dto.room_name }">
		</td>
	</tr>
	
	<tr>
		<td align="center" valign="middle"><b>방가격</b></td>
		<td valign="middle">
			<input type="text" class="form-control" name="room_price" required="required"
			style="width: 25vh; height: 5vh;" value="${dto.room_price }">
		</td>
	</tr>
   	
	<tr>
		<td align="center" valign="middle"><b>인원</b></td>
		<td valign="middle" style="display: flex; border-left: none;">
			<select class="form-control" name="room_minpeople" required="required"
			style="width: 5vh; height: 5vh;">
				<option value="1" ${dto.room_minpeople eq '1' ? 'selected' : ''}>1</option>
				<option value="2" ${dto.room_minpeople eq '2' ? 'selected' : ''}>2</option>
				<option value="3" ${dto.room_minpeople eq '3' ? 'selected' : ''}>3</option>
				<option value="4" ${dto.room_minpeople eq '4' ? 'selected' : ''}>4</option>
				<option value="5" ${dto.room_minpeople eq '5' ? 'selected' : ''}>5</option>
				<option value="6" ${dto.room_minpeople eq '6' ? 'selected' : ''}>6</option>
				<option value="7" ${dto.room_minpeople eq '7' ? 'selected' : ''}>7</option>
				<option value="8" ${dto.room_minpeople eq '8' ? 'selected' : ''}>8</option>
			</select>
			
			<b style="padding-top: 0.7vh;">&nbsp;~&nbsp;</b>
			
			<select class="form-control" name="room_maxpeople" required="required"
			style="width: 5vh; height: 5vh;">
				<option value="1" ${dto.room_maxpeople eq '1' ? 'selected' : ''}>1</option>
				<option value="2" ${dto.room_maxpeople eq '2' ? 'selected' : ''}>2</option>
				<option value="3" ${dto.room_maxpeople eq '3' ? 'selected' : ''}>3</option>
				<option value="4" ${dto.room_maxpeople eq '4' ? 'selected' : ''}>4</option>
				<option value="5" ${dto.room_maxpeople eq '5' ? 'selected' : ''}>5</option>
				<option value="6" ${dto.room_maxpeople eq '6' ? 'selected' : ''}>6</option>
				<option value="7" ${dto.room_maxpeople eq '7' ? 'selected' : ''}>7</option>
				<option value="8" ${dto.room_maxpeople eq '8' ? 'selected' : ''}>8</option>
			</select>
		</td>
	</tr>
            
	<tr>
		<td align="center" valign="middle"><b>방갯수</b></td>
		<td valign="middle">
			<select class="form-control" name="room_count" required="required"
			style="width: 5vh; height: 5vh;">
				<option value="1" ${dto.room_count eq '1' ? 'selected' : ''}>1</option>
				<option value="2" ${dto.room_count eq '2' ? 'selected' : ''}>2</option>
				<option value="3" ${dto.room_count eq '3' ? 'selected' : ''}>3</option>
				<option value="4" ${dto.room_count eq '4' ? 'selected' : ''}>4</option>
				<option value="5" ${dto.room_count eq '5' ? 'selected' : ''}>5</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<td align="center" valign="middle"><b>방사진</b></td>
		<td valign="middle">
			<input type="file" class="form-control" name="photos" required="required" multiple="multiple"
			style="width: 40vh; height: 5vh;">
		</td>
	</tr>

    <tr>
                <td align="center" valign="middle"><b>방위치</b></td>
                <td valign="middle">
                    <input type="text" class="form-control" name="room_location" required="required" value=${dto.room_location }
                           placeholder="ex)202호, 304호" style="width: 50vh; height: 5vh;">
                </td>
   	</tr>      
	
	<tr>
                <td align="center" valign="middle"><b>체크인</b></td>
                <td valign="middle" style="display: flex; border-left: none;">
                    <select class="form-control" name="room_checkin" required="required"
                            style="width: 10vh; height: 5vh;">
                        <option value="00:00" ${dto.room_checkin eq '00:00' ? 'selected' : ''}>00:00</option>
                        <option value="1:00" ${dto.room_checkin eq '1:00' ? 'selected' : ''}>1:00</option>
                        <option value="2:00" ${dto.room_checkin eq '2:00' ? 'selected' : ''}>2:00</option>
                        <option value="3:00" ${dto.room_checkin eq '3:00' ? 'selected' : ''}>3:00</option>
                        <option value="4:00" ${dto.room_checkin eq '4:00' ? 'selected' : ''}>4:00</option>
                        <option value="5:00" ${dto.room_checkin eq '5:00' ? 'selected' : ''}>5:00</option>
                        <option value="6:00" ${dto.room_checkin eq '6:00' ? 'selected' : ''}>6:00</option>
                        <option value="7:00" ${dto.room_checkin eq '7:00' ? 'selected' : ''}>7:00</option>
                        <option value="8:00" ${dto.room_checkin eq '8:00' ? 'selected' : ''}>8:00</option>
                        <option value="9:00" ${dto.room_checkin eq '9:00' ? 'selected' : ''}>9:00</option>
                        <option value="10:00" ${dto.room_checkin eq '10:00' ? 'selected' : ''}>10:00</option>
                        <option value="11:00" ${dto.room_checkin eq '11:00' ? 'selected' : ''}>11:00</option>
                        <option value="12:00" ${dto.room_checkin eq '12:00' ? 'selected' : ''}>12:00</option>
                        <option value="13:00" ${dto.room_checkin eq '13:00' ? 'selected' : ''}>13:00</option>
                        <option value="14:00" ${dto.room_checkin eq '14:00' ? 'selected' : ''}>14:00</option>
                        <option value="15:00" ${dto.room_checkin eq '15:00' ? 'selected' : ''}>15:00</option>
                        <option value="16:00" ${dto.room_checkin eq '16:00' ? 'selected' : ''}>16:00</option>
                        <option value="17:00" ${dto.room_checkin eq '17:00' ? 'selected' : ''}>17:00</option>
                        <option value="18:00" ${dto.room_checkin eq '18:00' ? 'selected' : ''}>18:00</option>
                        <option value="19:00" ${dto.room_checkin eq '19:00' ? 'selected' : ''}>19:00</option>
                        <option value="20:00" ${dto.room_checkin eq '20:00' ? 'selected' : ''}>20:00</option>
                        <option value="21:00" ${dto.room_checkin eq '21:00' ? 'selected' : ''}>21:00</option>
                        <option value="22:00" ${dto.room_checkin eq '22:00' ? 'selected' : ''}>22:00</option>
                        <option value="23:00" ${dto.room_checkin eq '23:00' ? 'selected' : ''}>23:00</option>
                        <option value="24:00" ${dto.room_checkin eq '24:00' ? 'selected' : ''}>24:00</option>
                    </select>

                    <b style="padding-top: 0.7vh;">&nbsp;~&nbsp;</b>

                    <select class="form-control" name="room_checkout" required="required"
                            style="width: 10vh; height: 5vh;">
                        <option value="00:00" ${dto.room_checkout eq '00:00' ? 'selected' : ''}>00:00</option>
                        <option value="1:00" ${dto.room_checkout eq '1:00' ? 'selected' : ''}>1:00</option>
                        <option value="2:00" ${dto.room_checkout eq '2:00' ? 'selected' : ''}>2:00</option>
                        <option value="3:00" ${dto.room_checkout eq '3:00' ? 'selected' : ''}>3:00</option>
                        <option value="4:00" ${dto.room_checkout eq '4:00' ? 'selected' : ''}>4:00</option>
                        <option value="5:00" ${dto.room_checkout eq '5:00' ? 'selected' : ''}>5:00</option>
                        <option value="6:00" ${dto.room_checkout eq '6:00' ? 'selected' : ''}>6:00</option>
                        <option value="7:00" ${dto.room_checkout eq '7:00' ? 'selected' : ''}>7:00</option>
                        <option value="8:00" ${dto.room_checkout eq '8:00' ? 'selected' : ''}>8:00</option>
                        <option value="9:00" ${dto.room_checkout eq '9:00' ? 'selected' : ''}>9:00</option>
                        <option value="10:00" ${dto.room_checkout eq '10:00' ? 'selected' : ''}>10:00</option>
                        <option value="11:00" ${dto.room_checkout eq '11:00' ? 'selected' : ''}>11:00</option>
                        <option value="12:00" ${dto.room_checkout eq '12:00' ? 'selected' : ''}>12:00</option>
                        <option value="13:00" ${dto.room_checkout eq '13:00' ? 'selected' : ''}>13:00</option>
                        <option value="14:00" ${dto.room_checkout eq '14:00' ? 'selected' : ''}>14:00</option>
                        <option value="15:00" ${dto.room_checkout eq '15:00' ? 'selected' : ''}>15:00</option>
                        <option value="16:00" ${dto.room_checkout eq '16:00' ? 'selected' : ''}>16:00</option>
                        <option value="17:00" ${dto.room_checkout eq '17:00' ? 'selected' : ''}>17:00</option>
                        <option value="18:00" ${dto.room_checkout eq '18:00' ? 'selected' : ''}>18:00</option>
                        <option value="19:00" ${dto.room_checkout eq '19:00' ? 'selected' : ''}>19:00</option>
                        <option value="20:00" ${dto.room_checkout eq '20:00' ? 'selected' : ''}>20:00</option>
                        <option value="21:00" ${dto.room_checkout eq '21:00' ? 'selected' : ''}>21:00</option>
                        <option value="22:00" ${dto.room_checkout eq '22:00' ? 'selected' : ''}>22:00</option>
                        <option value="23:00" ${dto.room_checkout eq '23:00' ? 'selected' : ''}>23:00</option>
                        <option value="24:00" ${dto.room_checkout eq '24:00' ? 'selected' : ''}>24:00</option>
                    </select>
                </td>
            </tr>
	
	<tr>
		<td align="center" colspan="2">
			<button type="submit" class="room_insert_btn1">수정</button>
			<button type="button" class="room_insert_btn2"onclick="location.href='history.back()'">취소</button>
		</td>
	</tr>
</table>
</div>
</form>
</body>
</html>