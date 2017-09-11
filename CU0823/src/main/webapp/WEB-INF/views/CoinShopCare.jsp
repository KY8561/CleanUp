<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
img{
width:150px;
height:150px;
}

</style>
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="coinShopDelete">
${list }
</form>
</body>
</html>