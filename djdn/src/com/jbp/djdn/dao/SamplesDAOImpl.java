package com.jbp.djdn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.Sample;

@Repository
public class SamplesDAOImpl implements SamplesDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 0810
	@Override
	public int insertUrl(String url) {
		return session.insert("samples.insertUrl", url);
	}

	// 2020-07-29
	@Override
	public List<Sample> selectLessonSamplesByLessonNo(int lessonNo) {
		return session.selectList("samples.selectLessonSamplesByLessonNo", lessonNo);
	}

}
