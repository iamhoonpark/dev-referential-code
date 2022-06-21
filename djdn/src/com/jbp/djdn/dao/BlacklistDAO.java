package com.jbp.djdn.dao;

import java.util.List;

import com.jbp.djdn.vo.Blacklist;
import com.jbp.djdn.vo.PageVO;

public interface BlacklistDAO {

	// 2020-07-30
	public int deleteBlacklist(int blacklistNo);

	public int selectTotalBlacklist(int memberNo);

	public List<Blacklist> selectBlacklist(PageVO pageVO);

	// 2020-07-29
	public int selectBlacklistCheck(Blacklist blacklist);

	// 2020.07.28
	public int insertBlacklist(Blacklist blacklist);

}
