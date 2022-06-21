package com.jbp.djdn.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jbp.djdn.service.RefundService;
import com.jbp.djdn.vo.Member;
import com.jbp.djdn.vo.Refund;

@Controller
public class RefundController {

	private RefundService refundService;

	public void setRefundService(RefundService refundService) {
		this.refundService = refundService;
	}

	// 2020-08-08 박혜민 refund페이지 출력
	@RequestMapping(value = "/refund.djdn", method = RequestMethod.GET)
	public void refund(Model model, HttpSession session, int courseNo) {
		Member loginMember = (Member) session.getAttribute(Member.LOGIN);
		model.addAllAttributes(refundService.getRefunds(courseNo, loginMember.getMemberNo()));
	}

	// 2020-08-08 박혜민 환불사유 입력
	@RequestMapping(value = "/refundInsert.djdn", method = RequestMethod.POST)
	public String refundReason(Model model, Refund refund, HttpSession session) {
		Member loginMember = (Member) session.getAttribute(Member.LOGIN);
		refundService.addRefund(refund, loginMember.getMemberNo());
		// 2020-08-08 박혜민 입력되면, /myActivity.djdn로 이동
		return "redirect:/myActivity.djdn";
	}

}
