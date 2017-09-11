<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<script type="text/javascript">
//자동으로 팝업 창이 닫히게 하는 함수
function closePop(form){
   //form의 target을 부모 창으로 설정함
   form.target = opener.name;
   form.submit();
   
   if(opener!=null){
      opener.insert=null;
      self.close();
   }
}
function enterSubmit(form){
   //엔터키로 같은 동작
   if(event.keyCode==13){
      event.cancelBubble=true;
      closePop(form);
   }
}

</script>
<script>

//이메일 인증
   function eCheck(){
      var form = document.authenform;
      var Num = ${Num}; 
      console.log(Num);
      if(!form.authnum.value){
         alert("인증번호를 입력하세요");
         return false;
      }
      if(form.authnum.value!=Num){
         alert("틀린 인증번호입니다. 인증번호를 다시 입력해주세요.");
         form.authnum.value="";
         return false;
      }
      if(form.authnum.value==Num){
         alert("인증완료");
         //opener.document.join.mailCheck.value="인증완료";
         self.close();
         $(opener.location).attr("href","javascript:show()");
      }
   }
</script>
<body>
<h5>인증번호 7자리를 입력하세요</h5>
<div class="container" >
   <form method="post" name="authenform" target="JoinMember.jsp">
      <input type="text" id="authnum" name="authnum">
      <input type="button" onclick="eCheck()" value="인증하기"><br/><br/>
      <input type="button" value="취소" onclick="back()"/>
   </form>
</div>
</body>
</html>