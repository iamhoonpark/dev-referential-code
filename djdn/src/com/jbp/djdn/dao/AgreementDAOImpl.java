package com.jbp.djdn.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.Agreement;

@Repository
public class AgreementDAOImpl implements AgreementDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 2020-08-07 이성진 약관동의 insert
	@Override
	public int insertAgreement(Agreement agreement) {
		return session.insert("agreement.insertAgreement", agreement);
	}
}