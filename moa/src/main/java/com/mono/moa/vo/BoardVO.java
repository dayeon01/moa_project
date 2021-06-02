package com.mono.moa.vo;

import java.util.Date;
import java.sql.*;
import java.text.*;

public class BoardVO {
	private int nno , rno;
	private String ntitle, nbody, ndate, code;
	private Date wdate;
	
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
	public String getNdate() {
		return ndate;
	}
	public void setNdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		ndate = form.format(wdate);
	}
	public void setNdate(String ndate) {
		this.ndate = ndate;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
		setNdate();
		
	}
	
	
	
}
