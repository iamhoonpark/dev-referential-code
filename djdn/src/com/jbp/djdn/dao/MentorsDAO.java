package com.jbp.djdn.dao;

import java.util.List;

import com.jbp.djdn.vo.Mentor;

public interface MentorsDAO {

	// 2020-08-09 임현우
	public int insertMentor(Mentor mentor);

	// 2020-07-28
	public Mentor selectMentorByMemberNo(int memberNo);

	public int selectMentorCheck(int memberNo);

	public Mentor selectLogin(int memberNo);
	
	//2020-08-10 동범 mentorProfile 카테고리별 content찾기
	public List<Mentor> selectMentorContent(Mentor mentor);
	
	//2020-08-10 동범 mentorAppeal 추가
	public int selectAppealSeq(); //현재 appealNo sequence찾기
	public int selectCategoryNo(String categoryName); //해당 카테고리 번호찾기
	public int insertMentorAppeal(Mentor mentor);
	public int insertMentorCertificates(Mentor mentor);
}
