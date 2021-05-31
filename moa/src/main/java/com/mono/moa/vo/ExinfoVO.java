package com.mono.moa.vo;

import java.text.*;
import java.util.*;

public class ExinfoVO {
	private int exino, exiecno, exiprice, exiexpno, exiclick;
	private String exiperson, exiname, exiage, startdate, enddate, idir, imgname; 
	private Date exisdate, exiedate;
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
	public int getExiprice() {
		return exiprice;
	}
	public void setExiprice(int exiprice) {
		this.exiprice = exiprice;
	}
	public int getExiexpno() {
		return exiexpno;
	}
	public void setExiexpno(int exiexpno) {
		this.exiexpno = exiexpno;
	}
	public int getExiclick() {
		return exiclick;
	}
	public void setExiclick(int exiclick) {
		this.exiclick = exiclick;
	}
	public String getExiperson() {
		return exiperson;
	}
	public void setExiperson(String exiperson) {
		this.exiperson = exiperson;
	}
	public String getExiname() {
		return exiname;
	}
	public void setExiname(String exiname) {
		this.exiname = exiname;
	}
	public String getExiage() {
		return exiage;
	}
	public void setExiage(String exiage) {
		this.exiage = exiage;
	}
	public Date getExisdate() {
		return exisdate;
	}
	public void setExisdate(Date exisdate) {
		this.exisdate = exisdate;
	}
	public Date getExiedate() {
		return exiedate;
	}
	public void setExiedate(Date exiedate) {
		this.exiedate = exiedate;
	}
	public String getStartdate() {
		return startdate;
	}
	public String setSdate(Date date) {
		SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd");
		
		return form.format(date);
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
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
	@Override
	public String toString() {
		return "exino=" + exino + ", exiecno=" + exiecno + ", exiprice=" + exiprice + ", exiexpno=" + exiexpno
				+ ", exiclick=" + exiclick + ", exiperson=" + exiperson + ", exiname=" + exiname + ", exiage=" + exiage
				+ ", startdate=" + startdate + ", enddate=" + enddate + ", idir=" + idir + ", imgname=" + imgname
				+ ", exisdate=" + exisdate + ", exiedate=" + exiedate;
	}
	
	
	// json 문자열 반환 함수
	public String getJson() {
		// 꺼낼 데이터
		//	exino, exiecno, exiperson, exiname, exisdate
		
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		
		StringBuffer buff = new StringBuffer();
		buff.append("{");
		buff.append("	'exino': " + exino + ", ");
		buff.append("	'exiecno': " + exiecno + ", ");
		buff.append("	'exiperson': '" + exiperson + "', ");
		buff.append("	'exiname': '" + exiname + "', ");
		buff.append("	'exisdate': '" + form.format(exisdate) + "'");
		buff.append("}");
		
		return buff.toString();
	}
	// json 문자열 반환 함수
	public String getJsonStr() {
		// 꺼낼 데이터
		//	exino, exiecno, exiperson, exiname, exisdate
		
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		
		StringBuffer buff = new StringBuffer();
		buff.append("{");
		/*
		 * buff.append("	'url': '/moa/exhibit/sang.moa?exino=" + exino + "', ");
		 */		
		buff.append("title: '" + exiname + "', ");
		buff.append("url: 'exhibit/sang.moa', ");
		buff.append("start: '" + form.format(exisdate) + "'");
		buff.append("}");
		
		return buff.toString();
	}
}
