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
<form name="form">
<select name=first onchange="firstChange();" size=1>
 <OPTION value=''>대분류</OPTION>
 <OPTION value=''>컴퓨터</OPTION>
 <OPTION value=''>프린터</OPTION>
</SELECT>
<SELECT name=second onchange="secondChange();" size=1>
 <OPTION value=''>대분류를 먼저 선택하세요</OPTION>
</SELECT>
<SELECT name=third size=1>
 <OPTION value=''>중분류를 먼저 선택하세요</OPTION>
</SELECT>
</body>
    
    
    
    
  </body>
  <script>
  function firstChange() {
	  var x = document.form.first.options.selectedIndex;
	  var groups=document.form.first.options.length;
	  var group=new Array(groups);
	  for (i=0; i<groups; i++)
	   group[i]=new Array();
	  
	  group[0][0]=new Option("대분류를 먼저 선택하세요","");
	  group[1][0]=new Option("컴퓨터 회사 선택","");
	  group[1][1]=new Option("삼성","ss");
	  group[1][2]=new Option("대우","dw");
	  group[1][3]=new Option("엘지","lg");
	  group[2][0]=new Option("프린터 회사 선택","");
	  group[2][1]=new Option("엡손","epson");
	  group[2][2]=new Option("휴랫팩커드","hp");
	  
	  temp = document.form.second;
	  for (m = temp.options.length-1 ; m > 0 ; m--)
	   temp.options[m]=null
	  for (i=0;i<group[x].length;i++){
	   temp.options[i]=new Option(group[x][i].text,group[x][i].value)
	  }
	  temp.options[0].selected=true
	 }
  
  
  
	 function secondChange() {
	  var first = document.form.first.options.selectedIndex;
	  var x = document.form.second.options.selectedIndex;
	  var groups=document.form.second.options.length;
	  var group=new Array(groups);
	  for (i=0; i<groups; i++)
	   group[i]=new Array();
	  if(first == 1) {
	   group[0][0]=new Option("중분류를 먼저 선택하세요","");
	   group[1][0]=new Option("삼성컴퓨터 선택","");
	   group[1][1]=new Option("섬성 팬티엄III","ss3");
	   group[1][2]=new Option("삼성 팬티엄IV","ss4");
	   group[1][3]=new Option("삼성 센스 노트북","ssnote");
	   group[2][0]=new Option("대우 컴퓨터 선택","");
	   group[2][1]=new Option("대우 데스크탑 프로","dw");
	   group[3][0]=new Option("엘지 컴퓨터 선택","");
	   group[3][1]=new Option("LG IBM PC","lgpc");
	   group[3][2]=new Option("LG IBM NOTEBOOK ","lgnote");
	  } else if(first == 2) {
	   group[0][0]=new Option("중분류를 먼저 선택하세요","");
	   group[1][0]=new Option("엡손 프린터 선택","");
	   group[1][1]=new Option("엡손 잉크","epson_ink");
	   group[1][2]=new Option("엡손 레이져","epson_laser");
	   group[2][0]=new Option("휴렛캑커드 프린터 선택","");
	   group[2][1]=new Option("HP 잉크젯","hp_ink");
	   group[2][2]=new Option("HP 레이져젯","hp_laser");
	  }
	  
	  temp = document.form.third;
	  for (m = temp.options.length-1 ; m > 0 ; m--)
	   temp.options[m]=null
	  for (i=0;i<group[x].length;i++){
	   temp.options[i]=new Option(group[x][i].text,group[x][i].value)
	  }
	  temp.options[0].selected=true
	 }
  
  
  </script>
</html>