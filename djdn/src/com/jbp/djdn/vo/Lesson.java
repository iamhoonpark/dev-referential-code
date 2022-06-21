package com.jbp.djdn.vo;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

public class Lesson {

	// 2020-08-11 민겸 추가 guNo, gunNo
	// 2020-08-09 avgScore, sumReview
	// 2020-08-11 강정현 lessonTags 멤버필드 선언
	// 2020-08-07 member open, openFlag
	// 2020-07-30 member courseNo, courseCurrval
	// 2020-07-25 member likecount, r
	private DecimalFormat df;
	private String[] lessonImg, curriculumContent, tag, url, startDate;
	private String title, detailAddress, message, introduction, target, thumnail, nickname, profileImg, gungu, sido,
			courseStatus, likeCount, address;
	private int avgScore, sumReview, lessonNo, minPersonnel, maxPersonnel, price, round, categoryNo, memberNo, addressNo, courseNo,
			courseCurrval, menteeNo, wishlistNo, no, count, r, goNo,gunNo;;
	private double roundHour, scoreAvg;
	private char type, personnel, status;
	private Timestamp regdate, startTimestamp;
	private Calendar cal;
	private List<LessonTag> lessonTags;
	//2020-08-10 tags 민겸
	private List<Tag> tags;
	//2020-08-12 flags Review, themeOrder, location 강정현
	private boolean flag;
	private Review review;
	private List<LessonTag> themeOrder;
	private Location location;
	
	public Lesson() {
		cal = Calendar.getInstance();
		df = new DecimalFormat("###,###,###원");
	}
	
	// 2020-07-30 Constructor lessonNo, status
	public Lesson(int lessonNo, char status) {
		this.lessonNo = lessonNo;
		this.status = status;
	}

	// 2020-07-30 Constructor memberNo, courseNo, courseCurrval
	public Lesson(int memberNo, int courseNo, int courseCurrval) {
		super();
		this.memberNo = memberNo;
		this.courseNo = courseNo;
		this.courseCurrval = courseCurrval;
	}
	
	
	
	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public List<LessonTag> getThemeOrder() {
		return themeOrder;
	}

	public void setThemeOrder(List<LessonTag> themeOrder) {
		this.themeOrder = themeOrder;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	public boolean getFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getSumReview() {
		return sumReview;
	}

	public void setSumReview(int sumReview) {
		this.sumReview = sumReview;
	}
	
	public Timestamp getStartTimestamp() {
		return startTimestamp;
	}

	public void setStartTimestamp(Timestamp startTimestamp) {
		this.startTimestamp = startTimestamp;
	}

	public String getCourseStatus() {
		return courseStatus;
	}

	public void setCourseStatus(String courseStatus) {
		this.courseStatus = courseStatus;
	}
	
	public int getAvgScore() {
		return avgScore;
	}

	public void setAvgScore(int avgScore) {
		this.avgScore = avgScore;
	}

	public int getGoNo() {
		return goNo;
	}

	public void setGoNo(int goNo) {
		this.goNo = goNo;
	}

	public int getGunNo() {
		return gunNo;
	}

	public void setGunNo(int gunNo) {
		this.gunNo = gunNo;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public double getScoreAvg() {
		return scoreAvg;
	}

	public void setScoreAvg(double scoreAvg) {
		this.scoreAvg = scoreAvg;
	}

	public List<LessonTag> getLessonTags() {
		return lessonTags;
	}

	public void setLessonTags(List<LessonTag> lessonTags) {
		this.lessonTags = lessonTags;
	}

	public String[] getStartDate() {
		return startDate;
	}

	public void setStartDate(String[] startDate) {
		this.startDate = startDate;
	}

	public String[] getTag() {
		return tag;
	}

	public void setTag(String[] tag) {
		this.tag = tag;
	}

	public String[] getUrl() {
		return url;
	}

	public void setUrl(String[] url) {
		this.url = url;
	}

	public String getGungu() {
		return gungu;
	}

	public String[] getCurriculumContent() {
		return curriculumContent;
	}

	public void setCurriculumContent(String[] curriculumContent) {
		this.curriculumContent = curriculumContent;
	}

	public String[] getLessonImg() {
		return lessonImg;
	}

	public void setLessonImg(String[] lessonImg) {
		this.lessonImg = lessonImg;
	}

	public void setGungu(String gungu) {
		this.gungu = gungu;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public int getMenteeNo() {
		return menteeNo;
	}

	public void setMenteeNo(int menteeNo) {
		this.menteeNo = menteeNo;
	}

	public int getWishlistNo() {
		return wishlistNo;
	}

	public void setWishlistNo(int wishlistNo) {
		this.wishlistNo = wishlistNo;
	}

	// 2020-07-30 getter/setter courseNo, courseCurrval
	public int getCourseCurrval() {
		return courseCurrval;
	}

	public void setCourseCurrval(int courseCurrval) {
		this.courseCurrval = courseCurrval;
	}

	public int getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}

	// 2020-07-25 getter/setter likecount, r
	public String getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(String likeCount) {
		this.likeCount = likeCount;
	}

	public int getR() {
		return r;
	}

	public void setR(int r) {
		this.r = r;
	}

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

	public int getLessonNo() {
		return lessonNo;
	}

	public void setLessonNo(int lessonNo) {
		this.lessonNo = lessonNo;
	}

	public char getType() {
		return type;
	}

	public void setType(char type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public char getPersonnel() {
		return personnel;
	}

	public void setPersonnel(char personnel) {
		this.personnel = personnel;
	}

	public int getMinPersonnel() {
		return minPersonnel;
	}

	public void setMinPersonnel(int minPersonnel) {
		this.minPersonnel = minPersonnel;
	}

	public int getMaxPersonnel() {
		return maxPersonnel;
	}

	public void setMaxPersonnel(int maxPersonnel) {
		this.maxPersonnel = maxPersonnel;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public double getRoundHour() {
		return roundHour;
	}

	public void setRoundHour(double roundHour) {
		this.roundHour = roundHour;
	}

	public int getRound() {
		return round;
	}

	public void setRound(int round) {
		this.round = round;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getAddressNo() {
		return addressNo;
	}

	public void setAddressNo(int addressNo) {
		this.addressNo = addressNo;
	}

	public String getThumnail() {
		return thumnail;
	}

	public void setThumnail(String thumnail) {
		this.thumnail = thumnail;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		cal.setTime(regdate);
		this.regdate = regdate;
	}

	// 2020-07-25 시간당 수업 가격 포맷하는 메서드
	public String getFormatPrice() {
		return df.format(price);
	}

	// 수업 총 가격 계산하고 포맷하는 메서드
	public int getTotal() {
		return (int) (price * round * roundHour);
	}

	public String getTotalPrice() {
		double total = price * round * roundHour;
		return df.format(total);
	}

	public String getTotalTaxPrice() {
		double total = price * round * roundHour * 1.1;
		return df.format(total);
	}

	// 결제 시간 포맷하는 메서드(년 월 일(요일) 시간 : 분)
	public String getFormatRegdate() {
		String weekStr = "";
		String amPmStr = "";
		String minuteStr = "";

		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);
		int week = cal.get(Calendar.DAY_OF_WEEK);
		int hour = cal.get(Calendar.HOUR);
		int minute = cal.get(Calendar.MINUTE);
		int amPm = cal.get(Calendar.AM_PM);
		if (week == 1) {
			weekStr = "일";
		} else if (week == 2) {
			weekStr = "월";
		} else if (week == 3) {
			weekStr = "화";
		} else if (week == 4) {
			weekStr = "수";
		} else if (week == 5) {
			weekStr = "목";
		} else if (week == 6) {
			weekStr = "금";
		} else {
			weekStr = "토";
		} // if~elseif~else end

		if (amPm == 0) {
			amPmStr = "오전";
		} else {
			amPmStr = "오후";
		}

		if (minute != 0) {
			minuteStr = minute + "분";
		}
		return year + "년 " + month + "월 " + date + "일" + "(" + weekStr + ") " + amPmStr + " " + hour + "시 " + minuteStr;
	}

	// 1회당 수업시간을 포맷하는 메서드
	public String getFormatRoundHour() {
		String word = "";
		double format = Math.floor(roundHour);
		int result = (int) (format / roundHour);
		// System.out.println(roundHour);
		// System.out.println("result : " + result);

		if (result == 1) {
			word = (int) format + "시간";
		} else {
			word = (int) format + "시간 30분";
		}
		return word;
	}

	public int getHour() {
		double format = Math.floor(roundHour);
		int result = (int) format;

		return result;
	}

	public int getMinute() {

		double format = Math.floor(roundHour);
		int result = (int) (format / roundHour);

		if (result == 1) {
			result = 0;
		} else {
			result = 30;
		}

		return result;
	}

	// 2020-08-10 주영
	public String getFormatStatus() {
		switch (status) {
		case 'O':
			return "공개";
		case 'C':
			return "비공개";
		case 'F':
			return "종료";
		case 'E':
			return "만료";
		default:
			return "공개";
		}
	}

	// 2020-08-10 주영
	public String getFormatPersonnel() {
		switch (personnel) {
		case 'P':
			return "1대1";
		case 'G':
			return "그룹";
		default:
			return "그룹";
		}
	}

	// 2020-08-11 주영
	public String getFormatCourseStatus() {
		try {
			switch (courseStatus) {
			case "CI":
				return "수강중";
			case "CC":
				return "수강완료";
			case "RI":
				return "환불진행중";
			case "RC":
				return "환불완료";
			default:
				return "수강완료";
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

}