<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
img{
width:150px;
height:150px;
}
 .btn{height:15px;padding:8px; border-radius:2px; margin-bottom:3px;
 font-size:14px;font-weight:700;color:#fff;text-align:center;background:#a4a4a4; float:right;  margin-right:2%; }
.fom{
	width: 830px;
	margin-left: 18%;
}
</style>
<script>
$(function(){
   $('#checkAll').click(function(){
      if($('#checkAll').prop('checked')){
      $('input[name=chkbox]:checkbox').each(function(){
         $(this).prop('checked',true);
      });
      }else{
         $('input[name=chkbox]:checkbox').each(function(){
            $(this).prop('checked',false);
         });
      }
   })
});</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="resources\bootstrap\layout\styles\layout.css" rel="stylesheet" type="text/css" media="all">
<link href="http://fonts.googleapis.com/earlyaccess/nanumpenscript.css" rel="stylesheet" type="text/css">
<style>
	
</style>
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
            <li><a href="./NoticeManage3">공지사항</a></li>
            <li><a href="inQuiryList">1:1 문의</a></li>
            <li><a href="Question.jsp">자주하는질문</a></li>
         </ul>
      </ul>
    </nav>
  </header>
</div>
<form action="coinShopDelete" class="fom">
${list }
</form>
</body>
</html>