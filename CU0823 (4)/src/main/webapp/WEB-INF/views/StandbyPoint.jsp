<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<style>
   #acceptbutton1{
      display: none;
   }
   #acceptbutton2{
      display: none;
   }
</style>
</head>
<body>
   <form name="chk">
      <select name="kind" id="kind" onChange="kindchange()">
          <option value="대기">대기중</option>
          <option value="취소">취소</option>
          <option value="취소완료">취소완료</option>
          <option value="진행">진행중</option>
          <option value="최종">최종완료</option>
          <option value="지급">지급완료</option>
          <option value="승인취소">승인취소</option>
      </select>
   </form>
   <form name="pointStandbyFrm">
      ${sbplist}
      <input type="hidden" name="arr"   id="arr"/>
      <input type="hidden" name="button" id="button"/>
      <input type="button" onclick="acceptadmin1()" id="acceptbutton1" value="승인"/>
      <input type="button" onclick="acceptadmin2()" id="acceptbutton2" value="승인취소"/>
   </form>
</body>
<script>
   window.onload = function(){
      var kind="${kind}";
      console.log("onload kind="+kind);
      $("#kind option[value='"+kind+"']").attr("selected","selected");
      
      var button1 = document.getElementById("acceptbutton1");
      var button2 = document.getElementById("acceptbutton2");
      if(kind == "최종"){
         button1.style.display = "block";
         button2.style.display = "block";
      }else if(kind == "승인취소"){
         button1.style.display = "block";
      }else if(kind == "지급"){
         button2.style.display = "block";
      }
      
   }
</script>
<script>
   function kindchange(){
      var kind = $("#kind option:selected").val();
      document.chk.action="./pointMmSelect?kind="+kind;
      document.chk.submit();
   }
</script>
<script>
   function acceptadmin1(){
      var arr = [];
      $("input[name='choice']:checked").each(function(i){
         arr.push($(this).val());
      });
      $('#arr').val(arr);
      console.log(arr);
      
      var kind = "${kind}";
      console.log("버튼안 kind="+kind);
      var button = "";
      if(kind == "최종"){
         button = "승인"
      }else if(kind == "승인취소"){
         button = "다시승인"
      }
      console.log("button="+button);
      $('#button').val(button);
      document.pointStandbyFrm.action = "./pointAdmin";
      document.pointStandbyFrm.submit();
   }
   function acceptadmin2(){
      var arr = [];
      $("input[name='choice']:checked").each(function(i){
         arr.push($(this).val());
      });
      $('#arr').val(arr);
      console.log(arr);
      
      var kind = "${kind}";
      var button = "";
      if(kind == "지급"){
         button = "승인후취소"
      }else if(kind == "최종"){
         button = "승인취소"
      }
      console.log("button="+button);
      $('#button').val(button);
      document.pointStandbyFrm.action = "./pointDelete";
      document.pointStandbyFrm.submit();
   }
</script>
</html>