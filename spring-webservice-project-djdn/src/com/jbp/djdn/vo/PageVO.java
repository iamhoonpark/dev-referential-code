package com.jbp.djdn.vo;

public class PageVO {

	// 2020-08-09 주영
	private String courseStatus;
	private char status;
	private int start, end, no;

	public PageVO() {
		// TODO Auto-generated constructor stub
	}

	public PageVO(int pageNo, int numPage) {
		end = pageNo * numPage;
		start = end - numPage + 1;
		// start = (pageNo-1)*numPage+1;
	}

	public PageVO(int pageNo, int numPage, int no) {
		end = pageNo * numPage;
		start = end - numPage + 1;
		// start = (pageNo-1)*numPage+1;
		this.no = no;
	}

	// 2020-08-09 주영
	public PageVO(int pageNo, int numPage, int no, char status) {
		end = pageNo * numPage;
		start = end - numPage + 1;
		// start = (pageNo-1)*numPage+1;
		this.no = no;
		this.status = status;
	}

	public String getCourseStatus() {
		return courseStatus;
	}

	public void setCourseStatus(String courseStatus) {
		this.courseStatus = courseStatus;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

}
