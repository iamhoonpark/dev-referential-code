package com.jbp.djdn.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.Dropout;

@Repository
public class DropoutDAOImpl implements DropoutDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 2020-08-08 이성진 회원 탈퇴
	@Override
	public int insertDropout(Dropout dropout) {
		return session.insert("dropout.insertDropout", dropout);
	}

}
