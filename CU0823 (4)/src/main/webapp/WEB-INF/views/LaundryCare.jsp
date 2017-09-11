<!--
Template Name: Vendor
Author: <a href="http://www.os-templates.com/">OS Templates</a>
Author URI: http://www.os-templates.com/
Licence: Free to use under our free template licence terms
Licence URI: http://www.os-templates.com/template-terms
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta charset="utf-8">
<link rel="icon" href="resources/bootstrap/images/favicon.ico" type="image/x-icon" />
<link href="resources\bootstrap\layout\styles\layout.css" rel="stylesheet" type="text/css" media="all">
<style>
     @import url(//fonts.googleapis.com/earlyaccess/hanna.css);
        @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body{
background:white;
}
.rounded{
           width:100px;
           height:100px;
        }
   .btn{height:15px;padding:8px; border-radius:2px; 
 font-size:14px;font-weight:700;color:#fff;text-align:center;background:#a4a4a4; float:right;  margin-right:2%; }
.re_star, .re_content, .re_date{
   border:white;
}
</style>
</head>
<!-- JAVASCRIPTS --> 
<script src="resources/bootstrap/layout/scripts/jquery.min.js"></script> 
<script src="resources/bootstrap/layout/scripts/supersized/supersized.min.js"></script> 
<script type="text/javascript">
var arr= [];
var gfv_count = 1;
$(document).ready(function(){
      $("#addFile").on("click", function(e){ //파일 추가 버튼
        e.preventDefault();
        fn_addFile();
    });
     
    $("a[name='delete']").on("click", function(e){ //삭제 버튼
        e.preventDefault();
          console.log($(this).html());
       
        fn_deleteFile($(this));
    });
});
function fn_addFile(){
    var str = "<p><input type='file' name='img_name1"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
    $("#fileDiv1").append(str);
    $("a[name='delete']").on("click", function(e){ //삭제 버튼
        e.preventDefault();
        fn_deleteFile($(this));
    });
}
function fn_deleteFile(obj){
   console.log(obj.parent().html());
   $("#saveDiv").append(obj.parent().html());
     obj.parent().remove();
 }
</script>
<body>
<div class="wrapper row1">
  <header id="header" class="clear" style="width:92%;"> 
   <a href="./logout" style="float:right;">로그아웃</a><a  href="./businessUpdateMV"style="float:right;">개인정보수정　|　</a>
    <div id="logo">
      <a href="./BusinessMainMV"><img src="resources\bootstrap\images\img_t21_006.jpg" style="margin-left:11%; margin-top:2%; margin-bottom:2%;"/></a>
    </div>
    <nav id="mainav">
      <ul class="clear">
        <li><a href="./HomeInfoMV3">홈페이지소개</a></li>
        <li><a href="#" class="drop">매장등록</a>
            <ul>
               <li><a href="./LaundryAddmv">일반세탁소</a></li>
               <li><a href="./CoinShopAddmv">코인세탁소</a></li>
            </ul>
        </li>
        <li><a href="./reservationList">예약현황</a>
        </li>
        <li><a class="drop" href="#">마이페이지</a>
             <ul>
               <li><a href="./businessMyPage">정보</a></li>
               <li><a href="./laundryMm">일반세탁소 관리</a></li>
               <li><a href="./coinShopMm">코인세탁소 관리</a></li>
               <li><a href="./pointMm?type=전체내역">포인트 관리</a></li>
            </ul>
        </li>
        <li><a class="drop" href="#">Q & A</a>
        <ul>
            <li><a href="./NoticeManage3">공지사항</a></li>
            <li><a href="inQuiryList">1:1 문의</a></li>
            <li><a href="Question.jsp">자주하는질문</a></li>
         </ul>
      </ul>
    </nav>
  </header>
</div>
<div class="warpper" style="background:white; height: 60%; width:92%; margin-top:2%; margin-bottom:10%; padding-top: 10px;">
 <div class="laundryDeleteFrm" style="margin-left:14%; margin-top:4%; width:90%; height:600px;"  >
<form action="laundryDelete" style="margin-right:10%;">
<span style="font-size:30px; font-family:'Hanna'; margin-left:40%;">세탁소 관리</span><br/><br/><br/><br/>
 ${llisthtml}
 </form>
   </div>
</div>
   <div class="wrapper row4" style="border-top-width: 0px;">
  <footer id="footer" class="clear" style="margin-left: 0px; margin-right: 0px;">
    <div class="one_third first" style=" width:26%; margin-right:7%; margin-left:6%;">
    <h6 class="title">STAFF</h6>
      <ul class="nospace clear ftgal">
        <li class="one_third first" style="margin-right:6px;"><a href="#"><img class="rounded" src="resources/bootstrap/images/images (1).jpg" alt=""></a></li>
        <li class="one_third" style="margin-right:6px;"><a href="#"><img class="rounded" src="resources/bootstrap/images/yr.jpg" alt=""></a></li>
        <li class="one_third"><a href="#"><img class="rounded" src="resources/bootstrap/images/sy.jpg" alt=""></a></li>
        <li class="one_third first" style="margin-right:6px;"><a href="#"><img class="rounded" src="resources/bootstrap/images/sr.jpg" alt=""></a></li>
        <li class="one_third" style="margin-right:6px;"><a href="#"><img class="rounded" src="resources/bootstrap/images/mk.jpg" alt=""></a></li>
        <li class="one_third"><a href="#"><img class="rounded" src="resources/bootstrap/images/demo/100x100.gif" alt=""></a></li>
      </ul>
    </div>
    <div class="one_third" style="width:25%;margin-right: 3%; margin-left: 1%;">
      <h6 class="title">LAUNDRY METHOD</h6>
      <ul class="nospace clear">
        <li class="clear push30">
          <div class="imgl"><img class="rounded" style="width:140px; height:110px;" src="resources/bootstrap/images/다운로드.jpg" alt=""></div>
          <p class="nospace push15"><b>　　구두,운동화 </b><br/><br/>구두와 같은 가죽신발의 경우에는 물을 절대 사..<p class="nospace" ><a href="#" >Read more &raquo;</a></p></p>
        </li>
        <li class="clear">
          <div class="imgl"><img class="rounded" style="width:140px; height:110px;" src="resources/bootstrap/images/S12040_760.jpg" alt=""></div>
          <p class="nospace push15"><b>　　블라우스,셔츠 </b><br/><br/>드라이크리닝을 하는 것이 좋다. 손 빨래시에..<p class="nospace" ><a href="#" >Read more &raquo;</a></p></p>
        </li>
      </ul>
    </div>
    <div class="one_third" style="width:23%;margin-right: 3%;margin-left:5%;">
     <h6 class="title">COMPANY INFO</h6>
      <address class="push30">
      Company Name : 세탁소개팅<br>
      Street Name &amp; Number : <br/>인천 남구 학익동 매소홀로<br>
         태승빌딩 5층<br>
      Postcode/Zip : 22123
      </address>
      <ul class="nospace">
        <li class="push10"><span class="icon-time"></span> Mon. - Fri. 9:00am - 7:00pm</li>
        <li class="push10"><span class="icon-phone"></span> +08 (123) 456 7890</li>
        <li><span class="icon-envelope-alt"></span> tofha56@gmail.com</li>
      </ul>
    </div>
  </footer>
</div>
<div class="wrapper row5">
  <div id="copyright" class="clear"> 
    <p class="fl_left">Copyright &copy; 2017 - All Rights Reserved </p>
  </div>
</div> 
</body>
<script>
var arr = [];
var arrStr;
function reviewUpdate(){
   $('#saveDiv input').each(function(i){
      arr.push($(this).val());
      arrStr = arr.toString();
      $('#arr').val(arrStr);
   });
   document.bb.action="./reviewUpdate";
   document.bb.submit();
}
</script>
</html>