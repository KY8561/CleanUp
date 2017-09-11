<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<script>
   function actionBtn(check){
      if(check==1){
         document.myPage.action="./personUpdateMV";
         document.myPage.submit();
      }else if(check==2){
         document.myPage.action="./MemberDeleteMV";
         document.myPage.submit();
      }
   }
   

</script>
<body>
<form name="myPage" method="post">
   <h1>나의 정보 페이지</h1>
   <table>
      <tr>
         <td>이름</td>
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
         <td>주소</td>
         <td>${m.m_address}</td>
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
         <td>등급</td>
         <td>${m.m_ggrade}</td>
      </tr>
      <tr>
         <td></td>
      </tr>
      <tr>
         <td colspan="2">
            <input type="button" value="수정하기" onclick="actionBtn(1)"/>
            <input type="button" value="탈퇴하기" onclick="actionBtn(2)"/>
         </td> 
      </tr>
   </table>
</form>
</body>
</html> --%>



<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

function selectChange(){
   var str= $("#nt_categori option:selected").val();
         $('#choice').val(str);
            document.chk.action="./NoticeManage"
              document.chk.submit();
         }
function noticeAddmv(){
   document.chk.action="./noticeAddMv"
   document.chk.submit();
}
 </script>
<body>
공지사항 관리페이지
<form name="chk" action="noticeDelete">
<select name="nt_categori" id="nt_categori" onChange="selectChange()" >
         <option value="0">공용</option>
         <option value="1">고객</option>
         <option value="2">사업자</option>
         </select>
         ${list}
         <input type="hidden" id="choice" name="choice"/>
</form>
</body>
<script>
window.onload = function(){
    var kind="${kind}";
       $("#nt_categori option[value='"+kind+"']").attr("selected","selected");
         if("${id}"=="admin"){
         var con = document.getElementById("admin");
         con.style.display = 'block';
         }
 }
      
</script>
</html> --%>



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
<title>Login</title>
<meta charset="utf-8">
<link rel="icon" href="resources/bootstrap/images/favicon.ico" type="image/x-icon" />
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
       
 .personMyPage{position:relative;width:435px}
 td{
    padding: 10px;   
 }
 table{
    width:500px;
 }
 .sub{
    border-radius:2px; padding:8px;
 font-size:14px;font-weight:700;color:#fff;text-align:center;background:#a4a4a4
 }
 h1 { font-family: 'Nanum Myeongjo'; }
</style>
</head>
<!-- JAVASCRIPTS --> 
<script src="resources/bootstrap/layout/scripts/jquery.min.js"></script> 
<script src="resources/bootstrap/layout/scripts/supersized/supersized.min.js"></script> 
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

function selectChange(){
   var str= $("#nt_categori option:selected").val();
         $('#choice').val(str);
            document.chk.action="./NoticeManage"
              document.chk.submit();
         }
function noticeAddmv(){
   document.chk.action="./noticeAddMv"
   document.chk.submit();
}
 </script>
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
<div class="warpper" style="background:white; height: 60%; padding-top: 8px;">
 <div class="personMyPage" style="margin-left:30%; margin-top:3%; padding: 5px;">
<form name="myPage" method="post">
   <h1>나의 정보 페이지</h1>
   <table style="width:500px;">
      <tr>
         <td>이름</td>
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
         <td>주소</td>
         <td>${m.m_address}</td>
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
         <td>등급</td>
         <td>${m.m_ggrade}</td>
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
</html>