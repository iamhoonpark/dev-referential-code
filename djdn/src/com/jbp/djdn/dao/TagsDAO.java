package com.jbp.djdn.dao;

import java.util.List;

import com.jbp.djdn.vo.Tag;

public interface TagsDAO {
	
	//2020-08-10 민겸
	public List<Tag> selectList(int lessonNo);

	// 0810
	public int insertTags(String tag);

	public int insertLessonTag();

	// 2020-07-31
	public List<Tag> selectTagList(String keyword);

}
