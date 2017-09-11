<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script>
function idSelect(){
   document.nameForm.action = './idSelect';
   document.nameForm.submit();
}
</script>
</head>
<body>

         <form class="form-horizontal" name="nameForm" action="realmessageSend" method="get">
         <select name="choice" id="choice" >
         <option value="all">-선택하세요-
         <option value="laundry">일반세탁소</option>
         <option value="coin">코인세탁소</option>
         <option value="admin">관리자</option>
         </select>
                  받을사람<input type="text" class="form-control" name="n_takeid" id="n_takeid"  value="${n_takeid}">
                        <input type="button" id="select" value="검색" class='btn btn-primary'onClick="idSelect()">
                  <br/>제목
                     <input type="text" class="form-control" name="n_title" >
                  쪽지내용
                     <textarea class="form-control" rows="5" name="n_content"></textarea>
                     <br/>
                     <input type="submit" class='btn btn-primary'value="쪽지보내기">
      </form>
</body>

</html>