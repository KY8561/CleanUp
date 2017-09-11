<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<body>
<form name="aa" action="noticeUpdateMv">
제목 <input type="text" name="nt_title" value="${nt.nt_title}" disabled />
<input type="hidden" name="nt_title" value="${nt.nt_title }"/>
날짜 ${nt.nt_date}
내용<br/>
<input type="hidden" name="nt_code" value="${nt.nt_code }"/>
<textarea name="nt_content" disabled>${nt.nt_content }</textarea><br/>
<input type="hidden" name="nt_content" value="${nt.nt_content }"/>
<input type="submit" value="공지사항 수정"/>
<input type="button" onclick="noticedelete()" value="삭제"/>
</form>




</body>


<script>
function noticedelete(){
   document.aa.action="./noticeDelete";
   document.aa.submit();
}
</script>
</html>