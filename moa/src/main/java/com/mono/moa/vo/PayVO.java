package com.mono.moa.vo;

import java.sql.*;

public class PayVO {
	
	private int pno, pmno, ptno, ticket, pexino, mno;
	private String total, sdate, imp_uid, merchant_uid;
	private Date paydate;
	
	
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
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
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
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
				+ ", mno=" + mno + ", total=" + total + ", sdate=" + sdate + ", imp_uid=" + imp_uid + ", merchant_uid="
				+ merchant_uid + ", paydate=" + paydate + "]";
	}
	
	
	
	

}
