<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=99e91fbe1b2c343821dfa986b88cb1b6&libraries=services,clusterer,drawing"></script>
<style>
#header {
   position: absolute;
   margin-left: 360px;
   height: 250px;
   display: table-cell;
   vertical-align: middle;
}

#SHOPINFO {
   position: absolute;
   margin-top: 250px;
   margin-left: 360px;
   width: 400px;
   height: 800px;
}



#RESERVATION {
   position: absolute;
   margin-top: 250px;
   margin-left: 360px;
   width: 400px;
   height: 800px;
}

#REVIEW {
   position: absolute;
   margin-top: 225px;
   margin-left: 360px;
/*    background-color: #F5F5F5; */
   width: 400px;
   height: 800px;
}
</style>
</head>

<body>
   <div id=header>
      ${LLIST} 세탁소코드: ${NLCODE} <input id="userId" type="hidden"
         value="${NLCODE}"> 
         <a href="javascript:AJ1('shopInfo','#printI')"> <input type="button" value="주요정보" id="info2"></a> 
         <a href="javascript:AJ2('shopCart','#printM')"><input type="button" value="예약하기" id="info"></a> 
         <a href="javascript:AJ3('shopReview','#printR')"><input type="button" value="리뷰" id="info3"></a>
   </div>

   <!--예약하기 DIV-->
   <div id="RESERVATION">
      <div id="printM"></div>
      <!--결제창 AJAX  -->

      <div class="selectP" style="display: none">
         <!--none 숨기기 block 보이기 -->
         수량<input type="number" name="price" width="1px"> <br>
         품목선택 ${handle} <a href="javascript:additem('givetakeSelect','#addM')"><input
            type="button" id="addItemBtn" value="+"></a> <a
            href="./shopDetail?nl_code=${NLCODE}"><input type="button"
            value="다시예약하기"></a>

         <form action="possibleItem" name="HandleForm" id="HandleForm">
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
      <!-- 추가한 품목 가격 -->
      <div id="deleteM" class="addM"></div>
      <!-- 마이너스 품목 가격-->
      <div class="mgPoint" style="display: none">보유마일리지:${mg}</div>
      <div class="mg" style="display: none">
         마일리지사용:<input type="text" id="mg" name="mg" placeholder="마일리지입력"
            value="0">
      </div>
      <div id="mgP" class="mgP"></div>
      <!--마일리지 적용후 총가격-->
      <a href="javascript:mgSubmit('mgSubmit','#mgP')"><input
         type="button" id="mgSubmit" value="마일리지적용" style="display: none"></a> <br> 
         <input type="button" id="givatakeBtn" value="수거방법선택" style="display: none">
      <!-- <div id="GT"></div> -->

      <br> <br> <input type="hidden" value="${timeover}" />
      <div class="gtSelect" style="display: none">

         <form name="gtForm">
            수거방법/시간: <input type="radio" name="serviceType" value="give" checked><span>
               수거</span> <input type="radio" name="serviceType" value="homegive"><span>방문수거</span>
            <br> 날짜: <input type="datepicker" id="date1" name="date1"
               placeholder="날짜를 입력하세요."> <br> <br> <span
               id="viewGiveCategory"> <select
               class="form-control giveMainCategory" name="giveMainCategory"
               id="give2" style="width: 200px" size=10>
                  <option disabled="disabled">집으로 찾아오는 수거</option> ${time}
            </select>
            </span> <span id="viewHomeGiveCategory" style="display: none"> <select
               class="form-control homegiveMainCategory"
               name="homegiveMainCategory" id="give2" style="width: 200px" size=10>
                  <option disabled=”disabled”>세탁소 찾아가서 맡김</option> ${time}
            </select>
            </span> <br> <br>
            <!--수령-->
            수령방법/시간: <input type="radio" name="serviceType2" value="take"
               checked><span> 수령</span> <input type="radio"
               name="serviceType2" value="hometake"><span>방문수령</span> <br>
            날짜: <input type="datepicker" id="date2" name="date2"
               placeholder="날짜를 입력하세요."> <br> <br> <span
               id="viewTakeCategory"> <select
               class="form-control takeMainCategory" name="takeMainCategory"
               id="take2" style="width: 200px" size=10>
                  <option disabled=”disabled”>세탁소에서 배달</option> ${time}
            </select>
            </span> <span id="viewHomeTakeCategory" style="display: none"> <select
               class="form-control hometakeMainCategory"
               name="hometakeMainCategory" id="take2" style="width: 200px" size=10>
                  <option disabled=”disabled”>세탁소 방문해서 받기</option> ${time}
            </select>
            </span> <input type="button" onclick="addHandle()" value="결제하기" />
         </form>
      </div>
   </div>
   <!--예약하기 DIV-->





   <div id="SHOPINFO">
   
   <div id="map" style="width:300px;height:300px;position:relative;overflow:hidden;"></div> 
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=99e91fbe1b2c343821dfa986b88cb1b6"></script>
<script>
      var container = document.getElementById('map');
      var options = {
         center: new daum.maps.LatLng(33.450701, 126.570667),
         level: 3
      };

      var map = new daum.maps.Map(container, options);
      
      var geocoder = new daum.maps.services.Geocoder();
      var positions=[];
      var infowindow=[];
      
         geocoder.addressSearch('${laundry.getNl_address()}', function(result, status) {
              // 정상적으로 검색이 완료됐으면 
              if (status === daum.maps.services.Status.OK) {

                 var coords = new daum.maps.LatLng(result[0].y, result[0].x);

                 // 결과값으로 받은 위치를 마커로 표시합니다
                 var marker = new daum.maps.Marker({
                     map: map,
                     position: coords
                 });

                 // 인포윈도우로 장소에 대한 설명을 표시합니다
                 var infowindow = new daum.maps.InfoWindow({
                     content: '<div style="width:150px;text-align:center;padding:6px 0;">${laundry.getNl_name()}</div>'
                 });
                 infowindow.open(map, marker);
                 map.setCenter(coords);
                 // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
             } 
         });   
         
   </script> 
   ${nInfo }
      <div id="printI"></div>
   
   </div>
   <div id="REVIEW">
      <div id="printR"></div>
   </div>



  


</body>



<script>

function addHandle(){
   
    var give2 = $("#give2 option:selected").val();
   var take2 = $("#take2 option:selected").val();
 
    var gSelect = $('input[name=serviceType]').val();
    var tSelect = $('input[name=serviceType2]').val();
    
    var gdate =$('input[name=date1]').val();
    var tdate =$('input[name=date2]').val();
    
    var mg =$('input[name=mg]').val();
    
    
/*     var lastItemNo = $("#itemadd tr:last").attr("id").replace("item", "");
      alert(lastItemNo);
    
    for(i=0;i<10;i++){
         var first=$('select[name=p_t_name]').val();
      var second=$('select[name=p_name]').val();
      var price=$('input[name=price]').val();
    } 
 */
    location.href="./coinPayComplete?gi="+give2+"&ta="+take2+"&gs="+gSelect+"&ts="+tSelect+"&gd="+gdate+"&td="+tdate+"&mg="+mg;
}

</script>
<script type="text/javascript">




$(function() {
   
   var now = '${now}';
   var time = '${timeover}';
   
    $( "#date1" ).datepicker({
        minDate: 0,
         dateFormat: "yy-mm-dd",
         changeMonth: true, 
         changeYear: true,
         nextText: '다음 달',
         prevText: '이전 달',
         showOn: "both", 
         
         buttonImage: "/images/date.png",
         buttonImageOnly: true,
         beforeShow: function(input, inst){
         //현재값 저장 input parameter 클릭했을때
        //    alert("지금값");
         },
         onSelect:function (dateText, inst){
            //변경시
         alert(now+"now");
         alert(dateText+"dateText");
      
         if(now==dateText){
         $("#give2 > option[value='${timeover}']").prevAll().attr("disabled", "disabled"); //value값으로 선택 
        
         }else{
        $("#give2").attr("selected", "selected");
          
        }
       }//onselect:function
    }); //datepicker
});

$(function() {
   var now = '${now}';
   var time = '${timeover}';
   
   
    $( "#date2" ).datepicker({
        minDate: 1,
         dateFormat: "yy-mm-dd",
         changeMonth: true, 
         changeYear: true,
         nextText: '다음 달',
         prevText: '이전 달',
         showOn: "both", 
         buttonImageOnly: true,
         buttonImage: "/images/date.png",
         
         beforeShow: function(input, inst){  //현재클릭했을때
             },
         onSelect:function (dateText, inst){ //클릭변경시
            //변경시
         alert("선택날짜:"+dateText);
      
         if(now==dateText){
         $("#take > option[value='${timeover}']").prevAll().attr("disabled", "disabled"); //value값으로 선택 
        
         }else{
        $("#take").attr("selected", "selected");
        }
       }//onselect:function
    }); //datepicker      
});
</script>




<script>
$(document).ready(function() {
    //최상단 체크박스 클릭
    $("#givatakeBtn").click(function() {
       $('.gtSelect').show();   /*숨기기 hide() 보이기 show() */
    })})
</script>





<script>
/*    
    var DT =$('#date1').val(),
    alert(DT);
console.log(DT);
 */

//$("#id > option[value='value']").attr("selected", "true"); //value값으로 선택
/*    $("#type").val("11").attr("selected", "selected");
   });    */
</script>

<link type="text/css"
   href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"
   rel="stylesheet">
<script type="text/javascript"
   src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript"
   src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>



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
} */

$(document).ready(function() {
    //최상단 체크박스 클릭
    $("#info").click(function() {
       $('.mgPoint').show();
       $('.mg').show();
       $('.selectP').show();   /*숨기기 hide() 보이기 show() */
       $('#mgSubmit').show();
       $('#givatakeBtn').show();
       
       
       
       
    })})

//마일리지 적용    
 function mgSubmit(url, position){
   

   var mg = $("#mg").val();
   var allData = {"mg":mg};
   
   
   
     var mg = document.getElementById("mgP");
    mg.style.display = 'block';  
    
   alert(allData);
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
      
       var con = document.getElementById("addM");
      var con1 = document.getElementById("deleteM");
      var mg = document.getElementById("mgP");
      
      
      con.style.display = 'block';
      con1.style.display = 'none'; 
      mg.style.display='none';
      
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
      
      var arr = [];
      var arrStr;

/*       function updateCoinShop(){
         $('#saveDiv input').each(function(i){
            arr.push($(this).val());
            arrStr = arr.toString();
            $('#arr').val(arrStr);
         });
         document.updateForm.action="./updateCoinShop";
         document.updateForm.submit();
      } */
      
      
   }
function removeitem(elem, position) {
    $('#item'+elem).remove();
    console.log(elem);
    
   var allData={"elem":(elem-1)};
  // var lastItemNo = $('#one td:last').val;
  // tr태그의 마지막 번째를 구해 id="item"의 형태로 만들어 lastItemNo에 대입
 var lastItemNo = $("#itemadd tr:last").attr("id").replace("item", "");
  
 var con = document.getElementById("addM");
 var con1 = document.getElementById("deleteM");
 var mg = document.getElementById("mgP");
 con.style.display = 'none';
 con1.style.display = 'block'; 
 mg.style.display = 'none'; 
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
//매장정보 AJAX
function AJ1(url, position){   
	/*    var con = document.getElementById("SHOPINFO");
	    if(con.style.display=='none'){
	       con.style.display = 'block';
} */
/*  var userId = $("#userId").val(); //NLCODE
var allData = { "userId":userId}; */

   var info = document.getElementById("SHOPINFO");
   var review = document.getElementById("REVIEW");
   var pay= document.getElementById("RESERVATION");
   
   
   info.style.display = 'block';
   review.style.display = 'none'; 
   pay.style.display='none';
   




/* $.ajax({
   url:url,
   type:"get",
   data: allData,   

   success:function(html){
      $(position).html(html);
   },
   error:function(error){
   console.log(error);
   }
}); */
}

//예약하기AJAX
   function AJ2(url, position){   
      
      var userId = $("#userId").val();
      var allData = { "userId":userId};
      
         var info = document.getElementById("SHOPINFO");
         var review = document.getElementById("REVIEW");
         var pay= document.getElementById("RESERVATION");
         
         
         info.style.display = 'none';
         review.style.display = 'none'; 
         pay.style.display='block';
      
      
      
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
//리뷰AJAX
      function AJ3(url, position){   
      
      var userId = $("#userId").val(); //NLCODE
      var allData = { "userId":userId};
      
      
         var info = document.getElementById("SHOPINFO");
         var review = document.getElementById("REVIEW");
         var pay= document.getElementById("RESERVATION");
         
         info.style.display = 'none';
         review.style.display = 'block'; 
         pay.style.display='none';
      
      
      
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
 
 
 
</html>