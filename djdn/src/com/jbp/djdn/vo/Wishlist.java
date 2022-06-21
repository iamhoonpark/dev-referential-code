package com.jbp.djdn.vo;

import java.sql.Timestamp;

public class Wishlist {

	private int wishlistNo, memberNo, lessonNo;
	private Timestamp regdate;

	public Wishlist() {
		// TODO Auto-generated constructor stub
	}

	// 2020-07-27 constructor
	public Wishlist(int memberNo, int lessonNo) {
		super();
		this.memberNo = memberNo;
		this.lessonNo = lessonNo;
	}

	public int getWishlistNo() {
		return wishlistNo;
	}

	public void setWishlistNo(int wishlistNo) {
		this.wishlistNo = wishlistNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getLessonNo() {
		return lessonNo;
	}

	public void setLessonNo(int lessonNo) {
		this.lessonNo = lessonNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
