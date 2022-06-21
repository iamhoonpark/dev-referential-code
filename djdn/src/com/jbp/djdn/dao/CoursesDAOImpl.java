package com.jbp.djdn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.Course;

@Repository
public class CoursesDAOImpl implements CoursesDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public int updateCourseBystatus(int courseNo) {
		return session.update("courses.updateCourseBystatus", courseNo);
	}
	
	@Override
	public List<Course> selectCourseByStartDate() {
		return session.selectList("courses.selectCourseByStartDate");
	}
	
	// 2020-07-30
	@Override
	public int selectCourseCurrval() {
		return session.selectOne("courses.selectCourseCurrval");
	}

	@Override
	public int insertCourse(Course course) {
		return session.insert("courses.insertCourse", course);
	}

	// 2020.07.28
	@Override
	public List<Course> selectMenteeListByLessonNo(int lessonNo) {
		return session.selectList("courses.selectMenteeListByLessonNo", lessonNo);
	}

	@Override
	public int updateCourseStatus(int courseNo) {
		return session.update("courses.updateCourseStatus", courseNo);
	}

	// 2020-08-10 수정됨
	@Override
	public Course selectRefund(Course course) {
		return session.selectOne("courses.selectRefund", course);
	}

}