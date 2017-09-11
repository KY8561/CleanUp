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
<script>
function oneCheckbox(a){
    var obj = document.getElementsByName("p_gender");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != a){
            obj[i].checked = false;
        }
        
    }
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
   document.update.action="./pwCheck3";
   document.update.submit();
 }
 
 function update(check){
    if(check==1){
       alert("비밀번호가 확인되었습니다.");
      $('#updateSubmit').css("display","block");
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
    document.update.action="./joinVCsend6";
    document.update.submit();
 }
 
 
 function authnumCheck(){
    var num = $('#num').val();
     var r_num = $('#r_num').val();
    if(r_num==num){
       alert("이메일 인증이 완료되었습니다.");
       $('#updateSubmit2').prop("disabled",false);
    }else{
       alert("인증번호가 맞지 않습니다.");
    }
 }

 function businessUpdate(){
    document.update.action="./businessUpdate";
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
         <td>이메일</td>
         <td>
            <input type="text" name="email1"  id="email1" value="${email1}" onfocus="this.value='';" class="emailInput" disabled/> 
            @ <input type="text" name="email2" id="email2" value="" disabled /> 
            <select style="height:22px" name="email3" id="email3" onchange="email_change()" class="emailInput" disabled>
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
         <td><input type="text" name="authnum" id="num" disabled/></td> 
         <td><input type="button" value="확인" onclick="authnumCheck()"/></td>
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
      <br/>
         <td>사업자 번호</td>
         <td>${b.b_lisence}<input type="hidden" value="${b.b_lisence}" name="lisence"/></td>
      </tr>
      <tr>
         <td><br/></td>
      </tr>
      <tr>
         <td colspan="2">
         <div id="updateSubmit" style="display:none">
         <input type="hidden" id="r_num" value="${r_num}"/>
         <input type="button" id="updateSubmit2" onclick="businessUpdate()" value="수정하기" disabled/>
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
   var gender = $('#gender').val();
   if(gender=="남"){
      $('#gender1').prop("checked",true);
   }else if(gender=="여"){
      $('#gender2').prop("checked",true);
   }
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
</html>