<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
   function searchList(){
      var obj = $('#selectBox option:selected').val();
      var val = $('#val').val(obj);
      document.blacklist.action="./selectMemberList";
      document.blacklist.submit();
   }
   
   function blackCheck(check){
      if(check==1)
         alert("리스트 검색 실패");
   }
   
   function addBlack(){
      document.blacklist.action="./changeClass";
      document.blacklist.submit();
   }
   
   function change(num){
      if(num==1){
         document.blacklist.action="./changeClass1";
         document.blacklist.submit();
      }else if(num==2){
         document.blacklist.action="./changeClass2";
         document.blacklist.submit();
      }else if(num==3){
         document.blacklist.action="./changeClass3";
         document.blacklist.submit();
      }
      
   }
</script>
<body onLoad="blackCheck(${check})">
<form name="blacklist" method="post">
   ${li}
</form> 
</body>
</html>