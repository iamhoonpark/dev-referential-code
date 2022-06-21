package com.jbp.djdn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.MenteeSchedule;

@Repository
public class MenteeSchedulesDAOImpl implements MenteeSchedulesDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 2020-07-30
	@Override
	public int insertMenteeSchedules(MenteeSchedule schedule) {
		return session.insert("menteeSchedules.insertMenteeSchedules", schedule);
	}

	@Override
	public List<MenteeSchedule> selectMenteeSchedules(MenteeSchedule schedule) {
		return session.selectList("menteeSchedules.selectMenteeSchedules", schedule);
	}
}
