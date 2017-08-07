package com.real.cu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.real.cu.bean.Reservation;
import com.real.cu.dao.ReservationDao;




@Service 
public class ReservationService {

	

	
		private ModelAndView mav;	//modelanview excute사용시
		
		
		@Autowired
		private ReservationDao rDao;
		
		
		
		
		public ModelAndView execute(int cmd){

			switch(cmd){
			case 1:
				personReservation();
				break;
			}
			return mav;
		}
		
		
		
		private void personReservation() {
			
		mav = new ModelAndView();	
		String view=null;
		view="PersonReservation";
		
		
		
		
		System.out.println("여기옴");	
				
		
		List<Reservation> rlist=rDao.personReservation();	
	
		
		System.out.println("DB다녀옴");
		
		
		String List = personReservationHtml(rlist);	
			
		mav.addObject("RLIST",List);
		
		
		
		
		
		
		
		mav.setViewName(view);
			
			
		
	
		
			//리스트뽑아서 html
		}



		private String personReservationHtml(List<Reservation> rlist) {

			
			
			
		StringBuilder sb=new StringBuilder();
		
	Reservation r = new Reservation();
		
		for(int i=0; i<rlist.size(); i++){
			r=rlist.get(i);
			sb.append("<table>");
			sb.append("------------------------------------------------------------");
			sb.append("<tr><td>예약일자</td><td>예약번호</td></tr>");
			sb.append("------------------------------------------------------------");
			sb.append("<tr><td>예약상품"+r.getNr_nlcode()+"와이셔츠</td>");
			sb.append("<tr><td>예약금액"+r.getNr_code()+"</td></tr>");  //주문리스트에서 수량x세탁취급코드
			sb.append("<tr><td>예약처리상태"+r.getNr_state()+"</td></tr>");
			sb.append("</table>");
			sb.append("------------------------------------------------------------");
			
		}	
			
		
			
			return sb.toString();
		}

}
