package com.real.cu;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.real.cu.service.BoardService;

@Controller
public class BController {

	private ModelAndView mav;

	@Autowired
	private BoardService bs;
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping(value = "/Question", method = RequestMethod.GET)
	public ModelAndView Qustion() {
		mav = new ModelAndView();
		mav.setViewName("Qustion");
		return mav;
	}
	//공지사항 
	@RequestMapping(value = "/NoticeManage")
	public ModelAndView NoticeManage() {
		mav = new ModelAndView();
		mav=bs.execute(10); 
		return mav;
	}
	
	@RequestMapping(value = "/noticeAddMv", method = RequestMethod.GET)
	   public ModelAndView noticeAddMv() {
	      mav = new ModelAndView();
	      mav.setViewName("noticeAdd");
	      return mav;
	   }
	   @RequestMapping(value = "/noticeUpdateMv", method = RequestMethod.GET)
	   public ModelAndView noticeUpdateMv() {
	      mav = new ModelAndView();
	      mav=bs.execute(15); 
	      return mav;
	   }@RequestMapping(value = "/noticeUpdate", method = RequestMethod.GET)
	   public ModelAndView noticeUpdate() {
	      mav = new ModelAndView();
	      mav=bs.execute(17); 
	      return mav;
	   }
	   
	   @RequestMapping(value = "/noticedetail")
	   public ModelAndView noticedetail() {
	      mav = new ModelAndView();
	      mav=bs.execute(13); 
	      return mav;
	   }
	   @RequestMapping(value = "/noticeAdd")
       public ModelAndView noticeAdd(){
          mav = new ModelAndView();
          mav=bs.execute(16); 
          return mav;
       }
       @RequestMapping(value = "/noticeDelete")
       public ModelAndView noticeDelete(){
          mav = new ModelAndView();
          mav=bs.execute(14); 
          return mav;
       }
	   
	
	
	@RequestMapping(value = "/requestCheck")
	public ModelAndView requestCheck() {
		mav = new ModelAndView();
		mav=bs.execute(18); 
		return mav;
	}
	
	@RequestMapping(value = "/requestSelect")
	public ModelAndView requestSelect() {
		mav = new ModelAndView();
		mav=bs.execute(19); 
		return mav;
	}

	
	
	
	
	///상욱
	 @RequestMapping(value = "/myActivity")
	    public ModelAndView myActivity(){
	       mav = new ModelAndView();
	       mav=bs.execute(1); 
	       return mav;
	    }
	    @RequestMapping(value = "/myActivitySelect")
	    public ModelAndView myActivitySelect(){
	       mav = new ModelAndView();
	       mav=bs.execute(2); 
	       return mav;
	    }
	    @RequestMapping(value = "/reviewChange")
	    public ModelAndView reviewChange(){
	       mav = new ModelAndView();
	       mav=bs.execute(3); 
	       return mav;
	    }
	    @RequestMapping(value = "/reviewUpdate")
	    public ModelAndView reviewUpdate(MultipartHttpServletRequest multi) throws IllegalStateException, IOException{
	       System.out.println("들어옴?");
	       mav = new ModelAndView();
	       mav=bs.execute(multi,1); 
	       return mav;
	    }
	    @RequestMapping(value = "/shopReview")
	    public ModelAndView shopReview(){
	       mav = new ModelAndView();
	       mav=bs.execute(5); 
	       return mav;
	    }
	    @RequestMapping(value = "/reviewadd")
	    public ModelAndView reviewadd(MultipartHttpServletRequest multi) throws IllegalStateException, IOException{
	       mav = new ModelAndView();
	       mav=bs.execute(multi,2); 
	       return mav;
	    }
	    @RequestMapping(value = "/CoinshopReview")
	    public ModelAndView CoinshopReview(){
	       mav = new ModelAndView();
	       mav=bs.execute(6); 
	       return mav;
	    }
	
	
	
}
