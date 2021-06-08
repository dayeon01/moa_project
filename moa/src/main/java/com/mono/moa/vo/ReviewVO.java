package com.mono.moa.vo;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {

	private int rno, bno, mno, upno, nowPage, exino;
	private String id, name, title, body, sdate, reply, savename, dir, star;
	private Date wdate;
	private Date redate;
	private Time wtime;
	private ArrayList<ReviewVO> list;
	private ArrayList<FileVO> flist;
	private MultipartFile upfile;
	private MultipartFile[] file;
	
	
	
	public ArrayList<FileVO> getFlist() {
		return flist;
	}
	public void setFlist(ArrayList<FileVO> flist) {
		this.flist = flist;
	}
	public MultipartFile getUpfile() {
		return upfile;
	}
	public void setUpfile(MultipartFile upfile) {
		this.upfile = upfile;
	}
	public MultipartFile[] getFile() {
		return file;
	}
	public void setFile(MultipartFile[] file) {
		this.file = file;
	}
	public int getExino() {
		return exino;
	}
	public void setExino(int exino) {
		this.exino = exino;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public ArrayList<ReviewVO> getList() {
		return list;
	}
	public void setList(ArrayList<ReviewVO> list) {
		this.list = list;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public int getUpno() {
		return upno;
	}
	public void setUpno(int upno) {
		this.upno = upno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
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
	public Date getRedate() {
		return redate;
	}
	public void setRedate(Date redate) {
		this.redate = redate;
	}
	public Time getWtime() {
		return wtime;
	}
	public void setWtime(Time wtime) {
		this.wtime = wtime;
	}
	@Override
	public String toString() {
		return "ReviewVO [rno=" + rno + ", bno=" + bno + ", mno=" + mno + ", upno=" + upno + ", id=" + id + ", name="
				+ name + ", title=" + title + ", body=" + body + ", sdate=" + sdate + ", reply=" + reply + "]";
	}
	

}
