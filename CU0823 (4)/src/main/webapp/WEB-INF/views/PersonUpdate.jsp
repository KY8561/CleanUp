<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<style>
</style>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function oneCheckbox(a){
    var obj = document.getElementsByName("p_gender");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != a){
            obj[i].checked = false;
        }
        
    }
}



function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
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
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}

$(function() {
    $('.p_pw').keyup(function() {
       $('font[name=pwCheck]').text('');
    });

    $('.p_pw2').keyup(function() {
       if ($('.p_pw').val() != $('.p_pw2').val()) {
          $('span[name=pwCheck]').text('');
          $('span[name=pwCheck]').html("암호틀림");
       } else {
          $('span[name=pwCheck]').text('');
          $('span[name=pwCheck]').html("암호맞음");
       }
    });
 });
 
 function pwCheck(){
   document.update.action="./pwCheck1";
   document.update.submit();
 }
 
 function update(check){
    var gender = $('#gender').val();
    console.log(gender);
      if(gender=="남"){
         alert("남자");
         $('#gender1').prop("checked",true);
      }else if(gender=="여"){
         alert("여자");
         $('#gender2').prop("checked",true);
      }
      
    if(check==1){
       alert("비밀번호가 확인되었습니다.");
       $('#updateSubmit2').prop("disabled",false);
      $('#updateSubmit').css("display","block");
      $('#update')
    }
   if(check==2){
      alert("비밀번호가 틀렸습니다.");
   }if(check==3){
      alert("이메일 전송 완료");
      $('#updateSubmit').css("display","block");
       $('#numCheck').css("display","block");
       $('.emailInput').prop("disabled",false);
       $('#emailSendBtn').css("display","block");
       $('#btn1').css("display","none");
       $('#num').prop("disabled",false);
   }
}
 
 
 function emailInput(){
    $('.emailInput').prop("disabled",false);
    $('#emailSendBtn').css("display","block");
    $('#btn1').css("display","none");
 }
 
 function emailSend(){
    $('#numCheck').css("display","block");
    document.update.action="./joinVCsend5";
    document.update.submit();
 }
 
 
 function authnumCheck(){
    var num = $('#num').val();
     var r_num = $('#r_num').val();
    if(r_num==num){
       alert("이메일 인증이 완료되었습니다.");
       $('#updateSubmit2').prop("disabled",false);
    }
 }

 function personUpdate(){
    document.update.action="./personUpdate";
    document.update.submit();
 }
 
 </script>
<body onLoad="update(${check})">
   <form name="update" method="post">
   <h1>개인정보수정 페이지</h1>
   <table>
      <tr>
         <td>아이디</td>
         <td>${p_id}</td>
      </tr>
      <tr>
         <td>현재 비밀번호</td>
         <td><input type="password" name="pw" value="${pw}"/>
         <input type="button" onclick="pwCheck()" value="확인"/></td>
      </tr>
      <tr>
         <td>새 비밀번호</td>
         <td><input type="password" name="p_pw" value="${p_pw}"/></td>
      </tr>
      <tr>
         <td>새 비밀번호 확인</td>
         <td><input type="password" name="p_pw2" value="${p_pw}"/></td>
      </tr>
      <tr>
         <td>이름</td>
         <td><input type="text" value="${p.p_name}" name="p_name"/></td>
      </tr>
      <tr>
         <td>성별</td>
         <td><input type="checkbox" name="p_gender" id="gender1" value="남" onclick="oneCheckbox(this)" />남자 
            <input type="checkbox" name="p_gender" id="gender2" value="여" onclick="oneCheckbox(this)" />여자</td>
      </tr>
      <tr>
         <td>주소</td>
         <td>
            <input type="text" name="post" id="sample6_postcode"  value="${post}"/> 
            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호찾기" />
            </td>
         </tr>
         <tr>
            <td></td>
            <td>
            <input type="text" name="addr1"  id="sample6_address" value="${addr1}"/> 
            <input type="text" name="addr2" id="sample6_address2" value="${addr2}" />
            </td>
         </tr>
      <tr>
         <td>이메일</td>
         <td>
            <input type="text" name="email1"  id="email1" value="${email1}" onfocus="this.value='';" class="emailInput" disabled/> 
            @ <input type="text" name="email2" id="email2" value="" disabled/> 
            <select style="height:22px" name="email3" id="email3" onchange="email_change()">
               <option value="0">선택하세요</option>
               <option value="naver.com">naver.com</option>
               <option value="nate.com">nate.com</option>
               <option value="9">직접입력</option>
            </select>
            <input type="button" id="btn1" value="변경" onclick="emailInput()"/>
            </td>
            <td>
             <input type="button" id="emailSendBtn" style="display:none" value="인증번호 발송" onclick="emailSend()" />
         </td>
      </tr>
      <tr>
      <table id="numCheck" style="display:none">
         <tr>
         <td>인증번호</td>
         <td><input type="text" name="authnum" id="num" disabled/> <input type="button" value="확인" onclick="authnumCheck()"/></td>
         </tr>
      </table>
      </tr>
   <tr>
         <td>전화번호</td>
            <td>
            <select name="phone1" id="phone1">
               <option value="010">010</option>
               <option value="011">011</option>
               <option value="017">017</option>
               <option value="018">018</option>
               <option value="019">019</option>
               </select> 
               - <input type="text" name="phone2" id="phone2" value="${phone2}"/> - <input type="text" name="phone3" id="phone3" value="${phone3}"/>
            </td>
      </tr>
      <tr>
         <td><br/></td>
      </tr>
      <tr>
         <td colspan="2">
         <div id="updateSubmit" style="display:none">
         <input type="hidden" id="r_num" value="${r_num}"/>
         <input type="button" id="updateSubmit2" onclick="personUpdate()" value="수정하기" disabled/>
         </div></td>
      </tr>
   </table>
               <input type="hidden" id="email7" name="email7" value="${email7}"/>
                  <input type="hidden" id="flag" name="flag" value="${flag}"/>
                  <input type="hidden" id="gender" name="gender" value="${p_gender}"/>
   </form>
</body>
<script>
$(document).ready(function email2(){
   var flag = $('#flag').val();
   var phone1="${phone1}";
   console.log(phone1);
   $("#phone1 option[value='" +phone1+ "']").attr("selected","selected");
      var email7 = $('#email7').val();
      $('#email2').val(email7);
      $('#email3').val(0);
      console.log(email7);
         if(flag==1){
            $('#email2').attr("disabled",false);
            $('#email2').val(email7);
            $('#email3').val(email7);
         }else if(flag==2){
            $('#email2').val(email7);
            $('#email3').val(9);
             $('#email2').attr("disabled",false);
         }else if(flag==5){
         $('#email1').val("");
         $('#email2').val("");
         $('#email3').val(0);
         $('#email2').attr("disabled",true);
      }
});

function email_change(){
   var text = $("#email3 option:selected").val();
   var email = $('#email2').val();
         if(text == '0'){
             $('#email2').val("");
             $('#email2').attr("disabled",true);
         }else if(text == '9'){
            $('#email2').val("");
             $('#email2').attr("disabled",false);
             $("#email2").focus();
         }else{
            $('#email2').val(text);
             $('#email2').attr("disabled",true);
         }
      }


</script>
<script>
window.onload = function(){
	       var  p_gender= "${p_gender}";
	       $('input:checkbox[name="p_gender"]').each(function(){
	          if(this.value == p_gender){
	             this.checked = true;
	          }
	       });
}
	      
</script>
</html>