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
   <input type="hidden" id="kind" value="${kind }"/>
   <form name="pointreturnFrm">
      회원 구분  <input type="radio" name="person" id="member" value="개인"/>개인회원
             <input type="radio" name="person" id="business" value="사업자"/>사업자회원<br/>
      현재포인트 : ${pointtotal }포인트<br/>
      환불포인트 <input type="text" name="point" id="point" onkeyup="returnpoint()" /><br/>
      환불 후 잔여포인트 :<span id="balance"></span><br/>
      이름 <input type="text" name="name" onFocus="checkpoint()"/><br/>
      전화번호 연락처 <select name="first" id="first">
               <option value="10">010</option>
               <option value="11">011</option>
               <option value="17">017</option>
               <option value="2">02</option>
               <option value="31">031</option>
               <option value="32">032</option>
               <option value="33">033</option>
               <option value="41">041</option>
               <option value="42">042</option>
               <option value="43">043</option>
               <option value="44">044</option>
               <option value="51">051</option>
               <option value="52">052</option>
               <option value="53">053</option>
               <option value="54">054</option>
               <option value="55">055</option>
               <option value="61">061</option>
               <option value="62">062</option>
               <option value="63">063</option>
               <option value="64">064</option>
            </select>
            - <input type="text" style="width: 50px;" name="second" id="second" />
            - <input type="text" style="width: 50px;" name="third" id="third" /></br>
            은행명 <select name="bank">
               <option value="">은행선택</option>
               <option value="우리">우리</option>
               <option value="신한">신한</option>
               <option value="NH농협">NH농협</option>
               <option value="KB국민">KB국민</option>
               <option value="하나">하나</option>
               <option value="외환">외환</option>
               <option value="IBK기업">IBK기업</option>
               <option value="새마을">새마을</option>
               <option value="부산">부산</option>
               <option value="경남">경남</option>
               <option value="광주">광주</option>
               <option value="전북">전북</option>
               <option value="신협">신협</option>
               <option value="SC제일">SC제일</option>
               <option value="KDB산업">KDB산업</option>
               <option value="대구">대구</option>
               <option value="제주">제주</option>
               <option value="우체국">우체국</option>
               <option value="수협">수협</option>
            </select>
      계좌번호 <input type="text" name="banknum"   placeholder="'-'제외하고 작성해주세요"/><br/>
      <input type="button" onclick="pointreturn()" id="button"/>
   </form>
</body>
<script>
   window.onload = function(){
      var kind = $("#kind").val();
      console.log(kind);
      if(kind == 1){
         $("#button").val("환불하기");
         $("#member").prop('checked', true);
      }else if(kind == 2){
         $("#button").val("환전하기");
         $("#business").prop('checked', true);
      }
   }
   function returnpoint(){
      var point = $("#point").val();
      var realpoint = ${pointtotal};
      if(realpoint<point){
         alert(realpoint+"포인트를 초과하였습니다.");
         $("#point").val('');
         $("#balance").text('');
      }else{
         $("#balance").text(realpoint-point);
      }
      
   }
   function checkpoint(){
      var point = $("#point").val();
      var kind =  $('input:radio[name="person"]:checked').val();
      console.log(kind);
      if(kind == "개인"){
         if(point<3000){
            alert("3000포인트 이상 환불 가능합니다.");
            $("#point").val('');
            $("#point").focus();
            $("#balance").text('');
            return false;
         }
      }else if(kind == "사업자"){
         if(point<5000){
            alert("5000포인트 이상 환전 가능합니다.");
            $("#point").val('');
            $("#point").focus();
            $("#balance").text('');
            return false;
         }
      }
   }
   function pointreturn(){
      document.pointreturnFrm.action="./pointexchange";
       document.pointreturnFrm.submit();
   }
   $(function(){
        if('${msg}'=="환불신청 되었습니다."){
           alert('${msg}');
        }
    });
</script>
</html>