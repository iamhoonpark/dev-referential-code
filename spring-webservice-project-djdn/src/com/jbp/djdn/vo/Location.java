package com.jbp.djdn.vo;

import java.sql.Timestamp;

public class Location {

	private int addressNo, sido;
	private String address, addressSido;
	private Timestamp regdate;

	public Location() {
		// TODO Auto-generated constructor stub
	}

	public String getAddressSido() {
		return addressSido;
	}

	public void setAddressSido(String addressSido) {
		this.addressSido = addressSido;
	}

	public int getAddressNo() {
		return addressNo;
	}

	public void setAddressNo(int addressNo) {
		this.addressNo = addressNo;
	}

	public int getSido() {
		return sido;
	}

	public void setSido(int sido) {
		this.sido = sido;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
