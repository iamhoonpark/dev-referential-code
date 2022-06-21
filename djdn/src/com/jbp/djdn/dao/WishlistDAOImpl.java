package com.jbp.djdn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.Lesson;
import com.jbp.djdn.vo.PageVO;
import com.jbp.djdn.vo.Wishlist;

@Repository
public class WishlistDAOImpl implements WishlistDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 2020.07.31
	@Override
	public int selectWishlistTotal(int no) {
		return session.selectOne("wishlist.selectWishlistTotal", no);
	}

	@Override
	public List<Lesson> selectWishList(PageVO pageVO) {
		return session.selectList("wishlist.selectWishList", pageVO);
	}

	@Override
	public int deleteWishlist(Wishlist wishlist) {
		return session.delete("wishlist.deleteWishlist", wishlist);
	}

	// 2020-07-29
	@Override
	public int selectWishlistCount(int lessonNo) {
		return session.selectOne("wishlist.selectWishlistCount", lessonNo);
	}

	// 2020-07-27
	@Override
	public int deleteLike(Wishlist wishlist) {
		return session.delete("wishlist.deleteLike", wishlist);
	}

	@Override
	public Wishlist selectLike(Wishlist wishlist) {
		return session.selectOne("wishlist.selectLike", wishlist);
	}

	@Override
	public int insertLike(Wishlist wishlist) {
		return session.insert("wishlist.insertLike", wishlist);
	}

}
