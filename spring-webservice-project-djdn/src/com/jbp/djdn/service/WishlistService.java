package com.jbp.djdn.service;

import java.util.Map;

public interface WishlistService {

	// 2020-08-08 강정현 찜하기 버튼 클릭시 위시리스트 등록
	public Map<String, Object> getLikeContents(int lessonNo, int memberNo);

	// 2020-08-07 임현우
	public Map<String, Object> getWishList(int page, int memberNo);

	public boolean removeWishlist(int wishlistNo, int memberNo);
	
	//2020-08-10 동범
	public String wishControl(int memberNo, int lessonNo);
}
