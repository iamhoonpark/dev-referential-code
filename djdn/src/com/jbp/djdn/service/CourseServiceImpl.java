package com.jbp.djdn.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.jbp.djdn.dao.BlacklistDAO;
import com.jbp.djdn.dao.CoursesDAO;
import com.jbp.djdn.dao.LessonTagsDAO;
import com.jbp.djdn.dao.LessonsDAO;
import com.jbp.djdn.dao.LocationDAO;
import com.jbp.djdn.dao.MenteeSchedulesDAO;
import com.jbp.djdn.dao.ReviewsDAO;
import com.jbp.djdn.util.PaginateUtil;
import com.jbp.djdn.vo.Blacklist;
import com.jbp.djdn.vo.Course;
import com.jbp.djdn.vo.Lesson;
import com.jbp.djdn.vo.Location;
import com.jbp.djdn.vo.MenteeSchedule;
import com.jbp.djdn.vo.PageVO;

@Service
public class CourseServiceImpl implements CourseService {

	// 멤버필드 선언
	// 2020-08-08 주영 lessonTagsDAO, reviewsDAO 멤버필드, setter
	// 2020-08-08 강정현 menteeSchedulesDAO 멤버필드, setter
	// 2020-08-07 박혜민 blackList 멤버필드, setter
	private LessonTagsDAO lessonTagsDAO;
	private ReviewsDAO reviewsDAO;
	private MenteeSchedulesDAO menteeSchedulesDAO;
	private BlacklistDAO blacklistDAO;
	private LocationDAO locationDAO;
	private LessonsDAO lessonsDAO;
	private CoursesDAO coursesDAO;

	// setter
	public void setLessonTagsDAO(LessonTagsDAO lessonTagsDAO) {
		this.lessonTagsDAO = lessonTagsDAO;
	}

	public void setReviewsDAO(ReviewsDAO reviewsDAO) {
		this.reviewsDAO = reviewsDAO;
	}

	public void setMenteeSchedulesDAO(MenteeSchedulesDAO menteeSchedulesDAO) {
		this.menteeSchedulesDAO = menteeSchedulesDAO;
	}

	public void setLocationDAO(LocationDAO locationDAO) {
		this.locationDAO = locationDAO;
	}

	public void setLessonsDAO(LessonsDAO lessonsDAO) {
		this.lessonsDAO = lessonsDAO;
	}

	public void setBlacklistDAO(BlacklistDAO blacklistDAO) {
		this.blacklistDAO = blacklistDAO;
	}

	public void setCoursesDAO(CoursesDAO coursesDAO) {
		this.coursesDAO = coursesDAO;
	}

	// 2020-08-09 주영
	@Override
	public List<Lesson> getMyCourseSchedules(int no) {
		return lessonsDAO.selectMyActivitySchedules(no);
	}

	// 2020-08-08 주영
	@Override
	public Map<String, Object> getMyCourses(int page, int no, String courseStatus) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		int numPage = 6;
		PageVO pageVO = new PageVO(page, numPage, no);
		pageVO.setCourseStatus(courseStatus);
		List<Lesson> lessons = lessonsDAO.selectListMyActivity(pageVO);
		// selectTotal
		Lesson lesson = new Lesson();
		lesson.setMemberNo(no);
		lesson.setCourseStatus(courseStatus);
		int total = lessonsDAO.selectTotalMyActivity(lesson);
		if (!lessons.isEmpty()) {
			for (Lesson list : lessons) {
				list.setScoreAvg(reviewsDAO.selectLessonReviewCountAvg(list.getLessonNo()).getScoreAvg());
				list.setCount(reviewsDAO.selectLessonReviewCountAvg(list.getLessonNo()).getCount());
				// 태그
				list.setLessonTags(lessonTagsDAO.selectLessonTagsByLessonNo(list.getLessonNo()));
			}
			String paginate = PaginateUtil.getPaginate(page, total, numPage, 3, "/myActivity.djdn", "page=");
			map.put("paginate", paginate);
			map.put("total", total);
		}
		map.put("lessons", lessons);
		return map;
	}

	@Override
	public Map<String, Object> getCourse(int memberNo) {
		Map<String, Object> modelMap = new ConcurrentHashMap<String, Object>();
		int courseNo = coursesDAO.selectCourseCurrval();
		Lesson lessonCourse = new Lesson(memberNo, courseNo, courseNo);
		MenteeSchedule schedule = new MenteeSchedule(courseNo, memberNo);
		Lesson lesson = lessonsDAO.selectCourseLessonByNo(lessonCourse);
		Location location = locationDAO.selectLocationByAddressNo(lesson.getAddressNo());
		List<MenteeSchedule> menteeSchedules = menteeSchedulesDAO.selectMenteeSchedules(schedule);
		modelMap.put("lesson", lesson);
		modelMap.put("location", location);
		modelMap.put("menteeSchedules", menteeSchedules);
		return modelMap;
	}

	// 2020-08-07 박혜민 멘티목록
	@Override
	public List<Course> getMenteeList(int lessonNo) {
		return coursesDAO.selectMenteeListByLessonNo(lessonNo);
	}

	// 2020-08-07 박혜민 멘티목록 에서 멘티차단하기
	@Override
	public int addMenteeBlack(Blacklist blacklist) {
		return blacklistDAO.insertBlacklist(blacklist);
	}

}
