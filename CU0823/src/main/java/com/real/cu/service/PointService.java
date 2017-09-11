package com.real.cu.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.real.cu.bean.Member;
import com.real.cu.bean.Mileage;
import com.real.cu.bean.Pointhistory;
import com.real.cu.bean.Readypoint;
import com.real.cu.bean.Reservation;
import com.real.cu.bean.Return;
import com.real.cu.dao.PointDao;

@Service("pointservice")
public class PointService {
   private ModelAndView mav;
   
   @Autowired
   private HttpServletRequest req;
   @Autowired
   private HttpSession session;
   @Autowired
   private PointDao pdao;

   public ModelAndView execute(int i) {
      switch(i){
      case 1:
         myPoint();break;
      case 2:
         pointcharge();break;
      case 3:
         PointReturn();break;
      case 4:
         pointexchange();break;
      case 5:
         pointMm();break;
      case 6:
         pointRequest();break;
      case 7:
         pointAccept();break;
      case 8:
         pointMmSelect();break;
      case 9:
         pointAdmin();break;
      case 10:
         pointDelete();break;
      default:
         break;
      }
      return mav;
   }

   

   private void pointDelete() {
      mav = new ModelAndView();
      String view = null;
      String button = req.getParameter("button");
      System.out.println("button="+button);
      String arrStr = req.getParameter("arr");
      System.out.println("arrStr="+arrStr);
      String [] arr = arrStr.split(",");
      String nr_code = null;
      String rp_code = null;
      String member = null;
      String business = null;
      Pointhistory ph = new Pointhistory();
      Readypoint rp = new Readypoint();
      Reservation r = new Reservation();
      //0:nr_code(예약코드), 1:rp_code(대기코드), 2:멤버아이디, 3:사업자아이디
      if(button.equals("승인취소")){
         for(int i=0; i<arr.length; i++){
            if((i%4)==0){
               nr_code = arr[i];
            }else if((i%4)==1){
               rp_code = arr[i];
            }else if((i%4)==2){
               member = arr[i];
            }
         }
            //사업자회원 포인트 insert
            rp = pdao.readypointSelect(nr_code);
            ph.setPh_pid(rp.getRp_upid());
            ph.setPh_point(rp.getRp_point());
            ph.setPh_history(6);
            ph.setPh_process(nr_code);
            pdao.pointinsert(ph);
            //대기포인트 update
            rp.setRp_state(2);
            rp.setRp_code(rp_code);
            pdao.readypointUpdate(rp);
            //예약 update
            r.setNr_state(8);
            r.setNr_code(nr_code);
            pdao.reservationUpdate(r);
            //일반회원 포인트 update
            ph.setPh_pid(member);
            ph.setPh_process(nr_code);
            ph.setPh_history(6);
            pdao.pointUpdate(ph);
            
            view = "forward:/pointMmSelect?kind=최종";

      }else if(button.equals("승인후취소")){
         for(int i=0; i<arr.length; i++){
            if((i%4)==0){
               nr_code = arr[i];
            }else if((i%4)==1){
               rp_code = arr[i];
            }else if((i%4)==2){
               member = arr[i];
            }else if((i%4)==3){
               business = arr[i];
            }
         }
         //사업자회원 포인트 update
         ph.setPh_pid(business);
         ph.setPh_process(nr_code);
         ph.setPh_history(6);
         pdao.pointUpdate(ph);
         //대기포인트 update
         rp.setRp_code(rp_code);
         rp.setRp_state(2);
         pdao.readypointUpdate(rp);
         //예약 update
         r.setNr_code(nr_code);
         r.setNr_state(8);
         pdao.reservationUpdate(r);
         //일반회원 update
         ph.setPh_pid(member);
         ph.setPh_process(nr_code);
         ph.setPh_history(6);
         pdao.pointUpdate(ph);
         
         view = "forward:/pointMmSelect?kind=지급";
      }
      mav.setViewName(view);
   }

   private void pointAdmin() {
      mav = new ModelAndView();
      String view = null;
      String button = req.getParameter("button");
      System.out.println("button="+button);
      String arrStr = req.getParameter("arr");
      System.out.println("arrStr="+arrStr);
      String [] arr = arrStr.split(",");
      String nr_code = null;
      String rp_code = null;
      String member = null;
      String business = null;
      Pointhistory ph = new Pointhistory();
      Readypoint rp = new Readypoint();
      Reservation r = new Reservation();
      //0:nr_code(예약코드), 1:rp_code(대기코드), 2:멤버아이디, 3:사업자아이디
      if(button.equals("승인")){   
         for(int i=0; i<arr.length; i++){
            if((i%4)==0){
               nr_code = arr[i];
            }else if((i%4)==1){
               rp_code = arr[i];
               System.out.println("else if rp_code="+rp_code);
            }
         }
         //사업자회원 포인트 insert
         rp = pdao.readypointSelect(nr_code);
         ph.setPh_pid(rp.getRp_upid());
         ph.setPh_point(rp.getRp_point());
         ph.setPh_history(5);
         ph.setPh_process(nr_code);
         pdao.pointinsert(ph);
         //대기포인트 update
         rp.setRp_state(1);
         rp.setRp_code(rp_code);
         pdao.readypointUpdate(rp);
         //예약 update
         r.setNr_state(7);
         r.setNr_code(nr_code);
         pdao.reservationUpdate(r);
            
         view = "forward:/pointMmSelect?kind=최종";
      }else if(button.equals("다시승인")){
         for(int i=0; i<arr.length; i++){
            if((i%4)==0){
               nr_code = arr[i];
            }else if((i%4)==1){
               rp_code = arr[i];
            }else if((i%4)==2){
               member = arr[i];
            }else if((i%4)==3){
               business = arr[i];
            }
         }
         //사업자회원 포인트 update
         ph.setPh_pid(business);
         ph.setPh_process(nr_code);
         ph.setPh_history(5);
         pdao.pointUpdate(ph);
         //대기포인트 update
         rp.setRp_code(rp_code);
         rp.setRp_state(1);
         pdao.readypointUpdate(rp);
         //예약 update
         r.setNr_code(nr_code);
         r.setNr_state(7);
         pdao.reservationUpdate(r);
         //일반회원 update
         ph.setPh_pid(member);
         ph.setPh_process(nr_code);
         ph.setPh_history(1);
         pdao.pointUpdate(ph);
         
         view = "forward:/pointMmSelect?kind=승인취소";
      }
      mav.setViewName(view);
   }

   private void pointMmSelect() {
      mav = new ModelAndView();
      String kind = req.getParameter("kind");
      System.out.println("kind="+kind);
      Reservation nr = new Reservation();
      LinkedHashMap<String,Object> map = new LinkedHashMap<String,Object>();
      List<Reservation> nrlist = null;
      String sbplist = null;
      
      if(kind.equals("대기")){
         nrlist = pdao.reservationSelect(1);
         sbplist = sbplistHtml(nrlist,kind);
      }else if(kind.equals("취소")){
         nrlist = pdao.reservationSelect(2);
         sbplist = sbplistHtml(nrlist,kind);
      }else if(kind.equals("취소완료")){
         nrlist = pdao.reservationSelect(6);
         sbplist = sbplistHtml(nrlist,kind);
      }else if(kind.equals("진행")){
         map.put("i", 3);
         map.put("j", 4);
         nrlist = pdao.reservationSelect(map);
         sbplist = sbplistHtml(nrlist,kind);
      }else if(kind.equals("최종")){
         nrlist = pdao.reservationSelect(5);
         sbplist = sbplistHtml(nrlist,kind);
      }else if(kind.equals("지급")){
         nrlist = pdao.reservationSelect(7);
         sbplist = sbplistHtml(nrlist,kind);
      }else if(kind.equals("승인취소")){
         nrlist = pdao.reservationSelect(8);
         sbplist = sbplistHtml(nrlist,kind);
      }
      mav.addObject("sbplist", sbplist);
      mav.addObject("kind", kind);
      mav.setViewName("StandbyPoint");
   }

   private String sbplistHtml(List<Reservation> nrlist, String kind) {
      StringBuilder sb = new StringBuilder();
      sb.append("<table><tr>");
      if(kind.equals("최종") || kind.equals("지급") || kind.equals("승인취소")){
         sb.append("<td>선택</td>");
      }
      sb.append("<td>예약번호</td><td>이름</td><td>세탁소</td><td>날짜</td><td>포인트</td><td>현황</td></tr>");
      sb.append("<tr>");
      if(kind.equals("최종") || kind.equals("지급") || kind.equals("승인취소")){
         sb.append("<td></td>");
      }
      sb.append("<td></td><td>(연락처)</td><td>(연락처)</td><td></td><td></td><td></td></tr>");
      for(int i=0; i<nrlist.size(); i++){
         Reservation nr = nrlist.get(i);
         Readypoint rp = new Readypoint();
         rp = pdao.readypointSelect(nr.getNr_code());
         String laundryname = pdao.laundryNameSelect(nr.getNr_nlcode());
         String mphone = pdao.personPhoneSelect(rp.getRp_downid());
         String bphone = pdao.personPhoneSelect(rp.getRp_upid());
         String mph_code = null;
         String bph_code = null;
         LinkedHashMap<String,Object> map = new LinkedHashMap<String,Object>();
         if(kind.equals("최종") || kind.equals("지급") || kind.equals("승인취소")){
            map.put("ph_process", nr.getNr_code());
            map.put("ph_pid", rp.getRp_downid());
            if(pdao.phcodeSelect(map)!= null){
               System.out.println("member="+map.get("ph_pid"));
               mph_code = pdao.phcodeSelect(map);
            }
            map.put("ph_pid", rp.getRp_upid());
            System.out.println("business="+map.get("ph_pid"));
            if(pdao.phcodeSelect(map) != null){
               bph_code = pdao.phcodeSelect(map);
            }
         }
         sb.append("<tr>");
         if(kind.equals("최종") || kind.equals("승인취소") || kind.equals("지급")){
            sb.append("<td><input type='checkbox' name='choice' value='"+nr.getNr_code()+","+rp.getRp_code()+","+mph_code+","+bph_code+"'/></td>");
         }
         SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
         Date date1 = nr.getNr_date();
         String today = df.format(date1);
         sb.append("<td>"+today+"-"+nr.getNr_code()+"</td>");
         sb.append("<td>"+nr.getNr_pid()+"</td>");
         sb.append("<td>"+laundryname+"</td>");
         sb.append("<td>"+today+"</td>");
         sb.append("<td>"+rp.getRp_point()+"</td>");
         if(nr.getNr_state() == 1){
            sb.append("<td>수거전</td></tr>");
         }else if(nr.getNr_state() == 2){
            sb.append("<td>취소중</td></tr>");
         }else if(nr.getNr_state() == 3){
            sb.append("<td>세탁중</td></tr>");
         }else if(nr.getNr_state() == 4){
            sb.append("<td>배달중</td></tr>");
         }else if(nr.getNr_state() == 5){
            sb.append("<td>완료</td></tr>");
         }else if(nr.getNr_state() == 6){
            sb.append("<td>취소완료</td></tr>");
         }else if(nr.getNr_state() == 7){
            sb.append("<td>지급완료</td></tr>");
         }else if(nr.getNr_state() == 8){
            sb.append("<td>승인취소</td></tr>");
         }
         sb.append("<tr>");
         if(kind.equals("최종") || kind.equals("지급") || kind.equals("승인취소")){
            sb.append("<td></td>");
         }
         sb.append("<td></td><td>"+mphone+"</td><td>"+bphone+"</td><td></td><td></td><td></td></tr>");
      }
      sb.append("</table>");
      return sb.toString();
   }

   private void pointAccept() {
      mav = new ModelAndView();
      String arrStr = req.getParameter("arr");
      String [] arr = arrStr.split(",");
      Pointhistory ph = new Pointhistory();
      for(int i=0; i<arr.length; i++){
         int cnt = pdao.returnUpdate(arr[i]);
         if(cnt!=0){
            Return r = pdao.returnCodeSelect(arr[i]);
            System.out.println("pr_pid="+r.getPr_pid());
            ph.setPh_pid(r.getPr_pid());
            ph.setPh_point(r.getPr_point());
            if(r.getPr_flag() == 0){
               ph.setPh_history(2);
            }else if(r.getPr_flag() == 1){
               ph.setPh_history(3);
            }
            System.out.println("rcode="+r.getPr_code());
            ph.setPh_process(r.getPr_code());
            pdao.pointinsert(ph);
         }else{
            System.out.println("update 실패");
         }
      }
      mav.setViewName("forward:/pointRequest?kind=전체&state=처리전");
      
   }

   private void pointRequest() {
      mav = new ModelAndView();
      String kind = req.getParameter("kind");
      String state = req.getParameter("state");
      System.out.println("kind="+kind);
      System.out.println("state="+state);
      List<Return> rlist = null;
      LinkedHashMap<String,Object> rmap = new LinkedHashMap<String,Object>();
      String returnlist = null;
      if(kind.equals("전체")){
         if(state.equals("처리전")){
            rlist = pdao.returnAllSelect(0);
         }else if(state.equals("처리완료")){
            rlist = pdao.returnAllSelect(1);
         }
      }else if(kind.equals("일반")){
         if(state.equals("처리전")){
            rmap.put("state", 0);
            rmap.put("flag", 0);
            rlist = pdao.returnFlagSelect(rmap);
         }else if(state.equals("처리완료")){
            rmap.put("state", 1);
            rmap.put("flag", 0);
            rlist = pdao.returnFlagSelect(rmap);
         }
      }else if(kind.equals("사업자")){
         if(state.equals("처리전")){
            rmap.put("state", 0);
            rmap.put("flag", 1);
            rlist = pdao.returnFlagSelect(rmap);
         }else if(state.equals("처리완료")){
            rmap.put("state", 1);
            rmap.put("flag", 1);
            rlist = pdao.returnFlagSelect(rmap);
         }
      }
      returnlist = returnList(rlist);
      System.out.println("returnlist="+returnlist);
      mav.addObject("returnlist", returnlist);
      mav.addObject("kind", kind);
      mav.addObject("state", state);
      mav.setViewName("PointManage");
   }

   private String returnList(List<Return> rlist) {
      StringBuilder sb = new StringBuilder();
      sb.append("<table><tr><td>선택</td>");
      sb.append("<td>번호</td><td>분류</td><td>아이디</td><td>포인트</td><td>계좌번호</td><td>날짜</td><td>처리상태</td></tr>");
      for(int i=0; i<rlist.size(); i++){
         Return r = rlist.get(i);
         sb.append("<tr><td><input type='checkbox' name='choice' value='"+r.getPr_code()+"'/></td>");
         sb.append("<td>"+(i+1)+"</td>");
         if(r.getPr_flag() == 0){
            sb.append("<td>환불</td>");
         }else if(r.getPr_flag() == 1){
            sb.append("<td>환전</td>");
         }
         sb.append("<td>"+r.getPr_pid()+"</td>");
         sb.append("<td>"+r.getPr_point()+"</td>");
         sb.append("<td>"+r.getPr_banknum()+"</td>");
         sb.append("<td>"+r.getPr_date()+"</td>");
         if(r.getPr_state() == 0){
            sb.append("<td>처리전</td>");
         }else if(r.getPr_state() ==1){
            sb.append("<td>처리완료</td>");
         }
      }
      sb.append("</table>");
      return sb.toString();
   }

   private void pointMm() {
      mav = new ModelAndView();
      String id = "ddd";   //======================================session변경
      int kind = pdao.kindselect(id);
      String type = req.getParameter("type");
      List<Pointhistory> realplist = null;
      List<Return> realrlist = null;
      String pointList = null;
      
      List<Pointhistory> plist = pdao.pointselect(id);
      if(type.equals("전체내역")){
         pointList = pointListHtml(plist,kind);
      }else if(type.equals("수익내역")){
         realplist = pdao.pointPlusSelect(id);
         pointList = pointListHtml(realplist,kind);
      }else if(type.equals("환전내역")){
         realplist = pdao.pointMinusSelect(id);
         pointList = pointListHtml(realplist,kind);
      }
      
      calculationP(plist,kind);
      
      List<Return> rlist = pdao.returnselect(id);
      String returnList = returnListHtml(rlist);
      calculationR(rlist);
      
      mav.addObject("type", type);
      mav.addObject("pointList", pointList);
      mav.addObject("returnList", returnList);
      
      mav.setViewName("PointInfo");
      
   }

   private void calculationR(List<Return> rlist) {
      int returnplus = 0;
      
      for(int i=0; i<rlist.size(); i++){
         Return r = rlist.get(i);
         if(r.getPr_state() == 1){
            returnplus += r.getPr_point();
         }
      }
      
      mav.addObject("returnplus", returnplus);
   }

   private String returnListHtml(List<Return> rlist) {
      StringBuilder sb = new StringBuilder();
      sb.append("<table>");
      for(int i=0; i<rlist.size(); i++){
         Return r = rlist.get(i);
         if(r.getPr_state() == 0){
            sb.append("<tr><td>환전처리중</td><td>"+r.getPr_date()+"</td><td>"+r.getPr_point()+"</td></tr>");
         }else if(r.getPr_state() == 1){
            sb.append("<tr><td>환전완료</td><td>"+r.getPr_date()+"</td><td>"+r.getPr_point()+"</td></tr>");
         }
      }
      sb.append("</table>");
      return sb.toString();
   }

   private void pointexchange() {
      mav = new ModelAndView();
      String view = null;
      String id = "aaa";   //====================================session으로 변경
      String kind = req.getParameter("person");
      Return pr = new Return();
      pr.setPr_pid(id);
      pr.setPr_point(Integer.parseInt(req.getParameter("point")));
      pr.setPr_name(req.getParameter("name"));
      String phone = "0"+req.getParameter("first")+"-"+req.getParameter("second")+"-"+req.getParameter("third");
      System.out.println("phone="+phone);
      pr.setPr_phone("");
      pr.setPr_bank(req.getParameter("bank"));
      pr.setPr_banknum(req.getParameter("banknum"));
         
      if(kind.equals("개인")){
         pdao.memberReturnInsert(pr);
         view = "forward:/myPoint?type=전체내역";
      }else if(kind.equals("사업자")){
         pdao.businessReturnInsert(pr);
         view = "forward:/pointMm?type=전체내역";
      }
      mav.addObject("msg", "환불신청 되었습니다.");
      mav.setViewName(view);
      
   }

   private void PointReturn() {
      mav = new ModelAndView();
      String id = "aaa";   //==================================== session으로 변경
      int kind = pdao.kindselect(id);
      List<Pointhistory> plist = pdao.pointselect(id);
      calculationP(plist,kind);
      
      mav.addObject("kind", kind);
      mav.setViewName("PointReturn");
   }

   private void pointcharge() {
      mav = new ModelAndView();
      String id = "ddd";   //=========================================session으로 변경
      int point = Integer.parseInt(req.getParameter("point"));
      System.out.println("point="+point);
      Pointhistory ph = new Pointhistory();
      ph.setPh_pid(id);
      ph.setPh_point(point);
      ph.setPh_history(4);
      ph.setPh_process("");
      pdao.pointinsert(ph);
      
      mav.setViewName("forward:/myPoint?type=전체내역");
   }
   
   /*private void myPointChange() {
      mav = new ModelAndView();
      String kind = req.getParameter("kind");
      System.out.println("kind="+kind);
      String month = req.getParameter("month");
      System.out.println("month="+month);
      
      
   }*/

   @SuppressWarnings("null")
   private void myPoint() {
      mav = new ModelAndView();
      String id = "aaa";   //================================================session으로 변경
      String grade = pdao.memberselect(id);
      int kind = pdao.kindselect(id);
      String type = req.getParameter("type");
      //String month = req.getParameter("month");
      String pointList = null; 
      String mileageList = null;
      List<Pointhistory> realplist = null;
      List<Mileage> realmlist = null;
      Mileage m = new Mileage();
      
      List<Pointhistory> plist = pdao.pointselect(id);
      List<Mileage> mlist= pdao.mileageselect(id);
      if(type.equals("전체내역")){
         pointList = pointListHtml(plist,kind);
         if(kind == 1){
            mileageList = mileageListHtml(mlist);
         }
      }else if(type.equals("사용내역")){
         realplist = pdao.pointPlusSelect(id);
         pointList = pointListHtml(realplist,kind);
         if(kind == 1){
            m.setMg_pid(id);
            m.setMg_updown(1);
            realmlist = pdao.mileagePlmiSelect(m);
            mileageList = mileageListHtml(realmlist);
         }
      }else if(type.equals("적립내역")){
         realplist = pdao.pointMinusSelect(id);
         pointList = pointListHtml(realplist,kind);
         if(kind == 1){
            m.setMg_pid(id);
            m.setMg_updown(0);
            realmlist = pdao.mileagePlmiSelect(m);
            mileageList = mileageListHtml(realmlist);
         }
      }
      
      calculationP(plist,kind);
      if(kind == 1){
         calculationM(mlist);
      }
      
      mav.addObject("type", type);
      mav.addObject("grade", grade);
      mav.addObject("pointList", pointList);
      mav.addObject("mileageList", mileageList);
      
      mav.setViewName("Point");
   }

   /*for(int i=0; i<plist.size(); i++){
               Pointhistory ph = plist.get(i);
               if(dateCal(ph.getPh_date(),1)){
                  realplist.add(plist.get(i));
               }
            }
            pointList = pointListHtml(realplist,kind);
            for(int i=0; i<mlist.size(); i++){
               Mileage m = mlist.get(i);
               if(dateCal(m.getMg_date(),1)){
                  realmlist.add(mlist.get(i));
               }
            }
            mileageList = mileageListHtml(realmlist);
    * 
    * private boolean dateCal(Date ph_date, int i) {
      //비교일
      Calendar c = Calendar.getInstance();
      c.setTime(new Date());
      //기준일
      if(i == 1){
         c.add(Calendar.MONTH, -3);
         if(Check(c.getTime(),ph_date)){
            return true;
         }
      }else if(i == 2){
         c.add(Calendar.MONTH, -6);
         if(Check(c.getTime(),ph_date)){
            return true;
         }
      }
      return false;
   }

   private boolean Check(Date date, Date ph_date) {
      if(date.compareTo(ph_date)>0){
         return true;
      }else if(date.compareTo(ph_date)<0){
         return false;
      }else{
         return true;
      }
   }*/



   private void calculationM(List<Mileage> mlist) {
      int mileageplus = 0;
      int mileageminus = 0;
      int mileagetotal = 0;
      for(int i=0; i<mlist.size(); i++){
         Mileage m = mlist.get(i);
         if(m.getMg_history() == 0){
            mileageplus += m.getMg_mileage();
         }else if(m.getMg_history() == 1){
            mileageplus += m.getMg_mileage();
         }else if(m.getMg_history() == 2){
            mileageminus += m.getMg_mileage();
         }
      }
      mileagetotal = mileageplus - mileageminus;
      mav.addObject("mileagetotal", mileagetotal);
   }

   private void calculationP(List<Pointhistory> plist, int kind) {
      int pointplus = 0;
      int pointminus = 0;
      int pointtotal = 0;
      if(kind ==1){
         for(int i=0; i<plist.size(); i++){
            Pointhistory ph = plist.get(i);
            if(ph.getPh_history() == 0){
               pointminus += ph.getPh_point();
            }else if(ph.getPh_history() == 1){
               pointplus+=ph.getPh_point();
            }else if(ph.getPh_history() == 2){
               pointminus += ph.getPh_point();
            }else if(ph.getPh_history() == 4){
               pointplus += ph.getPh_point();
            }
            
         }
      }else if(kind ==2){
         for(int i=0; i<plist.size(); i++){
            Pointhistory ph = plist.get(i);
            if(ph.getPh_history() == 3){
               pointminus += ph.getPh_point();
            }else if(ph.getPh_history() == 5){
               pointplus+=ph.getPh_point();
            }
            
         }
      }
      pointtotal = pointplus - pointminus;
      mav.addObject("pointtotal", pointtotal);
      
   }

   private String mileageListHtml(List<Mileage> mlist) {
      StringBuilder sb = new StringBuilder();
      
      sb.append("<table>");
      for(int i=0; i<mlist.size(); i++){
         Mileage m = mlist.get(i);
         SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
         Date date1 = m.getMg_date();
         String today = df.format(date1);
         if(m.getMg_history() == 0){
            sb.append("<tr><td>결제</td><td>"+today+"</td><td>+"+m.getMg_mileage()+"</td></tr>");
         }else if(m.getMg_history() == 1){
            sb.append("<tr><td>리뷰</td><td>"+today+"</td><td>+"+m.getMg_mileage()+"</td></tr>");
         }else if(m.getMg_history() == 2){
            sb.append("<tr><td>사용</td><td>"+today+"</td><td>-"+m.getMg_mileage()+"</td></tr>");
         }
      }
      sb.append("</table>");
      return sb.toString();
   }

   private String pointListHtml(List<Pointhistory> plist, int kind) {
      StringBuilder sb = new StringBuilder();
      if(kind == 1){
         sb.append("<table>");
         for(int i=0; i<plist.size(); i++){
            Pointhistory ph = plist.get(i);
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date date1 = ph.getPh_date();
            String today = df.format(date1);
            if(ph.getPh_history() == 0){
               sb.append("<tr><td>결제</td><td>"+today+"</td><td>-"+ph.getPh_point()+"</td></tr>");
            }else if(ph.getPh_history() == 1){
               sb.append("<tr><td>결제취소</td><td>"+today+"</td><td>+"+ph.getPh_point()+"</td></tr>");
            }else if(ph.getPh_history() == 2){
               sb.append("<tr><td>환불</td><td>"+today+"</td><td>-"+ph.getPh_point()+"</td></tr>");
            }else if(ph.getPh_history() == 4){
               sb.append("<tr><td>충전</td><td>"+today+"</td><td>+"+ph.getPh_point()+"</td></tr>");
            }
            
         }
         sb.append("</table>");
      }else if(kind == 2){
         sb.append("<table>");
         for(int i=0; i<plist.size(); i++){
            Pointhistory ph = plist.get(i);
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date date1 = ph.getPh_date();
            String today = df.format(date1);
            if(ph.getPh_history() == 3){
               sb.append("<tr><td>환전</td><td>"+today+"</td><td>-"+ph.getPh_point()+"</td></tr>");
            }else if(ph.getPh_history() == 5){
               sb.append("<tr><td>세탁완료</td><td>"+today+"</td><td>+"+ph.getPh_point()+"</td></tr>");
            }
            
         }
         sb.append("</table>");
      }
      return sb.toString();
   }
   

}