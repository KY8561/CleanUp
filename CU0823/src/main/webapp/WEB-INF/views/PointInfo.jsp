<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<style>
   .list{
      float: left;
      margin-right: 30px;
   }
</style>
</head>
<body>
   <div class="list" id="point">포인트 ${pointtotal}</div>   
   <div class="list">환전누적 포인트 ${returnplus}</div><br/>
   <form name="chk">
      <select name="type" id="type" onChange="kindchange()">
          <option value="전체내역">전체내역</option>
          <option value="수익내역">수익내역</option>
          <option value="환전내역">환전내역</option>
      </select>
   </form>
   <div id="point" class="list">
      ${pointList}
   </div>
   <div id="return" class="list">
      ${returnList}
   </div><br/><br/><br/><br/>
   <a href='./PointReturn'>포인트 환전 신청</a></br>
</body>
<script>
   window.onload = function(){
      var type="${type}";
      console.log("onload type="+type);
      $("#type option[value='"+type+"']").attr("selected","selected");
   }
</script>
<script>
   function kindchange(){
      var type = $("#type option:selected").val();
      document.chk.action="./pointMm?type="+type;
      document.chk.submit();
   }
</script>
</html>