package com.jbp.djdn.dao;

import java.util.List;

import com.jbp.djdn.vo.Appeal;
import com.jbp.djdn.vo.Mentor;

public interface AppealDAO {

	public List<Appeal> selectAppeal(int memberNo);

	public Appeal selectAppealIntroduction(Appeal appeal);
	
	//2020-08-10 구동범 MentorAppeal추가
	public int insertMentorAppeal(Appeal appeal);
	//2020-08-10 동범 현재 appeal seq찾기
	public int selectAppealSeq();
	//2020-08-10 동범 appeal no찾기
	public int selectAppealNo(Mentor mentor);
	//2020-08-12 동범 mentorProfile Category 삭제
	public int deleteByAppealNo(int appealNo);

}
