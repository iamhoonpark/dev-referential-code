package com.jbp.djdn.vo;

import java.sql.Timestamp;

public class Curriculum {

	// 2020-08-10 멤버필드 선언
	private int curriculumNo, round, lessonNo, number;
	private String content;
	private Timestamp regdate;

	public Curriculum() {
		// TODO Auto-generated constructor stub
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getCurriculumNo() {
		return curriculumNo;
	}

	public void setCurriculumNo(int curriculumNo) {
		this.curriculumNo = curriculumNo;
	}

	public int getRound() {
		return round;
	}

	public void setRound(int round) {
		this.round = round;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
