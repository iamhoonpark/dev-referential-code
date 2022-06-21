package com.jbp.djdn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.Curriculum;

@Repository
public class CurriculumsDAOImpl implements CurriculumsDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 2020-08-10
	@Override
	public int insertCurriculums(Curriculum curriculum) {
		return session.insert("curriculums.insertCurriculums", curriculum);
	}

	// 2020-07-29
	@Override
	public List<Curriculum> selectLessonCurriculums(int lessonNo) {
		return session.selectList("curriculums.selectLessonCurriculums", lessonNo);
	}

}
