package com.jbp.djdn.service;

import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.jbp.djdn.dao.AgreementDAO;
import com.jbp.djdn.dao.CoursesDAO;
import com.jbp.djdn.dao.DropoutDAO;
import com.jbp.djdn.dao.MembersDAO;
import com.jbp.djdn.dao.MentorsDAO;
import com.jbp.djdn.util.SendEmail;
import com.jbp.djdn.vo.Agreement;
import com.jbp.djdn.vo.Course;
import com.jbp.djdn.vo.Dropout;
import com.jbp.djdn.vo.Member;
import com.jbp.djdn.vo.Mentor;

@Service
public class MemberServiceImpl implements MemberService {

	// 멤버필드 선언
	private MembersDAO membersDAO;
	private MentorsDAO mentorsDAO;
	// 2020-08-07 이성진 약관동의
	private AgreementDAO agreementsDAO;
	// 2020-08-08 이성진 회원탈퇴
	private DropoutDAO dropoutDAO;

	// setter
	public void setMembersDAO(MembersDAO membersDAO) {
		this.membersDAO = membersDAO;
	}

	public void setMentorsDAO(MentorsDAO mentorsDAO) {
		this.mentorsDAO = mentorsDAO;
	}

	
	// 2020-08-07 이성진 약관동의 세터주입
	public void setAgreementsDAO(AgreementDAO agreementsDAO) {
		this.agreementsDAO = agreementsDAO;
	}

	// 2020-08-08 이성진 회원탈퇴 세터주입
	public void setDropoutDAO(DropoutDAO dropoutDAO) {
		this.dropoutDAO = dropoutDAO;
	}

	@Override
	public Member login(Member member) {
		return membersDAO.selectLogin(member);
	}

	@Override
	public Map<String, Object> mentorCheck(int memberNo) {
		Map<String, Object> modelMap = new ConcurrentHashMap<String, Object>();
		int count = mentorsDAO.selectMentorCheck(memberNo);
		modelMap.put("count", count);
		if (count == 1) {
			Mentor mentor = mentorsDAO.selectLogin(memberNo);
			// System.out.println(mentor.getNickname());
			// System.out.println(mentor.getMemberNo());
			modelMap.put("loginMentor", mentor);
		} // if end
		return modelMap;
	}

	// 2020-08-08 이성진
	@Override
	public int insertJoin(Member member, Agreement agreement) {
		
		String email = member.getEmail()+"@"+member.getEmailAddress();
		member.setEmail(email);
		
		membersDAO.insertJoin(member);
		agreementsDAO.insertAgreement(agreement);
		return 1;

	}

	@Override
	public int selectCountId(String id) {
		return membersDAO.selectCountId(id);
	}

	// 2020-08-08 이성진 회원탈퇴(휴면)
	@Override
	public boolean dropoutInsert(Dropout dropout, int memberNo) {
		boolean flag = false;
		dropout.setMemberNo(memberNo);
		int result = membersDAO.updateDormancy(memberNo);
		int result1 = dropoutDAO.insertDropout(dropout);
		if (result == 1 && result1 == 1) {
			flag = true;
		}
		return flag;
	}

	@Override
	public Member getMyInfo(int memberNo) {
		return membersDAO.selectMyInfo(memberNo);
	}

	@Override
	public int getEmail(Member member) {
		return membersDAO.updateEmail(member);
	}

	// 2020-08-09 이성진 닉네임Update
	@Override
	public int updateNickname(Member member) {
		return membersDAO.updateNickname(member);
	}

	// 2020-08-09 이성진 폰 Update
	@Override
	public int updatePhone(Member member) {
		return membersDAO.updatePhone(member);
	}

	// 2020-08-09 이성진 profile Update
	@Override
	public int updateProfileImg(Member member) {
		return membersDAO.updateProfileImg(member);
	}

	@Override
	// 2020-08-10 이성진
	public int updateEmail(Member member) {
		return membersDAO.updateEmail(member);
	}

	// 2020-08-11 Seongjin Lee send email
	@Override
	public void sendMail(String email) {

		SendEmail.mailSend(email);
	}

	// 2020-08-08 박혜민 아이디찾기
	@Override
	public Member idSearch(Member member) {
		return membersDAO.selectIdCheck(member);
	}

	// 2020-08-07 박주현 : 비밀번호 찾기
	@Override
	public boolean checkPassword(Member member) {
		boolean flag = false;
		// System.out.println(member.getId());
		// System.out.println(member.getEmail());
		Member memberCheck = membersDAO.selectPasswordCheck(member);
		// System.out.println("memberCheck:" + memberCheck);
		if (memberCheck != null) {
			Random rd = new Random();
			Integer pwd = rd.nextInt(999999999);
			String pwdStr = pwd.toString();
			memberCheck.setPwd(pwdStr);
			SendEmail.mailSend(member.getEmail(), pwdStr);
			int result = membersDAO.updatePassword(memberCheck);
			flag = result == 1;
		}
		return flag;
	}

	// 2020-08-07 박주현 : 비밀번호 변경
	@Override
	public void changePassword(String pwd, int memberNo) {
		Member member = new Member(pwd, memberNo);
		membersDAO.updatePassword(member);
	}

}
