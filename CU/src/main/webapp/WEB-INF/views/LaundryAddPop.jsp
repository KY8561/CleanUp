<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
   //자동으로 팝업 창이 닫히게 하는 함수
   function closePop(form) {
      //form의 target을 부모 창으로 설정함
      form.target = opener.name;
      form.submit();
      if (opener != null) {
         opener.insert = null;
         self.close();
      }
   }
   
   
</script>

</head>
<body>
   <form action="/" name="donateForm">
      <table id="example">
         <tr>
            <td>품목 <select name="first" id="first" onchange=firstChange()
               size=1>
                  <option value="품목">품목</option>
                  <option value="상의">상의</option>
                  <option value="하의/원피스">하의/원피스</option>
                  <option value="아우터">아우터</option>
                  <option value="침구류">침구류</option>
                  <option value="신발">신발</option>
                  <option value="액세서리/기타">액세서리/기타</option>
                  <option value="리빙">리빙</option>
                  <option value="특수 의류">특수 의류</option>
                  <option value="스포츠 웨어">스포츠 웨어</option>
                  <option value="한복">한복</option>
            </select> <select name="second" id="second" size=1>
                  <option value='품목을 먼저 선택하세요'>품목을 먼저 선택하세요</option>
            </select> <input type="text" name="price" placeholder="가격(숫자만 입력)" /> <input
               type="button" onclick="additem()" id="addItemBtn" value="+" />
            </td>
         </tr>
      </table>
   </form>
   <form name="HandleForm" target="LaundryAdd.jsp">
      <table id="itemadd">
         <tr id="item0">
            <td>품목</td>
            <td>종류</td>
            <td>가격</td>
            <td>삭제</td>
         </tr>
         ${handleupdate }
      </table>
      <div id='deleteitem'></div>
      <input type="hidden" name="arr" id="arr"/>
      <input type="button" onclick="addHandle()" value="등록" />
      <input type="hidden" id="nl_code" name="nl_code" value="${nl_code}"/>
      <input type="hidden" id="nl_name" name="nl_name" value="${nlMap.nl_name}"/>
      <input type="hidden" id="post" name="post" value="${nlMap.post}"/>
      <input type="hidden" id="addr1" name="addr1" value="${nlMap.addr1}"/>
      <input type="hidden" id="addr2" name="addr2" value="${nlMap.addr2}"/>
      <input type="hidden" id="first" name="first" value="${nlMap.first}"/>
      <input type="hidden" id="second" name="second" value="${nlMap.second}"/>
      <input type="hidden" id="third" name="third" value="${nlMap.third}"/>
      <input type="hidden" id="nl_open" name="nl_open" value="${nlMap.nl_open}"/>
      <input type="hidden" id="nl_close" name="nl_close" value="${nlMap.nl_close}"/>
      <input type="hidden" id="nl_repair" name="nl_repair" value="${nlMap.nl_repair}"/>
      <input type="hidden" id="nl_timelap" name="nl_timelap" value="${nlMap.nl_timelap}"/>
      <input type="hidden" id="nl_qty" name="nl_qty" value="${nlMap.nl_qty}"/>
      <input type="hidden" id="nl_content" name="nl_content" value="${nlMap.nl_content}"/>
      <input type="hidden" id="kind" name="kind" value="${kind}"/>
   </form>
</body>
<script>
   var arr = [];
   var arrStr;
   function addHandle() {
      $('#itemadd input').each(function(i) {//추가된 아이템
         arr.push($(this).val());
      });
      arrStr = arr.toString();
      $('#arr').val(arrStr);
      
      var nl_code = $("#nl_code").val();
      var nl_name = $("#nl_name").val();
      var post = $("#post").val();
      var addr1 = $("#addr1").val();
      var addr2 = $("#addr2").val();
      var first = $("#first").val();
      console.log(first);
      var second = $("#second").val();
      var third = $("#third").val();
      var nl_open = $("#nl_open").val();
      var nl_close = $("#nl_close").val();
      var nl_repair = $("#nl_repair").val();
      var nl_timelap = $("#nl_timelap").val();
      var nl_qty = $("#nl_qty").val();
      var nl_content = $("#nl_content").val();
      var kind = $("#kind").val();
      document.HandleForm.action = "possibleItem?nl_name="+nl_name+"&post="+post+"&addr1="+addr1+"&addr2="+addr2+"&first="+first+"&second="+second+"&third="+third+"&nl_open="+nl_open+"&nl_close="+nl_close+"&kind="+kind;
      document.HandleForm.submit();
      self.close();
   }

   function additem() {
      var first = $('select[name=first]').val();
      var second = $('select[name=second]').val();
      var price = $('input[name=price]').val();

      // tr태그의 마지막 번째를 구해 id="item"의 형태로 만들어 lastItemNo에 대입
      var lastItemNo = $("#itemadd tr:last").attr("id").replace("item", "");
      console.log(lastItemNo);
      //새로 추가 할 경우 두번째 tr 값을 복사하여 newitem변수에 대입
      var newitem = '<tr id="item' + (parseInt(lastItemNo) + 1)
            + '"><td><input type="text" name="one'
            + (parseInt(lastItemNo) + 1) + '" value="' + first
            + '" disabled/></td><td><input type="text" name="two'
            + (parseInt(lastItemNo) + 1) + '" value="' + second
            + '" disabled/></td><td><input type="text" name="price'
            + (parseInt(lastItemNo) + 1) + '" value="' + price
            + '" disabled/></td><td><button onclick="removeitem('
            + (parseInt(lastItemNo) + 1) + ')">-</button></td></tr>';
      /* var newitem = '<tr id="item'+(parseInt(lastItemNo)+1)+'"><td><input type="text" name="test" id="test" value="'
        +first+'" disabled/></td><td><input type="text" name="test" id="test" value="'+second
        +'" disabled/></td><td><input type="text" name="test" id="test value="'+price+'" disabled/></td><td><input type="button" onclick="removeitem('
      +(parseInt(lastItemNo)+1)+')" value="-"/></td></tr>; */
      $('#itemadd').append(newitem);
      $('input[name=price]').val('');
   }
   
   function removerealitem(elem){
      $('#item'+elem).remove();
   }
   function removeitem(elem) {
      $('#item'+elem).remove();
   }

   function firstChange() {// 대분류 변한 경우
      var x = document.donateForm.first.options.selectedIndex;//선택한 인덱스
      var groups = document.donateForm.first.options.length;//대분류 갯수
      var group = new Array(groups);//배열 생성
      for (i = 0; i < groups; i++) {
         group[i] = new Array();
      }//for
      // 옵션(<option>) 생성
      group[0][0] = new Option("대분류를 먼저 선택하세요", "");
      group[1][0] = new Option("상의 선택");
      group[1][1] = new Option("셔츠");
      group[1][2] = new Option("티셔츠");
      group[1][3] = new Option("후드티");
      group[1][4] = new Option("블라우스");
      group[1][5] = new Option("니트/스웨터");
      group[1][6] = new Option("가디건");
      group[1][7] = new Option("조끼");
      group[2][0] = new Option("하의/원피스 선택");
      group[2][1] = new Option("바지");
      group[2][2] = new Option("스커트");
      group[2][3] = new Option("원피스/점프수트");
      group[3][0] = new Option("아우터 선택");
      group[3][1] = new Option("정장 상의");
      group[3][2] = new Option("자켓");
      group[3][3] = new Option("점퍼/야상");
      group[3][4] = new Option("반코트");
      group[3][5] = new Option("일반코트");
      group[3][6] = new Option("트렌치코트");
      group[3][7] = new Option("롱코트");
      group[3][8] = new Option("패딩 조끼");
      group[3][9] = new Option("패딩 점퍼");
      group[3][10] = new Option("패딩 코트");
      group[3][11] = new Option("방한패딩/다운패딩");
      group[4][0] = new Option("침구류 선택");
      group[4][1] = new Option("베개 커버");
      group[4][2] = new Option("얇은 이불류(소=아동,싱글)");
      group[4][3] = new Option("얇은 이불류(중=더블,퀸)");
      group[4][4] = new Option("얇은 이불류(대=킹 이상)");
      group[4][5] = new Option("두꺼운 이불류(소)");
      group[4][6] = new Option("두꺼운 이불류(중)");
      group[4][7] = new Option("두꺼운 이불류(대)");
      group[4][8] = new Option("거위/오리털(소)");
      group[4][9] = new Option("거위/오리털(중)");
      group[4][10] = new Option("거위/오리털(대)");
      group[4][11] = new Option("양모솜 이불(소)");
      group[4][12] = new Option("양모솜 이불(중)");
      group[4][13] = new Option("양모솜 이불(대)");
      group[4][14] = new Option("실크 이불(소)");
      group[4][15] = new Option("실크 이불(중)");
      group[4][16] = new Option("실크 이불(대)");
      group[4][17] = new Option("알러지케어 패드(소)");
      group[4][18] = new Option("알러지케어 패드(중)");
      group[4][19] = new Option("알러지케어 패드(대)");
      group[4][20] = new Option("알러지케어 이불(소)");
      group[4][21] = new Option("알러지케어 이불(중)");
      group[4][22] = new Option("알러지케어 이불(대)");
      group[5][0] = new Option("신발 선택");
      group[5][1] = new Option("운동화/스티커즈");
      group[5][2] = new Option("캐쥬얼 샌들/슬리퍼");
      group[5][3] = new Option("구두/로퍼");
      group[5][4] = new Option("등산화");
      group[5][5] = new Option("부츠화");
      group[5][6] = new Option("롱부츠");
      group[5][7] = new Option("어그부츠");
      group[5][8] = new Option("가죽부츠(발목)");
      group[5][9] = new Option("가죽롱부츠");
      group[6][0] = new Option("액세서리/기타 선택");
      group[6][1] = new Option("넥타이/보타이");
      group[6][2] = new Option("스카프");
      group[6][3] = new Option("목도리");
      group[6][4] = new Option("다림질만(손다림질)");
      group[7][0] = new Option("리빙 선택");
      group[7][1] = new Option("단모러그(120cm이하)");
      group[7][2] = new Option("단모러그");
      group[7][3] = new Option("장모러그(120cm이하)");
      group[7][4] = new Option("장모러그");
      group[7][5] = new Option("발매트");
      group[7][6] = new Option("원룸커튼(초소형)");
      group[7][7] = new Option("커튼(일반)");
      group[7][8] = new Option("커튼(속커튼)");
      group[7][9] = new Option("쿠션커버(소형)");
      group[7][10] = new Option("쿠션커버(50~60cm)");
      group[7][11] = new Option("쿠션커버(대형)");
      group[7][12] = new Option("쇼파커버(2인)");
      group[7][13] = new Option("쇼파커버(3인)");
      group[8][0] = new Option("특수 의류 선택");
      group[8][1] = new Option("가죽 상의");
      group[8][2] = new Option("가죽 바지");
      group[8][3] = new Option("가죽 스커트류");
      group[8][4] = new Option("가죽 점퍼/자켓류");
      group[8][5] = new Option("가죽 코트");
      group[8][6] = new Option("가죽 롱코트");
      group[8][7] = new Option("네오프렌 티셔츠");
      group[8][8] = new Option("네오프렌 스커트");
      group[8][9] = new Option("네오프렌 원피스");
      group[8][10] = new Option("네오프렌 점퍼/자켓");
      group[8][11] = new Option("네오프렌 코트");
      group[9][0] = new Option("스포츠 웨어 선택");
      group[9][1] = new Option("트레이닝/요가 상의");
      group[9][2] = new Option("트레이닝/요가 하의");
      group[9][3] = new Option("수영복(남/녀)");
      group[9][4] = new Option("다이빙/서핑 수트 상의");
      group[9][5] = new Option("다이빙/서핑 수트 하의");
      group[9][6] = new Option("다이빙/서핑 수트 전신");
      group[9][7] = new Option("래쉬가드 상의");
      group[9][8] = new Option("래쉬가드 하의");
      group[9][9] = new Option("낚시/등산복 상의");
      group[9][10] = new Option("낚시/등산복 하의");
      group[9][11] = new Option("낚시/등산복 조끼");
      group[10][0] = new Option("한복 선택");
      group[10][1] = new Option("한복 속저고리/속바지");
      group[10][2] = new Option("한복 조끼");
      group[10][3] = new Option("한복 저고리, 당의");
      group[10][4] = new Option("마고자");
      group[10][5] = new Option("두루마기");
      group[10][6] = new Option("한복 바지");
      group[10][7] = new Option("한복 속치마");
      group[10][8] = new Option("동정 교체");
      group[10][9] = new Option("한복 악세사리");

      temp = document.donateForm.second;//두번 째 셀렉트 얻기(<select name=second>)
      for (m = temp.options.length - 1; m > 0; m--) {//현재 값 지우기
         temp.options[m] = null
      }
      for (i = 0; i < group[x].length; i++) {//값 셋팅
         //예) <option value="ss">삼성</option>
         temp.options[i] = new Option(group[x][i].text, group[x][i].value);
      }
      temp.options[0].selected = true//인덱스 0번째, 즉, 첫번째 선택
   }
   
</script>
</html>