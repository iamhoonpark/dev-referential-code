package com.jbp.djdn.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

public class Review {

	// 2020-08-10 임현우 reviewCount
	// 2020-08-08 avgScore 자료형 수정됨 주영
	// 2020-08-08 주현 : riName 추가
	// 2020-08-11 주현 : myReviewImgs, regdateStr 추가
	private String nickname, profileImg, content, title, name, riName, regdateStr;
	private double scoreAvg, avgScore;
	private int reviewNo, score, memberNo, courseNo, count, lessonNo, reviewCount;
	private Timestamp regdate;
	private List<ReviewImg> reviewImgs;
	private String[] myReviewImgs;

	public Review() {
		// TODO Auto-generated constructor stub
	}

	// 2020-07-31
	public Review(int lessonNo, int memberNo) {
		super();
		this.lessonNo = lessonNo;
		this.memberNo = memberNo;
	}

	public Review(int memberNo, int courseNo, int score, String content) {
		super();
		this.score = score;
		this.memberNo = memberNo;
		this.courseNo = courseNo;
		this.content = content;
	}
	
	
	//2020-08-11 박주현 
	public String[] getMyReviewImgs() {
		return myReviewImgs;
	}

	public void setMyReviewImgs(String[] myReviewImgs) {
		this.myReviewImgs = myReviewImgs;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	// 2020-07-30 getter/setter List<ReviewImg>
	public List<ReviewImg> getReviewImgs() {
		return reviewImgs;
	}

	public void setReviewImgs(List<ReviewImg> reviewImgs) {
		this.reviewImgs = reviewImgs;
	}

	// 2020-07-29 getter / setter nickname, profileImg
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	// 2020-07-25 getter / setter lessonNo, reviewCount, scoreAvg
	public double getScoreAvg() {
		return scoreAvg;
	}

	public void setScoreAvg(double scoreAvg) {
		this.scoreAvg = scoreAvg * 20;
	}

	public int getLessonNo() {
		return lessonNo;
	}

	public void setLessonNo(int lessonNo) {
		this.lessonNo = lessonNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public double getAvgScore() {
		return avgScore;
	}

	public void setAvgScore(double avgScore) {
		this.avgScore = avgScore;
	}

	// 2020-08-08 박주현 : 리뷰 이미지 출력 관련 riName 세터게터 추가
	public String getRiName() {
		return riName;
	}

	public void setRiName(String riName) {
		this.riName = riName;
	}
	
	// 2020-08-11 박주현
	public String getRegdateStr() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
		System.out.println(sdf.format(regdate));
		return sdf.format(regdate);
	}

	public void setRegdateStr(String regdateStr) {
		this.regdateStr = regdateStr;
	}	
	

}
