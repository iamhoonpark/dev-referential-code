package com.jbp.djdn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.LessonTag;

@Repository
public class LessonTagsDAOImpl implements LessonTagsDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 2020-08-09 주영
	@Override
	public List<LessonTag> selectLessonTagsByLessonNo(int lessonNo) {
		return session.selectList("lessonTags.selectLessonTagsByLessonNo", lessonNo);
	}

	// 2020-08-08 수정 주영
	@Override
	public List<LessonTag> selectLessonTagsByMemberNo(int no) {
		return session.selectList("lessonTags.selectLessonTagsByMemberNo", no);
	}

	// 2020-07-31
	@Override
	public List<LessonTag> selectLessonThemeTags(int lessonNo) {
		return session.selectList("lessonTags.selectLessonThemeTags", lessonNo);
	}

}
