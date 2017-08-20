package com.real.cu;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.real.cu.bean.N_laundry;
import com.real.cu.service.ReservationService;



@Controller
public class RController {

	private ModelAndView mav;

	@Autowired
	private ReservationService rs;
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping(value = "/personReservation", method = RequestMethod.GET)
	public ModelAndView PersonReservation() {
		N_laundry nl = new N_laundry();
		mav=rs.execute(1,nl);  
		return mav;
	}

	@RequestMapping(value = "/shopCart")
	public ModelAndView reply(@RequestParam(value="userId") String NLCODE){
		System.out.println("아작스들어옴");
		mav = new ModelAndView();
		N_laundry nl = new N_laundry();
		nl.setNl_code(NLCODE);
		System.out.println(NLCODE);
		mav=rs.execute(2,nl);
		return mav;
	}

	@RequestMapping(value = "/shopCart2")
	public ModelAndView reply2(@RequestParam(value="selectedValue") String T_NAME){
		mav = new ModelAndView();
		N_laundry nl = new N_laundry();
		nl.setNl_content(T_NAME);
		System.out.println(T_NAME);
		System.out.println("제발");
		mav=rs.execute(4,nl);
		return mav;
	}

	@RequestMapping(value = "/laundryReservAdN", method = RequestMethod.GET)
	public ModelAndView LaundryReservAd() throws ParseException {
		String text=request.getParameter("text");
		String date=request.getParameter("date");

		System.out.println(date);
		System.out.println(text);
		mav = new ModelAndView();
		N_laundry nl = new N_laundry();
		mav=rs.execute(16,nl,text,date);
		mav.setViewName("laundryReservAd");
		return mav;
	}	

	@RequestMapping(value = "/test2", method = RequestMethod.GET)
	public ModelAndView test() {
		mav = new ModelAndView();
		mav.setViewName("test2");
		return mav;
	}

	@RequestMapping(value = "/givetakeSelect", method = RequestMethod.GET)
	public ModelAndView givetakeSelect() {
		mav = new ModelAndView();
		N_laundry nl = new N_laundry();
		String LH = request.getParameter("LH_LAUNDRY");
		int QTY = Integer.parseInt(request.getParameter("QTY"));
		int NUM = Integer.parseInt(request.getParameter("NUM"));

		nl.setNl_content(LH);
		nl.setNl_qty(QTY);
		nl.setNl_repair(NUM);
		mav=rs.execute(10,nl);
		return mav;

	}
	@RequestMapping(value = "/givetakeSelect2", method = RequestMethod.GET)
	public ModelAndView givetakeSelect2() {
			mav = new ModelAndView();
			N_laundry nl = new N_laundry();
			
			int elem = Integer.parseInt(request.getParameter("elem"));

			nl.setNl_qty(elem);
			
			System.out.println(elem+"번쨰줄 지움");
			mav=rs.execute(11,nl);
			System.out.println("www");
		return mav;

	}
	@RequestMapping(value = "/givetakeBtn", method = RequestMethod.GET)
	public ModelAndView givetakeBtn() {
			mav = new ModelAndView();
			N_laundry nl = new N_laundry();
			
			mav=rs.execute(13,nl);
			System.out.println("givetakeBtn");
		return mav;

	}
	

	
	
	
	@RequestMapping(value = "/coinPayComplete", method = RequestMethod.GET)
	public ModelAndView coinPayComplete() {
		mav = new ModelAndView();
		N_laundry nl = new N_laundry();
		mav=rs.execute(6,nl);
		return mav;
	}
	@RequestMapping(value = "/reservationList", method = RequestMethod.GET)
	public ModelAndView reservationList() {
		mav=rs.execute(9);
		return mav;
	}

	@RequestMapping(value = "/selectState", method = RequestMethod.GET)
	public ModelAndView selectState() {
		mav=rs.execute(10);
		return mav;
	}
	@RequestMapping(value = "/laundryProcessing", method = RequestMethod.GET)
	public ModelAndView laundryProcessing() {
		mav=rs.execute(11);
		return mav;
	}
	
	
	
	
}
