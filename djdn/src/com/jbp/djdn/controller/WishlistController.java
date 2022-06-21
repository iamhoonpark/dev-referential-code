package com.jbp.djdn.controller;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jbp.djdn.service.WishlistService;
import com.jbp.djdn.vo.Lesson;
import com.jbp.djdn.vo.Member;

@Controller
public class WishlistController {

	private WishlistService wishlistService;

	public void setWishlistService(WishlistService wishlistService) {
		this.wishlistService = wishlistService;
	}
	
	// 2020-08-07 임현우
	// ajax가 아닌 그냥 Model로 받아서 하는 방법
	// @RequestMapping(value = "/wishList.djdn",method = RequestMethod.GET)
	// public String wishList(Model model,@RequestParam(defaultValue = "1") int
	// page) {
	// model.addAllAttributes(wishlistService.getWishList(page)) ;
	// return "wishList";
	// }

	// ajax로 하는 방법

	// 1)jsp view 를 나타내는 controller
	@RequestMapping(value = "/wishList.djdn", method = RequestMethod.GET)
	public String wishListAjax(Model model) {
		return "wishList";
	}

	// 2)//MappingJacksonJsonView 응답 - json view
	@RequestMapping(value = "/ajax/getWishList.djdn", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> wishListShow(int page, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		Map<String, Object> modelMap = wishlistService.getWishList(page, loginMember.getMemberNo());
		List<Lesson> wishlist = (List<Lesson>)modelMap.get("wishLists");
		for(Lesson lesson : wishlist) {
			lesson.getReview().setRegdate(Timestamp.valueOf("2020-08-13 00:00:00.0"));
		}
		return modelMap;
	}

	// 위시리스트 삭제
	@RequestMapping(value = "/ajax/deleteWishlist.djdn", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String wishListDel(int wishlistNo, HttpSession session) {
		Member loginMember = (Member) session.getAttribute(Member.LOGIN);
		boolean flag = wishlistService.removeWishlist(wishlistNo, loginMember.getMemberNo());
		return "{\"flag\":" + flag + "}";
	}

	// 2020-08-08 강정현 찜하기 버튼 누르면 위시리스트 등록
	@RequestMapping(value = "/ajax/like.djdn", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getLike(int lessonNo, HttpSession session) {
		Member loginMember = (Member) session.getAttribute(Member.LOGIN);
		return wishlistService.getLikeContents(lessonNo, loginMember.getMemberNo());
	}

}
