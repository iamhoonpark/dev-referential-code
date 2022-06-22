package com.jbp.djdn.service;

import org.springframework.stereotype.Service;

import com.jbp.djdn.dao.AppealDAO;

@Service
public class AppealServiceImpl implements AppealService {

	private AppealDAO appealDAO;
	
	public void setAppealDAO(AppealDAO appealDAO) {
		this.appealDAO = appealDAO;
	}
	
}
