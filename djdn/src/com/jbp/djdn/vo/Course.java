package com.jbp.djdn.vo;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

public class Course {

	private int courseNo, payment, memberNo, lessonNo;
	private Timestamp regdate, startDate;
	private String status, request, title, thumbnail, gungu, sido, name, id, pwd, nickname, email, phone, profileImg;
	private char menteeLevel, method, personnel, gender;
	private SimpleDateFormat sdf;

	public Course() {
		sdf = new SimpleDateFormat("YYYY-MM-dd");
	}

	public Course(int payment, int memberNo, int lessonNo, String request, char menteeLevel, char method) {
		this.payment = payment;
		this.memberNo = memberNo;
		this.lessonNo = lessonNo;
		this.request = request;
		this.menteeLevel = menteeLevel;
		this.method = method;
	}

	public int getCourseNo() {
		return courseNo;
	}

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public char getMenteeLevel() {
		return menteeLevel;
	}

	public void setMenteeLevel(char menteeLevel) {
		this.menteeLevel = menteeLevel;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public char getMethod() {
		return method;
	}

	public void setMethod(char method) {
		this.method = method;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public char getPersonnel() {
		return personnel;
	}

	public void setPersonnel(char personnel) {
		this.personnel = personnel;
	}

	public String getGungu() {
		return gungu;
	}

	public void setGungu(String gungu) {
		this.gungu = gungu;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	// 2020.07.24
	// 숫자 형식 포맷 메서드
	public String getFormatedPayment() {
		DecimalFormat df = new DecimalFormat("###,###,###");
		return df.format(payment);
	}

	// 날짜 형식 포맷 메서드
	public String getFormatedRegdate() {
		return sdf.format(regdate);
	}

	// 2020.07.28
	// startDate 날짜 포맷 설정
	public String getFormatedStartDate() {
		return sdf.format(startDate);
	}

}