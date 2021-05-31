package com.mono.moa.vo;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;

public class MemberVO {
	private int mno;
	private String name, id, pw, tel, email, gen, birth, sdate;
	private Date jDate;
	private Time jTime;
	
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return 	email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGen() {
		return gen;
	}
	public void setGen(String gen) {
		this.gen = gen;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth.trim();
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate() {
	SimpleDateFormat form1 = new SimpleDateFormat("yyyy/MM/dd");
	SimpleDateFormat form2 = new SimpleDateFormat(" HH:mm:ss");
	sdate = form1.format(jDate) + form2.format(jTime);
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public Date getjDate() {
		return jDate;
	}
	public void setjDate(Date jDate) {
		this.jDate = jDate;
	}
	public Time getjTime() {
		return jTime;
	}
	public void setjTime(Time jTime) {
		this.jTime = jTime;
		setSdate();
	}
	@Override
	public String toString() {
		return "mno=" + mno + ", name=" + name + ", id=" + id + ", pw=" + pw + ", tel=" + tel + ", mail="
				+ email + ", gen=" + gen + ", birth=" + birth + ", sdate=" + sdate;
	}
	
	
	
}