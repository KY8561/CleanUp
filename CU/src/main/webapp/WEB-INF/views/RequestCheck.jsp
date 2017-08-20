<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>	
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <style></style>
  </head>
<body>
<form name="requestfrm" method="get">
<select id="state">
	<option value="1">전체목록</option>
	<option value="2">답변대기</option>
	<option value="3">답변완료</option>
</select><input type="hidden" name=sele id=sele>
<input type="button" value="찾기" onclick="changeshow()">
<br><br>
<table border="1">
	<tr>
	<td>선택</td>
	<td>아이디</td>
	<td>이름</td>
	<td>연락처</td>
	<td>상태</td>
	<td>작성일</td>
	<td>답변</td>
	</tr>
	${test}
</table>
</form>
</body>
<script>
	function changeshow() {
		var text = $("#state option:selected").val();
		console.log(text);
		if (text == 3) {
			document.requestfrm.action = "./requestCheck";
			document.requestfrm.submit();
		} else {
			document.requestfrm.action = "./requestSelect";		
			document.requestfrm.submit();
		}
	}
</script>
</html>