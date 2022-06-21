package com.jbp.djdn.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.jbp.djdn.dao.AppealDAO;
import com.jbp.djdn.dao.BackgroundDAO;
import com.jbp.djdn.dao.CareersDAO;
import com.jbp.djdn.dao.CategoryDAO;
import com.jbp.djdn.dao.CertificatesDAO;
import com.jbp.djdn.dao.LessonTagsDAO;
import com.jbp.djdn.dao.LessonsDAO;
import com.jbp.djdn.dao.MentorsDAO;
import com.jbp.djdn.dao.ReviewsDAO;
import com.jbp.djdn.vo.Appeal;
import com.jbp.djdn.vo.Background;
import com.jbp.djdn.vo.Career;
import com.jbp.djdn.vo.Certificate;
import com.jbp.djdn.vo.Lesson;
import com.jbp.djdn.vo.Mentor;
import com.jbp.djdn.vo.Review;

@Service
public class MentorServiceImpl implements MentorService {

	private BackgroundDAO backgroundDAO;
	private MentorsDAO mentorsDAO;
	private LessonsDAO lessonsDAO;
	private AppealDAO appealDAO;
	private CareersDAO careersDAO;
	private CertificatesDAO certificatesDAO;
	private CategoryDAO categoryDAO;//
	private LessonTagsDAO lessonTagsDAO;
	private ReviewsDAO reviewsDAO;
	
	public void setBackgroundDAO(BackgroundDAO backgroundDAO) {
		this.backgroundDAO = backgroundDAO;
	}
	public void setMentorsDAO(MentorsDAO mentorsDAO) {
		this.mentorsDAO = mentorsDAO;
	}
	public void setLessonsDAO(LessonsDAO lessonsDAO) {
		this.lessonsDAO = lessonsDAO;
	}
	public void setAppealDAO(AppealDAO appealDAO) {
		this.appealDAO = appealDAO;
	}
	public void setCareersDAO(CareersDAO careersDAO) {
		this.careersDAO = careersDAO;
	}
	public void setCertificatesDAO(CertificatesDAO certificatesDAO) {
		this.certificatesDAO = certificatesDAO;
	}
	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}
	public void setLessonTagsDAO(LessonTagsDAO lessonTagsDAO) {
		this.lessonTagsDAO = lessonTagsDAO;
	}
	public void setReviewsDAO(ReviewsDAO reviewsDAO) {
		this.reviewsDAO = reviewsDAO;
	}

	// 2020-08-09 임현우
	@Override
	public int putMentor(Mentor mentor, String[] school, String[] major, char[] graduation, String[] proof) {
		mentorsDAO.insertMentor(mentor);
		int memberNo = mentor.getMemberNo();
		for (int i = 0; i < school.length; i++) {
//				System.out.println("school: "+school[i]);
//				System.out.println("major: "+major[i]);
//				System.out.println("graduation: "+graduation[i]);
//				System.out.println("proof: "+proof[i]);
//				System.out.println(memberNo);
			Background background = new Background();
			background.setSchool(school[i]);
			background.setGraduation(graduation[i]);
			background.setMajor(major[i]);
			background.setProof(proof[i]);
			background.setMemberNo(memberNo);
			backgroundDAO.insertBackground(background);
		} // for end
		return 0;
	}

	@Override
	public int putBackground(Background background) {
		return backgroundDAO.insertBackground(background);
	}
	
	//2020-08-08 동범 mentorProfile.djdn의 Mentor별 카드띄우기
	public List<Lesson> searchLessonsByMentor(int memberNo) {
		
		int lessonNo = 0;
		List<Lesson> lessons = lessonsDAO.selectLessonsByMentor(memberNo);
		for(Lesson lesson:lessons) {
			lessonNo = lesson.getLessonNo();
			
			lesson.setLessonTags(lessonTagsDAO.selectLessonThemeTags(lessonNo));
			
			Review reviewInfo = reviewsDAO.selectLessonThemeScore(lessonNo);
			
			lesson.setScoreAvg(reviewInfo.getScoreAvg());
			lesson.setCount(reviewInfo.getCount());
		}
		
		return lessons;
	}
	
	
	//2020-08-08 동범 mentorProfile.djdn의 Service
	public Map<String, Object> searchMentor(int memberNo) {
		//Map Setting
		Map<String, Object> modelMap = new HashMap<>();
		
		int count = mentorsDAO.selectMentorCheck(memberNo);
		modelMap.put("count", count);
		if (count == 1) {
			Mentor mentor = mentorsDAO.selectLogin(memberNo);
			// System.out.println(mentor.getNickname());
			// System.out.println(mentor.getMemberNo());
			modelMap.put("loginMentor", mentor);
		} // if end
		
		
		modelMap.put("mentor", mentorsDAO.selectMentorByMemberNo(memberNo));
		modelMap.put("lessonCount", lessonsDAO.selectCountOpenLessons(memberNo));
		modelMap.put("appeals", appealDAO.selectAppeal(memberNo));
		modelMap.put("backgrounds", backgroundDAO.selectBackground(memberNo));
		
		
		return modelMap;
	}
	
	//2020-08-10 동범 mentorProfile 카테고리별 content찾기
	public List<Mentor> searchContentInfo(Mentor mentor) {
		return mentorsDAO.selectMentorContent(mentor);
	}
	
	
	// 2020-08-10
	@Override
	public void addMentorInfo(Mentor mentor, int memberNo) {

		//해당 카테고리 번호받기
		int categoryNo = categoryDAO.selectCategoryNo(mentor.getCategory());
		
		//basic data for Insert
		mentor.setMemberNo(memberNo);
		
		//appeal Insert
		Appeal appeal = new Appeal();
		appeal.setIntroduction(mentor.getIntroduce());
		appeal.setCategoryNo(categoryNo);
		appeal.setMemberNo(memberNo);
		appealDAO.insertMentorAppeal(appeal);
		
		//career Insert
		Career career = new Career();
		career.setAppealNo(appeal.getAppealNo());
		
		
		
		//career Insert for Array
		for(int i = 0; i< mentor.getCompany().length; i++) {
			career.setCompany(mentor.getCompany()[i]);
			career.setHireDate(Date.valueOf(mentor.getHireDate()[i]));
			career.setLeaveDate(Date.valueOf(mentor.getLeaveDate()[i]));
			career.setTask(mentor.getTask()[i]);
			careersDAO.insertMentorCareers(career);
		}
		
		//certificates Insert
		Certificate certificate = new Certificate();
		certificate.setAppealNo(appeal.getAppealNo());
		//certificates Insert for Array
		for(int i = 0; i < mentor.getCertificate().length; i++) {
			certificate.setName(mentor.getCertificate()[i]);
			certificate.setProof(mentor.getProof()[i]);			
			certificatesDAO.insertMentorCertificates(certificate);
		}
	}
	
	//2020-08-12 동범 MentorProfile Category삭제
	public void removeMentorCate(Mentor mentor) {
		System.out.println(mentor.getMemberNo() + " : " + mentor.getCategoryName());
		//click한 category의 appealNo찾기
		int appealNo = appealDAO.selectAppealNo(mentor);
		System.out.println("appealNo : " + appealNo);
		
		certificatesDAO.deleteByAppealNo(appealNo);
		careersDAO.deleteByAppealNo(appealNo);
		appealDAO.deleteByAppealNo(appealNo);
	}
}
