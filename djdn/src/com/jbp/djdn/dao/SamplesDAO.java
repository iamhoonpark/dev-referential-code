package com.jbp.djdn.dao;

import java.util.List;

import com.jbp.djdn.vo.Sample;

public interface SamplesDAO {

	// 0810
	public int insertUrl(String url);

	// 2020-07-29
	public List<Sample> selectLessonSamplesByLessonNo(int lessonNo);

}
