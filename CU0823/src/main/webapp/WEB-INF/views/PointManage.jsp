<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
   <form name="chk">
      <select name="kind" id="kind" onChange="kindchange()">
          <option value="전체">전체내역</option>
          <option value="일반">일반회원</option>
          <option value="사업자">사업자회원</option>
      </select>
      <select name="state" id="state" onChange="kindchange()">
          <option value="처리전">처리전</option>
          <option value="처리완료">처리완료</option>
      </select>
   </form>
   <form name="pointRequestFrm">
      ${returnlist }
      <input type="hidden" name="arr"   id="arr"/>
      <input type="button" onclick="acceptadmin()" value="승인"/>
   </form>
</body>
<script>
   window.onload = function(){
      var kind="${kind}";
      console.log("onload kind="+kind);
      var state="${state}";
      console.log("onload state="+state);
      $("#kind option[value='"+kind+"']").attr("selected","selected");
      $("#state option[value='"+state+"']").attr("selected","selected");
   }
</script>
<script>
   function kindchange(){
      var kind = $("#kind option:selected").val();
      var state = $("#state option:selected").val();
      document.chk.action="./pointRequest?kind="+kind+"&state="+state;
      document.chk.submit();
   }
</script>
<script>
   function acceptadmin(){
      var arr = [];
      $("input[name='choice']:checked").each(function(i){
         arr.push($(this).val());
      });
      $('#arr').val(arr);
      console.log(arr);
      document.pointRequestFrm.action = "./pointAccept";
      document.pointRequestFrm.submit();
   }
</script>
</html>