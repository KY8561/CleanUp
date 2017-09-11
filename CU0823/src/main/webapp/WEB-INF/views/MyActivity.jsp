<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

function selectChange(){
   var str= $("#myActivity option:selected").val();
       document.chk.action="./myActivitySelect?choic="+str;
        document.chk.submit();
         }
 </script>
<body>
<input type="text" value="나의활동" disabled>
<form name="chk" action="myActivity">
<select name="myActivity" id="myActivity" onChange="selectChange()" >
         <option value="all">-선택하세요-
         <option value="review">리뷰</option>
         <option value="Request">1:1문의</option>
         </select>
         
</form>

${myActivity }
</body>
</html>