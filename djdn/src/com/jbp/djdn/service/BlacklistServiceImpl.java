package com.jbp.djdn.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.jbp.djdn.dao.BlacklistDAO;
import com.jbp.djdn.util.PaginateUtil;
import com.jbp.djdn.vo.Blacklist;
import com.jbp.djdn.vo.PageVO;

@Service
public class BlacklistServiceImpl implements BlacklistService {

	private BlacklistDAO blacklistDAO;

	public void setBlacklistDAO(BlacklistDAO blacklistDAO) {
		this.blacklistDAO = blacklistDAO;
	}

	// 2020-08-11 주영
	@Override
	public int unblockBlacklist(int blacklistNo) {
		return blacklistDAO.deleteBlacklist(blacklistNo);
	}

	// 2020-08-07 주영
	@Override
	public Map<String, Object> getBlacklist(int page, int no) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		int numPage = 6;
		PageVO pageVO = new PageVO(page, numPage, no);
		List<Blacklist> blacklist = blacklistDAO.selectBlacklist(pageVO);
		int total = blacklistDAO.selectTotalBlacklist(no);
		String paginate = PaginateUtil.getPaginate(page, total, numPage, 3, "/blackList.djdn", "page=");
		map.put("list", blacklist);
		map.put("paginate", paginate);
		map.put("total", total);
		return map;
	}

}
