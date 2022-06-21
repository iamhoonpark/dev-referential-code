package com.jbp.djdn.vo;

import java.sql.Timestamp;
import java.util.Calendar;

public class MentorSchedule {

	// 2020-07-29 멤버필드 cal
	private Calendar cal;
	private double roundHour;
	private int mentorScheduleNo, lessonNo, r;
	private Timestamp regdate, startDate;

	public MentorSchedule() {
		cal = Calendar.getInstance();
	}

	public MentorSchedule(Timestamp startDate) {
		this.startDate = startDate;
	}

	public int getR() {
		return r;
	}

	public void setR(int r) {
		this.r = r;
	}

	public double getRoundHour() {
		return roundHour;
	}

	public void setRoundHour(double roundHour) {
		this.roundHour = roundHour;
	}

	public int getMentorScheduleNo() {
		return mentorScheduleNo;
	}

	public void setMentorScheduleNo(int mentorScheduleNo) {
		this.mentorScheduleNo = mentorScheduleNo;
	}

	public int getLessonNo() {
		return lessonNo;
	}

	public void setLessonNo(int lessonNo) {
		this.lessonNo = lessonNo;
	}

	public Timestamp getStartDate() {
		return startDate;
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

	// 날짜 포맷하는 메서드
	public int getMonth() {
		return cal.get(Calendar.MONTH) + 1;
	}

	public int getDay() {
		return cal.get(Calendar.DATE);
	}

	public String getDate() {
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		return month + "월 " + day + "일";
	}

	// 시간 포맷하는 메서드
	public String getFirstTime() {
		int minute = cal.get(Calendar.MINUTE);
		int hour = cal.get(Calendar.HOUR);
		if (minute == 0) {
			return hour + "시";
		} else {
			return hour + "시 " + minute + "분";
		} // if~else end
	}

	public String getLastTime() {
		double format = Math.floor(roundHour);
		int result = (int) (format / roundHour);
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int minute = cal.get(Calendar.MINUTE);
		int resultHour = hour + (int) format;

		// result가 1이라는 것은 회당수업시간이 시간단위로만 있는 것
		if (result == 1) {
			// minute이 0이면 분을 사용할 필요가 없는 것
			if (minute == 0) {
				if (resultHour > 12) {
					return resultHour - 12 + "시";
				} else {
					return resultHour + "시";
				} // if~else end
			} else {
				if (resultHour > 12) {
					return resultHour - 12 + "시 " + minute + "분";
				} else {
					return resultHour + "시 " + minute + "분";
				} // if~else end
			} // if~else end
		} else {
			// roundHour가 30분 단위로 쪼개져 있는 것
			if (minute + 30 == 60) {
				resultHour += 1;
				if (resultHour > 12) {
					return resultHour - 12 + "시";
				} else {
					return resultHour + "시";
				} // if~else end
			} else {
				if (resultHour > 12) {
					return resultHour - 12 + "시 " + minute + "분";
				} else {
					return resultHour + "시 " + minute + "분";
				} // if~else end
			} // if~else end
		} // if~else end

	}// getLastTime() end

	public String getAmPm() {
		int amPm = cal.get(Calendar.AM_PM);
		if (amPm == 0) {
			return "오전";
		} else {
			return "오후";
		}
	}

	public String getAmPmCheck() {
		double format = Math.floor(roundHour);
		//int result = (int) (format / roundHour);
		int hour = cal.get(Calendar.HOUR_OF_DAY);

		if (hour + (int) format > 23) {
			return "오전";
		} else if (hour + (int) format > 11) {
			return "오후";
		} else {
			return "오전";
		}
	}

}
