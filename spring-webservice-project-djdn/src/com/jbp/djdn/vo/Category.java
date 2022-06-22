package com.jbp.djdn.vo;

import java.sql.Timestamp;

public class Category {

	// 2020-07-28 멤버필드 upperName 추가
	private String name, upperName;
	private int categoryNo, upperCategory;
	private Timestamp regdate;

	public Category() {
		// TODO Auto-generated constructor stub
	}

	// 2020-07-28 setter/getter upperName 추가
	public String getUpperName() {
		return upperName;
	}

	public void setUpperName(String upperName) {
		this.upperName = upperName;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getUpperCategory() {
		return upperCategory;
	}

	public void setUpperCategory(int upperCategory) {
		this.upperCategory = upperCategory;
	}

}
