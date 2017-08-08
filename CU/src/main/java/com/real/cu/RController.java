package com.real.cu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.real.cu.bean.Reservation;
import com.real.cu.service.ReservationService;

@Controller
public class RController {
/*	@Autowired
	private ReservationService rs;*/

	private ModelAndView mav;
/*	
	@Autowired
	private Reservation rv;*/


	@RequestMapping(value = "/BusinessMain", method = RequestMethod.GET)
	public ModelAndView joinBusinessMV() {
		mav = new ModelAndView();
		mav.setViewName("BusinessMain");		
		return mav;
	}

/*	@RequestMapping(value = "/reservationList", method = RequestMethod.POST)
	public ModelAndView reservationList(Reservation rv) {
		mav=rs.execute(rv,1);
		return mav;
	}*/
}
