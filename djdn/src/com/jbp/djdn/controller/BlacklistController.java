package com.jbp.djdn.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jbp.djdn.service.BlacklistService;
import com.jbp.djdn.vo.Member;

@Controller
public class BlacklistController {

	private BlacklistService blacklistService;

	public void setBlacklistService(BlacklistService blacklistService) {
		this.blacklistService = blacklistService;
	}

	// 2020-08-11 주영
	@RequestMapping(value = "/blacklistDelete.djdn", method = RequestMethod.GET)
	public String unblockBlacklist(int blacklistNo, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		blacklistService.unblockBlacklist(blacklistNo);
		return "redirect:/blackList.djdn?memberNo=" + loginMember.getMemberNo();
	}

	// 2020-08-11 주영
	@RequestMapping(value = "/blackList.djdn", method = RequestMethod.GET)
	public String blacklist(Model model, @RequestParam(defaultValue = "1") int page, HttpSession session, int memberNo) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		int no = loginMember.getMemberNo();
		model.addAllAttributes(blacklistService.getBlacklist(page, no));
		return "blackList";
	}

}
