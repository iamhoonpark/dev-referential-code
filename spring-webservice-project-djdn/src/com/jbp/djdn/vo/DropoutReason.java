package com.jbp.djdn.vo;

import java.sql.Timestamp;

public class DropoutReason {
	
	private int dropoutReasonNo;
	private String reason;
	private Timestamp regdate;

	public DropoutReason() {
		// TODO Auto-generated constructor stub
	}

	public int getDropoutReasonNo() {
		return dropoutReasonNo;
	}

	public void setDropoutReasonNo(int dropoutReasonNo) {
		this.dropoutReasonNo = dropoutReasonNo;
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
