package com.jbp.djdn.dao;

import java.util.List;

import com.jbp.djdn.vo.MenteeSchedule;

public interface MenteeSchedulesDAO {

	// 2020-07-30
	public int insertMenteeSchedules(MenteeSchedule schedule);

	public List<MenteeSchedule> selectMenteeSchedules(MenteeSchedule schedule);

}
