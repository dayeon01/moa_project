package com.mono.moa.vo;

import java.util.Date;
import java.sql.*;
import java.text.*;

public class BoardVO {
	private int nno , rno;
	private String ntitle, nbody, sdate, code;
	private Date ndate;
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNbody() {
		return nbody;
	}
	public void setNbody(String nbody) {
		this.nbody = nbody;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy년 MM월 dd일");
		sdate = form.format(ndate);
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Date getNdate() {
		return ndate;
	}
	public void setNdate(Date ndate) {
		this.ndate = ndate;
		setSdate();
	}

	
	
}
	
	