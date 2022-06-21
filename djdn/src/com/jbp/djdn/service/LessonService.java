package com.jbp.djdn.service;

import java.util.List;
import java.util.Map;

import com.jbp.djdn.vo.Category;
import com.jbp.djdn.vo.CheckRule;
import com.jbp.djdn.vo.Course;
import com.jbp.djdn.vo.Lesson;
import com.jbp.djdn.vo.Location;
import com.jbp.djdn.vo.Member;
import com.jbp.djdn.vo.Tag;

public interface LessonService {
	
	public List<Course> courseCompare();
	//2020-08-10 민겸
	public List<Location> getGungo(int addressNo);
	//2020-08-09 민겸
	public List<Location> getSido();
	public List<Lesson> getLessonCard(CheckRule checkRule, int memberNo);
	public List<Lesson> getLessonCard(Lesson lesson);
	public List<Tag> getTags(int lessonNo);

	// 2020-08-11 주영
	public List<Lesson> getMyLessonSchedules(int no);

	public Map<String, Object> getMyLessons(int page, int no, char status);

	// 0809
	public void insertLesson(Lesson lesson);

	// 08/08
	public List<Location> getSidoFirst();

	public List<Location> getSidoSecond(int sido);

	// 0807
	public List<Category> getSubCate(int no);

	public List<Category> getUpperCate();

	// 2020-08-08 강정현 수업 상태 업데이트하는 메서드
	public boolean updateLessonStatus(Lesson lesson);

	// 2020-08-08 강정현 수업 신청하는 메서드
	public void addCourse(Course course, String[] classDate, int memberNo);

	// 2020-08-08 강정현 수업 상세 불러오는 메서드
	public Map<String, Object> getLesson(int lessonNo, Member loginMember);
	
	//2020-08-07 동범 search테마
	public Map<String, Object> searchLessonThemeList(int memberNo);	
	//2020-08-07 동범 search태그
	public Map<String, Object> searchByTag(int memberNo);
	//2020-08-07 동범 search카테고리
	public Map<String, Object> searchCategory(int memberNo);
	//2020-08-07 동범 search 계절
	public Map<String, Object> searchSeason(int memberNo);
	//2020-08-07 동범 상단searchBar 검색
	public List<Tag> searchBar(String keyword);
}
