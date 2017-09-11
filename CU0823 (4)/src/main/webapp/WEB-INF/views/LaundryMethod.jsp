<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<!--
Template Name: Vendor
Author: <a href="http://www.os-templates.com/">OS Templates</a>
Author URI: http://www.os-templates.com/
Licence: Free to use under our free template licence terms
Licence URI: http://www.os-templates.com/template-terms
-->
<html>
 <head>
        <meta charset="utf-8">
      <link href="resources\bootstrap\layout\styles\layout.css" rel="stylesheet" type="text/css" media="all">
<link href="http://fonts.googleapis.com/earlyaccess/nanumpenscript.css" rel="stylesheet" type="text/css">
        <style>
        .rounded{
           width:100px;
           height:100px;
        }
            h3{
                clear: left;
            }
            .img2{
                width: 120px;
                height: 120px;
            }
            .kind1{
                float: left;
            }
            .kind2{
                float: left;
            }
            .text_border {
   text-shadow: -1.5px 0 black, 0 1.5px black, 1.5px 0 black, 0 -1.5px black;
   -moz-text-shadow: -1.5px 0 black, 0 1.5px black, 1.5px 0 black, 0 -1.5px black;
   -webkit-text-shadow: -1.5px 0 black, 0 1.5px black, 1.5px 0 black, 0 -1.5px black;
}
            
        </style>
</head>
<!-- JAVASCRIPTS --> 
<script src="resources/bootstrap/layout/scripts/jquery.min.js"></script> 
<script src="resources/bootstrap/layout/scripts/supersized/supersized.min.js"></script> 

<body id="top">
<div class="wrapper row1">
  <header id="header" class="clear" style="width:92%;"> 
  <a href="./JoinMemberMV" style="float:right;">Join</a><a  href="./LoginMV"style="float:right;">Login　|　</a>
    <div id="logo">
      <a href="./"><img src="resources\bootstrap\images\img_t21_006.jpg" style="margin-left:11%; margin-top:2%; margin-bottom:2%;"/></a>
    </div>
    <nav id="mainav">
      <ul class="clear">
            <li><a href="./HomeInfoMV">홈페이지소개</a></li>
        <li class="active"><a href="./LaundryMethodMv">세탁방법안내</a></li>
        <li><a href="./shopListSelect">매장찾기</a>
        
          <!-- <ul>
            <li><a href="#">일반세탁소</a></li>
            <li><a class="drop" href="#">Level 2 + Drop</a>
              <ul>
                <li><a href="#">Level 3</a></li>
                <li><a href="#">Level 3</a></li>
              </ul>
            </li>
          </ul> -->
        </li>
        <li><a href="./NoticeManage">공지사항</a>
      <!--   <li><a href="#">Link Text</a></li>
        <li><a href="#">Link Text</a></li>
        <li><a href="#">Link Text</a></li>
        <li><a href="#">A Very Long Link Text</a></li> -->
      </ul>
    </nav>
  </header>
</div>
<div class="wrapper" style="background:white;height:1900px; padding-top: 10px;">
      <div id="method" style="margin-left:20%; margin-top:3%;">
      <h3>면</h3>
        <div class="kind1" style="margin-bottom:5%; margin-right:2%;">
            <img src="resources/bootstrap/images/면.PNG" class="img2"/>
        </div>
        <div class="kind1" style="margin-top:2%;">
            <p>-가볍고 내구성이 좋으며 흡수력과 통기성이 좋아 세탁에 뛰어난 소재</p>
            <p>-세탁기 세탁시 형태의 변형을 방지하기 위해 세탁망에 넣어서 세탁하는 것을 권장합니다.</p>
        </div>

        <h3>폴리에스테르</h3>
        <div class="kind1" style="margin-bottom:5%; margin-right:2%;">
            <img src="resources/bootstrap/images/폴리에스테르.PNG"  class="img2"/>
        </div>
        <div class="kind1" style="margin-top:2%;" > 
            <p>-형태의 틀어짐이 없고, 가볍고 부드러우며 구김이 가지 않는 소재</p>
            <p>-열에 약한 소재이므로 삶은 세탁은 피해주시고 미지근한 물에 중성세제로 세탁하는 것을 권장합니다.</p>
        </div>
    
        <h3>레이온</h3>
        <div class="kind1" style="margin-bottom:5%; margin-right:2%;">
            <img src="resources/bootstrap/images/레이온.PNG"  class="img2"/>
        </div>
        <div class="kind1" style="margin-top:2%;">
            <p>-촉감이 부드럽고 차가운 느낌의 소재로 광택이 감도는 소재</p>
            <p>-수축이 될 수 있으므로 드라이 크리닝을 권장합니다. 햇볕 아래가 아닌 그늘에서 건조 시켜주세요.</p>
        </div>
        
        <h3>린넨</h3>
        <div class="kind1" style="margin-bottom:5%; margin-right:2%;">
            <img src="resources/bootstrap/images/린넨.PNG"  class="img2"/>
        </div>
        <div class="kind1" style="margin-top:2%;">
            <p >-열전도율이 크고, 시원하고 편안해 여름 옷감으로 많이 쓰이는 소재</p>
            <p>-구김 심한 소재이므로 미지근한 물에 중성세제로 눌러짜듯 손세탁 해주시거나, 드라이크리닝 권장합니다.</p>
        </div>
        
        <h3>TR</h3>
        <div class="kind1" style="margin-bottom:5%; margin-right:2%;">
            <img src="resources/bootstrap/images/TR.PNG"  class="img2"/>
        </div>
        <div class="kind1" style="margin-top:2%;">
            <p>-폴리에스테르+레이온 형태의 틀어짐이 없고 구김이 가지 않는 소재</p>
            <p>-열에 약한소재이므로 삶는 세탁 해주시고 미지근한 물에 중성세제로 세탁하는 것을 권장합니다.</p>
        </div>
        
        <h3>아크릴</h3>
        <div class="kind1" style="margin-bottom:5%; margin-right:2%;">
            <img src="resources/bootstrap/images/아크릴.PNG" class="img2"/>
        </div>
        <div class="kind1" style="margin-top:2%;">
            <p>-울보다 내구성이 좋고 세탁 후 건조가 빠른 울과 유사한 소재</p>
            <p>-쉽게 수축되는 소재로 드라이크리닝 권장합니다. 손세탁시 미지근한 물에 울샴푸로 가볍게 눌러 세탁해주세요.</p>
        </div>
        
        <h3>나일론</h3>
        <div class="kind1" style="margin-bottom:5%; margin-right:2%;">
            <img src="resources/bootstrap/images/나일론.PNG" class="img2"/>
        </div>
        <div class="kind1" style="margin-top:2%;">
            <p>-탄력성, 보온성이 좋고 마찰에 강해 안감으로 많이 쓰이는 소재</p>
            <p>-중성, 약알칼리성 세제로 세탁해주세요. 표백제는 피해주세요.</p>
        </div>
        
        <h3>울</h3>
        <div class="kind1" style="margin-bottom:5%; margin-right:2%;">
            <img src="resources/bootstrap/images/울.PNG" class="img2"/>
        </div>
        <div class="kind1" style="margin-top:2%;">
            <p>-양털로 제작되어 보온성이 뛰어나고 신축성이 좋은 소재</p>
            <p>-장기간 착용을 위해 물세탁은 피해주시고 드라이크리닝 권장합니다.</p>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="wrapper row4" style="border-top-width: 0px;">
  <footer id="footer" class="clear" style="margin-left: 0px; margin-right: 0px;">
    <div class="one_third first" style=" width:26%; margin-right:7%; margin-left:6%;">
    <h6 class="title">STAFF</h6>
      <ul class="nospace clear ftgal">
        <li class="one_third first" style="margin-right:6px;"><a href="#"><img class="rounded" src="resources/bootstrap/images/images (1).jpg" alt=""></a></li>
        <li class="one_third" style="margin-right:6px;"><a href="#"><img class="rounded" src="resources/bootstrap/images/ky.jpg" alt=""></a></li>
        <li class="one_third"><a href="#"><img class="rounded" src="resources/bootstrap/images/sy.jpg" alt=""></a></li>
        <li class="one_third first" style="margin-right:6px;"><a href="#"><img class="rounded" src="resources/bootstrap/images/sr.jpg" alt=""></a></li>
        <li class="one_third" style="margin-right:6px;"><a href="#"><img class="rounded" src="resources/bootstrap/images/mk.jpg" alt=""></a></li>
        <li class="one_third"><a href="#"><img class="rounded" src="resources/bootstrap/images/yr.jpg" alt=""></a></li>
      </ul>
    </div>
    <div class="one_third" style="width:25%;margin-right: 3%; margin-left: 1%;">
      <h6 class="title">LAUNDRY METHOD</h6>
      <ul class="nospace clear">
        <li class="clear push30">
          <div class="imgl"><img class="rounded" style="width:140px; height:110px;" src="resources/bootstrap/images/다운로드.jpg" alt=""></div>
          <p class="nospace push15"><b>　　구두,운동화 </b><br/><br/>구두와 같은 가죽신발의 경우에는 물을 절대 사..<p class="nospace" ><a href="#" >Read more &raquo;</a></p></p>
        </li>
        <li class="clear">
          <div class="imgl"><img class="rounded" style="width:140px; height:110px;" src="resources/bootstrap/images/S12040_760.jpg" alt=""></div>
          <p class="nospace push15"><b>　　블라우스,셔츠 </b><br/><br/>드라이크리닝을 하는 것이 좋다. 손 빨래시에..<p class="nospace" ><a href="#" >Read more &raquo;</a></p></p>
        </li>
      </ul>
    </div>
    <div class="one_third" style="width:23%;margin-right: 3%;margin-left:5%;">
     <h6 class="title">COMPANY INFO</h6>
      <address class="push30">
      Company Name : 세탁소개팅<br>
      Street Name &amp; Number : <br/>인천 남구 학익동 매소홀로<br>
         태승빌딩 5층<br>
      Postcode/Zip : 22123
      </address>
      <ul class="nospace">
        <li class="push10"><span class="icon-time"></span> Mon. - Fri. 9:00am - 7:00pm</li>
        <li class="push10"><span class="icon-phone"></span> +08 (123) 456 7890</li>
        <li><span class="icon-envelope-alt"></span> tofha56@gmail.com</li>
      </ul>
    </div>
  </footer>
</div>
<div class="wrapper row5">
  <div id="copyright" class="clear"> 
    <p class="fl_left">Copyright &copy; 2017 - All Rights Reserved </p>
  </div>
</div>
</body>

</html>