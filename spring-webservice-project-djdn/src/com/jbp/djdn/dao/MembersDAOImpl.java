package com.jbp.djdn.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jbp.djdn.vo.Member;
import com.jbp.djdn.vo.Mentor;

@Repository
public class MembersDAOImpl implements MembersDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 2020-08-09 임현우
	@Override
	public int insertMentor(Mentor mentor) {
		return session.insert("mentors.insertMentor", mentor);
	}

	// 2020-08-02
	@Override
	public int updateDormancy(int memberNo) {
		return session.update("members.updateDormancy", memberNo);
	}

	// 2020-07-31
	@Override
	public int selectCountNickname(String nickname) {
		return session.selectOne("members.selectCountNickname", nickname);
	}

	// 2020-07-31
	@Override
	public String selectEmail(int memberNo) {
		return session.selectOne("members.selectEmail", memberNo);
	}

	@Override
	public int updateEmail(Member member) {
		return session.update("members.updateEmail", member);
	}

	// 2020-07-30
	@Override
	public String selectNickname(int memberNo) {
		return session.selectOne("members.selectNickname", memberNo);
	}

	@Override
	public String selectProfileImg(int memberNo) {
		return session.selectOne("members.selectProfileImg", memberNo);
	}

	@Override
	public int updatePassword(Member member) {
		return session.update("members.updatePassword", member);
	}

	@Override
	public Member selectPasswordCheck(Member member) {
		return session.selectOne("members.selectCheck", member);
	}

	@Override
	public Member selectIdCheck(Member member) {
		return session.selectOne("members.selectIdCheck", member);
	}

	@Override
	public Member selectLogin(Member member) {
		return session.selectOne("members.selectLogin", member);
	}

	// 2020-08-08 내 정보 수정
	@Override
	public Member selectMyInfo(int memberNo) {
		return session.selectOne("members.selectMyInfo", memberNo);
	}

	// 2020-08-07 이성진 회원가입 인서트
	@Override
	public int insertJoin(Member member) {
		return session.insert("members.insertJoin", member);
	}

	// 2020-08-07 이성진 회원가입 아이디 중복체크
	@Override
	public int selectCountId(String id) {
		return session.selectOne("members.selectCountId", id);
	}

	// 2020-08-09 이성진 닉넴 업댓
	@Override
	public int updateNickname(Member member) {
		return session.update("members.updateNickname", member);
	}

	// 2020-08-09 이성진 전화번호 업댓
	@Override
	public int updatePhone(Member member) {
		return session.update("members.updatePhone", member);
	}

	// 2020-08-09 이성진 프로필 사진 업댓
	@Override
	public int updateProfileImg(Member member) {
		return session.update("members.updateProfileImg", member);
	}

}
