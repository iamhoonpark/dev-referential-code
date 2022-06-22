package com.jbp.djdn.dao;

import java.util.List;

import com.jbp.djdn.vo.Review;
import com.jbp.djdn.vo.ReviewImg;

public interface ReviewImgsDAO {

	// 2020-08-12 주영
	public int insertReviewImg(String name);

	// 2020-08-10 임현우
	public Review selectReview(int lessonNo);

	// 2020-07-31
	public int insertImg(ReviewImg reviewImg);

	public int deletePopUpImg(ReviewImg reviewImg);

	public List<ReviewImg> selectListPopupImg(ReviewImg reviewImg);

	// 2020-07-30
	public List<ReviewImg> selectLessonReviewImgsByReviewNo(int reviewNo);

	// 2020-07-29
	public List<ReviewImg> selectLessonReviewImgs(int lessonNo);

	// 2020-08-09 주현 : 리뷰목록에서의 imgList
	public List<ReviewImg> selectListImg(int no);

	// 2020-08-08 주현 : 리뷰목록에서 삭제 눌렀을 때 deleteReviewImg
	public int delete(int reviewNo);

	// 2020-08-09 주현 : 리뷰 수정 팝업 selectImgList
	public List<ReviewImg> selectImgListByReviewNo(int reviewNo);

	// 2020-08-10 주현 : 리뷰 수정 팝업에서 사진 새로 추가하고 '등록하기' 눌렀을 때 insert
	public int insertReviewImg(ReviewImg reviewImg);

}
