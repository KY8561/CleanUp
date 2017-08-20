package com.real.cu.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.real.cu.bean.Image;
import com.real.cu.bean.N_laundry;
import com.real.cu.bean.Person;
import com.real.cu.bean.Request;
import com.real.cu.bean.Review;
import com.real.cu.dao.BoardDao;
import com.real.cu.dao.LaundryDao;


@Service
public class BoardService {

   @Autowired
   private HttpSession session;
   @Autowired
   private BoardDao bDao;
   @Autowired
   private HttpServletRequest req;
   
   private ModelAndView mav;
   public ModelAndView execute(int i) {
      switch(i){
      case 1:
         myActivity();
         break;
      case 2:
         myActivitySelect();
         break;
      case 3:
         reviewChange();
         break;
      case 5:
         shopReview();
         break;
      case 6:
         shopReview();
         break;
     
		case 18:
			requestCheck();
			break;
		case 19:
			requestSelect();
			break;
		case 10:
			test();
			break;
		
		default:
         break;
      }
      return mav;
   }


private void requestSelect() {
	mav = new ModelAndView();
	int select = Integer.parseInt(req.getParameter("sele"));
	System.out.println(select);
	System.out.println("선택됨");

}

private void requestCheck() {
	mav = new ModelAndView();
	List<Request> relist = bDao.requestCheck();
	List<Person> plist = getperson(relist);

	System.out.println(plist);

	String html = requestHtml(relist,plist);
	mav.addObject("test",html);
	mav.setViewName("RequestCheck");
}


private List<Person> getperson(List<Request> relist) {
	Request re = new Request();
	List<Person> plist = new ArrayList<Person>();
	for(int i=0;i<relist.size();i++){
		re = relist.get(i);
		plist.addAll(bDao.getperson(re.getR_pid()));
	}
	return plist;
}

private String requestHtml(List<Request> relist, List<Person> plist) {
	StringBuilder sb = new StringBuilder();
	Request re = new Request();
	Person p = new Person();
	for(int i=0; i<relist.size(); i++){
		re=relist.get(i);
		p=plist.get(i);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date = re.getR_date();
		String day = df.format(date);

		sb.append("<tr><td><input type='checkbox' value='i'></td>");        
		sb.append("<td>"+re.getR_pid()+"</td>");
		sb.append("<td>"+p.getP_name()+"</td>");
		sb.append("<td>"+p.getP_phone()+"</td>");
		sb.append("<td>"+re.getR_state()+"</td>");
		sb.append("<td>"+day+"</td>");
		sb.append("<td><input type='button' value='답변보기' id='i'></td></tr>");
	}
	return sb.toString();
}

private void test() {
	mav = new ModelAndView();
	System.out.println("서비스탐");
	mav.setViewName("NoticeManage");
}
   private void reviewadd(MultipartHttpServletRequest multi) throws IllegalStateException, IOException {
      mav=new ModelAndView();
//      String id=(String)session.getAttribute("id");
      String id="aaa";
      Review re=new Review();
      re.setRe_pid(id);
      re.setRe_content(multi.getParameter("re_content"));
      re.setRe_nlcode(multi.getParameter("re_nlcode"));
      re.setRe_nrcode(multi.getParameter("re_nrcode"));
      System.out.println(multi.getParameter("re_star"));
      re.setRe_star(Integer.parseInt(multi.getParameter("re_star")));
      bDao.reviewadd(re);
      fileUp(multi,re.getRe_code());
      mav.setViewName("MyActivity");
   }
   public void fileUp(MultipartHttpServletRequest multi, String code) throws IllegalStateException, IOException{
      //1.저장경로 찾기
      System.out.println("안넘어와?");
      String root=multi.getSession().getServletContext().getRealPath("/");   //물리적인 주소
      System.out.println(root);
      String path=root+"/resources/upload/";
      /*String path="C://Users/Administrator/Documents/세탁소개팅/CU/src/main/webapp/resources/upload";   //fullPath와 동일
       */      
       //2.폴더 생성을 꼭 할것...
       File dir=new File(path);
       if(!dir.isDirectory()){  //upload 폴더 없다면
          dir.mkdir();  //upload 폴더 생성
       }
       //3.파일을 가져오기-일태그 이름들 반환
       Iterator<String> files=multi.getFileNames();   //파일 업로드 2개 이상일때
       while(files.hasNext()){
          LinkedHashMap<String,String> fMap=new LinkedHashMap<String, String>();
          String fileTagName=files.next();
          //파일 메모리에 저장
          MultipartFile mf=multi.getFile(fileTagName);   //실제 파일에 대한 모든 정보 담음
          String oriFileName=mf.getOriginalFilename();   //a.txt
          /*fMap.put("oriFileName", oriFileName);*/
          //4.시스템파일이름 생성  a.txt  ==>112323242424.txt
          String sysFileName=System.currentTimeMillis()+"."
                +oriFileName.substring(oriFileName.lastIndexOf(".")+1);
          if(sysFileName.contains("jpg")){
             System.out.println("안되는거!!");
          System.out.println(sysFileName);
          fMap.put("img_name", sysFileName);
          fMap.put("img_board", code);
          fMap.put("img_code",null);
         
             bDao.reviewPictureAdd(fMap);
             //5.메모리->실제 파일 업로드
             try {
                mf.transferTo(new File(path+sysFileName));

             }catch (IOException e) {
                e.printStackTrace();
             }
             }
          }
       }

   

   private void shopReview() {
      mav=new ModelAndView();
      String re_nlcode=req.getParameter("re_nlcode");
      String re_nrcode=req.getParameter("re_nrcode");
      System.out.println(re_nlcode+"111"+re_nrcode);
      N_laundry LaundryInfo=bDao.shopInfo(re_nlcode);
      System.out.println(LaundryInfo.getNl_code()+"code");
      String Ldinfo=LdInfoHtml(LaundryInfo);
      mav.addObject("Ldinfo",Ldinfo);
      mav.addObject("re_nrcode",re_nrcode);
      mav.setViewName("Review");
   }
   private void reviewChange() {
      mav=new ModelAndView();
      String re_code=req.getParameter("re_code");
      System.out.println(re_code);
      N_laundry LaundryInfo=bDao.LaundryInfo(re_code);
      Review re=bDao.reviewInfo(re_code);
      List<Image> img=bDao.ImageSelect(re_code);
      String Ldinfo=LdInfoHtml(LaundryInfo);
      String reInfo=reInfoHtml(re,img);
      mav.addObject("Ldinfo",Ldinfo);
      mav.addObject("reInfo",reInfo);
      mav.setViewName("ReviewUpdate");
   }
   private String reInfoHtml(Review re, List<Image> img) {
      StringBuilder mb=new StringBuilder();
      for(int i=0; i<img.size(); i++){
         Image image=img.get(i);
         System.out.println(image.getImg_name());
         mb.append("<p><input type='hidden' name='img_name"+i+"' value='"+image.getImg_code()+"'/>");
         mb.append("<img src='resources/upload/"+image.getImg_name()+"' width='50' height='50'/>");
         mb.append("<a href='#this'class='btn' id='delete' name='delete'>삭제</a></p>");
      }
      mb.append("<input type='text' name='re_star' value='"+re.getRe_star()+"'>");
      mb.append("<input type='hidden' name='re_code' value='"+re.getRe_code()+"'>");
      mb.append("<textarea rows='10' cols='40' name='re_content' >"+re.getRe_content()+"</textarea>");
      return mb.toString();
   }

   private void myActivitySelect() {
      mav=new ModelAndView();
//      String id=(String)session.getAttribute("id");
      String id="aaa";
      String choice=req.getParameter("myActivity");
      if(choice.equals("review") || choice.equals("all") || choice==null){
         myActivity();
      }else if(choice.equals("Request")){
         List<Request> re=bDao.selectRequest(id);
         String myActivity=myBoardRequestHtml(re);
         mav.addObject("myActivity",myActivity);
         mav.setViewName("MyActivity");

      }
   }

   private String LdInfoHtml(N_laundry nl) {
      StringBuilder sb=new StringBuilder();
      sb.append("<h3>"+nl.getNl_name()+"</h3>");
      sb.append("주소 : "+nl.getNl_address()+"<br/>");
      sb.append("연락처 : "+nl.getNl_phone()+"<br/>");
      sb.append("영업시간 : 오픈"+nl.getNl_open()+"~마감"+nl.getNl_close()+"<br/>");
      sb.append("<table><tr><td colspan='3'>상세가격</td></tr>");
      sb.append("</table>");
      sb.append("<h3>세탁소 홍보글</h3>");
      sb.append("<p>"+nl.getNl_content()+"</p>");
      sb.append("<input type='hidden' name='re_nlcode' value='"+nl.getNl_code()+"'>");
      return sb.toString();
   }
   
   private String myBoardRequestHtml(List<Request> re) {
      StringBuilder mb=new StringBuilder();
      if(re.size()==0){
         mb.append("문의글이 없습니다.");
      }else{
            for(int i=0; i<re.size();i++){   
               Request rq=re.get(i);
               mb.append("<hr/><input type='text' value='"+rq.getR_date()+"'/><br/>");
               mb.append("<input type='text' value='"+rq.getR_title()+"'/>");
               mb.append(rq.getR_content());
               mb.append(rq.getR_state());
            }
      }return mb.toString();
   }
   private void myActivity() {
      mav=new ModelAndView();
//      String id=(String)session.getAttribute("id");
      String id="aaa";
      List<Review> nt=bDao.selectReview(id);
      String myActivity=myBoardReviewHtml(nt);
      mav.addObject("myActivity",myActivity);
      mav.setViewName("MyActivity");

   }
   private String myBoardReviewHtml(List<Review> nt) {
      StringBuilder mb=new StringBuilder();
      if(nt.size()==0){
         mb.append("리뷰활동이 없습니다.");
      }else{
            for(int i=0; i<nt.size();i++){   
               Review rv=nt.get(i);
               mb.append("<hr/><input type='text' value='"+rv.getRe_date()+"'/><br/>");
               mb.append("<input type='text' name='re_star' value='"+rv.getRe_star()+"'/>");
               mb.append("<textarea rows='10' cols='40' name='re_content'>"+rv.getRe_content()+"</textarea>");
               mb.append("<a href='./reviewChange?re_code="+rv.getRe_code()+"'>수정</a>");
            }
      }return mb.toString();
   }
   public ModelAndView execute(MultipartHttpServletRequest multi, int cmd) throws IllegalStateException, IOException {
      switch(cmd){
      case 1:
         reviewUpdate(multi);
         break;
      case 2:
         reviewadd(multi);
         break;
      default:
         break;
      }
      return mav;
   }
   private void reviewUpdate(MultipartHttpServletRequest multi) throws IllegalStateException, IOException {
      mav=new ModelAndView();
      Image image=new Image();
      System.out.println("들어오니니");
      LinkedHashMap<String,Object> fmap=new LinkedHashMap<String,Object>();
      fmap.put("re_code", (String)multi.getParameter("re_code"));
      fmap.put("re_content", (String)multi.getParameter("re_content"));
      fmap.put("re_star", Integer.parseInt(multi.getParameter("re_star")));
      fmap.put("re_pid", "aaa");//(String)session.getAttribute("id") 변경
      bDao.reviewUpdate(fmap);
      if(multi.getParameterValues("arr")!=null){
      String[] imgList=multi.getParameterValues("arr");
      String[] array = imgList[0].split(",");
      for(int i=0; i<array.length;i++){
         System.out.println("들어오지?????");
         System.out.println(array[i]);
         image.setImg_code(array[i]);
         bDao.imgDelete(image);
         }
      }
      fileUp(multi,multi.getParameter("re_code"));
      myActivity();
      }
}
   