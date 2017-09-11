<!--
Template Name: Vendor
Author: <a href="http://www.os-templates.com/">OS Templates</a>
Author URI: http://www.os-templates.com/
Licence: Free to use under our free template licence terms
Licence URI: http://www.os-templates.com/template-terms
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta charset="utf-8">
<link rel="icon" href="resources/bootstrap/images/favicon.ico" type="image/x-icon" />
<link href="resources\bootstrap\layout\styles\layout.css" rel="stylesheet" type="text/css" media="all">
<style>
body{
background:white;
}
.rounded{
           width:100px;
           height:100px;
        }
       
 .loginForm{position:relative;width:435px}
 .loginForm .box{width:326px}
 .loginForm .box .iText{width:300px;margin:0 5px;padding:10px 12px;border:1px solid #e1e1e1}
 .loginForm .box .fright{float:right;}
 .loginForm .box p{margin-top:1em}
 .loginForm .box p span,
 .loginForm .box p input{height:18px;font-size:11px;color:#737373;line-height:18px;vertical-align:middle}
 .loginForm .loginBtn{display:block;position:absolute;top:0;right:0;width:80px;height:60px;padding:10px;border-radius:5px;
 font-size:14px;font-weight:700;color:#fff;margin-top:5px;line-height:60px;text-align:center;text-shadow:1px 1px 1px #004773;background:#333}
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
function selectChange2(){
      var str= $("#nt_categori option:selected").val();
            $('#choice').val(str);
               document.chk.action="./NoticeManage2"
                 document.chk.submit();
            }
function selectChange3(){
      var str= $("#nt_categori option:selected").val();
            $('#choice').val(str);
               document.chk.action="./NoticeManage3"
                 document.chk.submit();
            }
function noticeAddmv(){
   document.chk.action="./noticeAddMv"
   document.chk.submit();
}
 </script>
<body onLoad="loginCheck(${check})">
<div class="wrapper row1">
  <header id="header" class="clear" style="width:92%;"> 
<c:set var="menu">${menu}</c:set>
<c:choose>
<c:when test="${menu eq '공통'}">
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
<div class="warpper" style="background:white; height: 60%; padding-top: 5px;">
 <div class="loginForm" style="margin-left:32%; margin-top:14%;">
<form name="chk" action="noticeDelete">
<select name="nt_categori" id="nt_categori" onChange="selectChange()" >
         <option value="0">공용</option>
         <option value="1">고객</option>
         <option value="2">사업자</option>
         </select>
         <p></p>
         ${list}
         <input type="hidden" id="choice" name="choice"/>
</form>
      </div>
    </div>
    </c:when>
<c:when test="${menu eq '개인'}">
<a href="./logout" style="float:right;">로그아웃</a><a  href="./personUpdateMV"style="float:right;">개인정보수정　|　</a><br/>
	 <br/>   <div id="check" style="display:none">
    <a href="./message" onClick="window.open(this.href, '', 'width=700, height=400'); return false;">
    <img src="resources\bootstrap\images\new.png" style="width:50px; height:50px; float:right;"></a></div>
     <div id="check1" style="display:block">
     <a href="./message" onClick="window.open(this.href, '', 'width=700, height=400'); return false;">
   <img src="resources\bootstrap\images\message.png" style="width:60px; height:60px; float:right; margin-right:70px"></a>
     </div>

    <div id="logo">
      <a href="./PersonMain"> <img src="resources\bootstrap\images\img_t21_006.jpg" style="margin-left:11%; margin-top:2%; margin-bottom:2%;"/></a>
    </div>
    <nav id="mainav">
      <ul class="clear">
            <li><a href="./HomeInfoMV2">홈페이지소개</a></li>
        <li><a href="#" class="drop">마이페이지</a>
            <ul>
               <li><a href="./personMyPage">나의 정보</a></li>
               <li><a href="./CoinShopAddmv">예약내역</a></li>
               <li><a href="./CoinShopAddmv">나의 포인트</a></li>
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
        <li class="active"><a href="./NoticeManage2">공지사항</a>
      </ul>
    </nav>
      </header>
</div>
<div class="warpper" style="background:white; height: 60%; padding-top: 5px;">
 <div class="loginForm" style="margin-left:32%; margin-top:14%;">
<form name="chk" action="noticeDelete">
<select name="nt_categori" id="nt_categori" onChange="selectChange2()" >
         <option value="0">공용</option>
         <option value="1">고객</option>
         <option value="2">사업자</option>
         </select>
         <p></p>
         ${list}
         <input type="hidden" id="choice" name="choice"/>
</form>
      </div>
    </div>
</c:when>

<c:when test="${menu eq '사업자'}">
<a href="./logout" style="float:right;">로그아웃</a><a  href="./personUpdateMV"style="float:right;">개인정보수정　|　</a>
   	 <br/>   <div id="check" style="display:none">
    <a href="./message" onClick="window.open(this.href, '', 'width=700, height=400'); return false;">
    <img src="resources\bootstrap\images\new.png" style="width:50px; height:50px; float:right;"></a></div>
     <div id="check1" style="display:block">
     <a href="./message" onClick="window.open(this.href, '', 'width=700, height=400'); return false;">
   <img src="resources\bootstrap\images\message.png" style="width:60px; height:60px; float:right; margin-right:70px"></a>
     </div>
    <div id="logo">
      <a href="./BusinessMain"> <img src="resources\bootstrap\images\img_t21_006.jpg" style="margin-left:11%; margin-top:2%; margin-bottom:2%;"/></a>
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
               <li><a href="./myPage">정보</a></li>
               <li><a href="./laundryMm">일반세탁소 관리</a></li>
               <li><a href="./coinShopMm">코인세탁소 관리</a></li>
               <li><a href="./pointMm?type=전체내역">포인트 관리</a></li>
            </ul>
        </li>
        <li><a class="drop" href="#">Q & A</a>
        <ul>
            <li class="active"><a href="./NoticeManage3">공지사항</a></li>
            <li><a href="inQuiryList">1:1 문의</a></li>
            <li><a href="Question.jsp">자주하는질문</a></li>
         </ul>
      </ul>
    </nav>
      </header>
</div>
<div class="warpper" style="background:white; height: 60%; padding-top: 5px;">
 <div class="loginForm" style="margin-left:32%; margin-top:14%;">
<form name="chk" action="noticeDelete">
<select name="nt_categori" id="nt_categori" onChange="selectChange3()" >
         <option value="0">공용</option>
         <option value="1">고객</option>
         <option value="2">사업자</option>
         </select>
         <p></p>
         ${list}
         <input type="hidden" id="choice" name="choice"/>
</form>
      </div>
    </div>
</c:when>

<c:when test="${menu eq '관리자'}">
    <a href="./logout" style="float:right;">로그아웃</a><br/>
   	    <div id="check" style="display:none">
    <a href="./message" onClick="window.open(this.href, '', 'width=700, height=400'); return false;">
    <img src="resources\bootstrap\images\new.png" style="width:50px; height:50px; float:right;"></a></div>
     <div id="check1" style="display:block">
     <a href="./message" onClick="window.open(this.href, '', 'width=700, height=400'); return false;">
   <img src="resources\bootstrap\images\message.png" style="width:60px; height:60px; float:right; margin-right:70px"></a>
     </div>
    <div id="logo">
     <a href="./AdminMain" ><img src="resources\bootstrap\images\img_t21_006.jpg" style="margin-left:11%; margin-top:2%; margin-bottom:2%;"/></a>
    </div>
  <nav id="mainav">
      <ul class="clear">
           <li><a href="#" class="drop">매장관리</a>
            <ul>
               <li><a href="./laundryCheck">세탁소 승인 및 확인</a></li>
               <li><a href="./laundryManage">세탁소 관리</a></li>
            </ul>
        </li>
        <li><a href="./laundryReservAdN"" >일반세탁소예약관리</a>
        </li>
     <li><a class="drop" href="#">회원관리</a>
             <ul>
               <li><a href="./blackList">블랙리스트현황</a></li>
               <li><a href="./adminDeleteMV">회원탈퇴</a></li>
            </ul>
        </li>
        <li><a class="drop" href="#">포인트관리</a>
             <ul>
               <li><a href="./laundryMm">포인트 환전요청</a></li>
               <li><a href="./coinShopMm">대기 중 포인트 확인</a></li>
            </ul>
        </li>
        <li><a class="drop" href="#">Q & A</a>
             <ul>
                 <li><a href="./NoticeManage4">공지사항 수정/등록</a></li>
               <li><a href="./requestCheck">1:1 문의 확인/수정</a></li>
            </ul>
        </li>
      </ul>
    </nav>
      </header>
</div>
<div class="warpper" style="background:white; height: 60%; padding-top: 5px;">
 <div class="loginForm" style="margin-left:32%; margin-top:14%;">
<form name="chk" action="noticeDelete">
<select name="nt_categori" id="nt_categori" onChange="selectChange3()" >
         <option value="0">공용</option>
         <option value="1">고객</option>
         <option value="2">사업자</option>
         </select>
         <p></p>
         ${list}
         <input type="hidden" id="choice" name="choice"/>
</form>
      </div>
    </div>
    </c:when>

</c:choose>
</body>
<script>
window.onload = function(){
    var kind="${kind}";
       $("#nt_categori option[value='"+kind+"']").attr("selected","selected");
         if("${id}"=="admin"){
         var con = document.getElementById("admincheck");
         con.style.display = 'block';
         }
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