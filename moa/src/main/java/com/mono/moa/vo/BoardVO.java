package com.mono.moa.vo;

import java.util.*;
import java.sql.Date;
import java.sql.Time;
import java.text.*;
public class BoardVO {
	private int nno , rno;
	private String ntitle, nbody, sdate, code;
	private Date wdate;
	private Time wtime;
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

	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

	public String getSdate() {
		return sdate;
	}
	public void setSdate() {
		SimpleDateFormat form1 = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat form2 = new SimpleDateFormat(" HH:mm:ss");
		sdate = form1.format(wdate) + form2.format(wtime);
	}
	public void setSdate(Date wdate) {
		SimpleDateFormat form1 = new SimpleDateFormat("yyyy/MM/dd");
		sdate = form1.format(wdate);
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	public Time getWtime() {
		return wtime;
	}
	public void setWtime(Time wtime) {
		this.wtime = wtime;
	}
	@Override
	public String toString() {
		return "BoardVO :nno " + nno + ", rno=" + rno + ", ntitle=" + ntitle + ", nbody=" + nbody + ", sdate=" + sdate
				+ ", code=" + code + ", wdate=" + wdate + ", wtime=" + wtime ;
	}
	
	
}
