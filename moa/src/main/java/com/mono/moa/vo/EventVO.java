package com.mono.moa.vo;

import java.util.*;
import java.sql.Date;
import java.sql.Time;
import java.text.*;

public class EventVO {
	private int exino,exiecno, evtno, evtexino, exiprice, rno, exiexpno;
	private String evtcode, evtcontent, sdate, edate, exiname, exiperson,idir, imgname, reprice;
	private Date startdate, enddate;
	
	public int getExino() {
		return exino;
	}
	public void setExino(int exino) {
		this.exino = exino;
	}
	public int getExiecno() {
		return exiecno;
	}
	public void setExiecno(int exiecno) {
		this.exiecno = exiecno;
	}
	public int getExiexpno() {
		return exiexpno;
	}
	public void setExiexpno(int exiexpno) {
		this.exiexpno = exiexpno;
	}
	public int getEvtno() {
		return evtno;
	}
	public void setEvtno(int evtno) {
		this.evtno = evtno;
	}
	public int getEvtexino() {
		return evtexino;
	}
	public void setEvtexino(int evtexino) {
		this.evtexino = evtexino;
	}
	public int getExiprice() {
		return exiprice;
	}
	public void setExiprice(int exiprice) {
		this.exiprice = exiprice;
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
		SimpleDateFormat form = new SimpleDateFormat("yyyy/ MM/ dd");
		sdate = form.format(startdate);
	}
	
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	
	public String getEdate() {
		return edate;
	}
	public void setEdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy/ MM/ dd/");
		edate = form.format(enddate);
	}
	
	public void setEdate(String edate) {
		this.edate = edate;
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
	public String getReprice() {
		return reprice;
	}
	public void setReprice(String reprice) {
		this.reprice = reprice;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
		setSdate();
	}
	
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
		setEdate();
	}
	@Override
	public String toString() {
		return "evtno=" + evtno + ", evtexino=" + evtexino + ", exiprice=" + exiprice + ", rno=" + rno
				+ ", evtcode=" + evtcode + ", evtcontent=" + evtcontent + ", sdate=" + sdate + ", edate=" + edate
				+ ", exiname=" + exiname + ", exiperson=" + exiperson + ", idir=" + idir + ", imgname=" + imgname
				+ ", reprice=" + reprice + ", startdate=" + startdate + ", enddate=" + enddate ;
	}
	
}
