<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
   function deleteCheck(check){
      if(check==1){
         alert("비밀번호를 확인했습니다.")
         $('#delete').css("display","block");
      }if(check==2){
         alert("비밀번호가 일치하지 않습니다.");
      }
   }
   
   function forward(){
      document.deleteFrm.action="./pwCheck4";
      document.deleteFrm.submit();
   }
   
   function businessDelete(){
      document.deleteFrm.action="./businessDelete";
      document.deleteFrm.submit();
   }
   
</script>
<body onLoad="deleteCheck(${check})">
<form name="deleteFrm" method="post">
   <h1>회원탈퇴 페이지</h1>
   <table>
      <tr>
         <td>아이디</td>
         <td>${p_id}</td>
      </tr>
      <tr>
         <td>비밀번호</td>
         <td><input type="password" placeholder="비밀번호를 입력하세요." value="${pw}"name="pw" />
         <input type="button" value="확인" onclick="forward()"/></td>
      </tr>
      <tr>
         <td colspan="2">
         <input type="button" value="탈퇴하기" id="delete" style="display:none" onclick="businessDelete()"/>
          </td>
      </tr>
   </table>
</form>
</body>
</html>