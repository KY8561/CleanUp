package com.real.cu.bean;

import java.util.Date;

public class Reservation {
	String nr_code;
	String nr_pid;
	Date nr_date;
	String nr_nlcode;
	int state;
	String nr_pickupdate;
	String nr_pickuptime;
	String nr_deliverydate;
	String nr_deliverytime;
	public String getNr_code() {
		return nr_code;
	}
	public void setNr_code(String nr_code) {
		this.nr_code = nr_code;
	}
	public String getNr_pid() {
		return nr_pid;
	}
	public void setNr_pid(String nr_pid) {
		this.nr_pid = nr_pid;
	}
	public Date getNr_date() {
		return nr_date;
	}
	public void setNr_date(Date nr_date) {
		this.nr_date = nr_date;
	}
	public String getNr_nlcode() {
		return nr_nlcode;
	}
	public void setNr_nlcode(String nr_nlcode) {
		this.nr_nlcode = nr_nlcode;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getNr_pickupdate() {
		return nr_pickupdate;
	}
	public void setNr_pickupdate(String nr_pickupdate) {
		this.nr_pickupdate = nr_pickupdate;
	}
	public String getNr_pickuptime() {
		return nr_pickuptime;
	}
	public void setNr_pickuptime(String nr_pickuptime) {
		this.nr_pickuptime = nr_pickuptime;
	}
	public String getNr_deliverydate() {
		return nr_deliverydate;
	}
	public void setNr_deliverydate(String nr_deliverydate) {
		this.nr_deliverydate = nr_deliverydate;
	}
	public String getNr_deliverytime() {
		return nr_deliverytime;
	}
	public void setNr_deliverytime(String nr_deliverytime) {
		this.nr_deliverytime = nr_deliverytime;
	}
	
}
