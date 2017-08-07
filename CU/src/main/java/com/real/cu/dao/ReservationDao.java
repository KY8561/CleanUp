package com.real.cu.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real.cu.bean.Reservation;

@Repository
public class ReservationDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<Reservation> personReservation() {

		
		
		
		System.out.println("안녕하세요!!!!!!!!!");
		
		
		return sqlSession.selectList("Reservation.personReservation");
	}

}
