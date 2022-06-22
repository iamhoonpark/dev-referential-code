package com.jbp.djdn.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.jbp.djdn.dao.ReviewImgsDAO;
import com.jbp.djdn.dao.ReviewsDAO;
import com.jbp.djdn.util.PaginateUtil;
import com.jbp.djdn.vo.PageVO;
import com.jbp.djdn.vo.Review;
import com.jbp.djdn.vo.ReviewImg;

@Service
public class ReviewServiceImpl implements ReviewService {

	// 2020-08-08 강정현 멤버필드 ReviewImgsDAO
	private ReviewImgsDAO reviewImgsDAO;
	private ReviewsDAO reviewsDAO;

	// 2020-08-08 강정현 setter ReviewImgsDAO
	public void setReviewImgsDAO(ReviewImgsDAO reviewImgsDAO) {
		this.reviewImgsDAO = reviewImgsDAO;
	}

	public void setReviewsDAO(ReviewsDAO reviewsDAO) {
		this.reviewsDAO = reviewsDAO;
	}

	// 2020-08-12 주영
	public int postReview(Review review) {
		return reviewsDAO.insertReview(review);
	}

	// 2020-08-12 주영
	@Override
	public int postReviewImg(String[] imgName) {
		
		for (String name : imgName) {
			System.out.println(name);
			reviewImgsDAO.insertReviewImg(name);
		}
		
		return 1;
	}

	// 2020-08-08 강정현 리뷰 얻어오는 메서드(ajax)
	@Override
	public Map<String, Object> getReviews(int lessonNo, int page) {
		Map<String, Object> modelMap = new ConcurrentHashMap<String, Object>();
		int numPage = 5;
		PageVO pageVO = new PageVO(page, numPage, lessonNo);
		List<Review> reviews = reviewsDAO.selectLessonReviewByLessonNo(pageVO);
		for (Review review : reviews) {
			review.setReviewImgs(reviewImgsDAO.selectLessonReviewImgsByReviewNo(review.getReviewNo()));
		}
		int total = reviewsDAO.selectLessonReviewTotal(lessonNo);
		int numBlock = 4;
		String url = "/lessonDetail.djdn";
		String param = "lessonNo=" + lessonNo + "&page=";
		String paginate = PaginateUtil.getPaginate(page, total, numPage, numBlock, url, param);
		modelMap.put("reviewList", reviews);
		modelMap.put("paginate", paginate);
		return modelMap;
	}

	@Override
	public Map<String, Object> getMyreviews(int page, int no) {
		Map<String, Object> modelMap = new ConcurrentHashMap<String, Object>();
		// 페이징처리에 필요한 작업
		int numPage = 5;
		PageVO pageVO = new PageVO(page, numPage, no);
		List<Review> reviews = reviewsDAO.selectList(pageVO);
		for (Review review : reviews) {
			review.setReviewImgs(reviewImgsDAO.selectListImg(no));
		} // for end
			// System.out.println(reviews.size());
		int total = reviewsDAO.selectTotal(no);
		String paginate = PaginateUtil.getPaginate(page, total, numPage, 3, "/myReview.jdjn", "page=");
		modelMap.put("total", reviewsDAO.selectTotal(no));
		modelMap.put("paginate", paginate);
		modelMap.put("reviews", reviews);
		return modelMap;
	}

	// 2020-08-08 박혜민 리뷰총점
//	@Override
//	public Review getReviewStar(int courseNo) {
//		return reviewsDAO.selectReviewStar(courseNo);
//	}

	// 2020-08-08 selectListImg 주현
	@Override
	public List<ReviewImg> getMyreviewImgs(int no) {
		return reviewImgsDAO.selectListImg(no);
	}

	// 2020-08-08 deleteReview 주현
	@Override
	public void deleteReview(int reviewNo) {
		// 하위테이블 delete 구문
		reviewImgsDAO.delete(reviewNo);
		reviewsDAO.delete(reviewNo);
	}

	// 2020-08-09 selectOneByReviewNo 주현
	@Override
	public Review getMyReview(int reviewNo) {
		return reviewsDAO.selectOneByReviewNo(reviewNo);
	}

	// 2020-08-09 selectListByReviewNo 주현
	@Override
	public List<ReviewImg> getMyReviewImgList(int reviewNo) {
		return reviewImgsDAO.selectImgListByReviewNo(reviewNo);
	}

	// 2020-08-11 updateReview 주현
	@Override
	public void updateReview(Review review, String[] file) {
		reviewsDAO.updateReview(review);

		// 2. 먼저 기존 사진 모두 삭제
		reviewImgsDAO.delete(review.getReviewNo());

		System.out.println("file:" + file);

		if (file != null) {
			// 배열로 받은 파라미터 값을 포문 돌려서 다 넣어버리기
			for (String name : file) {

				ReviewImg reviewImg = new ReviewImg();

				reviewImg.setReviewNo(review.getReviewNo());
				reviewImg.setName(name);
				// 3. 사진 한번에 모두 등록
				reviewImgsDAO.insertReviewImg(reviewImg);
			} // for end

		} // if end

	}

	// 2020-08-08 주현 : 해당 리뷰 사진 전부 지우기
	@Override
	public void deldeteReviewImg(int reviewNo) {
		reviewImgsDAO.delete(reviewNo);
	}

	// 2020-08-10 주현
	@Override
	public void insertReviewPopImg(ReviewImg reviewImg) {
		reviewImgsDAO.insertImg(reviewImg);

	}
}
