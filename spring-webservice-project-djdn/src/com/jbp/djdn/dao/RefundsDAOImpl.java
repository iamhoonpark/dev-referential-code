package com.jbp.djdn.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.Refund;

@Repository
public class RefundsDAOImpl implements RefundsDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 2020-07-31
	@Override
	public int insertRefund(Refund refund) {
		return session.insert("refunds.insertRefund", refund);
	}

}