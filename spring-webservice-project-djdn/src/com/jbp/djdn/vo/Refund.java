package com.jbp.djdn.vo;

import java.sql.Timestamp;

public class Refund {
	
	private int refundNo, refund, memberNo, courseNo, refundReasonNo;
	private String detailReason;
	private Timestamp regdate;

	public Refund() {
		// TODO Auto-generated constructor stub
	}

	public Refund(int refund, int memberNo, int courseNo, int refundReasonNo, String detailReason) {
		this.refund = refund;
		this.memberNo = memberNo;
		this.courseNo = courseNo;
		this.refundReasonNo = refundReasonNo;
		this.detailReason = detailReason;
	}

	public int getRefundNo() {
		return refundNo;
	}

	public void setRefundNo(int refundNo) {
		this.refundNo = refundNo;
	}

	public int getRefund() {
		return refund;
	}

	public void setRefund(int refund) {
		this.refund = refund;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}

	public int getRefundReasonNo() {
		return refundReasonNo;
	}

	public void setRefundReasonNo(int refundReasonNo) {
		this.refundReasonNo = refundReasonNo;
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

}
