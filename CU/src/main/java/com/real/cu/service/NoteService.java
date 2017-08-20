package com.real.cu.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.real.cu.bean.Coin;
import com.real.cu.bean.N_laundry;
import com.real.cu.bean.Note;
import com.real.cu.dao.NoteDao;


@Service
public class NoteService {

   @Autowired
   private HttpSession session;
   @Autowired
   private NoteDao nDao;
   @Autowired
   private HttpServletRequest req;

   private ModelAndView mav;
   public ModelAndView execute(int i) {
      switch(i){
      case 1:
         messageCheck();
         break;
      case 2:
         message();
         break;
      case 3:
         sendmessage();
         break;
      case 5:
         messagedelete();
         break;
      case 6:
         idSelect();
         break;
      case 7:
         recevidSelect();
         break;
      case 8:
         Messagedetail();
         break;
      case 9:
         realmessageSend();
         break;
         
         
      default:
         break;
      }
      return mav;
   }


   private void realmessageSend() {
      //String N_SENDID=(String) session.getAttribute("id");
      String n_sendid="aaa";
      String n_takeid=req.getParameter("n_takeid");
      String n_title=req.getParameter("n_title");
      String n_content=req.getParameter("n_content");
      Note nt=new Note();
      nt.setN_content(n_content);
      nt.setN_takeid(n_takeid);
      nt.setN_sendid(n_sendid);
      nt.setN_title(n_title);
      nDao.realmessageSend(nt);
      message();   }


   private void Messagedetail() {
      String N_code=req.getParameter("code");
      Note no=nDao.MessageDetail(N_code);
      nDao.MessageUpdate(N_code);
      String result=MessageDetailHtml(no);
      mav.addObject("result", result);
      mav.setViewName("Message");
   }
   private String MessageDetailHtml(Note no) {
      StringBuilder mb=new StringBuilder();
      mb.append("<h2>상세페이지<h2>");
      mb.append("<style> table,th,td{border : 3px solid black; width:550px; text-align:center;}</style>");
      mb.append("<table><tr><td>제목:"+no.getN_title()+"</td><td>보낸사람:"+no.getN_sendid()+"</td>");
      mb.append("<td>보낸날짜:"+no.getN_date()+"</td>");
      mb.append("<tr><td colspan='3'>보낸내용:"+no.getN_content()+"</td></tr></table>");
      mb.append("<input type='submit' onclick='messagelist();' value='목록'/>");
      return mb.toString();
   }
   private void recevidSelect() {
         mav=new ModelAndView();
         mav.addObject("n_takeid",req.getParameter("n_takeid"));
         mav.setViewName("messageSend");
      }

   private void messagedelete() {
      String[] code=req.getParameterValues("chkbox");
      Note no=new Note();
      for(int i=0;i<code.length;i++){
         no.setN_code(code[i]);
         nDao.Messagedelete(no);
      }
      message();
   }      
   private void idSelect() {
      mav=new ModelAndView();
      String selectresult = null;
      String n_takeid=req.getParameter("n_takeid");
      String choice=req.getParameter("choice");
      System.out.println(choice);
      if(n_takeid.equals("")){
         req.setAttribute("n_takeid", "검색할 이름을 입력하세요");
         mav.setViewName("messageSend");
      }else{
         if(choice.equals("laundry")){
            List<N_laundry> ms=nDao.laundryId(n_takeid);
            selectresult=selectresult(ms);
         }else if(choice.equals("coin")){
            System.out.println(n_takeid);
         List<Coin> co=nDao.coinId(n_takeid);
            selectresult=selectCoinresult(co);
      }
      mav.addObject("selectresult", selectresult);
      mav.setViewName("idSelect");
      }
   }
   
   private String selectCoinresult(List<Coin> co) {
      StringBuilder mb=new StringBuilder();
      String n_takeid=req.getParameter("n_takeid");
      mb.append("<h2 style='text-align:center'>"+n_takeid+"에대한 검색결과</h2>");
      for(int i=0; i<co.size(); i++){
         Coin msid = co.get(i);
         System.out.println(co.get(i).getCl_pid()+"머냐");
         mb.append("<div style='text-align:center'><a href='./recevidSelect?n_takeid="+msid.getCl_pid()+"' >"+msid.getCl_pid()+"</a></div><br/>");
      }
      return mb.toString();
   }


   private String selectresult(List<N_laundry> ms) {
      StringBuilder mb=new StringBuilder();
      String n_takeid=req.getParameter("n_takeid");
      mb.append("<h2 style='text-align:center'>"+n_takeid+"에대한 검색결과</h2>");
      for(int i=0; i<ms.size(); i++){
         N_laundry msid=null;
         msid.setNl_pid(ms.get(i).getNl_pid());
         mb.append("<div style='text-align:center'><a href='./recevidSelect?n_takeid="+msid.getNl_pid()+"' >"+msid.getNl_pid()+"</a></div><br/>");
      }
      return mb.toString();
   }
   private void sendmessage() {
      mav=new ModelAndView();
//      String id=(String)session.getAttribute("id");
      String id="aaa";
      List<Note> nt=nDao.sendmessage(id);
      System.out.println(nt.size());
      String ntlist=ntlistHtml(nt);
      mav.addObject("result",ntlist);
      mav.setViewName("Message");
   }
   private void message() {
      mav=new ModelAndView();
//      String id=(String)session.getAttribute("id");
      String id="aaa";
      List<Note> nt=nDao.messageForm(id);
      System.out.println(nt.get(0).getN_code());
      System.out.println("사이즈"+nt.size());
      String ntlist=ntlistHtml(nt);
      mav.addObject("result",ntlist);
      mav.setViewName("Message");
      
   }

   private String ntlistHtml(List<Note> nt) {
      StringBuilder mb=new StringBuilder();
      if(nt.size()==0){
         System.out.println("여긴가?");
      mb.append("<table>");
      mb.append("<tr><td><input type='checkbox' id='checkAll'></td><td>제목</td><td>보낸사람</td><td>날짜</td></tr>");
      mb.append("</table><br/><br/><input type='submit'  onclick='messageSend();' value='쪽지보내기'/>");
      }else{
         System.out.println("아님여기?");
         Note n=nt.get(0);
         if(n.getN_sendid().equals("aaa")){//(String)session.getAttribute("id")바꾸기
            /*mb.append("<h4>보낸쪽지함</h4>");*/
            mb.append("<table><<tr><td><input type='checkbox' id='checkAll'>");
            mb.append("</td><td>제목</td><td>받는사람</td><td>날짜</td></tr>");
            mb.append("</tr>");
            for(int i=0; i<nt.size();i++)
            {   
               Note ns=nt.get(i);
               mb.append("<tr><td><input type='checkbox' name='chkbox' id='chkbox' value='"+ns.getN_code()+"'></td>");
               mb.append("<td><a href='./Messagedetail?code="+ns.getN_code()+"'>"+ns.getN_title()+"</a></td>");
               mb.append("<td>"+ns.getN_takeid()+"</td>");
               mb.append("<td>"+ns.getN_date()+"</td></tr>");
            }
         }else{
            /*mb.append("<h4>받은쪽지함</h4>");*/
            mb.append("<table><thead><tr><td><input type='checkbox' id='checkAll'>");
            mb.append("</td><td>제목</td><td>보낸사람</td><td>날짜</td></tr>");
            for(int i=0; i<nt.size();i++){
               Note ns=nt.get(i);
            mb.append("<tr><td><input type='checkbox' name='chkbox' id='chkbox' value='"+ns.getN_code()+"'></td>");
            mb.append("<td><a href='./Messagedetail?code="+ns.getN_code()+"'>"+ns.getN_title()+"</a></td>");
            mb.append("<td>"+ns.getN_sendid()+"</td>");
            mb.append("<td>"+ns.getN_date()+"</td></tr>");
            }
         }
      
         mb.append("</table><hr/>");
         mb.append("<input type='submit'  onclick='messageSend();' value='쪽지보내기'/>");
         mb.append("<input type='submit' id='messagedelete' value='삭제'/>");
      }return mb.toString();
   }

   private void messageCheck() {
   mav=new ModelAndView();
//   String id=(String)session.getAttribute("id");
   String id="aaa";
   int count=nDao.messageCheck(id);
   String view=req.getParameter("view");
   mav.addObject("count",count);
   mav.setViewName(view);
   }
   }
