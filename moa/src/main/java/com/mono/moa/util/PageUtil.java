package com.mono.moa.util;

public class PageUtil {
	
	private int nowPage;
	private int totalPage;
	private int total;
	
	private int pageRow;
	private int pageGroup;
	
	private int startPage;
	private int endPage;
	
	private int startCont;
	private int endCont;
	
	public PageUtil() {
		nowPage = 1;
	}
	
	public PageUtil(int nowPage, int total) {
		this(nowPage, total, 3, 3);
	}
	
	public PageUtil(int nowPage, int total, int pageRow, int pageGroup) {
		setPage(nowPage, total, pageRow, pageGroup);
	}

	public void setPage(int nowPage, int total, int pageRow, int pageGroup) {
		this.nowPage = nowPage;
		this.total = total;
		this.pageRow = pageRow;
		this.pageGroup = pageGroup;
		calcPage();
		calcStartPage();
		calcEndPage();
		calcCont(); 
	}
	
	public void calcPage() {
		totalPage = (total % pageRow) == 0 ? ((total == 0) ? 1 : total / pageRow) : (total / pageRow + 1) ;
	}

	public void calcStartPage() {
		int tmpGroup = (nowPage - 1) / pageGroup;
		startPage = tmpGroup * pageGroup + 1;
	}

	public void calcEndPage() {
		int tmpGroup = (nowPage - 1) / pageGroup;
		endPage = (tmpGroup + 1) * pageGroup;
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
	}

	public void calcCont() {
		startCont = (nowPage - 1) * pageRow + 1;
		endCont = (nowPage * pageRow) > total ? total : (nowPage * pageRow);
	}

	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPageRow() {
		return pageRow;
	}
	public void setPageRow(int pageRow) {
		this.pageRow = pageRow;
	}
	public int getPageGroup() {
		return pageGroup;
	}
	public void setPageGroup(int pageGroup) {
		this.pageGroup = pageGroup;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
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
}
