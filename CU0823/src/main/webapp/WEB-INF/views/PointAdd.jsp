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
   <form name="pointFrm">
      충전할 포인트 
      <select name="point" id="point" onChange="pointchange()">
         <option value="">충전할 포인트를 선택해주세요</option>
         <option value="5000">5,000</option>
         <option value="10000">10,000</option>
         <option value="15000">15,000</option>
         <option value="20000">20,000</option>
      </select><br/>
      <br/>
      결제수단
      <table>
         <tr>
            <td>입금계좌선택</td>
            <td>
               <select name="bank">
                  <option value="">입금계좌를 선택해주세요</option>
                  <option value="농협">농협 111-1111-1111-11</option>
                  <option value="기업">기업 222-222222-22-222</option>
                  <option value="국민">국민 333333-33-333333</option>
               </select>
            </td>
         </tr>
         <tr>
            <td>입금자명</td>
            <td><input type="text" name="name"/></td>
         </tr>
         <tr>
            <td>입금금액</td>
            <td>
               <span id="price"></span><br/>
               (선택하신 계좌로 3일 이내에 입금해주시지 않으면 자동 취소됩니다.)               
            </td>
         </tr>
      </table>
      <input type="button" onclick="charge()" value="충전하기"/>
   </form>
</body>
<script>
   function pointchange(){
      var point = $("#point option:selected").val();
      $("#price").text(point+"원");
      
   }
   function charge(){
       document.pointFrm.action="./pointcharge";
       document.pointFrm.submit();
   }
   
</script>
</html>