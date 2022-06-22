package com.jbp.djdn.dao;

import java.util.List;

import com.jbp.djdn.vo.Course;

public interface CoursesDAO {

	public int updateCourseBystatus(int courseNo);
	
	public List<Course> selectCourseByStartDate();
	
	// 2020-07-30
	public int selectCourseCurrval();

	public int insertCourse(Course course);

	// 2020.07.28
	public List<Course> selectMenteeListByLessonNo(int lessonNo);

	public int updateCourseStatus(int courseNo);

	// 2020-08-10 수정됨
	public Course selectRefund(Course course);

}
