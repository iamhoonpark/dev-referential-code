package com.jbp.djdn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.MentorSchedule;

@Repository
public class MentorSchedulesDAOImpl implements MentorSchdulesDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 0810
	@Override
	public int insertMentorSchedules(MentorSchedule schedule) {
		return session.insert("mentorSchedules.insertSchedules", schedule);
	}

	// 2020-07-29
	@Override
	public List<MentorSchedule> selectLessonSchedulesByLessonNo(int lessonNo) {
		return session.selectList("mentorSchedules.selectLessonSchedulesByLessonNo", lessonNo);
	}

}
