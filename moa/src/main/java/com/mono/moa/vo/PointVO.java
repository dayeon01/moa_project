package com.mono.moa.vo;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;

public class PointVO {
	private int pcode, pmno;
	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	public int getPmno() {
		return pmno;
	}
	public void setPmno(int pmno) {
		this.pmno = pmno;
	}
	public String getSpoint() {
		return spoint;
	}
	public void setSpoint(String spoint) {
		this.spoint = spoint;
	}
	public String getDepoint() {
		return depoint;
	}
	public void setDepoint(String depoint) {
		this.depoint = depoint;
	}
	public String getRepoint() {
		return repoint;
	}
	public void setRepoint(String repoint) {
		this.repoint = repoint;
	}
	public Date getpDate() {
		return pDate;
	}
	public void setpDate() {
		SimpleDateFormat form1 = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat form2 = new SimpleDateFormat(" HH:mm:ss");
	}
	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}
	private String spoint, depoint, repoint;
	private Date pDate;
	private Time pTime;
	
	@Override
	public String toString() {
		return "pcode=" + pcode + ", pmno=" + pmno + ", spoint=" + spoint + ", depoint=" + depoint
				+ ", repoint=" + repoint + ", pDate=" + pDate;
	}
}
