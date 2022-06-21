package com.jbp.djdn.service;

import java.util.List;
import java.util.Map;

import com.jbp.djdn.vo.Review;
import com.jbp.djdn.vo.ReviewImg;

public interface ReviewService {

	// 2020-08-12 주영
	// myActivity 페이지 리뷰작성 팝업에서 별점, 리뷰내용 등록
	public int postReview(Review review);

	// 2020-08-12 주영
	// myActivity 페이지 리뷰작성 팝업에서 리뷰이미지 등록
	public int postReviewImg(String[] imgName);

	// 2020-08-08 강정현 리뷰 얻어오는 메서드(ajax)
	public Map<String, Object> getReviews(int lessonNo, int page);

	// 2020-08-10 박주현 : 인자 수정
	public Map<String, Object> getMyreviews(int page, int no);

	// 2020-08-08 박혜민 리뷰총점
//	public Review getReviewStar(int courseNo);

	// 2020-08-08 주현 : 리뷰목록에서 리뷰이미지 불러오기 selectListImg
	public List<ReviewImg> getMyreviewImgs(int no);

	// 2020-08-08 주현 : 리뷰목록에서 삭제 눌렀을 때 해당 리뷰 지우기 deleteReview
	public void deleteReview(int reviewNo);

	// 2020-08-08 주현 : 리뷰목록에서 삭제 눌렀을 때 해당 리뷰사진 지우기 deleteReviewImg
	public void deldeteReviewImg(int reviewNo);

	// 2020-08-09 주현 : selectListByReviewNo
	public List<ReviewImg> getMyReviewImgList(int reviewNo);

	// 2020-08-09 주현 : 리뷰 수정 팝업에서 해당리뷰 불러오기 selectOneByReviewNo
	public Review getMyReview(int reviewNo);

	// 2020-08-08 주현 : 리뷰 수정 팝업에서 해당리뷰사진 불러오기 imgList
	// 중복된 코드라서 일단 주석
	// public List<ReviewImg> gestPopupImgList(ReviewImg reviewImg);

	// 2020-08-11 주현 : updateReview
	public void updateReview(Review review, String[] file);

	// 2020-08-11 주현 : 리뷰 수정 팝업에서 '수정하기' 눌렀을 때 insert
	public void insertReviewPopImg(ReviewImg reviewImg);
}
