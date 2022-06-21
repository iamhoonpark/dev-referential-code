package com.jbp.djdn.service;

import java.util.List;
import java.util.Map;

import com.jbp.djdn.vo.Blacklist;
import com.jbp.djdn.vo.Course;
import com.jbp.djdn.vo.Lesson;

public interface CourseService {

	// 2020-08-08 주영
	public List<Lesson> getMyCourseSchedules(int no);

	public Map<String, Object> getMyCourses(int page, int no, String courseStatus);

	public Map<String, Object> getCourse(int memberNo);

	// 2020-08-07 박혜민 멘티목록
	public List<Course> getMenteeList(int no);

	// 2020-08-07 박혜민 멘티목록 에서 멘티차단하기
	public int addMenteeBlack(Blacklist blacklist);
}
