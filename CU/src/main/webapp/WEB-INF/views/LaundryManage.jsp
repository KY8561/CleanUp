<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="laundrychoice" action="laundryManage">
<select name="shopchoice" id="shopchoice" >
          <option value="all">-선택하세요-
         <option value="laundry">일반세탁소</option>
         <option value="coin">코인세탁소</option>
         </select>
<input type="text" name="search" placeholder="search"/><button>검색</button>
</form>
         
<form action="shopdelete">
${lList}
</form>
<script>



</script>
<script>
$(function(){
   $('#checkAll').click(function(){
      if($('#checkAll').prop('checked')){
      $('input[name=chkbox]:checkbox').each(function(){
         $(this).prop('checked',true);
      });
      }else{
         $('input[name=chkbox]:checkbox').each(function(){
            $(this).prop('checked',false);
         });
      }
   })
});</script>

</body>
</html>