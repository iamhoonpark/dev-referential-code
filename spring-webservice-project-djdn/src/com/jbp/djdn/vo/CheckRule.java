//2020-08-11 민겸

package com.jbp.djdn.vo;

import java.security.Timestamp;

public class CheckRule {
	private String categoryNos,sidoNos, gunguNos, type, name, proof;
	private int price, order, certificateNo, appealNo;
	private Timestamp regdate;
	
	
	
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

	public int getCertificateNo() {
		return certificateNo;
	}

	public void setCertificateNo(int certificateNo) {
		this.certificateNo = certificateNo;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public CheckRule() {
		// TODO Auto-generated constructor stub
	}

	
	
	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}
	
	

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCategoryNos() {
		return categoryNos;
	}

	public void setCategoryNos(String categoryNos) {
		this.categoryNos = categoryNos;
	}

	public String getSidoNos() {
		return sidoNos;
	}

	public void setSidoNos(String sidoNos) {
		this.sidoNos = sidoNos;
	}

	public String getGunguNos() {
		return gunguNos;
	}

	public void setGunguNos(String gunguNos) {
		this.gunguNos = gunguNos;
	}
	
	
}
