package com.jbp.djdn.vo;

import java.sql.Timestamp;

public class Sample {

	private int sampleNo, lessonNo;
	private String url;
	private Timestamp regdate;

	public Sample() {
		// TODO Auto-generated constructor stub
	}

	public int getSampleNo() {
		return sampleNo;
	}

	public void setSampleNo(int sampleNo) {
		this.sampleNo = sampleNo;
	}

	public int getLessonNo() {
		return lessonNo;
	}

	public void setLessonNo(int lessonNo) {
		this.lessonNo = lessonNo;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
