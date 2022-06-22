package com.jbp.djdn.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.jbp.djdn.dao.AppealDAO;
import com.jbp.djdn.dao.BackgroundDAO;
import com.jbp.djdn.dao.CategoryDAO;
import com.jbp.djdn.dao.CoursesDAO;
import com.jbp.djdn.dao.CurriculumsDAO;
import com.jbp.djdn.dao.LessonImgDAO;
import com.jbp.djdn.dao.LessonTagsDAO;
import com.jbp.djdn.dao.LessonsDAO;
import com.jbp.djdn.dao.LocationDAO;
import com.jbp.djdn.dao.MenteeSchedulesDAO;
import com.jbp.djdn.dao.MentorSchdulesDAO;
import com.jbp.djdn.dao.MentorsDAO;
import com.jbp.djdn.dao.ReviewImgsDAO;
import com.jbp.djdn.dao.ReviewsDAO;
import com.jbp.djdn.dao.SamplesDAO;
import com.jbp.djdn.dao.TagsDAO;
import com.jbp.djdn.dao.WishlistDAO;
import com.jbp.djdn.util.PaginateUtil;
import com.jbp.djdn.vo.Appeal;
import com.jbp.djdn.vo.Category;
import com.jbp.djdn.vo.CheckRule;
import com.jbp.djdn.vo.Course;
import com.jbp.djdn.vo.Curriculum;
import com.jbp.djdn.vo.Lesson;
import com.jbp.djdn.vo.Location;
import com.jbp.djdn.vo.Member;
import com.jbp.djdn.vo.MenteeSchedule;
import com.jbp.djdn.vo.MentorSchedule;
import com.jbp.djdn.vo.PageVO;
import com.jbp.djdn.vo.Review;
import com.jbp.djdn.vo.Tag;
import com.jbp.djdn.vo.Wishlist;

@Service
public class LessonServiceImpl implements LessonService {

	// 멤버필드 선언
	private BackgroundDAO backgroundDAO;
	private TagsDAO tagsDAO;
	private MenteeSchedulesDAO menteeSchedulesDAO;
	private CoursesDAO coursesDAO;
	private AppealDAO appealDAO;
	private CategoryDAO categoryDAO;
	private MentorsDAO mentorsDAO;
	private LocationDAO locationDAO;
	private MentorSchdulesDAO mentorSchdulesDAO;
	private CurriculumsDAO curriculumsDAO;
	private SamplesDAO samplesDAO;
	private ReviewImgsDAO reviewImgsDAO;
	private WishlistDAO wishlistDAO;
	private LessonTagsDAO lessonTagsDAO;
	private LessonImgDAO lessonImgDAO;
	private ReviewsDAO reviewsDAO;
	private LessonsDAO lessonsDAO;

	
	public void setBackgroundDAO(BackgroundDAO backgroundDAO) {
		this.backgroundDAO = backgroundDAO;
	}
	// setter
	public void setTagsDAO(TagsDAO tagsDAO) {
		this.tagsDAO = tagsDAO;
	}

	public void setMenteeSchedulesDAO(MenteeSchedulesDAO menteeSchedulesDAO) {
		this.menteeSchedulesDAO = menteeSchedulesDAO;
	}

	public void setCoursesDAO(CoursesDAO coursesDAO) {
		this.coursesDAO = coursesDAO;
	}

	public void setAppealDAO(AppealDAO appealDAO) {
		this.appealDAO = appealDAO;
	}

	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

	public void setMentorsDAO(MentorsDAO mentorsDAO) {
		this.mentorsDAO = mentorsDAO;
	}

	public void setLocationDAO(LocationDAO locationDAO) {
		this.locationDAO = locationDAO;
	}

	public void setMentorSchdulesDAO(MentorSchdulesDAO mentorSchdulesDAO) {
		this.mentorSchdulesDAO = mentorSchdulesDAO;
	}

	public void setCurriculumsDAO(CurriculumsDAO curriculumsDAO) {
		this.curriculumsDAO = curriculumsDAO;
	}

	public void setSamplesDAO(SamplesDAO samplesDAO) {
		this.samplesDAO = samplesDAO;
	}

	public void setReviewImgsDAO(ReviewImgsDAO reviewImgsDAO) {
		this.reviewImgsDAO = reviewImgsDAO;
	}

	public void setWishlistDAO(WishlistDAO wishlistDAO) {
		this.wishlistDAO = wishlistDAO;
	}

	public void setLessonTagsDAO(LessonTagsDAO lessonTagsDAO) {
		this.lessonTagsDAO = lessonTagsDAO;
	}

	public void setLessonImgDAO(LessonImgDAO lessonImgDAO) {
		this.lessonImgDAO = lessonImgDAO;
	}

	public void setReviewsDAO(ReviewsDAO reviewsDAO) {
		this.reviewsDAO = reviewsDAO;
	}

	public void setLessonsDAO(LessonsDAO lessonsDAO) {
		this.lessonsDAO = lessonsDAO;
	}

	@Override
	public List<Course> courseCompare() {
		List<Course> courses = coursesDAO.selectCourseByStartDate();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss.s");
		Calendar cal = Calendar.getInstance();
		String sysdate = sdf.format(cal.getTime());
		System.out.println(sysdate);
		for(Course course : courses) {
			if(Timestamp.valueOf(sysdate).compareTo(course.getStartDate())==1) {
				coursesDAO.updateCourseBystatus(course.getCourseNo());
			}
		}
		return courses;
	}
	
	// 2020-08-10 민겸
	@Override
	public List<Location> getGungo(int addressNo) {
		// TODO Auto-generated method stub
		return locationDAO.selectGungu(addressNo);
	}

	// 2020-08-09 민겸
	@Override
	public List<Location> getSido() {
		// TODO Auto-generated method stub
		return locationDAO.selectSido();
	}

	// 2020-08-11 민겸
	@Override
	public List<Lesson> getLessonCard(CheckRule checkRule, int memberNo) {
		List<Lesson> lessons = lessonsDAO.selectLessonCard(checkRule);
		for (Lesson lesson : lessons) {
			lesson.setTags(tagsDAO.selectList(lesson.getLessonNo()));
			Wishlist wishlist = new Wishlist(memberNo,lesson.getLessonNo());
			Wishlist like = searchLike(wishlist);
			lesson.setFlag(like != null);
		}
		return lessons;

	}

	@Override
	public List<Lesson> getLessonCard(Lesson lessonFilter) {

		List<Lesson> lessons = lessonsDAO.selectLessonCard(lessonFilter);
		
//			for (Lesson lesson : lessons) {
//				
//				
//				List<Tag> tags =  tagsDAO.selectlist( lesson.getLessonNo());
//				
//				
//				lesson.getTagList(tags);
//			}

		return lessons;
	}

	@Override
	public List<Tag> getTags(int lessonNo) {
		// TODO Auto-generated method stub
		return null;
	}

	// 2020-08-09 주영
	@Override
	public List<Lesson> getMyLessonSchedules(int no) {
		List<Lesson> lessons = lessonsDAO.selectMyLessonsSchedules(no);
		for (Lesson lesson : lessons) {
			System.out.println(lesson.getStartDate());
		}
		return lessons;
	}

	// 2020-08-09 주영
	@Override
	public Map<String, Object> getMyLessons(int page, int no, char status) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		int numPage = 6;
		int total = 1;
		PageVO pageVO = new PageVO(page, numPage, no, status);
		List<Lesson> lessons = lessonsDAO.selectMyLessons(pageVO);
		if (!lessons.isEmpty()) {
			for (Lesson lesson : lessons) {
				lesson.setScoreAvg(reviewsDAO.selectLessonReviewCountAvg(lesson.getLessonNo()).getScoreAvg());
				lesson.setCount(reviewsDAO.selectLessonReviewCountAvg(lesson.getLessonNo()).getCount());
				lesson.setLessonTags(lessonTagsDAO.selectLessonTagsByLessonNo(lesson.getLessonNo()));
				total = lessonsDAO.selectTotalMyLessons(lesson);
			}
			String paginate = PaginateUtil.getPaginate(page, total, numPage, 3, "/myLesson.djdn", "page=");
			map.put("paginate", paginate);
			map.put("total", total);
		}
		map.put("lessons", lessons);
		return map;
	}

	// 0809
	@Override
	public void insertLesson(Lesson lesson) {
		int number = 1;
		// System.out.println(lesson.getTag());
		lessonsDAO.insertLesson(lesson);
		for (String img : lesson.getLessonImg()) {
			// System.out.println(img);
			lessonsDAO.insertLessonImgs(img);
		}
		for (String startDate : lesson.getStartDate()) {
			MentorSchedule schedule = new MentorSchedule(Timestamp.valueOf(startDate));
			mentorSchdulesDAO.insertMentorSchedules(schedule);
		}
		for (String curriculum : lesson.getCurriculumContent()) {
			Curriculum curriculum2 = new Curriculum();
			curriculum2.setNumber(number++);
			curriculum2.setContent(curriculum);
			curriculumsDAO.insertCurriculums(curriculum2);
		}
		// 태그삽입
		for (String tag : lesson.getTag()) {
			tagsDAO.insertTags(tag);
			tagsDAO.insertLessonTag();
		}
		// url삽입
		
		for (String url : lesson.getUrl()) {
			System.out.println(url);
			samplesDAO.insertUrl(url);
		}

	}

	// 08/08
	@Override
	public List<Category> getUpperCate() {
		return categoryDAO.selectListUpperCategory();
	}

	@Override
	public List<Category> getSubCate(int no) {
		return categoryDAO.selectListSubCategory(no);
	}

	@Override
	public List<Location> getSidoFirst() {
		return locationDAO.selectListSidoFirst();
	}

	@Override
	public List<Location> getSidoSecond(int sido) {
		return locationDAO.selectListSidoSecond(sido);
	}

	// 2020-08-08 강정현 수업 상태 업데이트 메서드
	@Override
	public boolean updateLessonStatus(Lesson lesson) {
		boolean flag = false;
		if (lesson.getStatus() == 'O') {
			lesson = new Lesson(lesson.getLessonNo(), 'C');
		} else {
			lesson = new Lesson(lesson.getLessonNo(), 'O');
		} // if~else end
		int result = lessonsDAO.lessonStatusUpdate(lesson);
		return flag = result == 1;
	}

	// 2020-08-07 강정현 수업 신청하는 메서드 선언
	@Override
	public void addCourse(Course course, String[] classDate, int memberNo) {
		if (course.getRequest() == "") {
			course.setRequest(null);
		}
		course.setMemberNo(memberNo);
		coursesDAO.insertCourse(course);
		for (String date : classDate) {
			MenteeSchedule schedule = new MenteeSchedule(Timestamp.valueOf(date));
			// System.out.println(Timestamp.valueOf(date));
			menteeSchedulesDAO.insertMenteeSchedules(schedule);
		} // for() end
	}

	// 2020-08-07 강정현 수업 상세 메서드 선언
	@Override
	public Map<String, Object> getLesson(int lessonNo, Member loginMember) {
		Map<String, Object> modelMap = new ConcurrentHashMap<String, Object>();
		Lesson lesson = lessonsDAO.selectLessonList(lessonNo);
		modelMap.put("lesson", lesson);
		modelMap.put("review", reviewsDAO.selectLessonThemeScore(lessonNo));
		modelMap.put("imgs", lessonImgDAO.selectLessonImgs(lessonNo));
		modelMap.put("tags", lessonTagsDAO.selectLessonThemeTags(lessonNo));
		modelMap.put("likeCount", wishlistDAO.selectWishlistCount(lessonNo));
		modelMap.put("reviewImgs", reviewImgsDAO.selectLessonReviewImgs(lessonNo));
		modelMap.put("samples", samplesDAO.selectLessonSamplesByLessonNo(lessonNo));
		modelMap.put("curriculums", curriculumsDAO.selectLessonCurriculums(lessonNo));
		modelMap.put("schedules", mentorSchdulesDAO.selectLessonSchedulesByLessonNo(lessonNo));
		modelMap.put("location", locationDAO.selectLocationByAddressNo(lesson.getAddressNo()));
		modelMap.put("mentor", mentorsDAO.selectMentorByMemberNo(lesson.getMemberNo()));
		modelMap.put("category", categoryDAO.selectLessonCategoryByNo(lesson.getCategoryNo()));
		modelMap.put("backgrounds", backgroundDAO.selectBackground(lesson.getMemberNo()));
		Appeal appeal = new Appeal();
		appeal.setMemberNo(lesson.getMemberNo());
		appeal.setCategoryNo(lesson.getCategoryNo());
		Appeal appealLesson = appealDAO.selectAppealIntroduction(appeal);
		System.out.println(appealLesson);
		if (appealLesson == null) {
			modelMap.put("appeals", "멘토정보가 없습니다.");
		} else {
			modelMap.put("appeals", appealLesson.getIntroduction());
		}
		char open = 'O';
		String openStr = lessonsDAO.selectLessonStatus(lessonNo);
		open = openStr.charAt(0);
		boolean openFlag = open == 'O';
		modelMap.put("open", open);
		modelMap.put("openFlag", openFlag);
		boolean flag = false;
		if (loginMember != null) {
			Wishlist wishlist = new Wishlist(loginMember.getMemberNo(), lessonNo);
			Wishlist like = wishlistDAO.selectLike(wishlist);
			flag = like != null;
		}
		modelMap.put("flag", flag);
		return modelMap;
	}

	
	//2020-08-07 동범 상단searchBar 검색
	public List<Tag> searchBar(String keyword) {
		return tagsDAO.selectTagList(keyword);
	}
	
	//2020-08-07 동범 search태그
	public Wishlist searchLike(Wishlist wishlist){
		return wishlistDAO.selectLike(wishlist);
	}

	//2020-08-07 동범 search테마 Like 검색
	public Map<String, Object> searchLessonThemeList(int memberNo){
		Map<String, Object> modelMap = new HashMap<>();
		List<Lesson> themeOrder = lessonsDAO.selectLessonThemeList();
		//계절별 location, lessonthemetags, lessonthemeScores 을 Map으로
		for(Lesson lessontheme : themeOrder) { 
			lessontheme.setThemeOrder(lessonTagsDAO.selectLessonThemeTags(lessontheme.getLessonNo()));
			lessontheme.setLocation(locationDAO.selectLocationByAddressNo(lessontheme.getAddressNo()));
			lessontheme.setReview(reviewsDAO.selectLessonThemeScore(lessontheme.getLessonNo()));
			modelMap.put("lessontheme1",lessontheme);
			try {
				Wishlist wishlist1 = new Wishlist(memberNo,lessontheme.getLessonNo());
				Wishlist like1 = searchLike(wishlist1);
				lessontheme.setFlag(like1 != null);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		modelMap.put("themeOrderLikes", themeOrder);
		return modelMap;
	}
	
	//2020-08-07 동범 search태그
	public List<Lesson> searchLessonThemeTag(){
		return lessonsDAO.selectLessonThemeListOrderTag();
	}
	
	//2020-08-07 동범 search카테고리
	public Map<String, Object> searchCategory(int memberNo){
		Map<String, Object> modelMap = new HashMap<>();
		List<Lesson> themeOrder = lessonsDAO.selectLessonThemeListOrderCategory();
		//계절별 location, lessonthemetags, lessonthemeScores 을 Map으로
		for(Lesson lessontheme : themeOrder) { 
			lessontheme.setThemeOrder(lessonTagsDAO.selectLessonThemeTags(lessontheme.getLessonNo()));
			lessontheme.setLocation(locationDAO.selectLocationByAddressNo(lessontheme.getAddressNo()));
			lessontheme.setReview(reviewsDAO.selectLessonThemeScore(lessontheme.getLessonNo()));
			modelMap.put("lessontheme4",lessontheme);
			try {
				Wishlist wishlist4 = new Wishlist(memberNo,lessontheme.getLessonNo());
				Wishlist like4 = searchLike(wishlist4);
				lessontheme.setFlag(like4 != null);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		modelMap.put("themeOrderCategory", themeOrder);
		return modelMap;
	}

	
	//2020-08-07 동범 address별 검색
	public Location searchByAddress(int addressNo) {
		return locationDAO.selectLocationByAddressNo(addressNo);
	}
	
	
	//2020-08-07 동범 tag별 검색
	public Map<String, Object> searchByTag(int memberNo){
		//modelMap 생성
		Map<String, Object> modelMap = new HashMap<>();
		List<Lesson> themeOrder = lessonsDAO.selectLessonThemeListOrderTag();
		//계절별 location, lessonthemetags, lessonthemeScores 을 Map으로
		for(Lesson lessontheme : themeOrder) { 
			lessontheme.setThemeOrder(lessonTagsDAO.selectLessonThemeTags(lessontheme.getLessonNo()));
			lessontheme.setLocation(locationDAO.selectLocationByAddressNo(lessontheme.getAddressNo()));
			lessontheme.setReview(reviewsDAO.selectLessonThemeScore(lessontheme.getLessonNo()));
			modelMap.put("lessontheme2",lessontheme);
			try {
				Wishlist wishlist2 = new Wishlist(memberNo,lessontheme.getLessonNo());
				Wishlist like2 = searchLike(wishlist2);
				lessontheme.setFlag(like2 != null);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		modelMap.put("themeOrderTags", themeOrder);
		return modelMap;
	}
	
	//2020-08-07 동범 score별 검색
	public Review searchByScore(int lessonNo) {
		return reviewsDAO.selectLessonThemeScore(lessonNo);
	}
	
	//2020-08-07 동범 search 계절별
	public Map<String, Object> searchSeason(int memberNo){
		//현재 월(달) 얻기
		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.MONTH)+1;
		//modelMap 생성
		Map<String, Object> modelMap = new HashMap<>();
		
		//계절별 location, lessonthemetags, lessonthemeScores 을 Map으로
		if(month<=2 || month==12) {
			//겨울
			List<Lesson> themeOrder = lessonsDAO.selectLessonThemeListOrderWinter();
			for(Lesson lessontheme : themeOrder) { 
				lessontheme.setThemeOrder(lessonTagsDAO.selectLessonThemeTags(lessontheme.getLessonNo()));
				lessontheme.setLocation(locationDAO.selectLocationByAddressNo(lessontheme.getAddressNo()));
				lessontheme.setReview(reviewsDAO.selectLessonThemeScore(lessontheme.getLessonNo()));
				modelMap.put("lessontheme3",lessontheme);
				try {
					Wishlist wishlist3 = new Wishlist(memberNo,lessontheme.getLessonNo());
					Wishlist like3 = searchLike(wishlist3);
					lessontheme.setFlag(like3 != null);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			modelMap.put("themeOrderSeason", themeOrder);
			modelMap.put("month", "겨울");

			return modelMap;
		}else if(month<=5) {
			//봄
			List<Lesson> themeOrder = lessonsDAO.selectLessonThemeListOrderSpring();
			for(Lesson lessontheme : themeOrder) { 
				lessontheme.setThemeOrder(lessonTagsDAO.selectLessonThemeTags(lessontheme.getLessonNo()));
				lessontheme.setLocation(locationDAO.selectLocationByAddressNo(lessontheme.getAddressNo()));
				lessontheme.setReview(reviewsDAO.selectLessonThemeScore(lessontheme.getLessonNo()));
				modelMap.put("lessontheme3",lessontheme);
				try {
					Wishlist wishlist3 = new Wishlist(memberNo,lessontheme.getLessonNo());
					Wishlist like3 = searchLike(wishlist3);
					lessontheme.setFlag(like3 != null);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			modelMap.put("themeOrderSeason", themeOrder);
			modelMap.put("month", "봄");

			return modelMap;
		}else if(month<=8) { 
			//여름
			List<Lesson> themeOrder = lessonsDAO.selectLessonThemeListOrderSummer();
			for(Lesson lessontheme : themeOrder) { 
				lessontheme.setThemeOrder(lessonTagsDAO.selectLessonThemeTags(lessontheme.getLessonNo()));
				lessontheme.setLocation(locationDAO.selectLocationByAddressNo(lessontheme.getAddressNo()));
				lessontheme.setReview(reviewsDAO.selectLessonThemeScore(lessontheme.getLessonNo()));
				modelMap.put("lessontheme3",lessontheme);
				try {
					Wishlist wishlist3 = new Wishlist(memberNo,lessontheme.getLessonNo());
					Wishlist like3 = searchLike(wishlist3);
					lessontheme.setFlag(like3 != null);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			modelMap.put("themeOrderSeasons", themeOrder);
			modelMap.put("month", "여름");

			return modelMap;
		}else { 
			//가을
			List<Lesson> themeOrder = lessonsDAO.selectLessonThemeListOrderAutumn();
			for(Lesson lessontheme : themeOrder) { 
				lessontheme.setThemeOrder(lessonTagsDAO.selectLessonThemeTags(lessontheme.getLessonNo()));
				lessontheme.setLocation(locationDAO.selectLocationByAddressNo(lessontheme.getAddressNo()));
				lessontheme.setReview(reviewsDAO.selectLessonThemeScore(lessontheme.getLessonNo()));
				modelMap.put("lessontheme3",lessontheme);
				try {
					Wishlist wishlist3 = new Wishlist(memberNo,lessontheme.getLessonNo());
					Wishlist like3 = searchLike(wishlist3);
					lessontheme.setFlag(like3 != null);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			modelMap.put("themeOrderSeason", themeOrder);
			modelMap.put("month", "가을");
			
			return modelMap;
		}//if~else end
	}

}
