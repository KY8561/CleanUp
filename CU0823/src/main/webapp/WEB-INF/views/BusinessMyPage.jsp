<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<script>
   function actionBtn(check){
      if(check==1){
         document.myPage.action="./businessUpdateMV";
         document.myPage.submit();
      }else if(check==2){
         document.myPage.action="./BusinessDeleteMV";
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
         <td>이메일</td>
         <td>${p.p_email}</td>
      </tr>
      <tr>
         <td>연락처</td>
         <td>${p.p_phone}</td>
      </tr>
      <tr>
         <td>사업자 번호</td>
         <td>${b.b_lisence}</td>
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
</html>