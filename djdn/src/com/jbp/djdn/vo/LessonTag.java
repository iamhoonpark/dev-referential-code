package com.jbp.djdn.vo;

import java.sql.Timestamp;

public class LessonTag {

	// 2020-07-25
	private String tag;
	private int lessonTagsNo, tagNo, lessonNo;
	private Timestamp regdate;

	public LessonTag() {
		// TODO Auto-generated constructor stub
	}

	// 2020-07-25 getter / setter tag
	public int getLessonTagsNo() {
		return lessonTagsNo;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public void setLessonTagsNo(int lessonTagsNo) {
		this.lessonTagsNo = lessonTagsNo;
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public int getLessonNo() {
		return lessonNo;
	}

	public void setLessonNo(int lessonNo) {
		this.lessonNo = lessonNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
