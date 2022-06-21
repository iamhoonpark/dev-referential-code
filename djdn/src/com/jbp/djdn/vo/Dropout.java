package com.jbp.djdn.vo;

import java.sql.Timestamp;

public class Dropout {
	
	private int dropoutNo, memberNo, dropoutReasonNo;
	private String detailReason;
	private Timestamp dropoutDate;

	public Dropout() {
		// TODO Auto-generated constructor stub
	}

	// 2020-08-02
	public Dropout(int memberNo, int dropoutReasonNo, String detailReason) {
		this.memberNo = memberNo;
		this.dropoutReasonNo = dropoutReasonNo;
		this.detailReason = detailReason;
	}

	public int getDropoutNo() {
		return dropoutNo;
	}

	public void setDropoutNo(int dropoutNo) {
		this.dropoutNo = dropoutNo;
	}

	public String getDetailReason() {
		return detailReason;
	}

	public void setDetailReason(String detailReason) {
		this.detailReason = detailReason;
	}

	public Timestamp getDropoutDate() {
		return dropoutDate;
	}

	public void setDropoutDate(Timestamp dropoutDate) {
		this.dropoutDate = dropoutDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getDropoutReasonNo() {
		return dropoutReasonNo;
	}

	public void setDropoutReasonNo(int dropoutReasonNo) {
		this.dropoutReasonNo = dropoutReasonNo;
	}

}
