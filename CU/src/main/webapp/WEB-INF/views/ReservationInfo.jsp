<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<style>
#top {
	width: 500px;
	height: 80px;
}
</style>
</head>
<script>
	$(document).ready(function() {
		//최상단 체크박스 클릭
		$("#0").click(function() {
			//클릭되었으면
			if ($("#0").prop("checked")) {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
				$("input[name=check]").prop("checked", true);
				//클릭이 안되있으면
			} else {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
				$("input[name=check]").prop("checked", false);
			}
		})
	})
</script>
<body>
	예약현황
	<form name="logFrm" method="get">
		<select id=state>
			<option value=6>전체</option>
			<option value=1>수거전</option>
			<option value=5>취소중</option>
			<option value=2>세탁중</option>
			<option value=3>배달중</option>
			<option value=4>완료</option>
		</select> <input type="hidden" name="text" id="text" /> 
		<input type="button" value="검색" onclick="changeshow()"> <br>
		<br>
		<table border="1" id="top">
			<tr>
				<td><input type="checkbox" name="check" id="0"></td>
				<td>이름</td>
				<td>번호</td>
				<td>세탁물 종류</td>
				<td>주소</td>
				<td>진행현황</td>
			</tr>
			${BRLIST} ${RLIST}
		</table>
		<input type="button" value="수거중" id="one" class="1"> 
		<input type="button" value="세탁중" id="two" class="2">
		<input type="button" value="배달중" id="three" class="3"> 
		<input type="button" value="완료" id="four" class="4">
		<input type="hidden" name="statebtn" id="statebtn" /> 
	</form>
</body>
<script>
	function changeshow() {
		var text = $("#state option:selected").val();
		if (text == 6) {
			document.logFrm.action = "./reservationList";
			document.logFrm.submit();
		} else {
			document.logFrm.action = "./selectState";
			document.logFrm.submit();
		}
	}

	$(function() {
		$('#one').click(function() {
			alert("첫번째 클릭");
			$('#statebtn').val($("#one").attr('class'));
			document.logFrm.action = "./laundryProcessing";
			document.logFrm.submit();
		})
		$('#two').click(function() {
			alert("두번째 클릭");
			$('#statebtn').val($("#two").attr('class'));
			document.logFrm.action = "./laundryProcessing";
			document.logFrm.submit();
		})
		$('#three').click(function() {
			alert("세번째 클릭");
			$('#statebtn').val($("#three").attr('class'));
			document.logFrm.action = "./laundryProcessing";
			document.logFrm.submit();
		})
		$('#four').click(function() {
			alert("네번째 클릭");
			$('#statebtn').val($("#four").attr('class'));
			document.logFrm.action = "./laundryProcessing";
			document.logFrm.submit();
		})
	});
</script>
</html>