package com.jbp.djdn.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Blacklist {

	private int blacklistNo, memberNo, lessonNo, blackReasonNo, mentorNo, menteeNo;
	private String detailReason, title, name, profileImg, reason;
	private Timestamp regdate;
	private SimpleDateFormat sdf;

	public Blacklist() {
		sdf = new SimpleDateFormat("YYYY-MM-dd");
	}

	// 2020-07-29
	public Blacklist(int mentorNo, int menteeNo) {
		this.mentorNo = mentorNo;
		this.menteeNo = menteeNo;
	}

	// 2020.07.29
	public Blacklist(int memberNo, int lessonNo, int blackReasonNo, String detailReason) {
		this.memberNo = memberNo;
		this.lessonNo = lessonNo;
		this.blackReasonNo = blackReasonNo;
		this.detailReason = detailReason;
	}

	public int getMentorNo() {
		return mentorNo;
	}

	public void setMentorNo(int mentorNo) {
		this.mentorNo = mentorNo;
	}

	public int getMenteeNo() {
		return menteeNo;
	}

	public void setMenteeNo(int menteeNo) {
		this.menteeNo = menteeNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public int getBlacklistNo() {
		return blacklistNo;
	}

	public void setBlacklistNo(int blacklistNo) {
		this.blacklistNo = blacklistNo;
	}

	public String getDetailReason() {
		return detailReason;
	}

	public void setDetailReason(String detailReason) {
		this.detailReason = detailReason;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getLessonNo() {
		return lessonNo;
	}

	public void setLessonNo(int lessonNo) {
		this.lessonNo = lessonNo;
	}

	public int getBlackReasonNo() {
		return blackReasonNo;
	}

	public void setBlackReasonNo(int blackReasonNo) {
		this.blackReasonNo = blackReasonNo;
	}

	// 2020-07-30
	// regdate 날짜 포맷 설정
	public String getFormatedRegdate() {
		return sdf.format(regdate);
	}
}
