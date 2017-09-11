<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<link href="resources\bootstrap\layout\styles\layout.css" rel="stylesheet" type="text/css" media="all">
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
body{
background:white;
}
.rounded{
           width:100px;
           height:100px;
        }
 .BusinessMyPage{position:relative;width:435px
 }
 
 td{
    padding: 10px;
 }
 table{
    width: 500px;
 }
.sub{
    border-radius:2px; padding:8px;
 font-size:14px;font-weight:700;color:#fff;text-align:center;background:#a4a4a4
 }
h1 { font-family: 'Nanum Myeongjo'; }
</style>
</head>
<script>
   function actionBtn(check){
      if(check==1){
         document.myPage.action="./businessUpdateMV";
         document.myPage.submit();
      }else if(check==2){
         document.myPage.action="./BusinessDeleteMV";
         document.myPage.submit();
      }
   }
   

</script>
<body>
<div class="wrapper row1">
  <header id="header" class="clear" style="width:92%;"> 
  <a href="./logout" style="float:right;">로그아웃</a><a  href="./businessUpdateMV"style="float:right;">개인정보수정　|　</a><br/>
    <div id="check" style="display:none">
    <a href="./message" onClick="window.open(this.href, '', 'width=700, height=400'); return false;">
    <img src="resources\bootstrap\images\new.png" style="width:50px; height:50px; float:right;"></a></div>
  	<div id="check1" style="display:block">
  	<a href="./message" onClick="window.open(this.href, '', 'width=700, height=400'); return false;">
    <img src="resources\bootstrap\images\message.png" style="width:50px; height:50px; float:right; "></a>
  	</div>
    <div id="logo">
      <img src="resources\bootstrap\images\img_t21_006.jpg" style="margin-left:11%; margin-top:2%; margin-bottom:2%;"/>
    </div>
    <nav id="mainav">
      <ul class="clear">
        <li><a href="index.html">홈페이지소개</a></li>
        <li><a href="#" class="drop">매장등록</a>
            <ul>
               <li><a href="./LaundryAddmv">일반세탁소</a></li>
               <li><a href="./CoinShopAddmv">코인세탁소</a></li>
            </ul>
        </li>
        <li><a href="./ReservationShop">예약현황</a>
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
            <li><a href="noticeList">공지사항</a></li>
            <li><a href="inQuiryList">1:1 문의</a></li>
            <li><a href="Question.jsp">자주하는질문</a></li>
         </ul>
      </ul>
    </nav>
  </header>
</div>
<div class=BusinessMyPage style="margin-left: 30%;">
<form name="myPage" method="post">
   <h1>나의 정보 페이지</h1>
   <table>
      <tr>
         <td style="width: 100px;">이름</td>
         <td>${p.p_name}</td>
      </tr>
      <tr>
         <td>아이디</td>
         <td>${p.p_id}</td>
      </tr>
      <tr>
         <td>성별</td>
         <td>${p.p_gender}</td>
      </tr>
      <tr>
         <td>이메일</td>
         <td>${p.p_email}</td>
      </tr>
      <tr>
         <td>연락처</td>
         <td>${p.p_phone}</td>
      </tr>
      <tr>
         <td>사업자 번호</td>
         <td>${b.b_lisence}</td>
      </tr>
      <tr>
         <td colspan="2" style="text-align: center;">
            <a href="#" class="sub" onclick="actionBtn(1)">수정하기</a>　　
            <a href="#" class="sub" onclick="actionBtn(2)">탈퇴하기</a>
         </td> 
      </tr>
   </table>
</form>
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
window.onload=function(){
	 if("${count}"!=0){
		   var con = document.getElementById("check");
		   var con1 = document.getElementById("check1");
		   con.style.display = 'block';
		   con1.style.display = 'none';
		   }else{
		        var con = document.getElementById("check");
		      var con1 = document.getElementById("check1");
		      con.style.display = 'none';
		      con1.style.display = 'block';
		   }
	 }
</script>
</html>