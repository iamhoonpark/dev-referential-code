package com.jbp.djdn.vo;

import java.sql.Timestamp;

public class LessonImg {

	private int lessonImgNo, lessonNo;
	private String name;
	private Timestamp regdate;

	public LessonImg() {
		// TODO Auto-generated constructor stub
	}

	public int getLessonImgNo() {
		return lessonImgNo;
	}

	public void setLessonImgNo(int lessonImgNo) {
		this.lessonImgNo = lessonImgNo;
	}

	public int getLessonNo() {
		return lessonNo;
	}

	public void setLessonNo(int lessonNo) {
		this.lessonNo = lessonNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
