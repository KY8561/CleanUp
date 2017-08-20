<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
var arr= [];
var gfv_count = 1;
$(document).ready(function(){
      $("#addFile").on("click", function(e){ //파일 추가 버튼
        e.preventDefault();
        fn_addFile();
    });
     
    $("a[name='delete']").on("click", function(e){ //삭제 버튼
        e.preventDefault();
    console.log($(this).html());
       
        fn_deleteFile($(this));
    });
});
function fn_addFile(){
    var str = "<p><input type='file' name='img_name1"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
    $("#fileDiv1").append(str);
    $("a[name='delete']").on("click", function(e){ //삭제 버튼
        e.preventDefault();
        fn_deleteFile($(this));
    });
}
function fn_deleteFile(obj){
   console.log(obj.parent().html());
     obj.parent().remove();
 }
 </script>
<body>
<form  action="reviewadd" method="post" enctype="multipart/form-data">
<input type="hidden" name="re_nrcode" value="${re_nrcode}">
${Ldinfo}
리뷰사진    <a href="#this" class="btn" id="addFile">파일 추가</a>
      <div id="fileDiv1">
         <p>
            <input type="file" id="file" name="img_name1">
         </p>
      </div>
<textarea rows="10" cols="40" name="re_content"></textarea>
<input type="submit" value="등록"/>
<select name="re_star">
<option value='1'>1</option>
<option value='2'>2</option>
<option value='3'>3</option>
<option value='4'>4</option>
<option value='5'>5</option>
</select>
</form>
</body>
</html>