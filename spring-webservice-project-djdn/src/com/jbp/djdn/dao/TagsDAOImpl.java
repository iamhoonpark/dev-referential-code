package com.jbp.djdn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.Tag;

@Repository
public class TagsDAOImpl implements TagsDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	//2020-08-10 민겸
	@Override
	public List<Tag> selectList(int lessonNo) {
		return session.selectList("tags.selectList",lessonNo);
	}

	// 0810
	@Override
	public int insertTags(String tag) {
		return session.insert("tags.insertTags", tag);
	}

	@Override
	public int insertLessonTag() {
		return session.insert("tags.insertLessonTag");
	}

	// 2020-07-31
	@Override
	public List<Tag> selectTagList(String keyword) {
		return session.selectList("tags.selectTagList", keyword);
	}

}
