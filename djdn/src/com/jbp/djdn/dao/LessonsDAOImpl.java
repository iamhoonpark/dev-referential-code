package com.jbp.djdn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.CheckRule;
import com.jbp.djdn.vo.Lesson;
import com.jbp.djdn.vo.PageVO;

@Repository
public class LessonsDAOImpl implements LessonsDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 2020-08-09 민겸
	public List<Lesson> selectLessonCard(CheckRule checkRule) {
		return session.selectList("lessons.selectLessonCard", checkRule);
	}

	public List<Lesson> selectLessonCard(Lesson lesson) {
		return session.selectList("lessons.selectLessonCard", lesson);
	}

	// 2020-08-11 주영
	@Override
	public List<Lesson> selectMyLessonsSchedules(int no) {
		return session.selectList("lessons.selectMyLessonsSchedules", no);
	}

	@Override
	public List<Lesson> selectMyActivitySchedules(int no) {
		return session.selectList("lessons.selectMyActivitySchedules", no);
	}

	@Override
	public int selectTotalMyLessons(Lesson lesson) {
		return session.selectOne("lessons.selectTotalMyLessons", lesson);
	}

	@Override
	public List<Lesson> selectMyLessons(PageVO pageVO) {
		return session.selectList("lessons.selectMyLessons", pageVO);
	}

	// 2020-08-07 주영
	@Override
	public int selectTotalMyActivity(Lesson lesson) {
		return session.selectOne("lessons.selectTotalMyActivity", lesson);
	}

	@Override
	public int insertLessonImgs(String lessonImg) {
		return session.insert("lessonImg.insertLessonImgs", lessonImg);
	}

	@Override
	public int insertLesson(Lesson lesson) {
		return session.insert("lessons.insertLesson", lesson);
	}

	// 2020-08-02
	@Override
	public int selectCountOpenLessons(int memberNo) {
		return session.selectOne("lessons.selectCountOpenLessons", memberNo);
	}

	// 08-01
	@Override
	public List<Lesson> selectListMyActivity(PageVO pageVO) {
		return session.selectList("lessons.selectListMyActivity", pageVO);
	}

	// 2020-07-29
	@Override
	public Lesson selectLessonByLessonNo(int lessonNo) {
		return session.selectOne("lessons.selectLessonByLessonNo", lessonNo);
	}

	// 2020-07-29
	@Override
	public int lessonStatusUpdate(Lesson lesson) {
		return session.update("lessons.lessonStatusUpdate", lesson);
	}

	@Override
	public String selectLessonStatus(int lessonNo) {
		return session.selectOne("lessons.selectLessonStatus", lessonNo);
	}

	// 2020-07-28
	@Override
	public Lesson selectLessonList(int lessonNo) {
		return session.selectOne("lessons.selectLessonList", lessonNo);
	}

	// 2020-07-25
	@Override
	public List<Lesson> selectLessonThemeListOrderCategory() {
		return session.selectList("lessons.selectLessonThemeListOrderCategory");
	}

	@Override
	public List<Lesson> selectLessonThemeListOrderWinter() {
		return session.selectList("lessons.selectLessonThemeListOrderWinter");
	}

	@Override
	public List<Lesson> selectLessonThemeListOrderAutumn() {
		return session.selectList("lessons.selectLessonThemeListOrderAutumn");
	}

	@Override
	public List<Lesson> selectLessonThemeListOrderSummer() {
		return session.selectList("lessons.selectLessonThemeListOrderSummer");
	}

	@Override
	public List<Lesson> selectLessonThemeListOrderSpring() {
		return session.selectList("lessons.selectLessonThemeListOrderSpring");
	}

	@Override
	public List<Lesson> selectLessonThemeListOrderTag() {
		return session.selectList("lessons.selectLessonThemeListOrderTag");
	}

	@Override
	public List<Lesson> selectLessonThemeList() {
		return session.selectList("lessons.selectLessonThemeListOrderLike");
	}

	@Override
	public Lesson selectCourseLessonByNo(Lesson Lesson) {
		return session.selectOne("lessons.selectCourseLessonByNo", Lesson);
	}

	//2020-08-11 동범
	public List<Lesson> selectLessonsByMentor(int memberNo) {
		return session.selectList("lessons.selectLessonsByMentor", memberNo);
	}
}
