package com.jbp.djdn.controller;

import org.springframework.stereotype.Controller;

import com.jbp.djdn.service.AppealService;

@Controller
public class AppealController {

	private AppealService appealService;
	
	public void setAppealService(AppealService appealService) {
		this.appealService = appealService;
	}
	
}
