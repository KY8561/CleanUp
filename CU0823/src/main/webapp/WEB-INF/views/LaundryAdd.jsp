<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
             var str = "<p><input type='file' name='img_name"+(2+gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
             $("#fileDiv").append(str);
             $("a[name='delete']").on("click", function(e){ //삭제 버튼
                 e.preventDefault();
                 fn_deleteFile($(this));
             });
         }

         function fn_deleteFile(obj){
             obj.parent().remove();
         }
         
         $(function(){
              if('${msg}'=="매장등록 성공"){
                 alert('${msg}');
              }else if('${msg}'=="매장등록 실패"){
                 alert('${msg}');
              }
           });
</script>
<script type="text/javascript">
   
   function insertPopup(){
      var nl_name=$("#nl_name").val();
      var post=$("#sample6_postcode").val();
      var addr1=$("#sample6_address").val();
      var addr2=$("#sample6_address2").val();
      var first=$("#first").val();
      if(first==null){
         first="01";
      }
      var second=$("#second").val();
      var third=$("#third").val();
      var nl_open=$("#nl_open").val();
      var nl_close=$("#nl_close").val();
      var kind = "등록";
      //window.name = "부모창 이름";
      window.name = "LaundryAdd.jsp";
      //window.open("자식창 이름", "불러올 자식 창의 닉네임", "팝업창 옵션");
      window.open("./LaundryAddPop?nl_name="+nl_name+"&post="+post+"&addr1="+addr1+"&addr2="+addr2+
            "&first="+first+"&second="+second+"&third="+third+"&nl_open="+nl_open+"&nl_close="+
            nl_close+"&kind="+kind,"", "width = 800, height = 500, resizabla = no, scrollbars = no, status = no");
      /* document.laundryform.action="./LaundryAddPop";
      document.laundryform.submit();*/
   }
   
</script>
<script>
window.onload = function(){
      var first=${nlMap.first};
      var open=${nlMap.nl_open};
      var close=${nlMap.nl_close};
       $('#first').val(first);
       $('#nl_open').val(open);
       $('#nl_close').val(close);
   }
 

</script>

</head>
<body>
LuandryAdd.jsp
   <form action="laundryAdd" name="laundryform" method="post" enctype="multipart/form-data">
      세탁소 이름 <input type="text" name="nl_name" id="nl_name" value="${nlMap.nl_name }"/> </br> 
      세탁소 주소 <input type="text" name="post" value="${nlMap.post }" id="sample6_postcode" placeholder="우편번호" />
            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호찾기" /></br> 
            <input type="text" name="addr1" value="${nlMap.addr1}" placeholder="주소" id="sample6_address" /> 
            <input type="text" name="addr2" value="${nlMap.addr2}" id="sample6_address2" placeholder="상세주소" /> <br /> 
      연락처 <select name="first" id="first">
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
         - <input type="text" style="width: 50px;" name="second" id="second" value="${nlMap.second}"/>
         - <input type="text" style="width: 50px;" name="third" id="third" value="${nlMap.third}" /></br> 
      운영시간 오픈 <select name="nl_open" id="nl_open">
               <option value="1">01:00</option>
               <option value="2">02:00</option>
               <option value="3">03:00</option>
               <option value="4">04:00</option>
               <option value="5">05:00</option>
               <option value="6">06:00</option>
               <option value="7">07:00</option>
               <option value="8">08:00</option>
               <option value="9">09:00</option>
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
         마감 <select name="nl_close" id="nl_close">
               <option value="1">01:00</option>
               <option value="2">02:00</option>
               <option value="3">03:00</option>
               <option value="4">04:00</option>
               <option value="5">05:00</option>
               <option value="6">06:00</option>
               <option value="7">07:00</option>
               <option value="8">08:00</option>
               <option value="9">09:00</option>
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
           </select> </br> 
      가능물품 및 가격 <input type="button" onclick="insertPopup()"   name="laundryhandle" value="등록하기" /> 
         ${handleList } 
         <input type="hidden" name="arr" value="${arr }"/><br /> 
      수선 가능여부 <input   type="checkbox" name="nl_repair" value="가능" onclick="oneCheckbox(this)"/>가능
             <input type="checkbox"   name="nl_repair" value="불가능" onclick="oneCheckbox(this)"/>불가능
             <input type="hidden" id="nl_repair" name="nl_repair"/><br /> 
      예약시간간격<input type="checkbox" name="nl_timelap" value="1시간" onclick="oneCheckbox1(this)"/>1시간
             <input   type="checkbox" name="nl_timelap" value="30분" onclick="oneCheckbox1(this)"/>30분
             <input type="hidden" id="nl_timelap" name="nl_timelap"/><br /> 
      예약가능횟수 <input type="text" name="nl_qty" id="nl_qty" value="${nlMap.nl_qty }" placeholder="숫자만 입력" /><br /> 
      사업자 등록증<input type="file" name="b_lisence" />

      <div id="fileDiv">
         매장사진 (2장 이상) <br />
         <a href="#this" class="btn" id="addFile">파일 추가</a>
         <p>
            <input type="file" id="file" name="img_name1"> 
            <a href="#this" class="btn" id="delete" name="delete">삭제</a>
         </p>
         <p>
            <input type="file" id="file" name="img_name2"> 
            <a href="#this" class="btn" id="delete" name="delete">삭제</a>
         </p>

      </div>
      홍보글
      <textarea rows="10" cols="40" name="nl_content" id="nl_content" value="${nlMap.nl_content }"></textarea></br> 
      <input type="submit" value="등록하기" />
   </form>
</body>
<script>
   /* function addlaundry(){
      if($('input[name=nlrepair]').is(":checked")){
         var nl_repair = $(this).val();
         $('input[name=nl_repair]').val(nl_repair);
      }
      if($('input[name=nltimelap]').is(":checked")){
         var nl_repair = $('input[name=nltimelap]').val();
         $('input[name=nltimelap]').val(nl_repair);
      }
   } */
   
   function oneCheckbox(a){
       var obj = document.getElementsByName("nl_repair");
       for(var i=0; i<obj.length; i++){
           if(obj[i] != a){
               obj[i].checked = false;
           }
           
       }
       
   }
   function oneCheckbox1(a){
      var obj1 = document.getElementsByName("nl_timelap");
      for(var i=0; i<obj1.length; i++){
           if(obj1[i] != a){
               obj1[i].checked = false;
           }
           
       }
   }

</script>
</html>