package com.jbp.djdn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.Mentor;

@Repository
public class MentorsDAOImpl implements MentorsDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 2020-08-09 임현우
	@Override
	public int insertMentor(Mentor mentor) {
		return session.insert("mentors.insertMentor", mentor);
	}

	// 2020-07-28
	@Override
	public Mentor selectMentorByMemberNo(int memberNo) {
		return session.selectOne("mentors.selectMentorByMemberNo", memberNo);
	}

	@Override
	public int selectMentorCheck(int memberNo) {
		return session.selectOne("mentors.selectMentorCheck", memberNo);
	}

	@Override
	public Mentor selectLogin(int memberNo) {
		return session.selectOne("mentors.selectLogin", memberNo);
	}

	//2020-08-10 동범 mentorProfile 카테고리별 content찾기
	public List<Mentor> selectMentorContent(Mentor mentor) {
		return session.selectList("mentors.selectMentorProfileByCategory", mentor);
	}
	
	//2020-08-10 mentorAppeal 추가
	public int selectAppealSeq() {
		return session.selectOne("mentors.selectAppealSeq");
	}
	public int selectCategoryNo(String categoryName) {
		return session.selectOne("mentors.selectCategoryNo", categoryName);
	}
	public int insertMentorAppeal(Mentor mentor) {
		return session.insert("mentors.insertMentorAppeal", mentor);
	}
	public int insertMentorCertificates(Mentor mentor) {
		return session.insert("mentors.insertMentorCertificates", mentor);
	}
}
