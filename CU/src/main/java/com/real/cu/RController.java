package com.real.cu;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.real.cu.service.ReservationService;



@Controller
public class RController {

	private ModelAndView mav;
	
	@Autowired
	private ReservationService rs;
	

	

	
	
	
	
	
	
	@RequestMapping(value = "/personReservation", method = RequestMethod.GET)
	public ModelAndView PersonReservation() {
		
		System.out.println("??");
	
		mav=rs.execute(1);  
		
	//	mav = new ModelAndView();
	//	mav.setViewName("PersonReservation");
		
		return mav;
		
	}
	
}
