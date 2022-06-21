package com.jbp.djdn.service;

import java.util.Map;

public interface BlacklistService {

	// 2020-08-11 주영
	public int unblockBlacklist(int blacklistNo);

	// 2020-08-07 주영
	public Map<String, Object> getBlacklist(int page, int no);

}
