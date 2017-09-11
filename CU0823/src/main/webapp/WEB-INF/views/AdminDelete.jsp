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
   document.deleteFrm.action="./selectList";
   document.deleteFrm.submit();
}

function personDelete(num){
   if(num==0){
      document.deleteFrm.action="./personDelete";
      document.deleteFrm.submit();
   }else if(num==1){
      document.deleteFrm.action="./personDelete2";
      document.deleteFrm.submit();
   }else if(num==2){
      document.deleteFrm.action="./personDelete3";
      document.deleteFrm.submit();
   }
}

</script>
<body>
<form name="deleteFrm" method="post">
   ${list}
</form>
</body>
</html>