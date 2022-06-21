package com.jbp.djdn.dao;

import java.util.List;

import com.jbp.djdn.vo.MentorSchedule;

public interface MentorSchdulesDAO {

	// 0810
	public int insertMentorSchedules(MentorSchedule schedule);

	// 2020-07-29
	public List<MentorSchedule> selectLessonSchedulesByLessonNo(int lessonNo);

}
