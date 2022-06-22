package com.jbp.djdn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.LessonImg;

@Repository
public class LessonImgDAOImpl implements LessonImgDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 2020-07-28
	@Override
	public List<LessonImg> selectLessonImgs(int lessonNo) {
		return session.selectList("lessonImg.selectLessonImgs", lessonNo);
	}

}
