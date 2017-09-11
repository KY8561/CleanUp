<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style></style>
</head>
<script>
   function move(obj){
      if(obj.value=="개인정보수정"){
         document.person.action="./personUpdateMV";
         document.person.submit();
      }
      if(obj.value=="나의정보"){
         document.person.action="./personMyPage";
         document.person.submit();
      }
   }
   
   function updateCheck(check){
      if(check==1)
         alert("회원정보수정 실패");
      if(check==2)
         alert("회원탈퇴 실패");
   }
   
</script>
<body onLoad="updateCheck(${check})">
   <form name="person" method="post">
   <h1>개인회원메인</h1>
   <input type="button" value="개인정보수정" onclick="move(this)"/>
   <input type="button" value="나의정보" onclick="move(this)"/>
</form>

<!--광영  -->
   <div>
      <ul>
         <li><a href="">홈페이지 소개</a></li>
         <li><a href="">마이페이지</a>
            <ul>
               <li>나의 정보</li>
               <li><a href="./personReservation">예약 내역</a></li>
               <li>나의 포인트</li>
               <li><a href="./myActivity">나의 활동</li>
            </ul></li>
         <li><a href="./shopListSelect">매장찾기</a></li>
         <li><a href="">Q&A</a></li>
      </ul>
   </div>

<!--옒  -->
<a href='./myPoint?type=전체내역'>나의포인트</a>


</body>
<script></script>
</html> --%>



<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script>
   function update(){
      document.business.action="./businessUpdateMV";
      document.business.submit();
   }
   
   function myPage(){
      document.business.action="./businessMyPage";
      document.business.submit();
   }
   
   function updateCheck(check){
      if(check==1)
         alert("회원정보수정 실패");
      if(check==2)
         alert("회원탈퇴 실패");
   }
   
</script>
<body onLoad="updateCheck(${check})">
<form name="business" method="post">
   <h1>사업자메인</h1>
   <input type="button" value="개인정보수정" onclick="update()"/>
   <input type="button" value="나의정보" onclick="myPage()"/>
</form>



<!-- 광영 -->
   <a href="./reservationList"><button>예약 내역</button></a>
   
   
   <a href='CoinShopAddmv'>코인세탁소등록</a><br/>
<a href='coinShopMm'>코인세탁소 관리</a>
<a href="./LaundryAddmv"><button>매장등록</button></a><br/>
<a href="./laundryMm"><button>매장관리</button></a><br/>
<a href="./shopListSelect"><button>매장검색</button></a><br/>
   
   
   
   <!--예림 포인트  -->
<a href="./pointMm?type=전체내역"><button>포인트 관리</button></a><br/>   
   
   
   
</body>
</html>
 --%>

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

function move(obj){
    if(obj.value=="개인정보수정"){
       document.person.action="./personUpdateMV";
       document.person.submit();
    }
    if(obj.value=="나의정보"){
       document.person.action="./personMyPage";
       document.person.submit();
    }
 }
 
 function updateCheck(check){
    if(check==1)
       alert("회원정보수정 실패");
    if(check==2)
       alert("회원탈퇴 실패");
 }
</script>
<body onLoad="updateCheck(${check})">
<div class="wrapper row1">
  <header id="header" class="clear" style="width:92%;"> 
  <a href="./logout" style="float:right;">로그아웃</a><a  href="./personUpdateMV"style="float:right;">개인정보수정　|　</a>
    <div id="logo">
      <img src="resources\bootstrap\images\img_t21_006.jpg" style="margin-left:11%; margin-top:2%; margin-bottom:2%;"/>
    </div>
    <nav id="mainav">
      <ul class="clear">
        <li><a href="index.html">홈페이지소개</a></li>
        <li><a href="#" class="drop">마이페이지</a>
            <ul>
               <li><a href="./personMyPage">나의 정보</a></li>
               <li><a href="./CoinShopAddmv">예약내역</a></li>
               <a href="./pointMm?type=전체내역"><button>포인트 관리</button></a>
               <li><a href="./CoinShopAddmv">나의 활동</a></li>
            </ul>
        </li>
        <li><a href="./shopListSelect">매장찾기</a>
        </li>
        <li><a class="drop" href="#">Q & A</a>
             <ul>
               <li><a href="./laundryMm">1:1문의</a></li>
               <li><a href="./coinShopMm">자주묻는 질문</a></li>
            </ul>
        </li>
        <li><a href="#">공지사항</a>
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