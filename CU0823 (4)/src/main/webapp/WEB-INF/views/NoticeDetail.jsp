<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" href="resources/bootstrap/images/favicon.ico" type="image/x-icon" />
<link href="resources\bootstrap\layout\styles\layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<style>
table{
   width: 500px;
   height: 320px;
   margin-left: 30%;
   text-align: center;
   margin-top: 5%;
}
.title{
   height: 10%;
}
.content{
   height: 5%;
}
.sub{
    border-radius:2px; padding:8px; 
 font-size:14px;font-weight:700;color:#fff;text-align:center;background:#a4a4a4
 }
</style>
<body>
<div class="wrapper row1">
  <header id="header" class="clear" style="width:92%;"> 
  <a href="./JoinMemberMV" style="float:right;">Join</a><a  href="./LoginMV"style="float:right;">Login　|　</a>
    <div id="logo">
     <a href="./"><img src="resources\bootstrap\images\img_t21_006.jpg" style="margin-left:11%; margin-top:2%; margin-bottom:2%;"/></a>
    </div>
    <nav id="mainav">
      <ul class="clear">
            <li><a href="./HomeInfoMV">홈페이지소개</a></li>
        <li><a href="./LaundryMethodMv">세탁방법안내</a></li>
        <li><a href="./shopListSelect">매장찾기</a>
          <!-- <ul>
            <li><a href="#">일반세탁소</a></li>
            <li><a class="drop" href="#">Level 2 + Drop</a>
              <ul>
                <li><a href="#">Level 3</a></li>
                <li><a href="#">Level 3</a></li>
              </ul>
            </li>
          </ul> -->
        </li>
       <li class="active"><a href="./NoticeManage">공지사항</a>
      <!--   <li><a href="#">Link Text</a></li>
        <li><a href="#">Link Text</a></li>
        <li><a href="#">Link Text</a></li>
        <li><a href="#">A Very Long Link Text</a></li> -->
      </ul>
    </nav>
  </header>
</div>
<form name="aa" action="noticeUpdateMv">
   <input type="hidden" name="nt_code" value="${nt.nt_code }"/>
   <input type="hidden" name="nt_title" value="${nt.nt_title }"/>
   <input type="hidden" name="nt_content" value="${nt.nt_content }"/>
<table>
      <tr>
         <td class="title">제목　 <input type="text" name="nt_title" value="${nt.nt_title}" disabled /></td>
         <td>날짜　 ${today}<br></td>
      </tr>
   <tr>
      <td colspan="2" class="content">내용<br></td>
   </tr>　　　　　
   <tr>
      <td colspan="2"><textarea name="nt_content" disabled style="width: 500px; height: 200px;">${nt.nt_content }</textarea></td>
   </tr>
   <tr>
      <td colspan="2"><a href="#" class="sub">수정</a>　　<a href="#" onclick="noticedelete()" class="sub">삭제</a></td>
   </tr>
</table>
</form>
</body>


<script>
function noticedelete(){
   document.aa.action="./noticeDelete";
   document.aa.submit();
}
</script>
</html>