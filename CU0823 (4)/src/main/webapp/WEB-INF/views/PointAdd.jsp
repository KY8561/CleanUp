 <!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Vendor</title>
<meta charset="utf-8">
<link href="resources\bootstrap\layout\styles\layout.css" rel="stylesheet" type="text/css" media="all">
<link href="http://fonts.googleapis.com/earlyaccess/nanumpenscript.css" rel="stylesheet" type="text/css">
<style>
.text_border {
   text-shadow: -1.5px 0 black, 0 1.5px black, 1.5px 0 black, 0 -1.5px black;
   -moz-text-shadow: -1.5px 0 black, 0 1.5px black, 1.5px 0 black, 0 -1.5px black;
   -webkit-text-shadow: -1.5px 0 black, 0 1.5px black, 1.5px 0 black, 0 -1.5px black;
}
#button{height:40px;padding:8px; border-radius:2px; 
 font-size:14px;font-weight:700;color:#fff;margin-top:300px;text-align:center;background:#a4a4a4}
#size{font-size:16px;}
.iText{width:300px;margin:0 0;padding:10px 12px;border:1px solid #e1e1e1}
</style>
</head>
<!-- JAVASCRIPTS --> 
<script src="resources/bootstrap/layout/scripts/jquery.min.js"></script> 
<script src="resources/bootstrap/layout/scripts/supersized/supersized.min.js"></script> 
<body id="top">
<div class="wrapper row1" style="height: 300px;">
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
<div class="wrapper" style="background-color:white; height: 450px;">
   <div>
      <form name="pointFrm" >
         <div style="margin-left: 22%;">
            <div id="size">포인트 충전</div><br/>
            충전할 포인트 <select name="point" id="point" onChange="pointchange()" style="width:230px; height:32px;color:#888888;">
               <option value="">충전할 포인트를 선택해주세요</option>
               <option value="5000">5,000</option>
               <option value="10000">10,000</option>
               <option value="15000">15,000</option>
               <option value="20000">20,000</option>
            </select><br /> <br /> 결제수단
         </div>
         <table style="margin-top: 10px; width: 700px; margin-left: 22%;">
            <tr>
               <td>입금계좌선택</td>
               <td><select name="bank" style="width:204px; height:32px;color:#888888;">
                     <option value="">입금계좌를 선택해주세요</option>
                     <option value="농협">농협 111-1111-1111-11</option>
                     <option value="기업">기업 222-222222-22-222</option>
                     <option value="국민">국민 333333-33-333333</option>
               </select></td>
            </tr>
            <tr>
               <td>입금자명</td>
               <td><input type="text" name="name" class="iText" placeholder="입금자명을 써주세요"/></td>
            </tr>
            <tr>
               <td>입금금액</td>
               <td><span id="price"></span><br /> (선택하신 계좌로 3일 이내에 입금해주시지
                  않으면 자동 취소됩니다.)</td>
            </tr>
         </table>
         <a href="#" onclick="charge()" id="button" style="margin-left:48%; ">충전하기</a>
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
   function pointchange(){
      var point = $("#point option:selected").val();
      $("#price").text(point+"원");
      
   }
   function charge(){
       document.pointFrm.action="./pointcharge";
       document.pointFrm.submit();
   }
   
</script>
</html>
