package com.jbp.djdn.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.jbp.djdn.dao.LessonTagsDAO;
import com.jbp.djdn.dao.ReviewsDAO;
import com.jbp.djdn.dao.WishlistDAO;
import com.jbp.djdn.util.PaginateUtil;
import com.jbp.djdn.vo.Lesson;
import com.jbp.djdn.vo.PageVO;
import com.jbp.djdn.vo.Review;
import com.jbp.djdn.vo.Wishlist;

@Service
public class WishlistServiceImpl implements WishlistService {

	private LessonTagsDAO lessonTagsDAO;
	private ReviewsDAO reviewsDAO;
	private WishlistDAO wishlistDAO;

	public void setLessonTagsDAO(LessonTagsDAO lessonTagsDAO) {
		this.lessonTagsDAO = lessonTagsDAO;
	}

	public void setReviewsDAO(ReviewsDAO reviewsDAO) {
		this.reviewsDAO = reviewsDAO;
	}

	public void setWishlistDAO(WishlistDAO wishlistDAO) {
		this.wishlistDAO = wishlistDAO;
	}

	// 2020-08-08 강정현 찜하기 버튼 누르면 위시리스트 등록
	@Override
	public Map<String, Object> getLikeContents(int lessonNo, int memberNo) {
		Map<String, Object> modelMap = new ConcurrentHashMap<String, Object>();
		Wishlist wishlist = new Wishlist(memberNo, lessonNo);
		Wishlist like = wishlistDAO.selectLike(wishlist);
		if (like == null) {
			wishlistDAO.insertLike(wishlist);
		} else {
			wishlistDAO.deleteLike(wishlist);
		} // if~else end
		int count = wishlistDAO.selectWishlistCount(lessonNo);
		modelMap.put("flag", like == null);
		modelMap.put("count", count);
		return modelMap;
	}

	// 2020-08-07 임현우
	// 위시리스트 얻기
	// @Override
	// public List<Lesson> getWishList(PageVO pageVO) {
	// return wishlistDAO.selectWishList(pageVO);
	// }

	@Override
	public Map<String, Object> getWishList(int page, int memberNo) {
		Map<String, Object> modelMap = new ConcurrentHashMap<String, Object>();
		int numPage = 3;
		PageVO pageVO = new PageVO(page, numPage, memberNo);
		List<Lesson> wishList = wishlistDAO.selectWishList(pageVO);
		int total = wishlistDAO.selectWishlistTotal(memberNo);
		String paginate = PaginateUtil.getPaginate(page, total, numPage, 3, "/wishList.djdn", "page=");
		for (Lesson lesson : wishList) {
			lesson.setReview(reviewsDAO.selectReview(lesson.getLessonNo()));
			// System.out.println("점수" + review.getReviewCount());
			// System.out.println("평균" + review.getScoreAvg());
			lesson.setLessonTags(lessonTagsDAO.selectLessonThemeTags(lesson.getLessonNo()));
		}
		modelMap.put("wishLists", wishList);
		modelMap.put("paginate", paginate);
		modelMap.put("total", total);
		return modelMap;
	}

	// 위시리스트 삭제
	@Override
	public boolean removeWishlist(int wishlistNo, int memberNo) {
		Wishlist wishlist = new Wishlist();
		wishlist.setMemberNo(memberNo);
		wishlist.setWishlistNo(wishlistNo);
		boolean flag = false;
		int result = wishlistDAO.deleteWishlist(wishlist);
		if (result == 1) {
			flag = true;
		}
		return flag;
	}
	//2020-08-08 구동범
	public String wishControl(int memberNo, int lessonNo) {
		
		Wishlist wishlist = new Wishlist(memberNo, lessonNo);
		Wishlist like = wishlistDAO.selectLike(wishlist);
		
		if(like==null) {
			wishlistDAO.insertLike(wishlist);
		}else {
			wishlistDAO.deleteLike(wishlist);
		}//if~else end
		
		int count = wishlistDAO.selectWishlistCount(lessonNo);
		
		//string return
		return "{\"flag\":"+(like==null)+",\"count\":"+count+"}";
	}
}
