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
${LLIST} 세탁소코드: ${NLCODE} 
	
	
	
	<input id="userId" type="hidden" value="${NLCODE}">

	<a href="javascript:AJ('shopCart','#printP')"><input type="button"
		value="예약하기" id="info"></a>

	<div id="printP"></div>

<div class="selectP" style="display:none">  <!--none 숨기기 block 보이기 -->
수량<input type="number" name="price" width="1px">	
	<br> 품목선택 ${handle}
	<a href="javascript:additem('givetakeSelect','#addM')"><input type="button" id="addItemBtn" value="+"></a>
	<a href="./shopDetail"><input type="button"
		value="다시예약하기"></a>
	<form action="possibleItem" id="HandleForm">
		<table id="itemadd">
			<tr id="item1">
				<td name="one1">품목</td>
				<td name="two1">종류</td>
				<td name="three1">수량</td>
				<td>삭제</td>
			</tr>
		</table>
		<input type="hidden" id="m" value="0">
	
	
	</form>
</div>


	<div id="program5"></div>
	<div id="addM" class="addM"></div>
	<div id="deleteM" class="addM"></div>
<input type="button" id="givatakeBtn" value="수거방법선택" onclick="givetakeBtn()">


	<div id="GT"></div><!--수거수량선택-->


<br><br>
<!--@@@@@@@@@@@@@@@@@@@@@-->
<div class="GTPAGE" style="display:none">
		수거방법/시간:
	     <input type="radio" name="serviceType" value="give" checked><span> 수거</span>
        <input type="radio" name="serviceType" value="homegive"><span>방문수거</span>
        <br>
          <input type="date">
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
          <input type="date">
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
    //최상단 체크박스 클릭
    $("#info").click(function() {
    	$('.selectP').show();   /*숨기기 hide() 보이기 show() */
    })})
</script>


<script>
$(document).ready(function() {
    //최상단 체크박스 클릭
    $("#givatakeBtn").click(function() {
    	$('.GTPAGE').show();   /*숨기기 hide() 보이기 show() */
    })})
</script>


<script type="text/javascript">
 //수거시간 수령방법 날짜
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
 </script>




<!-- <script>
 $(document).ready(function() {
    //최상단 체크박스 클릭
    $("#addItemBtn").click(function() {
    	$('.addM').show();   /*숨기기 hide() 보이기 show() */
    })})
</script>
<script>   
  $(document).ready(function() {
    //최상단 체크박스 클릭
    $("#dBtn2").click(function() {
    	$('.deleteM').show();   /*숨기기 hide() 보이기 show() */
    })})
</script>    
  -->
    
<script>    
/* function givetakeBtn(){    

	$.ajax({
		url: './givetakeBtn',
		type:"get",
		
		success:function(html){
			$('#GT').html(html);
		},
		error:function(error){
		console.log(error);
		}
	});
	
}	 */

function additem(url, position){
	   var first=$('select[name=p_t_name]').val();
	   var second=$('select[name=p_name]').val();
	   var price=$('input[name=price]').val();

	   // tr태그의 마지막 번째를 구해 id="item"의 형태로 만들어 lastItemNo에 대입
	     var lastItemNo = $("#itemadd tr:last").attr("id").replace("item", "");
	   console.log(lastItemNo);
	     //새로 추가 할 경우 두번째 tr 값을 복사하여 newitem변수에 대입
	     var newitem = '<tr id="item'+(parseInt(lastItemNo)+1)+'"><td id="one'+(parseInt(lastItemNo)+1)+'" name="one'+(parseInt(lastItemNo)+1)+'">'+'<span class="span'+(parseInt(lastItemNo)+1)+'">'+first+'</span>'+
	     '</td><td name="two'+(parseInt(lastItemNo)+1)+'">'+second+'</td><td name="three'+(parseInt(lastItemNo)+1)+'">'+price+
	   '</td><td><input type="button" id="dBtn2" onclick="removeitem('+(parseInt(lastItemNo)+1)+')" value="-"/></td></tr>';
	   $('#itemadd').append(newitem);
	   $('input[name=price]').val('');
	   
	//   var allData = {"LH_LAUNDRY":second};
	//   var allData2 = {"QTY":price};
	   
	console.log(lastItemNo);
	   var params = "LH_LAUNDRY=" + second + "&QTY=" + price + "&NUM=" + lastItemNo;

		$.ajax({
			url:url,
			type:"get",
			data: params,
			
			success:function(html){
				$(position).html(html);
			},
			error:function(error){
			console.log(error);
			}
		});
	}

function removeitem(elem, position) {
    $('#item'+elem).remove();
    console.log(elem);
    
   var allData={"elem":(elem-1)};
  // var lastItemNo = $('#one td:last').val;
  // tr태그의 마지막 번째를 구해 id="item"의 형태로 만들어 lastItemNo에 대입
 var lastItemNo = $("#itemadd tr:last").attr("id").replace("item", "");
  
   alert(allData);
      $.ajax({
	       url: './givetakeSelect2',
	       type:"get",
	       data: allData,

	       success:function(html)
	       {
	    	   $('#deleteM').html(html);
	          console.log(html);
	       },
	       error:function(error)
	       {
	          console.log(error);
	       }
	    });
      
 } 

	function AJ(url, position){
		
		var userId = $("#userId").val();
		var allData = { "userId":userId};
		
		$.ajax({
			url:url,
			type:"get",
			data: allData,	

			success:function(html){
				$(position).html(html);
			},
			error:function(error){
			console.log(error);
			}
		});
	}

</script>
</html>