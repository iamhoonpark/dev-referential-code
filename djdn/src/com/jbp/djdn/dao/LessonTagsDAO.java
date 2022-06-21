package com.jbp.djdn.dao;

import java.util.List;

import com.jbp.djdn.vo.LessonTag;

public interface LessonTagsDAO {

	// 2020-08-09 주영
	public List<LessonTag> selectLessonTagsByLessonNo(int lessonNo);

	// 2020-08-08 수정 주영
	public List<LessonTag> selectLessonTagsByMemberNo(int no);

	// 2020-07-31
	public List<LessonTag> selectLessonThemeTags(int lessonNo);

}
