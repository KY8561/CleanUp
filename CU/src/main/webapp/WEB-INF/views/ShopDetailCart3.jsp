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
    <div>
		<form name="givetakeFrm" method="get">
		
	<input type="text" value="보유포인트 5000포인트" disabled="ture">
	<br>
	<input type="text" value="마일리지    1000포인트" disabled="ture">
	사용할마일리지
	<input type="text" name="mileage">
	<input type="button" value="적용">
	<br>
	<br>
	<div id="mm"> 가격:${money }</div>
	<input type="hidden" value="${w1}" id="w1">
<input type="hidden" value="${w2}" id="w2">
<input type="hidden" value="${w3}" id="w3">
<input type="hidden" value="${w4}" id="w4">
<input type="hidden" value="${w5}" id="w5">
	<%-- <br>
	<br>
			수거방법/시간:
	     <input type="radio" name="serviceType" value="give" checked><span> 수거</span>
        <input type="radio" name="serviceType" value="homegive"><span>방문수거</span>
        <br>
        <br>
        <span id="viewGiveCategory">
            <select class="form-control giveMainCategory" name="giveMainCategory" style="width:200px" size=10>
             	<option disabled="disabled">집으로 찾아오는 수거</option>	
             	${time}
            </select>
        </span>
        
        <span id="viewHomeGiveCategory" style="display:none">
            <select class="form-control homegiveMainCategory" name="homegiveMainCategory" style="width:200px" size=10>
             <option disabled=”disabled”>세탁소 찾아가서 맡김</option>
              ${time}
            </select>
        </span>
        <br>
        <br>
	
			수령방법/시간:
	     <input type="radio" name="serviceType2" value="take" checked><span> 수령</span>
        <input type="radio" name="serviceType2" value="hometake"><span>방문수령</span>
        <br>
        <br>
        <span id="viewTakeCategory">
            <select class="form-control takeMainCategory" name="takeMainCategory" style="width:200px" size=10>
               <option disabled=”disabled”>세탁소에서 배달</option>
               ${time}
            </select>
        </span>
        <span id="viewHomeTakeCategory" style="display:none">
            <select class="form-control hometakeMainCategory" name="hometakeMainCategory" style="width:200px" size=10>
               <option disabled=”disabled”>세탁소 방문해서 받기</option>
               ${time}
            </select>
        </span>
		</form>
      <a href="./coinPayComplete"><input type="button" onclick="addHandle()" value="결제하기" /></a>
	
	</div>
  </body>
  <script>
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
         <script>
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

 </script> --%>
</html>