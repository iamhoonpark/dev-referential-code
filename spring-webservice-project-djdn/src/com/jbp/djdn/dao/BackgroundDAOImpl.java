package com.jbp.djdn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.Background;

@Repository
public class BackgroundDAOImpl implements BackgroundDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 2020-08-09 임현우
	@Override
	public int insertBackground(Background background) {
		return session.insert("background.insertBackground", background);
	}

	// 2020-08-02
	@Override
	public List<Background> selectBackground(int memberNo) {
		return session.selectList("background.selectBackground", memberNo);
	}

}
