package com.mono.moa.vo;

import java.sql.*;

public class PayVO {
	
	private int pno, pmno, ptno, ticket, pexino, mno, imp_uid, merchant_uri;
	private String ptotal, sdate;
	private Date paydate;
	
	
	public int getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(int imp_uid) {
		this.imp_uid = imp_uid;
	}
	public int getMerchant_uri() {
		return merchant_uri;
	}
	public void setMerchant_uri(int merchant_uri) {
		this.merchant_uri = merchant_uri;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
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
				+ ", mno=" + mno + ", imp_uid=" + imp_uid + ", merchant_uri=" + merchant_uri + ", ptotal=" + ptotal
				+ ", sdate=" + sdate + ", paydate=" + paydate + "]";
	}
	
	
	

}
