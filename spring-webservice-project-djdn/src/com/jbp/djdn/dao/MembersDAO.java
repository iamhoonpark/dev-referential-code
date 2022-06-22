package com.jbp.djdn.dao;

import com.jbp.djdn.vo.Member;
import com.jbp.djdn.vo.Mentor;

public interface MembersDAO {

	// 2020-08-09 임현우
	public int insertMentor(Mentor mentor);

	// 2020-08-08 이성진 회원탈퇴 Members 테이블의 dormancy cloumn을 null에서 D(dormancy 휴면)으로
	// 업데이트
	public int updateDormancy(int memberNo);

	// 2020-07-31
	public int selectCountNickname(String nickname);

	// 2020-07-31
	public String selectEmail(int memberNo);

	public int updateEmail(Member member);

	// 2020-07-30
	public String selectNickname(int memberNo);

	public String selectProfileImg(int memberNo);

	// 2020-08-07 이성진 회원가입 인서트
	public int insertJoin(Member member);

	// 2020-08-07 이성진 회원가입 아이디 중복체크
	public int selectCountId(String id);

	public int updatePassword(Member member);

	public Member selectPasswordCheck(Member member);

	public Member selectIdCheck(Member member);

	public Member selectLogin(Member member);

	// 2020-08-08
	public Member selectMyInfo(int memberNo);

	// 2020-08-09 이성진 닉네임 변경
	public int updateNickname(Member member);

	// 2020-08-09 이성진 폰 변경
	public int updatePhone(Member member);

	// 2020-07-30
	public int updateProfileImg(Member member);

}
