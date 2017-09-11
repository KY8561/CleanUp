<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Login</title>
<meta charset="utf-8">
<link rel="icon" href="resources/bootstrap/images/favicon.ico" type="image/x-icon" />
<link href="resources\bootstrap\layout\styles\layout.css" rel="stylesheet" type="text/css" media="all">
<style>
.list{float: left;margin-right: 30px; width:35%; height:30%;}
.point{float: left;}
</style>
</head>
<!-- JAVASCRIPTS --> 
<script src="resources/bootstrap/layout/scripts/jquery.min.js"></script> 
<script src="resources/bootstrap/layout/scripts/supersized/supersized.min.js"></script> 
<body>
<div class="wrapper row1">
  <header id="header" class="clear" style="width:92%;"> 
  <a href="./JoinMemberMV" style="float:right;">Join</a><a  href="./LoginMV"style="float:right;">Login　|　</a>
    <div id="logo">
     <a href="./"><img src="resources\bootstrap\images\img_t21_006.jpg" style="margin-left:11%; margin-top:2%; margin-bottom:2%;"/></a>
    </div>
    <nav id="mainav">
      <ul class="clear">
        <li><a href="index.html">홈페이지소개</a></li>
        <li><a href="#">세탁방법안내</a></li>
        <li><a class="drop" href="#">매장찾기</a>
        <ul>
            <li><a href="#">일반세탁소</a></li>
            <li><a href="#">코인세탁소</a></li>
         </ul>
        </li>
        <li><a class="drop" href="#">Q & A</a>
        <ul>
            <li><a href="#">공지사항</a></li>
            <li><a href="#">1:1 문의</a></li>
         </ul>
      </ul>
    </nav>
  </header>
</div>
<div class="wrapper" style="background:white;height: 500px; padding-top: 10px;">
 <div class="loginForm" style="margin-left:23%; margin-top:5%;">
   <div class="point" id="point" style="margin-right:280px;">포인트 ${pointtotal}</div>   
   <div class="point">환전누적 포인트 ${returnplus}</div><br/>
   <form name="chk">
      <select name="type" id="type" onChange="kindchange()" style="width:120px; height:32px; color:#63CAC6; margin-top:3%; margin-bottom:3%;">
          <option value="전체내역">전체내역</option>
          <option value="수익내역">수익내역</option>
          <option value="환전내역">환전내역</option>
      </select>
   </form>
   <div id="point" class="list">
      ${pointList}
   </div>
   <div id="return" class="list">
      ${returnList}
   </div>

   <div style="width:200px; margin-top:250px;">
      <a href='./PointReturn'>포인트 환전 신청</a>
   </div>
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
          <div class="imgl"><img class="rounded" src="resources/bootstrap/images/다운로드.jpg" alt=""></div>
          <p class="nospace push15"><b>　　구두,운동화 </b><br/><br/>구두와 같은 가죽신발의 경우에는 물을 절대 사..<p class="nospace" ><a href="#" >Read more &raquo;</a></p></p>
        </li>
        <li class="clear">
          <div class="imgl"><img class="rounded" src="resources/bootstrap/images/S12040_760.jpg" alt=""></div>
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
   window.onload = function(){
      var type="${type}";
      console.log("onload type="+type);
      $("#type option[value='"+type+"']").attr("selected","selected");
   }
</script>
<script>
   function kindchange(){
      var type = $("#type option:selected").val();
      document.chk.action="./pointMm?type="+type;
      document.chk.submit();
   }
</script>
</html>