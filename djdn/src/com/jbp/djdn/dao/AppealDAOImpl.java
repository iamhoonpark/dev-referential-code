package com.jbp.djdn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.Appeal;
import com.jbp.djdn.vo.Mentor;

@Repository
public class AppealDAOImpl implements AppealDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 2020-08-07 강정현
	@Override
	public Appeal selectAppealIntroduction(Appeal appeal) {
		return session.selectOne("appeal.selectAppealIntroduction", appeal);
	}

	// 2020-08-02
	@Override
	public List<Appeal> selectAppeal(int memberNo) {
		return session.selectList("appeal.selectAppeal", memberNo);
	}
	

	//2020-08-10 구동범
	public int insertMentorAppeal(Appeal appeal) {
		return session.insert("appeal.insertMentorAppeal", appeal);
	}
	//2020-08-10 동범 appeal seq찾기
	public int selectAppealSeq() {
		return session.insert("appeal.selectAppealSeq");
	}
	
	//2020-08-10 동범 appeal no찾기
	public int selectAppealNo(Mentor mentor) {
		return session.selectOne("appeal.selectMentorAppealNo", mentor);
	}
	
	//2020-08-12 동범 mentorProfile Category 삭제
	public int deleteByAppealNo(int appealNo) {
		return session.delete("appeal.deleteByAppealNo", appealNo);
	}

}
