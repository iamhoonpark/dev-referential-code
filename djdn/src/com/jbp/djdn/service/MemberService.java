package com.jbp.djdn.service;

import java.util.List;
import java.util.Map;

import com.jbp.djdn.vo.Agreement;
import com.jbp.djdn.vo.Course;
import com.jbp.djdn.vo.Dropout;
import com.jbp.djdn.vo.Member;

public interface MemberService {

	public Member login(Member member);

	public Map<String, Object> mentorCheck(int memberNo);
	
	// 2020-08-07 이성진 회원가입 인서트
	public int insertJoin(Member member, Agreement agreement);

	public int selectCountId(String id);

	// 2020-08-08 이성진 회원탈퇴 인서트
	public boolean dropoutInsert(Dropout dropout, int memberNo);

	// 2020-08-09 이성진 selectOne
	public Member getMyInfo(int memberNo);

	// 2020-08-09 이성진 이메일Update
	public int getEmail(Member member);

	// 2020-08-09 이성진 닉네임Update
	public int updateNickname(Member member);

	// 2020-08-09 이성진 phone Update
	public int updatePhone(Member member);

	// 2020-08-09 이성진 Update 프로필 사진
	public int updateProfileImg(Member member);
	
	// 2020-08-10 이성진 Update
	public int updateEmail(Member member);
	// 2020-08-10 이성진
	public void sendMail(String email);
	

	// 2020-08-08 박혜민
	public Member idSearch(Member member);

	// 2020-08-07 박주현 : 비밀번호 찾기
	public boolean checkPassword(Member member);

	// 2020-08-07 박주현 : 비밀번호 변경
	public void changePassword(String pwd, int memberNo);

}
