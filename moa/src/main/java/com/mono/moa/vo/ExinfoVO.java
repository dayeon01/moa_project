package com.mono.moa.vo;

import java.text.*;
import java.util.*;

public class ExinfoVO {
	private int exino, exiecno, exiprice, exiexpno, exiclick, explono, ecno;
	private int sMonth, eMonth;
	
	private String exiperson, exiname, exiage, startdate, enddate, idir, imgname, 
					ecnaming, excity, expname, expsite, exploc;
	private String selClass, selCity, searchArg; 
	
	private Date exisdate, exiedate;
	
	private int startCont;
	private int endCont;
	
	
	public String getSearchArg() {
		return searchArg;
	}
	public void setSearchArg(String searchArg) {
		this.searchArg = searchArg;
	}
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
		startdate = setSdate(exisdate);
	}
	public Date getExiedate() {
		return exiedate;
	}
	public void setExiedate(Date exiedate) {
		this.exiedate = exiedate;
		enddate = setSdate(exiedate);
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
	
	// 전시분류
	
	public String getEcnaming() {
		return ecnaming;
	}
	public int getEcno() {
		return ecno;
	}
	public void setEcno(int ecno) {
		this.ecno = ecno;
	}
	public void setEcnaming(String ecnaming) {
		this.ecnaming = ecnaming;
	}	
	public int getExplono() {
		return explono;
	}
	public void setExplono(int explono) {
		this.explono = explono;
	}
	public String getExcity() {
		return excity;
	}
	public void setExcity(String excity) {
		this.excity = excity;
	}
	public String getExpname() {
		return expname;
	}
	public void setExpname(String expname) {
		this.expname = expname;
	}
	public String getExpsite() {
		return expsite;
	}
	public void setExpsite(String expsite) {
		this.expsite = expsite;
	}
	public String getExploc() {
		return exploc;
	}
	public void setExploc(String exploc) {
		this.exploc = exploc;
	}
	
	//검색데이터 명령어
	public int getsMonth() {
		return sMonth;
	}
	public void setsMonth(int sMonth) {
		this.sMonth = sMonth;
	}
	public int geteMonth() {
		return eMonth;
	}
	public void seteMonth(int eMonth) {
		this.eMonth = eMonth;
	}
	public String getSelClass() {
		return selClass;
	}
	public void setSelClass(String selClass) {
		this.selClass = selClass;
	}
	public String getSelCity() {
		return selCity;
	}
	public void setSelCity(String selCity) {
		this.selCity = selCity;
	}
	
	//페이지
	public int getStartCont() {
		return startCont;
	}
	public void setStartCont(int startCont) {
		this.startCont = startCont;
	}
	public int getEndCont() {
		return endCont;
	}
	public void setEndCont(int endCont) {
		this.endCont = endCont;
	}
	
	
	@Override
	public String toString() {
		return "exino=" + exino + ", exiecno=" + exiecno + ", exiprice=" + exiprice + ", exiexpno=" + exiexpno
				+ ", exiclick=" + exiclick + ", explono=" + explono + ", ecno=" + ecno + ", sMonth=" + sMonth
				+ ", eMonth=" + eMonth + ", exiperson=" + exiperson + ", exiname=" + exiname + ", exiage=" + exiage
				+ ", startdate=" + startdate + ", enddate=" + enddate + ", idir=" + idir + ", imgname=" + imgname
				+ ", ecnaming=" + ecnaming + ", excity=" + excity + ", expname=" + expname + ", expsite=" + expsite
				+ ", exploc=" + exploc + ", selClass=" + selClass + ", selCity=" + selCity + ", searchArg=" + searchArg
				+ ", exisdate=" + exisdate + ", exiedate=" + exiedate + ", startCont=" + startCont + ", endCont="
				+ endCont;
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
