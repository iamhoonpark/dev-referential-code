package com.jbp.djdn.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.Career;

@Repository
public class CareersDAOImpl implements CareersDAO {

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	//2020-08-12 동범
	public int insertMentorCareers(Career career) {
		return session.insert("careers.insertMentorCareers", career);
	}
	
	//2020-08-12 동범 mentorProfile Category 삭제
	public int deleteByAppealNo(int appealNo) {
		return session.delete("careers.deleteByAppealNo", appealNo);
	}
}
