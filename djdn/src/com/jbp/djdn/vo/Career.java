package com.jbp.djdn.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Career {

	private int careerNo, appealNo;
	private String company, task;
	private char status;
	private Date hireDate, leaveDate;
	private Timestamp regdate;

	public Career() {
		// TODO Auto-generated constructor stub
	}

	public int getCareerNo() {
		return careerNo;
	}

	public void setCareerNo(int careerNo) {
		this.careerNo = careerNo;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

	public Date getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(Date leaveDate) {
		this.leaveDate = leaveDate;
	}

	public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}

	public int getAppealNo() {
		return appealNo;
	}

	public void setAppealNo(int appealNo) {
		this.appealNo = appealNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}
