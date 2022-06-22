package com.jbp.djdn.dao;

import java.util.List;

import com.jbp.djdn.vo.Curriculum;

public interface CurriculumsDAO {
	
	// 2020-08-10
	public int insertCurriculums(Curriculum curriculum);

	// 2020-07-29
	public List<Curriculum> selectLessonCurriculums(int lessonNo);

}
