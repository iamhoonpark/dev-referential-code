package com.jbp.djdn.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.jbp.djdn.dao.CoursesDAO;
import com.jbp.djdn.dao.RefundsDAO;
import com.jbp.djdn.dao.ReviewsDAO;
import com.jbp.djdn.vo.Course;
import com.jbp.djdn.vo.Refund;
import com.jbp.djdn.vo.Review;

@Service
public class RefundServiceImpl implements RefundService {

	// 2020-08-08 박혜민 DAO주입
	private ReviewsDAO reviewsDAO;
	private CoursesDAO coursesDAO;
	private RefundsDAO refundsDAO;

	// 2020-08-08 박혜민 setter주입
	public void setReviewsDAO(ReviewsDAO reviewsDAO) {
		this.reviewsDAO = reviewsDAO;
	}

	// 2020-08-08 박혜민 setter주입
	public void setCoursesDAO(CoursesDAO coursesDAO) {
		this.coursesDAO = coursesDAO;
	}

	public void setRefundsDAO(RefundsDAO refundsDAO) {
		this.refundsDAO = refundsDAO;
	}

	// 2020-08-08 박혜민 환불신청 페이지띄우기
	@Override
	public Map<String, Object> getRefunds(int courseNo, int memberNo) {
		Map<String, Object> modelMap = new ConcurrentHashMap<String, Object>();
		Course course = new Course();
		course.setMemberNo(memberNo);
		course.setCourseNo(courseNo);
		Review review = new Review();
		review.setCourseNo(courseNo);
		review.setMemberNo(memberNo);
		modelMap.put("course", coursesDAO.selectRefund(course));
		modelMap.put("review", reviewsDAO.selectReviewStar(review));
		return modelMap;
	}

	// 2020-08-08 박혜민 환불신청 insert
	@Override
	public Map<String, Object> addRefund(Refund refund, int memberNo) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		refund.setMemberNo(memberNo);
		refundsDAO.insertRefund(refund);
		coursesDAO.updateCourseStatus(refund.getCourseNo());
		return map;
	}

}
