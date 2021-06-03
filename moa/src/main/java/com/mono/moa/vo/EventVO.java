package com.mono.moa.vo;

import java.util.*;
import java.sql.Date;
import java.sql.Time;
import java.text.*;

public class EventVO {
	private int evtno, evtexino, exiprice, rno;
	private String evtcode, evtcontent, sdate, exiname, exiperson,idir, imgname, reprice;
	private Date wdate;
	private Time wtime;
	public int getEvtno() {
		return evtno;
	}
	public void setEvtno(int evtno) {
		this.evtno = evtno;
	}
	public int getExiprice() {
		return exiprice;
	}
	public void setExiprice(int exiprice) {
		this.exiprice = exiprice;
	}

	public String getReprice() {
		return reprice;
	}
	public void setReprice(String reprice) {
		this.reprice = reprice;
	}
	public String getExiname() {
		return exiname;
	}
	public void setExiname(String exiname) {
		this.exiname = exiname;
	}
	public String getExiperson() {
		return exiperson;
	}
	public void setExiperson(String exiperson) {
		this.exiperson = exiperson;
	}
	public String getIdir() {
		return idir;
	}
	public void setIdir(String idir) {
		this.idir = idir;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	public int getEvtexino() {
		return evtexino;
	}
	public void setEvtexino(int evtexino) {
		this.evtexino = evtexino;
	}
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getEvtcode() {
		return evtcode;
	}
	public void setEvtcode(String evtcode) {
		this.evtcode = evtcode;
	}
	public String getEvtcontent() {
		return evtcontent;
	}
	public void setEvtcontent(String evtcontent) {
		this.evtcontent = evtcontent;
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
		return "EventVO evtno=" + evtno + ", evtexino=" + evtexino + ", exiprice=" + exiprice + ", evtcode=" + evtcode
				+ ", evtcontent=" + evtcontent + ", sdate=" + sdate + ", exiname=" + exiname + ", exiperson="
				+ exiperson + ", idir=" + idir + ", imgname=" + imgname + ", wdate=" + wdate + ", wtime=" + wtime ;
	}
	
	
	
}
