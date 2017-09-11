<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
       var str = "<p><input type='file' name='img_name1"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
       $("#fileDiv").append(str);
       $("a[name='delete']").on("click", function(e){ //삭제 버튼
           e.preventDefault();
           fn_deleteFile($(this));
       });
   }
   function fn_deleteFile(obj){
       obj.parent().remove();
   }
</script>

</head>
<body>
   <form action="coinShopAdd" method="post" enctype="multipart/form-data">
      세탁소 이름 <input type="text" name="cl_name" /> <br/> 
      세탁소 주소 <input type="text" name="post" id="sample6_postcode" placeholder="우편번호" />
      <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호찾기" /><br/> 
      <input type="text" name="addr1" placeholder="주소" id="sample6_address" /> 
         <input type="text" name="addr2"id="sample6_address2" placeholder="상세주소" /> <br /> 연락처 <select
         name="first" class="sizing">
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
      </select>- <input type="text" style="width: 50px;" name="second" class="sizing" />
      - <input type="text" style="width: 50px;" name="third" class="sizing" />
      <br/>
      오픈<select name="cl_open">
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
      마감 <select name="cl_close">
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
      <br/> 세탁기개수 <input type="text" name="cl_qty" /> 
      
      <div id="fileDiv">
      사업자 등록증<input type="file" id="file" name="img_name"/><br/>
      매장사진 (2장 이상) <br /><a href="#this" class="btn" id="addFile">파일 추가</a>
         <p>
            <input type="file" id="file" name="img_name1">
             <a href="#this"class="btn" id="delete" name="delete">삭제</a>
         </p>
         
      </div>
       가격 및 상세정보
      <textarea rows="10" cols="40" name="cl_content"></textarea>
      </br> <input type="submit" value="등록하기" />
   </form>
</body>
</html>