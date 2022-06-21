package com.jbp.djdn.vo;

import java.sql.Timestamp;

public class RefundReason {

	private int refundReasonNo;
	private String reason;
	private Timestamp regdate;

	public RefundReason() {
		// TODO Auto-generated constructor stub
	}

	public int getRefundReasonNo() {
		return refundReasonNo;
	}

	public void setRefundReasonNo(int refundReasonNo) {
		this.refundReasonNo = refundReasonNo;
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
