package com.mono.moa.vo;

import java.util.*;
import java.sql.Date;
import java.sql.Time;
import java.text.*;

public class EventVO {
	private int exino,exiecno, evtno, evtexino, exiprice, rno, exiexpno;
	private String evtcode, evtcontent, evtsdate, evtedate, exisdate, exiedate, exiname, exiperson,idir, imgname, reprice, isshow;
	private Date startdate, enddate, edate, sdate ;
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
	public int getExiexpno() {
		return exiexpno;
	}
	public void setExiexpno(int exiexpno) {
		this.exiexpno = exiexpno;
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
	public String getEvtsdate() {
		return evtsdate;
	}
	public void setEvtsdate(String evtsdate) {
		this.evtsdate = evtsdate;
	}
	public String getEvtedate() {
		return evtedate;
	}
	public void setEvtedate(String evtedate) {
		this.evtedate = evtedate;
	}
	public String getExisdate() {
		return exisdate;
	}
	public void setExisdate(String exisdate) {
		this.exisdate = exisdate;
	}
	public String getExiedate() {
		return exiedate;
	}
	public void setExiedate(String exiedate) {
		this.exiedate = exiedate;
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
		exisdate = setStrDate(startdate);
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
		exiedate = setStrDate(enddate);
	}
	public Date getEdate() {
		return edate;
	}
	public void setEdate(Date edate) {
		this.edate = edate;
		evtedate = setStrDate(edate);
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
		evtsdate = setStrDate(sdate);
	}
	public String setStrDate(Date d) {
		return new SimpleDateFormat("yyyy/MM/dd").format(d);
	}
	public String getIsshow() {
		return isshow;
	}
	public void setIsshow(String isshow) {
		this.isshow = isshow;
	}
	
}
