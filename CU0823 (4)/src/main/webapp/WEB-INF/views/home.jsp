 <!DOCTYPE html>
<!--
Template Name: Vendor
Author: <a href="http://www.os-templates.com/">OS Templates</a>
Author URI: http://www.os-templates.com/
Licence: Free to use under our free template licence terms
Licence URI: http://www.os-templates.com/template-terms
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Vendor</title>
<meta charset="utf-8">
<link href="resources\bootstrap\layout\styles\layout.css" rel="stylesheet" type="text/css" media="all">
<link href="http://fonts.googleapis.com/earlyaccess/nanumpenscript.css" rel="stylesheet" type="text/css">
<style>
.rounded{
           width:100px;
           height:100px;
        }
</style>
</head>
<!-- JAVASCRIPTS --> 
<script src="resources/bootstrap/layout/scripts/jquery.min.js"></script> 
<script src="resources/bootstrap/layout/scripts/supersized/supersized.min.js"></script> 
<script>
jQuery(function ($) {
    $.supersized({
      slide_interval: 5000,
      transition: 1,
      transition_speed: 100,
        slides: [{
            image: 'resources/bootstrap/images/demo/slider/캡처.PNG',
            
        }, {
            image: 'resources/bootstrap/images/demo/slider/캡처1.PNG',
            image: 'resources/bootstrap/images/demo/slider/캡처2.PNG',
        }]
    });
});
</script>
<script>

   function joinCheck(check){
      if(check==1)
         alert("회원가입 성공");
      if(check==2)
         alert("회원님의 해당 이메일에 임시비밀번호가 전송되었습니다.");
      if(check==3)
         alert("정보수정 완료");
      if(check==4)
         alert("회원탈퇴 완료");
      if(check==5)
         alert("사업자탈퇴 완료");
   }
</script>
<body id="top" onLoad="joinCheck(${check})">
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
        <li><a href="./shoplogin">매장찾기</a></li>
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
        <li><a href="./NoticeManage">공지사항</a>
      <!--   <li><a href="#">Link Text</a></li>
        <li><a href="#">Link Text</a></li>
        <li><a href="#">Link Text</a></li>
        <li><a href="#">A Very Long Link Text</a></li> -->
      </ul>
    </nav>
  </header>
</div>
<div class="wrapper">
  <div id="slider"> 
    <div id="slidewrap">
      <div class="heading"><span id="slidecaption"></span></div>
      
    </div>
  </div>
</div>
<div class="wrapper row4" style="border-top-width: 0px;">
  <footer id="footer" class="clear" style="margin-left: 0px; margin-right: 0px;">
    <div class="one_third first" style=" width:26%; margin-right:7%; margin-left:6%;">
    <h6 class="title">STAFF</h6>
      <ul class="nospace clear ftgal">
        <li class="one_third first" style="margin-right:6px;"><a href="#"><img class="rounded" src="resources/bootstrap/images/images (1).jpg" alt=""></a></li>
        <li class="one_third" style="margin-right:6px;"><a href="#"><img class="rounded" src="resources/bootstrap/images/ky.jpg" alt=""></a></li>
        <li class="one_third"><a href="#"><img class="rounded" src="resources/bootstrap/images/sy.jpg" alt=""></a></li>
        <li class="one_third first" style="margin-right:6px;"><a href="#"><img class="rounded" src="resources/bootstrap/images/sr.jpg" alt=""></a></li>
        <li class="one_third" style="margin-right:6px;"><a href="#"><img class="rounded" src="resources/bootstrap/images/mk.jpg" alt=""></a></li>
        <li class="one_third"><a href="#"><img class="rounded" src="resources/bootstrap/images/yr.jpg" alt=""></a></li>
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
</html>