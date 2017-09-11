<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<style>
#top {
   width: 500px;
   height: 80px;
}
</style>
</head>
<script>
window.onload = function(){
    var kind="${kind}";
       $("#state option[value='"+kind+"']").attr("selected","selected");
 }
  
</script>
<script>
   $(document).ready(function() {
      //최상단 체크박스 클릭
      $("#0").click(function() {
         //클릭되었으면
         if ($("#0").prop("checked")) {
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=check]").prop("checked", true);
            //클릭이 안되있으면
         } else {
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=check]").prop("checked", false);
         }
      })
   })
</script>
<body>
   예약현황
   <form name="logFrm" method="get">
      <select id=state>
         <option value=9>전체</option>
         <option value=1>수거전</option>
         <option value=2>취소중</option>
         <option value=3>세탁중</option>
         <option value=4>배달중</option>
         <option value=5>완료</option>
         <option value=6>취소완료</option>
         <option value=7>지급완료</option>
         <option value=8>승인취소</option>
      </select> <input type="hidden" name=text id=text> 
      <input type="hidden" name=btnchoice id=btnchoice> 
      <input type="hidden" name=nlcode id=nlcode value="${nlcode}"> 
      <input type="button" value="검색" onclick="chan()"/>
      <br>
         ${BRLIST}${RLIST}
      <input type="button" value="수거취소" id="one" class="1" style="display:none"> 
      <input type="button" value="수거완료" id="two" class="3" style="display:none"> 
      <input type="button" value="세탁완료" id="three" class="4" style="display:none">
      <input type="button" value="배달완료" id="four" class="5" style="display:none"> 
      <input type="hidden" name="statebtn" id="statebtn" /> 
      
   </form>
</body>
<script>


   function chan(){
      var text = $("#state option:selected").val();
      $('#text').val(text);
      $('#nlcode').val('${nlcode}');
		
      alert('${nlcode}');
      if(text==9){
         document.logFrm.action = "./reservationList";
         document.logFrm.submit();
      }else{
         document.logFrm.action = "./selectState";
         document.logFrm.submit();
      }
   }
   
   $(document).ready(function(){
      var st = '${state}';
      console.log("st값"+st);
      if(st==1){
         $('#two').css("display","block");
      }else if (st==3){
         $('#one').css("display","block");
         $('#three').css("display","block");
      }else if(st==4){
         $('#two').css("display","block");
         $('#four').css("display","block");
      }else if(st==5){
         $('#three').css("display","block");
      }
   })

   $(function() {
	      $('#nlcode').val('${nlcode}');
      $('#one').click(function() {
         alert($('#nlcode').val);
         $('#statebtn').val($("#one").attr('class'));
         document.logFrm.action = "./laundryProcessing";
         document.logFrm.submit();
      })
      $('#two').click(function() {
         alert($('#nlcode').val);
         $('#statebtn').val($("#two").attr('class'));
         document.logFrm.action = "./laundryProcessing";
         document.logFrm.submit();
      })
      $('#three').click(function() {
         alert($('#nlcode').val);
         $('#statebtn').val($("#three").attr('class'));
         document.logFrm.action = "./laundryProcessing";
         document.logFrm.submit();
      })
      $('#four').click(function() {
         alert($('#nlcode').val);
         $('#statebtn').val($("#four").attr('class'));
         document.logFrm.action = "./laundryProcessing";
         document.logFrm.submit();
      })
   }); 
</script>
</html>