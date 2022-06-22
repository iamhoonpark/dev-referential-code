package com.jbp.djdn.service;

import java.util.Map;

import com.jbp.djdn.vo.Refund;

public interface RefundService {

	// 2020-08-08 박혜민 환불신청 페이지띄우기
	public Map<String, Object> getRefunds(int courseNo, int memberNo);

	// 2020-08-08 박혜민 환불신청 insert
	public Map<String, Object> addRefund(Refund refund, int memberNo);

}
