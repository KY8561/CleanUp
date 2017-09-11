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
  <body onLoad="adminCheck(${check})">
    
    <form name="admin">
   <h1>관리자메인</h1>
   <input type="button" value="블랙리스트 현황" onclick="blackList()"/>
   <input type="button" value="회원탈퇴페이지" onclick="adminDeleteMV()"/>
</form>
    
    
  <!--예림 포인트  -->
    <a href='pointRequest?kind=전체&state=처리전'>포인트 환전/환불 요청</a></br>
	<a href='pointMmSelect?kind=대기'>대기중 포인트 관리</a></br>
    
    
    
    	<div>


		<ul>
			<li><a href="">매장관리</a>
				<ul>
					<li><a href='laundryCheck'>세탁소 승인 및 확인</a></li>
					<li><a href='laundryManage'>세탁소 관리</a></li>
				</ul>
			
			</li>
			<li><a href="">예약관리</a>
				<ul>
					<li><a href="laundryReservAdN">일반 세탁소</a></li>
				</ul>
			</li>
			<li><a href="">회원관리</a>
			<ul>
					<li><a href="">블랙 리스트 현황</a></li>
				</ul>
			</li>
			<li><a href="">포인트관리</a>
				<ul>
					<li><a href="">포인트 환전요청</a></li>
					<li><a href="">대기중 포인트 확인</a></li>
				</ul>
			</li>
			<li><a href="">Q&A</a>
					<ul>
					<li><a href="./NoticeManage">공지사항 수정 및등록</a></li>
					<li><a href="./requestCheck">1:1문의 확인 및 수정</a></li>
					<li><a href="./Qustion">자주 묻는 질문 등록 및 수정</a></li>
				</ul>
			</li>
		</ul>
	</div>
    
    
    
    
    
  </body>
  <script>
   function blackList(){
      document.admin.action="./blackList";
      document.admin.submit();
   }
   
   function adminCheck(check){
      if(check==1)
         alert("리스트 검색 실패");
   }
   
   function adminDeleteMV(){
      document.admin.action="./adminDeleteMV";
      document.admin.submit();
      
   }
</script>
</html>