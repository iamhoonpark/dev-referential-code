package com.jbp.djdn.vo;

import java.sql.Timestamp;
import java.util.Calendar;

public class MenteeSchedule {

	// 2020-07-30 member memberNo
	private int menteeScheduleNo, courseNo, num, memberNo;
	private Timestamp regdate, startDate;
	private Calendar cal;

	public MenteeSchedule() {
		cal = Calendar.getInstance();
	}

	// 2020-07-30 Constructor courseNo, memberNo
	public MenteeSchedule(int courseNo, int memberNo) {
		this.courseNo = courseNo;
		this.memberNo = memberNo;
	}

	// 2020-07-30 getter/setter memberNo
	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getMenteeScheduleNo() {
		return menteeScheduleNo;
	}

	public void setMenteeScheduleNo(int menteeScheduleNo) {
		this.menteeScheduleNo = menteeScheduleNo;
	}

	public int getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}

	public Timestamp getStartDate() {
		return startDate;
	}

	public MenteeSchedule(Timestamp startDate) {
		this.startDate = startDate;
	}

	public void setStartDate(Timestamp startDate) {
		cal.setTime(startDate);
		this.startDate = startDate;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	// 수업시간 포맷 변경하는 메서드
	public String getDate() {

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

	public int getHour() {
		int hour = cal.get(Calendar.HOUR);
		return hour;
	}

	public int getMinute() {
		int minute = cal.get(Calendar.MINUTE);

		return minute;
	}

	public String getTimeType() {
		String amPmStr = "";
		int amPm = cal.get(Calendar.AM_PM);
		if (amPm == 0) {
			amPmStr = "오전";
		} else {
			amPmStr = "오후";
		}
		return amPmStr;
	}
}
