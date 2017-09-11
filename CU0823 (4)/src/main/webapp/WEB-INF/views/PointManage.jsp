<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
   <form name="chk">
      <select name="kind" id="kind" onChange="kindchange()">
          <option value="전체">전체내역</option>
          <option value="일반">일반회원</option>
          <option value="사업자">사업자회원</option>
      </select>
      <select name="state" id="state" onChange="kindchange()">
          <option value="처리전">처리전</option>
          <option value="처리완료">처리완료</option>
      </select>
   </form>
   <form name="pointRequestFrm">
      ${returnlist }
      <input type="hidden" name="arr"   id="arr"/>
      <input type="button" onclick="acceptadmin()" value="승인"/>
   </form>
</body>
<script>
   window.onload = function(){
      var kind="${kind}";
      console.log("onload kind="+kind);
      var state="${state}";
      console.log("onload state="+state);
      $("#kind option[value='"+kind+"']").attr("selected","selected");
      $("#state option[value='"+state+"']").attr("selected","selected");
   }
</script>
<script>
   function kindchange(){
      var kind = $("#kind option:selected").val();
      var state = $("#state option:selected").val();
      document.chk.action="./pointRequest?kind="+kind+"&state="+state;
      document.chk.submit();
   }
</script>
<script>
   function acceptadmin(){
      var arr = [];
      $("input[name='choice']:checked").each(function(i){
         arr.push($(this).val());
      });
      $('#arr').val(arr);
      console.log(arr);
      document.pointRequestFrm.action = "./pointAccept";
      document.pointRequestFrm.submit();
   }
</script>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Login</title>
<meta charset="utf-8">
<link rel="icon" href="resources/bootstrap/images/favicon.ico" type="image/x-icon" />
<link href="resources\bootstrap\layout\styles\layout.css" rel="stylesheet" type="text/css" media="all">
<style>
/*  .loginForm{position:relative;width:435px}
 .loginForm .box{width:326px}
 .loginForm .box .iText{width:300px;margin:0 5px;padding:10px 12px;border:1px solid #e1e1e1}
 .loginForm .box .fright{float:right;}
 .loginForm .box p{margin-top:1em}
 .loginForm .box p span,
 .loginForm .box p input{height:18px;font-size:11px;color:#737373;line-height:18px;vertical-align:middle}
 .loginForm .loginBtn{display:block;position:absolute;top:0;right:0;width:80px;height:60px;padding:10px;border-radius:5px;
 font-size:14px;font-weight:700;color:#fff;margin-top:5px;line-height:60px;text-align:center;text-shadow:1px 1px 1px #004773;background:#333} */
 #button{height:15px;padding:8px; border-radius:2px; margin-left:755px;
 font-size:14px;font-weight:700;color:#fff;margin-top:10px;text-align:center;background:#a4a4a4}
 table{font-size:14px; width:800px; height:180px;}
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
 <div class="loginForm" style="margin-left:22%; margin-top:5%;">
   <form name="chk" >
      <select name="kind" id="kind" onChange="kindchange()" style="width:120px; height:32px; color:#63CAC6; margin-top:3%; margin-bottom:3%;">
          <option value="전체">전체내역</option>
          <option value="일반">일반회원</option>
          <option value="사업자">사업자회원</option>
      </select>
      <select name="state" id="state" onChange="kindchange()" style="width:120px; height:32px; color:#63CAC6; margin-top:3%; margin-bottom:3%;">
          <option value="처리전">처리전</option>
          <option value="처리완료">처리완료</option>
      </select>
   </form>
   <form name="pointRequestFrm">
      <div id="list">
         ${returnlist }
      </div>
      <input type="hidden" name="arr"   id="arr"/><br/>
      <a href="#" onclick="acceptadmin()" id="button" >승인</a>
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
      var kind="${kind}";
      console.log("onload kind="+kind);
      var state="${state}";
      console.log("onload state="+state);
      $("#kind option[value='"+kind+"']").attr("selected","selected");
      $("#state option[value='"+state+"']").attr("selected","selected");
   }
</script>
<script>
   function kindchange(){
      var kind = $("#kind option:selected").val();
      var state = $("#state option:selected").val();
      document.chk.action="./pointRequest?kind="+kind+"&state="+state;
      document.chk.submit();
   }
</script>
<script>
   function acceptadmin(){
      var arr = [];
      $("input[name='choice']:checked").each(function(i){
         arr.push($(this).val());
      });
      $('#arr').val(arr);
      console.log(arr);
      document.pointRequestFrm.action = "./pointAccept";
      document.pointRequestFrm.submit();
   }
</script>
</html>