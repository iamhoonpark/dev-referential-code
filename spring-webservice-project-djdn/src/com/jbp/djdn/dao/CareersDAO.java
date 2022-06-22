package com.jbp.djdn.dao;

import com.jbp.djdn.vo.Career;

public interface CareersDAO {

	//2020-08-12 동범
	public int insertMentorCareers(Career career);
	
	//2020-08-12 동범 mentorProfile Category 삭제
	public int deleteByAppealNo(int appealNo);
}
