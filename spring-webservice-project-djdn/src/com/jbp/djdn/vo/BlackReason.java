package com.jbp.djdn.vo;

import java.sql.Timestamp;

public class BlackReason {
	
	private int blackReasonNo;
	private String reason;
	private Timestamp regdate;

	public BlackReason() {
		// TODO Auto-generated constructor stub
	}

	public int getBlackReasonNo() {
		return blackReasonNo;
	}

	public void setBlackReasonNo(int blackReasonNo) {
		this.blackReasonNo = blackReasonNo;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
