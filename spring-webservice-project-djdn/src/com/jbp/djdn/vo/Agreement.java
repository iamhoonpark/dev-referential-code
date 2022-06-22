package com.jbp.djdn.vo;

import java.sql.Timestamp;

public class Agreement {

	private int memberNo;
	private char service, privateLocation, location, mail;
	private Timestamp regdate;

	public Agreement() {
		// TODO Auto-generated constructor stub
	}

	public Agreement(char service, char privateLocation, char location, char mail) {
		this.service = service;
		this.privateLocation = privateLocation;
		this.location = location;
		this.mail = mail;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public char getService() {
		return service;
	}

	public void setService(char service) {
		this.service = service;
	}

	public char getPrivateLocation() {
		return privateLocation;
	}

	public void setPrivateLocation(char privateLocation) {
		this.privateLocation = privateLocation;
	}

	public char getLocation() {
		return location;
	}

	public void setLocation(char location) {
		this.location = location;
	}

	public char getMail() {
		return mail;
	}

	public void setMail(char mail) {
		this.mail = mail;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
