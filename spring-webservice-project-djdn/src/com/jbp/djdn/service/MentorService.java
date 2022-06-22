package com.jbp.djdn.service;

import java.util.List;
import java.util.Map;

import com.jbp.djdn.vo.Background;
import com.jbp.djdn.vo.Lesson;
import com.jbp.djdn.vo.Mentor;

public interface MentorService {

	// 2020-08-09 임현우
	public int putMentor(Mentor mentor, String[] school, String[] major, char[] graduation, String[] proof);

	public int putBackground(Background background);
	

	//2020-08-08 동범 mentorProfile.djdn의 Service
	public Map<String, Object> searchMentor(int memberNo);
	
	//2020-08-10 동범 mentorProfile 카테고리별 content찾기
	public List<Mentor> searchContentInfo(Mentor mentor);
	
	//2020-08-10 mentorAppeal 추가
	public void addMentorInfo(Mentor mentor, int memberNo);
	
	//2020-08-08 동범 mentorProfile.djdn의 Mentor별 카드띄우기
	public List<Lesson> searchLessonsByMentor(int memberNo);
	
	//2020-08-12 동범 MentorProfile Category삭제
	public void removeMentorCate(Mentor mentor);
}
