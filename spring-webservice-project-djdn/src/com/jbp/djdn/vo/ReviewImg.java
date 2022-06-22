package com.jbp.djdn.vo;

import java.sql.Timestamp;

public class ReviewImg {

	private int reviewImgNo, reviewNo, lessonNo, memberNo, courseNo;
	private String name;
	private Timestamp regdate;

	public ReviewImg() {
		// TODO Auto-generated constructor stub
	}

	public ReviewImg(int reviewNo, int lessonNo) {
		this.reviewNo = reviewNo;
		this.lessonNo = lessonNo;
	}

	// 07-30
	public int getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	// 2020-07-29 getter / setter
	public int getLessonNo() {
		return lessonNo;
	}

	public void setLessonNo(int lessonNo) {
		this.lessonNo = lessonNo;
	}

	public int getReviewImgNo() {
		return reviewImgNo;
	}

	public void setReviewImgNo(int reviewImgNo) {
		this.reviewImgNo = reviewImgNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
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
