<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

function selectChange(){
   var str= $("#nt_categori option:selected").val();
         $('#choice').val(str);
            document.chk.action="./NoticeManage"
              document.chk.submit();
         }
function noticeAddmv(){
   document.chk.action="./noticeAddMv"
   document.chk.submit();
}
 </script>
<body>
공지사항 관리페이지
<form name="chk" action="noticeDelete">
<select name="nt_categori" id="nt_categori" onChange="selectChange()" >
         <option value="0">공용</option>
         <option value="1">고객</option>
         <option value="2">사업자</option>
         </select>
         ${list}
         <input type="hidden" id="choice" name="choice"/>
</form>
</body>
<script>
window.onload = function(){
    var kind="${kind}";
       $("#nt_categori option[value='"+kind+"']").attr("selected","selected");
      	if("${id}"=="admin"){
   		var con = document.getElementById("admin");
   		con.style.display = 'block';
   	   }
 }
      
</script>
</html>