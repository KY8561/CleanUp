<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<form action="laundryDelete">

 ${llisthtml }
 </form>
</body>
<script>
$(function(){
   if('${msg}'=="삭제되었습니다."){
      alert('${msg}');
   }
});
</script>
</html>