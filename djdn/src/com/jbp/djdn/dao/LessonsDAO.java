package com.jbp.djdn.dao;

import java.util.List;

import com.jbp.djdn.vo.CheckRule;
import com.jbp.djdn.vo.Lesson;
import com.jbp.djdn.vo.PageVO;

public interface LessonsDAO {
	
	// 2020-08-09 민겸	
	public List<Lesson> selectLessonCard(CheckRule checkRule);
	public List<Lesson> selectLessonCard(Lesson lesson);

	// 2020-08-11 주영
	public List<Lesson> selectMyLessonsSchedules(int no);

	public List<Lesson> selectMyActivitySchedules(int no);

	public int selectTotalMyLessons(Lesson lesson);

	public List<Lesson> selectMyLessons(PageVO pageVO);

	// 2020-08-07 주영
	public int selectTotalMyActivity(Lesson lesson);

	// 0809
	public int insertLesson(Lesson lesson);

	public int insertLessonImgs(String lessonImg);

	// 2020-08-02
	public int selectCountOpenLessons(int memberNo);

	// 2020-08-07 수정됨 주영
	public List<Lesson> selectListMyActivity(PageVO pageVO);

	// 2020-07-29
	public Lesson selectLessonByLessonNo(int lessonNo);

	public int lessonStatusUpdate(Lesson lesson);

	public String selectLessonStatus(int lessonNo);

	// 2020-07-28
	public Lesson selectLessonList(int lessonNo);

	// 2020-07-25
	public List<Lesson> selectLessonThemeListOrderCategory();

	public List<Lesson> selectLessonThemeListOrderWinter();

	public List<Lesson> selectLessonThemeListOrderAutumn();

	public List<Lesson> selectLessonThemeListOrderSummer();

	public List<Lesson> selectLessonThemeListOrderSpring();

	public List<Lesson> selectLessonThemeListOrderTag();

	public List<Lesson> selectLessonThemeList();

	public Lesson selectCourseLessonByNo(Lesson Lesson);
	
	//2020-08-11 동범
	public List<Lesson> selectLessonsByMentor(int memberNo);	
}
