package com.jbp.djdn.vo;

import java.sql.Timestamp;

public class Certificate {
	
	private int certificateNo, appealNo;
	private String name, proof;
	private Timestamp regdate;

	public Certificate() {
		// TODO Auto-generated constructor stub
	}

	public int getCertificateNo() {
		return certificateNo;
	}

	public void setCertificateNo(int certificateNo) {
		this.certificateNo = certificateNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProof() {
		return proof;
	}

	public void setProof(String proof) {
		this.proof = proof;
	}

	public int getAppealNo() {
		return appealNo;
	}

	public void setAppealNo(int appealNo) {
		this.appealNo = appealNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
