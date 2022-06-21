package com.jbp.djdn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.Review;
import com.jbp.djdn.vo.ReviewImg;

@Repository
public class ReviewImgsDAOImpl implements ReviewImgsDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 2020-08-12 주영
	@Override
	public int insertReviewImg(String name) {
		return session.insert("reviewImgs.insertReviewImg", name);
	}

	// 2020-08-10 임현우
	@Override
	public Review selectReview(int lessonNo) {
		return session.selectOne("reviews.selectReview", lessonNo);
	}

	// 2020-07-31
	@Override
	public int insertImg(ReviewImg reviewImg) {
		return session.delete("reviewImgs.insertImg", reviewImg);
	}

	@Override
	public int deletePopUpImg(ReviewImg reviewImg) {
		return session.delete("reviewImgs.deletePopUpImg", reviewImg);
	}

	@Override
	public List<ReviewImg> selectListPopupImg(ReviewImg reviewImg) {
		return session.selectList("reviewImgs.selectListPopupImg", reviewImg);
	}

	// 2020-07-30
	@Override
	public List<ReviewImg> selectLessonReviewImgsByReviewNo(int reviewNo) {
		return session.selectList("reviewImgs.selectLessonReviewImgsByReviewNo", reviewNo);
	}

	// 2020-07-29
	@Override
	public List<ReviewImg> selectLessonReviewImgs(int lessonNo) {
		return session.selectList("reviewImgs.selectLessonReviewImgs", lessonNo);
	}

	// 2020-08-09 주현 : 리뷰목록에서 리뷰 하나에 등록된 imgList
	@Override
	public List<ReviewImg> selectListImg(int no) {
		return session.selectList("reviewImgs.selectListImg", no);
	}

	// 2020-08-08 주현 : 리뷰 목록에서 삭제 눌렀을 때 deleteReviewImg
	@Override
	public int delete(int reviewNo) {
		return session.delete("reviewImgs.deleteImg", reviewNo);
	}

	// 2020-08-09 주현 : 리뷰수정팝업에서 selectImgList
	@Override
	public List<ReviewImg> selectImgListByReviewNo(int reviewNo) {
		return session.selectList("reviewImgs.selectListByReviewNo", reviewNo);
	}

	// 2020-07-31
	// 2020-08-10 주현 : 리뷰수정팝업에서 사진 새로 추가하고 '등록하기' 눌렀을 때 - 이미지 추가
	@Override
	public int insertReviewImg(ReviewImg reviewImg) {
		return session.insert("reviewImgs.insertImg", reviewImg);
	}
}