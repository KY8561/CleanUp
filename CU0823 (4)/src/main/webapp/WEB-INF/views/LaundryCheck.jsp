<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<head>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

function selectChange(){
	   var str= $("#shopchoice option:selected").val();
	         $('#choice').val(str);
	         document.chk.action="./laundryCheck"
	           document.chk.submit();
	         }

function laundryAccept(){
   document.chk.action="./laundryAccept"
   document.chk.submit();
}
function acceptshopdelete(){
   document.chk.action="./acceptshopdelete"
   document.chk.submit();
}
</script>
<script type="text/javascript">
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
</head>
<body>
<form name="chk" action="shopDetail">
<select name="shopchoice" id="shopchoice" onChange="selectChange()" >
         <option value="all">-선택하세요-
         <option value="laundry">일반세탁소</option>
         <option value="coin">코인세탁소</option>
         </select>
         ${list}
         <input type="hidden" id="choice" name="choice"/>
</form>
</body>
<script>
window.onload = function(){
    var kind="${kind}";
       $("#shopchoice option[value='"+kind+"']").attr("selected","selected");
 }
  
</script>

</html>