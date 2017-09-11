<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources\bootstrap\layout\styles\layout.css" rel="stylesheet" type="text/css" media="all">
<link href="http://fonts.googleapis.com/earlyaccess/nanumpenscript.css" rel="stylesheet" type="text/css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
   function sample6_execDaumPostcode() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var fullAddr = ''; // 최종 주소 변수
                  var extraAddr = ''; // 조합형 주소 변수

                  // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     fullAddr = data.roadAddress;

                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     fullAddr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                  if (data.userSelectedType === 'R') {
                     //법정동명이 있을 경우 추가한다.
                     if (data.bname !== '') {
                        extraAddr += data.bname;
                     }
                     // 건물명이 있을 경우 추가한다.
                     if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName : data.buildingName);
                     }
                     // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                     fullAddr += (extraAddr !== '' ? ' (' + extraAddr
                           + ')' : '');
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                  document.getElementById('sample6_address').value = fullAddr;

                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById('sample6_address2').focus();
               }
            }).open();
   }
</script>
<script type="text/javascript">
var gfv_count = 1;
    $(document).ready(function(){
      $("#addFile").on("click", function(e){ //파일 추가 버튼
           e.preventDefault();
           fn_addFile();
       });
        
       $("a[name='delete']").on("click", function(e){ //삭제 버튼
           e.preventDefault();
           fn_deleteFile($(this));
       });
   });
   function fn_addFile(){
      if((2+gfv_count)<=5){
      var str = "<div class='filebox'><label for='file"+(2+gfv_count)+"'>매장사진<input type='file' id='file"+(2+gfv_count) +"' name='img_name"+(2+gfv_count)+"'/></label><input type='text' readonly='readonly' title='File Route' id='text"+(2+gfv_count)+"' style='margin-left:0.6%;'/><a href='#this' class='btn' name='delete' style='margin-left:0.5%;'>삭제</a></div>";
       gfv_count++;
      $("#fileDiv").append(str);
       $("a[name='delete']").on("click", function(e){ //삭제 버튼
           e.preventDefault();
           fn_deleteFile($(this));
       });
   }
   }
   function fn_deleteFile(obj){
       obj.parent().remove();
       gfv_count--;
   }
</script>

</head>
<style>
body{background-color: white;}
.text_border {
   text-shadow: -1.5px 0 black, 0 1.5px black, 1.5px 0 black, 0 -1.5px black;
   -moz-text-shadow: -1.5px 0 black, 0 1.5px black, 1.5px 0 black, 0 -1.5px black;
   -webkit-text-shadow: -1.5px 0 black, 0 1.5px black, 1.5px 0 black, 0 -1.5px black;
}
.button{height:40px;padding:8px; border-radius:2px; 
 font-size:14px;font-weight:700;color:#fff;text-align:center;background:#a4a4a4}
#size{font-size:16px;}
.iText{height:34px;margin-bottom:0.5%;width:200px;padding:10px 12px;border:1px solid #e1e1e1}
textarea{height:150px;margin-bottom:0.5%;width:65%;padding:10px 12px;border:1px solid #e1e1e1}

.filebox label { display: inline-block; padding: .5em .75em;font-size: 14px;font-weight:700; line-height: normal; vertical-align: middle; background-color: #a4a4a4; color:white; cursor: pointer; border: 1px solid #ebebeb; border-bottom-color: #e2e2e2; border-radius: .25em; }
.filebox input[type="file"] { /* 파일 필드 숨기기 */ position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px;  clip:rect(0,0,0,0); border: 0; }
.filebox input[type=text] {vertical-align:middle;display:inline-block;line-height:28px;font-size:12px;padding:0;height:34px;margin-bottom:0.5%;width:200px;padding:10px 12px;border:1px solid #e1e1e1}
table{margin-top:1.5%;width:500px;margin-bottom:0;}


</style>
<body>
<div class="wrapper row1">
  <header id="header" class="clear" style="width:92%;"> 
  <a href="./logout" style="float:right;">로그아웃</a><a  href="./businessUpdateMV"style="float:right;">개인정보수정　|　</a>
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
<div class="wrapper" style="background-color:white; height: 80%;">
<div style="margin-left:28%;">
    <form action="coinShopAdd" method="post" enctype="multipart/form-data">
          <input type="text" name="cl_name" placeholder="세탁소 이름" class="iText"/><br>
         <input type="text" name="post" id="sample6_postcode" placeholder="우편번호" class="iText"/>
         <a href="#" onclick="sample6_execDaumPostcode()" class="button">우편번호찾기</a><br>
         <input type="text" name="addr1" placeholder="주소" id="sample6_address" class="iText"/>
         <input type="text" name="addr2" id="sample6_address2" placeholder="상세주소" class="iText" /><br>
         
         <select name="first"  style="width:198px; height:32px;color:#888888;border:1px solid #e1e1e1">
         <option value="010">010</option>
         <option value="011">011</option>
         <option value="017">017</option>
         <option value="02">02</option>
         <option value="031">031</option>
         <option value="032">032</option>
         <option value="033">033</option>
         <option value="041">041</option>
         <option value="042">042</option>
         <option value="043">043</option>
         <option value="044">044</option>
         <option value="051">051</option>
         <option value="052">052</option>
         <option value="053">053</option>
         <option value="054">054</option>
         <option value="055">055</option>
         <option value="061">061</option>
         <option value="062">062</option>
         <option value="063">063</option>
         <option value="064">064</option>
      </select>
      - <input type="text" class="iText" name="second" placeholder="앞번호"/>
      - <input type="text" class="iText" name="third" placeholder="뒷번호" /><br>
         <select name="cl_open" style="width:198px; height:32px;color:#888888;border:1px solid #e1e1e1;margin-bottom: 0.5%;">
         <option value="">오픈시간</option>
         <option value="01">01:00</option>
         <option value="02">02:00</option>
         <option value="03">03:00</option>
         <option value="04">04:00</option>
         <option value="05">05:00</option>
         <option value="06">06:00</option>
         <option value="07">07:00</option>
         <option value="08">08:00</option>
         <option value="09">09:00</option>
         <option value="10">10:00</option>
         <option value="11">11:00</option>
         <option value="12">12:00</option>
         <option value="13">13:00</option>
         <option value="14">14:00</option>
         <option value="15">15:00</option>
         <option value="16">16:00</option>
         <option value="17">17:00</option>
         <option value="19">19:00</option>
         <option value="20">20:00</option>
         <option value="21">21:00</option>
         <option value="22">22:00</option>
         <option value="23">23:00</option>
         <option value="24">24:00</option>
      </select>
       <select name="cl_close" style="width:198px; height:32px;color:#888888;border:1px solid #e1e1e1;margin-bottom: 0.5%;">
         <option value="">마감시간</option>
         <option value="01">01:00</option>
         <option value="02">02:00</option>
         <option value="03">03:00</option>
         <option value="04">04:00</option>
         <option value="05">05:00</option>
         <option value="06">06:00</option>
         <option value="07">07:00</option>
         <option value="08">08:00</option>
         <option value="09">09:00</option>
         <option value="10">10:00</option>
         <option value="11">11:00</option>
         <option value="12">12:00</option>
         <option value="13">13:00</option>
         <option value="14">14:00</option>
         <option value="15">15:00</option>
         <option value="16">16:00</option>
         <option value="17">17:00</option>
         <option value="19">19:00</option>
         <option value="20">20:00</option>
         <option value="21">21:00</option>
         <option value="22">22:00</option>
         <option value="23">23:00</option>
         <option value="24">24:00</option>
         </select><br>
            <input type="text" name="cl_qty" placeholder="세탁기개수" class="iText"/>
            
            
            <div class="filebox">
             <label for="file">사업자등록증
            <input type="file" id="file" name="img_name"/>
             </label>
             <input type="text" readonly="readonly" title="file Route" id="text"/>
             </div>
             
            <div id="fileDiv">
         매장사진 (2장 이상)
         <a href="#this" class="btn" id="addFile">파일 추가</a>
            <div class="filebox" style="margin-top: 0.5%">
            <label for="file">매장사진
               <input type="file" id="file" name="img_name1">
            </label>
               <input type="text" readonly="readonly" title="File Route" id="text1"/>
               <a href="#this"class="btn" id="delete" name="delete">삭제</a>
            </div>
            </div>
            <textarea rows="10" cols="40" name="cl_content">홍보글</textarea><br>
            <div style="margin-top: 1%; margin-left: 30%"><input type="submit" value="등록하기" class="button"/></div>
   </form>
   </div>
   </div>
</body>
</html>