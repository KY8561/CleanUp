<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
   input[type=text] {
      width:140px;
   }
   
   #idSearch, #pwSearch{
      border:1px solid black;
      margin-left:5%;
      margin-right:45%;
      margin-bottom:2%;
   }
</style>
</head>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
function correctNum(){
   var num = ${Num};
      var flag = $('#flag').val();
      if(flag==1||flag==2){
         if(num==$('#authnum').val()){
         $('#button').css("display","none");
         $('#findId').css("display","block");
         $('#msg').css("display","block");
         }
      }else if(flag==3||flag==4){
         if(num==$('#authnum2').val()){
         $('#button2').css("display","none");
         $('#findPw').css("display", "block");
         $('#msg2').css("display","block");
         }
      }
}
      

function email_change(){
   var text = $("#email3 option:selected").val();
   var email = $('#email2').val();
         if(text == '0'){
             $('#email2').val("")
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

function email_change2(){
      var text = $("#email6 option:selected").val();
         if(text == '0'){
          $('#email5').val("");
          $('#email5').attr("disabled",true);
         }else if(text == '9'){
         $('#email5').val("");
          $('#email5').attr("disabled",false);
          $('#email5').focus();
         } else{
          $('#email5').val(text);
          $('#email5').attr("disabled",true);
         }
      } 
   
   
   function emailSend(){
      var text =$("#email3 option:selected").val();
      if(text == '0'){
          alert("도메인 주소를 입력해주세요.");
      }else{
         document.search.action="./joinVCsend3";
         document.search.submit();
      }
   }
   
   function emailSend2(){
      var text =$("#email6 option:selected").val();
      if(text=='0'){
         alert("도메인 주소를 입력해주세요.");
      }else{
         document.search.action="./joinVCsend4";
         document.search.submit();
      }
   }
   
   function find1(){
      document.search.action="./findId";
      document.search.submit();
   }
   
   function find2(){
      document.search.action="./findPw";
      document.search.submit();
   }
   
   
</script>
<script>
$(document).ready(function email2(){
   var flag = $('#flag').val();
   console.log(flag);
   if(flag==1||flag==2){
      var email7 = $('#email7').val();
      console.log(email7);
         if(flag==1){
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
   }else{
      var email7 = $('#email7').val();
      console.log(email7);
         if(flag==3){
            $('#email5').val(email7);
            $('#email6').val(email7);
         }else if(flag==4){
            $('#email5').val(email7);
            $('#email6').val(9);
            $('#email5').attr("disabled",false);
         }else if(flag==6){
         alert("여기 들어옴");
         $('#email4').val("");
         $('#email5').val("");
         $('#email6').val(0);
         $('#email5').attr("disabled",true);
      }
   }

});
</script>
<body onload="searchFrm(${check})">
<form name="search" method="post">
<br/>
      <div id="idSearch" >
         <h1>아이디 찾기</h1>
         <table>
            <tr>
               <td>이름</td>
               <td><input type="text" placeholder="이름" name="p_name" id="name" value="${p_name}"/></td>
            </tr>
            <tr>   
               <td>이메일</td>
               <td>
                  <input type="text" name="email1" placeholder="이메일" id="email1" value="${email1}" onfocus="this.value='';" /> 
                  @ <input type="text" name="email2" id="email2" disabled/> 
                  <select name="email3" id="email3" onchange="email_change()">
                     <option value="0" >선택하세요</option>
                     <option value="naver.com">naver.com</option>
                     <option value="nate.com">nate.com</option>
                     <option value="9">직접입력</option>
                  </select>
                  <input type="button" id="correct" value="인증번호 전송" onclick="emailSend()"/>
                  </td>
            </tr>
            <tr>   
               <td>인증번호</td>
               <td>
               <div style="float:left">
               <input type="text" id="authnum" name="authnum" value="${authnum}" placeholder="인증번호" disabled/>
               <input type="button" value="확인" id="button" onclick="correctNum()" disabled/>
               <span id="msg" style="display:none">메일인증성공</span>
               </div></td>
            </tr>
            <tr>
               <td><input type="button" value="아이디 찾기" id="findId" style="display:none" onclick="find1()"/></td>
            </tr>
         </table>
         <h2 id="idView" style="display:none">아이디는 ${p_id}입니다.</h2>
         <br/>
      </div>
      <div id="pwSearch">
         <h1>비밀번호 찾기</h1>
         <table>
            <tr>
               <td>아이디</td>
               <td><input type="text" placeholder="아이디" name="p_id" value="${pid}"/></td>
            </tr>
            <tr>   
               <td>이메일</td>
               <td>
                  <input type="text" name="email4" placeholder="이메일" id="email4" value="${email4}" onfocus="this.value='';" /> 
                  @ <input type="text" name="email5" id="email5" disabled/>
                  <select name="email6" id="email6" onchange="email_change2()">
                     <option value="0">선택하세요</option>
                     <option value="naver.com">naver.com</option>
                     <option value="nate.com">nate.com</option>
                     <option value="9">직접입력</option>
                  </select>
                  <input type="button" value="인증번호 전송" onclick="emailSend2()"/>
               </td>
            </tr>
            <tr>   
               <td>인증번호</td>
               <td>
               <div style="float:left">
               <input type="text" id="authnum2" name="authnum2" value="${authnum2}" placeholder="인증번호" disabled/>
               <input type="button" value="확인" onclick="correctNum()" id="button2" disabled/>
               <span id="msg" style="display:none">메일인증성공</span>
               </div></td>
            </tr>
            <tr>
               <td><input type="button" value="비밀번호 찾기" id="findPw" style="display:none" onclick="find2()"/></td>
            </tr>
         </table>
                  <input type="hidden" id="email7" name="email7" value="${email7}"/>
                  <input type="hidden" id="flag" name="flag" value="${flag}"/>
         <br/>
      </div>
</form>   
</body>
<script>
function searchFrm(check){
   console.log(check);
   var obj = document.getElementById("idView");
   if(check==1){
      alert("아이디를 찾았습니다.");
      obj.style.display="block";
      $('#name').prop("disabled",true);
      $('#email1').prop("disabled",true);
      $('#email3').prop("disabled",true);
      $('#correct').css("display","none");
   }else if(check==2){
      alert("아이디를 찾지 못했습니다.");
   }else if(check==3){
      alert("입력하신 정보가 맞지 않습니다.");
   }else if(check==4){
      alert("비밀번호를 찾지 못했습니다.");
   }else if(check==5){
      alert("인증메일을 확인해주세요.");
   }else if(check==6){
      alert("이메일 전송 완료");
      var flag = $('#flag').val();
      if(flag==1||flag==2){
         $('#authnum').attr("disabled",false);
         $('#button').attr("disabled",false);
         $('#correct').attr("value","재전송");
      }else if(flag==3||flag==4){
         $('#authnum2').attr("disabled",false);
         $('#button2').attr("disabled",false);
         $('#correct2').attr("value","재전송");
      }
   }else if(check==7){
      alert("등록된 정보가 없습니다.");
   }
}
</script>
</html>