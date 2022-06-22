package com.jbp.djdn.vo;

import java.sql.Timestamp;

public class Background {
	
	private int backgroundNo, memberNo;
	private String school, major, proof;
	private char graduation;
	private Timestamp regdate;

	public Background() {
		// TODO Auto-generated constructor stub
	}

	public int getBackgroundNo() {
		return backgroundNo;
	}

	public void setBackgroundNo(int backgroundNo) {
		this.backgroundNo = backgroundNo;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getProof() {
		return proof;
	}

	public void setProof(String proof) {
		this.proof = proof;
	}

	public char getGraduation() {
		return graduation;
	}

	public void setGraduation(char graduation) {
		this.graduation = graduation;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
