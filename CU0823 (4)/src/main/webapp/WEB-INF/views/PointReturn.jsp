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
#button{height:15px;padding:8px; border-radius:2px; 
 font-size:14px;font-weight:700;color:#fff;margin-top:10px;text-align:center;background:#a4a4a4}
.float{float: left;}
#size{font-size:16px;}
.iText{height:34px;margin-bottom:5px;width:200px;margin:0 0;padding:10px 12px;border:1px solid #e1e1e1}
#returndiv {margin-bottom:10px;}
.space{margin-bottom:10px;}
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
<div class="wrapper" style="background-color:white; height:450px;">
   <div id="returndiv" style="margin-left: 30%;">
   <input type="hidden" id="kind" value="${kind }"/>
   <form name="pointreturnFrm">
      <div id="size">포인트 <span id="span"></span>하기</div><br/>
         <div class="space">
         <input type="radio" name="person"  id="member" value="개인"/>개인회원
             <input type="radio" name="person" id="business" value="사업자"/>사업자회원<br/>
       </div>
       <div class="space">
            현재포인트  ${pointtotal }포인트<br/>
       </div>
         <input type="text" name="point" id="point" class="space iText" onkeyup="returnpoint()" placeholder="환불포인트"/><br/>
       <div class="space">
            환불 후 잔여포인트 <span id="balance"></span><br/>
       </div>
      <input type="text" name="name" class=" space iText" onFocus="checkpoint()" placeholder="이름"/><br/>
      <select name="first" id="first" class="space" style="width:198px; height:32px;color:#888888;">
               <option value="10">010</option>
               <option value="11">011</option>
               <option value="17">017</option>
               <option value="2">02</option>
               <option value="31">031</option>
               <option value="32">032</option>
               <option value="33">033</option>
               <option value="41">041</option>
               <option value="42">042</option>
               <option value="43">043</option>
               <option value="44">044</option>
               <option value="51">051</option>
               <option value="52">052</option>
               <option value="53">053</option>
               <option value="54">054</option>
               <option value="55">055</option>
               <option value="61">061</option>
               <option value="62">062</option>
               <option value="63">063</option>
               <option value="64">064</option>
            </select>
            - <input type="text" class="space iText" name="second" id="second" placeholder="앞번호"/>
            - <input type="text" class="space iText" name="third" id="third" placeholder="뒷번호"/></br>
            <select name="bank" class="space" style="width:198px; height:32px;color:#888888;">
               <option value="">은행선택</option>
               <option value="우리">우리</option>
               <option value="신한">신한</option>
               <option value="NH농협">NH농협</option>
               <option value="KB국민">KB국민</option>
               <option value="하나">하나</option>
               <option value="외환">외환</option>
               <option value="IBK기업">IBK기업</option>
               <option value="새마을">새마을</option>
               <option value="부산">부산</option>
               <option value="경남">경남</option>
               <option value="광주">광주</option>
               <option value="전북">전북</option>
               <option value="신협">신협</option>
               <option value="SC제일">SC제일</option>
               <option value="KDB산업">KDB산업</option>
               <option value="대구">대구</option>
               <option value="제주">제주</option>
               <option value="우체국">우체국</option>
               <option value="수협">수협</option>
            </select>
      &nbsp;&nbsp;<input type="text" name="banknum" class="space iText"  placeholder="계좌번호('-'제외하고 작성해주세요)" style="
    width: 256px;"/><br/>
      <div style="margin-top:100px;">
         <a href="#" onclick="pointreturn()" id="button" style="margin-left:25%;"><span id="return"></span></a>
         </div>
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
   window.onload = function(){
      var kind = $("#kind").val();
      console.log(kind);
      
      if(kind == 1){
         $("#return").text("환불하기");
         $("#span").text("환불");
         $("#member").prop('checked', true);
         $("#business").prop('disabled', true);
      }else if(kind == 2){
         $("#return").text("환전하기");
         $("#span").text("환전");
         $("#business").prop('checked', true);
         $("#member").prop('disabled', true);
      }
      
      
   }
   function returnpoint(){
      var point = $("#point").val();
      var realpoint = ${pointtotal};
      if(realpoint<point){
         alert(realpoint+"포인트를 초과하였습니다.");
         $("#point").val('');
         $("#balance").text('');
      }else{
         $("#balance").text(realpoint-point);
      }
      
   }
   function checkpoint(){
      var point = $("#point").val();
      var kind =  $('input:radio[name="person"]:checked').val();
      console.log(kind);
      if(kind == "개인"){
         if(point<3000){
            alert("3000포인트 이상 환불 가능합니다.");
            $("#point").val('');
            $("#point").focus();
            $("#balance").text('');
            return false;
         }
      }else if(kind == "사업자"){
         if(point<5000){
            alert("5000포인트 이상 환전 가능합니다.");
            $("#point").val('');
            $("#point").focus();
            $("#balance").text('');
            return false;
         }
      }
   }
   function pointreturn(){
      document.pointreturnFrm.action="./pointexchange";
       document.pointreturnFrm.submit();
   }
   $(function(){
        if('${msg}'=="환불신청 되었습니다."){
           alert('${msg}');
        }
    });
</script>
</html>