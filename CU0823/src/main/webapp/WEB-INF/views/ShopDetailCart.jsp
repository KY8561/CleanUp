<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 --%>

<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
<style>

#program{
width:100px;
}

</style>
 <!-- <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                if("homegive" == "homegive"){
                    $('input:radio[name="serviceType"][value="homegive"]').prop('checked', true);
                    $("select[name='homegiveMainCategory']").val("2").attr("selected", "selected");
                    $( "#viewGiveCategory" ).hide();
                    $( "#viewHomeGiveCategory" ).show();
                }
                 
                $("input[name='serviceType']:radio").change(function () {
                        var serviceType = this.value;
                                         
                        if(serviceType == "homegive"){//스포츠인 경우
                            $( "#viewGiveCategory" ).hide();
                            $( "#viewHomeGiveCategory" ).show();
                        }else if(serviceType == "give"){//공연/전시인 경우
                            $( "#viewGiveCategory" ).show();
                            $( "#viewHomeGiveCategory" ).hide();
                        }
                    });
    	    });
        </script>
         <script type="text/javascript">
            $(document).ready(function() {
                 
                if("hometake" == "hometake"){
                 
                    $('input:radio[name="serviceType2"][value="hometake"]').prop('checked', true);
                    $("select[name='hometakeMainCategory']").val("2").attr("selected", "selected");
                    $( "#viewTakeCategory" ).hide();
                    $( "#viewHomeTakeCategory" ).show();
                }
                 
                $("input[name='serviceType2']:radio").change(function () {
                    var serviceType2 = this.value;
                    
                        if(serviceType2 == "hometake"){
                            $( "#viewTakeCategory" ).hide();
                            $( "#viewHomeTakeCategory" ).show();
                        }else if(serviceType2 == "take"){
                            $( "#viewTakeCategory" ).show();
                            $( "#viewHomeTakeCategory" ).hide();
                        }
                                         
                    });
            });
        </script> -->
</head>
 
<script>
function tname() {
    var selectBox = document.getElementById("p_t_name"); /*  매장코드 변경*/
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    var allData={"selectedValue":selectedValue}
    console.log(selectedValue);
    $.ajax({
       url: './shopCart2',
       type:"get",
       data: allData,

       success:function(data)
       {
          console.log(data);
          
          $('#program').html(data);
       },
       error:function(error)
       {
          console.log(error);
       }
    });
}

function tname2(url,position) {
    var selectBox = document.getElementById("program"); /*  셀렉트박스 변경시 name*/
    var selectedValue2 = selectBox.options[selectBox.selectedIndex].value;
    var allData={"selectedValue2":selectedValue2}
    console.log(selectedValue2);
    $.ajax({
       url: url,
       type:"get",
       data: allData,

   	success:function(html){
		$(position).html(html);
		  $(position).html(data);
	},
	error:function(error){
	console.log(error);
	}
});
}



</script>

<body>
   <div class="pick">
      <form name="pickform" method="get">
      <h1>예약페이지</h1>
         트레이너 이름 : ${li} <br/>
    	프로그램 선택:
   <select id="program" name="p_name" width="100px" onchange="javascript:tname2('shopCart3','#program5');"><option value="선택">프로그램 선택</option></select><br/><br/>
 	
	  </form>
</div>  ${li2}

</body>

<!-- <script>

function addHandle(){
	document.cartForm.action = './coinPayComplete';
	document.cartForm.submit();
	
}
function reservcart(){
	document.cartForm.action = './coinPayComplete';
	document.cartForm.submit();
	
}
  </script>
   -->
 

</html>