package com.jbp.djdn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.Blacklist;
import com.jbp.djdn.vo.PageVO;

@Repository
public class BlacklistDAOImpl implements BlacklistDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 2020-07-30
	@Override
	public int deleteBlacklist(int blacklistNo) {
		return session.delete("blacklist.deleteBlacklist", blacklistNo);
	}
	
	@Override
	public int selectTotalBlacklist(int memberNo) {
		return session.selectOne("blacklist.selectTotalBlacklist", memberNo);
	}
	
	@Override
	public List<Blacklist> selectBlacklist(PageVO pageVO) {
		return session.selectList("blacklist.selectBlacklist", pageVO);
	}

	// 2020-07-29
	@Override
	public int selectBlacklistCheck(Blacklist blacklist) {
		return session.selectOne("blacklist.selectBlacklistCheck", blacklist);
	}

	// 2020.07.28
	@Override
	public int insertBlacklist(Blacklist blacklist) {
		return session.insert("blacklist.insertBlacklist", blacklist);
	}

}