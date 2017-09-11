<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>	
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <style></style>
  </head>
  <body>
  
  
  
  <form name="SearchFrm" method="get">
  	세탁소 이름<input type="text" name="text"/>
  	<input type="submit" value="검색" onclick="ReservSelect()">
  </form>
  

   <form name="SearchFrm2" method="get">
 	예약일자 <input type="date" name="date" />
  	<input type="submit" value="검색" onclick="ReservSelect2()">	
  </form>
  
  ${adrList }
    wafawfawf
  </body>
  <script>
  	function ReservSelect(){
  		document.SearchFrm.action="./laundryReservAdN";
  		document.SearchFrm.submit();
  	}
	function ReservSelect2(){
  		document.SearchFrm2.action="./laundryReservAdN";
  		document.SearchFrm2.submit();
  	}
  
  
  </script>
</html>