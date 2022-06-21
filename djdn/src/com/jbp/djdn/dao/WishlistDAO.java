package com.jbp.djdn.dao;

import java.util.List;

import com.jbp.djdn.vo.Lesson;
import com.jbp.djdn.vo.PageVO;
import com.jbp.djdn.vo.Wishlist;

public interface WishlistDAO {

	// 2020.07.31
	public int selectWishlistTotal(int no);

	public List<Lesson> selectWishList(PageVO pageVO);

	public int deleteWishlist(Wishlist wishlist);

	// 2020-07-29
	public int selectWishlistCount(int lessonNo);

	// 2020-07-27
	public int deleteLike(Wishlist wishlist);

	public Wishlist selectLike(Wishlist wishlist);

	public int insertLike(Wishlist wishlist);

}
