package com.jbp.djdn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.PageVO;
import com.jbp.djdn.vo.Review;

@Repository
public class ReviewsDAOImpl implements ReviewsDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 2020-08-12 주영
	@Override
	public int insertReview(Review review) {
		return session.insert("reviews.insertReview", review);
	}

	// 2020-08-10 임현우
	@Override
	public Review selectReview(int lessonNo) {
		return session.selectOne("reviews.selectReview", lessonNo);
	}

	// 2020-07-31
	// public int updateReview(Review review) {
	// return session.update("reviews.updateReview", review);
	// }

	@Override
	public Review selectOne(Review review) {
		return session.selectOne("reviews.selectOne", review);
	}

	// 2020-07-28
	@Override
	public int selectLessonReviewTotal(int lessonNo) {
		return session.selectOne("reviews.selectLessonReviewTotal", lessonNo);
	}

	@Override
	public List<Review> selectLessonReviewByLessonNo(PageVO pageVO) {
		return session.selectList("reviews.selectLessonReviewByLessonNo", pageVO);
	}

	// 2020.07.27
	// public int delete(int no) {
	// return session.delete("reviews.deleteReview", no);
	// }

	// 2020-08-09 주영
	@Override
	public Review selectLessonReviewCountAvg(int lessonNo) {
		return session.selectOne("reviews.selectLessonReviewCountAvg", lessonNo);
	}

	@Override
	public Review selectLessonThemeScore(int lessonNo) {
		return session.selectOne("reviews.selectLessonReviewCountAvg", lessonNo);
	}

	@Override
	public int selectTotal(int no) {
		return session.selectOne("reviews.selectTotal", no);
	}

	// public List<Review> selectList(PageVO pageVo) {
	// return session.selectList("reviews.selectList", pageVo);
	// }

	// 2020-08-10 수정됨
	@Override
	public Review selectReviewStar(Review review) {
		return session.selectOne("reviews.selectReviewStar", review);
	}

	// 2020-08-07 ?? : 리뷰목록에서 리뷰(별점, 글 등) selectList
	@Override
	public List<Review> selectList(PageVO pageVO) {
		return session.selectList("reviews.selectList", pageVO);
	}

	// 2020.07.27
	// 2020-08-08 주현 : 리뷰목록에서 '삭제' 눌렀을 때 해당 리뷰 deleteReview(이미지 제외)
	@Override
	public int delete(int reviewNo) {
		return session.delete("reviews.deleteReview", reviewNo);
	}

	// 2020-08-09 주현 : 리뷰수정팝업에서 해당리뷰(별점, 글) selectOne
	@Override
	public Review selectOneByReviewNo(int reviewNo) {
		return session.selectOne("reviews.selectOneByReviewNo", reviewNo);
	}

	// 2020-08-09 주현 : 리뷰수정팝업 update(별점, 글만)
	@Override
	public int updateReview(Review review) {
		return session.update("reviews.updateReview", review);
	}

}
