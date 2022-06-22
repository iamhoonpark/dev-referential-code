package com.jbp.djdn.dao;

import java.util.List;

import com.jbp.djdn.vo.Background;

public interface BackgroundDAO {

	// 2020-08-09 임현우
	public int insertBackground(Background background);

	public List<Background> selectBackground(int memberNo);

}
