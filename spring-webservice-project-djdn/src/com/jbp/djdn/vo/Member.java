package com.jbp.djdn.vo;

import java.sql.Timestamp;

public class Member {

	public static final String LOGIN = "loginMember";

	private int memberNo;
	private String name, id, pwd, nickname, email, phone, profileImg, emailAddress;
	private char gender, dormancy;
	private Timestamp signupDate;

	public Member() {
		// TODO Auto-generated constructor stub
	}

	// 2020-07-30 Constructor memberNo, profileImg
	public Member(int memberNo, String profileImg) {
		this.memberNo = memberNo;
		this.profileImg = profileImg;
	}

	public Member(String id, String pwd) {
		this.id = id;
		this.pwd = pwd;
	}

	// 2020-08-07 박주현 : 비밀번호 변경 위해 인자 순서 변경
	public Member(String pwd, int memberNo) {
		this.memberNo = memberNo;
		this.pwd = pwd;
	}

	public Member(String name, String id, String pwd, String nickname, String email, char gender, String phone) {
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.nickname = nickname;
		this.email = email;
		this.gender = gender;
		this.phone = phone;
	}

	
	
	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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

	public char getDormancy() {
		return dormancy;
	}

	public void setDormancy(char dormancy) {
		this.dormancy = dormancy;
	}

	public Timestamp getSignupDate() {
		return signupDate;
	}

	public void setSignupDate(Timestamp signupDate) {
		this.signupDate = signupDate;
	}

}
