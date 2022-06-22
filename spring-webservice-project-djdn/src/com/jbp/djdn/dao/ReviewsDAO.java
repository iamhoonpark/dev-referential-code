package com.jbp.djdn.dao;

import java.util.List;

import com.jbp.djdn.vo.PageVO;
import com.jbp.djdn.vo.Review;

public interface ReviewsDAO {

	// 2020-08-12 주영
	public int insertReview(Review review);

	// 2020-08-10 임현우
	public Review selectReview(int lessonNo);

	// 2020-07-31
	// public int updateReview(Review review);

	public Review selectOne(Review review);

	// 2020-07-28
	public int selectLessonReviewTotal(int lessonNo);

	public List<Review> selectLessonReviewByLessonNo(PageVO pageVO);

	// 2020.07.27
	// public int delete(int no);

	// 2020-08-09 주영
	public Review selectLessonReviewCountAvg(int lessonNo);

	public Review selectLessonThemeScore(int lessonNo);

	public int selectTotal(int no);

	// 2020-08-10 수정됨
	public Review selectReviewStar(Review review);

	// 2020-08-07 리뷰목록에서 reviewList 민겸
	public List<Review> selectList(PageVO pageVO);

	// 2020-08-08 주현 : 리뷰목록에서 삭제 눌렀을 때 해당 리뷰 지우기
	public int delete(int reviewNo);

	// 2020-08-09 주현 : 리뷰 수정 팝업에서 해당리뷰 불러오기 selectOne
	public Review selectOneByReviewNo(int reviewNo);

	// 2020-08-09 주현 : 리뷰 수정 팝업에서 '등록하기'버튼 눌렀을 때 update(글, 별점만)
	public int updateReview(Review review);

}
