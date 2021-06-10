package com.mono.moa.vo;

import java.sql.*;

public class PayVO {
	
	private int pno, pmno, ptno, ticket, pexino;
	private String ptotal, sdate;
	private Date paydate;
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getPmno() {
		return pmno;
	}
	public void setPmno(int pmno) {
		this.pmno = pmno;
	}
	public int getPtno() {
		return ptno;
	}
	public void setPtno(int ptno) {
		this.ptno = ptno;
	}
	public int getTicket() {
		return ticket;
	}
	public void setTicket(int ticket) {
		this.ticket = ticket;
	}
	public int getPexino() {
		return pexino;
	}
	public void setPexino(int pexino) {
		this.pexino = pexino;
	}
	public String getPtotal() {
		return ptotal;
	}
	public void setPtotal(String ptotal) {
		this.ptotal = ptotal;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public Date getPaydate() {
		return paydate;
	}
	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}
	@Override
	public String toString() {
		return "PayVO [pno=" + pno + ", pmno=" + pmno + ", ptno=" + ptno + ", ticket=" + ticket + ", pexino=" + pexino
				+ ", ptotal=" + ptotal + ", sdate=" + sdate + ", paydate=" + paydate + "]";
	}
	
	

}
