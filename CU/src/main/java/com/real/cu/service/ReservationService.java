package com.real.cu.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.real.cu.bean.Reservation;
import com.real.cu.dao.ReservationDao;

public class ReservationService {
	private ReservationDao rDao;
	@Autowired
	private HttpSession session;
	private ModelAndView mav;
	public ModelAndView execute(Reservation rv, int cmd){
		switch(cmd){
		case 1:
			reservationList(rv); 
			break;

		}
		return  mav;
	}
	private void reservationList(Reservation rv) {
		System.out.println("들어온지 체크");
		//rDao.reservationList(rv);
	}
}
