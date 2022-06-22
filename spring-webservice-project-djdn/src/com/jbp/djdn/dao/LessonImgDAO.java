package com.jbp.djdn.dao;

import java.util.List;

import com.jbp.djdn.vo.LessonImg;

public interface LessonImgDAO {

	// 2020-07-28
	public List<LessonImg> selectLessonImgs(int lessonNo);

}
