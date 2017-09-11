<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<form name="aa" action="noticeUpdate">
분류 <select name="nt_categori" id="shopchoice" onChange="selectChange()" >
         <option value="0">공용</option>
         <option value="1">고객</option>
         <option value="2">사업자</option>
         </select><br/>
제목 <input type="text" name="nt_title" value="${nt.nt_title}"  />
내용<br/>
<input type="hidden" name="nt_code" value="${nt.nt_code }"/>
<textarea name="nt_content" >${nt.nt_content }</textarea><br/>
<input type="submit" value="공지사항 수정"/>
<input type="button" onclick="cancel()" value="취소"/>
</form>

</body>
<script>
function cancel(){
   document.aa.action="./NoticeManage";
   document.aa.submit();
}
</script>
</html>