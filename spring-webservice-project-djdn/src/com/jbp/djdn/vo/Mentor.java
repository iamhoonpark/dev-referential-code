package com.jbp.djdn.vo;

import java.sql.Timestamp;

public class Mentor {

	private int memberNo, bankNo, appealNo, categoryNo;
	private String[] certificate, proof, company, task, hireDate, leaveDate;
	private String nickname, profileImg, idCard, account, name, id, pwd, email, phone
	, introduce, category, categoryName, certificateNameStr, proofStr, companyStr, taskStr;
	private Timestamp regdate, signupDate;
	private char gender, dormancy;
	private Timestamp hireDateStr, leaveDateStr;

	public Mentor() {
		// TODO Auto-generated constructor stub
	}

	public int getAppealNo() {
		return appealNo;
	}

	public void setAppealNo(int appealNo) {
		this.appealNo = appealNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String[] getCertificate() {
		return certificate;
	}

	public void setCertificate(String[] certificate) {
		this.certificate = certificate;
	}

	public String[] getProof() {
		return proof;
	}

	public void setProof(String[] proof) {
		this.proof = proof;
	}

	public String[] getCompany() {
		return company;
	}

	public void setCompany(String[] company) {
		this.company = company;
	}

	public String[] getTask() {
		return task;
	}

	public void setTask(String[] task) {
		this.task = task;
	}

	public String[] getHireDate() {
		return hireDate;
	}

	public void setHireDate(String[] hireDate) {
		this.hireDate = hireDate;
	}

	public String[] getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(String[] leaveDate) {
		this.leaveDate = leaveDate;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCertificateNameStr() {
		return certificateNameStr;
	}

	public void setCertificateNameStr(String certificateNameStr) {
		this.certificateNameStr = certificateNameStr;
	}

	public String getProofStr() {
		return proofStr;
	}

	public void setProofStr(String proofStr) {
		this.proofStr = proofStr;
	}

	public String getCompanyStr() {
		return companyStr;
	}

	public void setCompanyStr(String companyStr) {
		this.companyStr = companyStr;
	}

	public String getTaskStr() {
		return taskStr;
	}

	public void setTaskStr(String taskStr) {
		this.taskStr = taskStr;
	}

	public Timestamp getHireDateStr() {
		return hireDateStr;
	}

	public void setHireDateStr(Timestamp hireDateStr) {
		this.hireDateStr = hireDateStr;
	}

	public Timestamp getLeaveDateStr() {
		return leaveDateStr;
	}

	public void setLeaveDateStr(Timestamp leaveDateStr) {
		this.leaveDateStr = leaveDateStr;
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

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getBankNo() {
		return bankNo;
	}

	public void setBankNo(int bankNo) {
		this.bankNo = bankNo;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
