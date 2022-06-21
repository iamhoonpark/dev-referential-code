package com.jbp.djdn.controller;

import java.io.File;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jbp.djdn.service.MemberService;
import com.jbp.djdn.util.ResizeImageUtil;
import com.jbp.djdn.vo.Agreement;
import com.jbp.djdn.vo.Dropout;
import com.jbp.djdn.vo.Member;

@Controller
public class MemberController {

	private MemberService memberService;

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	// 2020-08-07 강정현 로그인
	@RequestMapping(value = "/login.djdn", method = RequestMethod.GET)
	public String loginMember() {
		return "login";
	}

	@RequestMapping(value = "/login.djdn", method = RequestMethod.POST)
	public String login(Member member, HttpSession session, RedirectAttributes ra) {
		Member loginMember = memberService.login(member);
		if (loginMember == null) {
			ra.addFlashAttribute("msg", "아이디나 비밀번호가 틀렸습니다");
			return "redirect:/login.djdn";
		} else {
			session.setAttribute(Member.LOGIN, loginMember);
			Map<String, Object> modelMap = memberService.mentorCheck(loginMember.getMemberNo());
			Integer count = (Integer) modelMap.get("count");
			session.setAttribute("count", count);
			if (count == 1) {
				session.setAttribute("loginMentor", modelMap.get("loginMentor"));
			} // if end
		} // if~else end
		return "redirect:/index.djdn";
	}

	@RequestMapping(value = "/logout.djdn", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index.djdn";
	}

	// 2020-08-07 이성진 회원가입 jsp뷰
	@RequestMapping(value = "/join.djdn", method = RequestMethod.GET)
	public void joinForm() {

	}

	// 2020-08-07 이성진 회원가입 redirect view
	@RequestMapping(value = "/join.djdn", method = RequestMethod.POST)
	public String insertJoin(Member member, Agreement agreement, HttpSession session) { // redirect view
		System.out.println(agreement.getLocation());
		System.out.println(agreement.getMail());
		System.out.println(agreement.getPrivateLocation());
		System.out.println(agreement.getService());
		memberService.insertJoin(member, agreement);
		session.setAttribute("userName", member.getNickname());
		return "redirect:/joinSuccess.djdn";
	}

	// 2020-08-07 이성진 id중복크 json 뷰
	@RequestMapping(value = "/ajax/idCheck.djdn", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String idCheck(String id) {
		int countId = memberService.selectCountId(id);
		return "{\"count\":" + countId + "}";
	}

	// 2020-08-07 이성진 닉네임중복크 json 뷰
	@RequestMapping(value = "/ajax/nicknameCheck.djdn", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String nicknameCheck(String nickname) {
		int countNickname = memberService.selectCountId(nickname);
		return "{\"countNickname\":" + countNickname + "}";
	}

	// 2020-08-07 이성진 회원가입 축하
	@RequestMapping(value = "/joinSuccess.djdn", method = RequestMethod.GET)
	public void joinCongrat() {
		
	}

	// 2020-08-08 이성진 회원탈퇴 (Dropout) jsp view(Internal Resource View)
	@RequestMapping(value = "/dropout.djdn", method = RequestMethod.GET)
	public void dropout(HttpSession session) {

	}

	// 2020-08-08 이성진 회원탈퇴 (Dropout) redirect view
	@RequestMapping(value = "/dropoutInsert.djdn", method = RequestMethod.POST)
	public String dropout(Model model, Dropout dropout, HttpSession session, RedirectAttributes ra) { // redirect view
		Member member = (Member) session.getAttribute(Member.LOGIN);
		boolean flag = memberService.dropoutInsert(dropout, member.getMemberNo());
		model.addAttribute("flag", flag);
		ra.addFlashAttribute("msg", "탈퇴되었습니다");
		// 회원탈퇴 시 로그아웃
		session.invalidate();
		return "redirect:/index.djdn";	
	}

	// 2020-08-07 이성진 개인정보 수정 jsp view
	@RequestMapping(value = "/profileUpdate.djdn", method = RequestMethod.GET)
	public void profileUpdate() {

	}

	// 2020-08-07 이성진 개인정보 수정 redirect view
	@RequestMapping(value = "/profileUpdate.djdn", method = RequestMethod.POST)
	public String profileUpdateAjax() {
		return "redirect:/profileUpdate.djdn";
	}

	// 2020-08-07 이성진 개인정보 수정 json view
	@RequestMapping(value = "/ajax/getMyInfo.djdn", method = RequestMethod.GET)
	@ResponseBody
	public Member getMyInfo(HttpSession session) {
		Member member = (Member) session.getAttribute(Member.LOGIN);
		return memberService.getMyInfo(member.getMemberNo());
	}

	// 2020-08-09 이성진 닉네임 변경 AJAX아님
	@RequestMapping(value = "/updateNickname.djdn", method = RequestMethod.POST)
	public String updateNickname(Member member, HttpSession session, Model model) {// redirect view
		Member loginMember = (Member) session.getAttribute(Member.LOGIN);
		session.setAttribute(Member.LOGIN, loginMember);
		member.setMemberNo(loginMember.getMemberNo());
		memberService.updateNickname(member);
		loginMember.setNickname(member.getNickname());
		//System.out.println("멤버" + member.getNickname());
		//System.out.println("로그인멤버" + loginMember.getNickname());
		model.addAttribute(member);
		return "redirect:/profileUpdate.djdn";
	}

	// 2020-08-09 이성진 전화번호 변경 redirect view
	@RequestMapping(value = "/updatePhone.djdn", method = RequestMethod.POST)
	public String updatePhone(Member member, HttpSession session, Model model) {// redirect view
		Member loginMember = (Member) session.getAttribute(Member.LOGIN);
		member.setMemberNo(loginMember.getMemberNo());
		memberService.updatePhone(member);
		loginMember.setPhone(member.getPhone());
		model.addAttribute(member);
		//System.out.println("멤버" + member.getPhone());
		//System.out.println("로그인멤버" + loginMember.getPhone());
		return "redirect:/profileUpdate.djdn";

	}

	// 2020-08-09 이성진 개인정보 수정페이지에서 비번 변경버튼 누를시 가는 jsp view
	@RequestMapping(value = "/passwordCheck.djdn", method = RequestMethod.GET)
	public void updatePassword() {
	
	}
	
	
	@RequestMapping(value="/ajax/updateProfileImg.djdn", method=RequestMethod.POST)
	@ResponseBody
	public String upload(Member member, MultipartFile uploadImg, HttpServletRequest request, Model model, HttpSession session ) { //uploadProfile이름이 upload.jsp의 file인풋의 name과 같아야 한다.  
			
		ServletContext application = request.getServletContext();
		String root= application.getRealPath("/");
		String uploadPath = root+"upload"+File.separator;
		String profilePath= root+"profile"+File.separator;
		
		System.out.println(uploadPath);
		//파일이름을 얻어옴
		String fileName= uploadImg.getOriginalFilename();
		
		//중복된 이름이 있으면 바꿔야한다. 
		UUID uuid= UUID.randomUUID();

		System.out.println(uuid);
		
		//중복없는 파일이름
		fileName= uuid+fileName;
		
		//파일
		File file= new File(uploadPath+ fileName);
		
		
		//실제 파일 업로드
		try {
			uploadImg.transferTo(file);


		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		System.out.println("POST/ profileUpdate.djdn");
			
		Member loginMember = (Member) session.getAttribute(Member.LOGIN);
		
		member.setMemberNo(loginMember.getMemberNo());
		member.setProfileImg(fileName);
		memberService.updateProfileImg(member);
		
		loginMember.setProfileImg(member.getProfileImg());

		model.addAttribute(member);
		System.out.println("멤버"+member.getProfileImg());
		System.out.println("로그인멤버"+loginMember.getProfileImg());
		
		
		ResizeImageUtil.resize(uploadPath+fileName, profilePath+fileName, 200, 150);

		
		return "{\"imageName\":\""+fileName+"\"}";
		
	}
	
	// 2020-08-10 이성진 이메일 인증 및 보내기 ajax
	@RequestMapping(value = "/ajax/sendEmail.djdn", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String sendEmail(String email) {// redirect view

		memberService.sendMail(email);

		// memberService.updateEmail(member);

		return "{\"msg\":\"번호가 발송되었습니다\"}";
	}
	
	
	// 2020-08-10 이성진 이메일 변경 ajax
	@RequestMapping(value="/ajax/updateEmail.djdn", method=RequestMethod.GET)
	@ResponseBody
	public String updateEmail(Member member, HttpSession session, Model model) {//redirect view
		
		Member loginMember = (Member) session.getAttribute(Member.LOGIN);
		
		member.setMemberNo(loginMember.getMemberNo());
		memberService.updateEmail(member);
		
		
		
		loginMember.setEmail(member.getEmail());

		model.addAttribute(member);
		System.out.println("멤버 : "+member.getEmail());
		System.out.println("로그인멤버 : "+loginMember.getEmail());
		
		String email = loginMember.getEmail();

		return "{\"email\":\""+email+"\"}";
	}

	// 2020-08-08 박혜민 아이디찾기 찾기페이지
	@RequestMapping(value = "/idSearch.djdn", method = RequestMethod.GET)
	public void idSearch() {

	}

	// 2020-08-08 박혜민 아이디찾기 실패페이지
	@RequestMapping(value = "/idSearchFail.djdn", method = RequestMethod.GET)
	public void idSearchFail() {

	}

	// 2020-08-08 박혜민 아이디찾기 성공페이지
	@RequestMapping(value = "/idSearchSuccess.djdn", method = RequestMethod.GET)
	public void idSearchSuccess() {

	}

	// 2020-08-08 박혜민 아이디찾기 실패하면 실패페이지,성공하면 성공페이지
	@RequestMapping(value = "/idSearch.djdn", method = RequestMethod.POST)
	public String idSearchSuccess(HttpSession session, String name, String email, String emailAddress) {
		String emailStr = email + "@" + emailAddress;
		Member member = new Member();
		member.setName(name);
		member.setEmail(emailStr);
		Member memberCheck = memberService.idSearch(member);
		if (memberCheck == null) {
			return "redirect:/idSearchFail.djdn";
		} else {
			session.setAttribute("memberCheck", memberCheck);
			return "redirect:/idSearchSuccess.djdn";
		} // if~else end
	}

	// 2020-08-07 박주현 : 비밀번호 찾기 페이지 맵핑
	@RequestMapping(value = "/passwordSearch.djdn", method = RequestMethod.GET)
	public void passwordSearch() {

	}

	// 2020-08-09 박주현 : 비밀번호 이메일로 전송하는 페이지 맵핑
	@RequestMapping(value = "/passwordSearchEmail.djdn", method = RequestMethod.GET)
	public String passwordSearchEmail() {
		return "passwordSearchEmail";
	}

	// 2020-08-07 박주현 : 비밀번호 찾기 수행 후 리다이렉트
	@RequestMapping(value = "/passwordSearch.djdn", method = RequestMethod.POST)
	public String passwordSearch(Member member, RedirectAttributes ra) {
		boolean flag = memberService.checkPassword(member);
		if (flag) {
			return "redirect:/passwordSearchEmail.djdn";
		} else {
			ra.addFlashAttribute("msg", "등록된 아이디가 없습니다.");
			return "redirect:/passwordSearch.djdn";
		}
	}


	// 2020-08-07 박주현 : 비밀번호 재설정(비밀번호 확인) 수행 후 리다이렉트
	@RequestMapping(value = "/passwordCheck.djdn", method = RequestMethod.POST)
	public String passwordCheck(HttpSession session, String check, RedirectAttributes ra) {
		Member member = (Member) session.getAttribute(Member.LOGIN);
		//System.out.println(member.getPwd());
		if (check.equals(member.getPwd())) {
			return "redirect:/passwordChange.djdn";
		} else {
			ra.addFlashAttribute("msg", "비밀번호가 틀렸습니다");
			return "redirect:/passwordSearch.djdn";
		}

	}

	// 2020-08-07 박주현 : 비밀번호 변경
	@RequestMapping(value = "/passwordChange.djdn", method = RequestMethod.GET)
	public String changePassword() {
		return "passwordChange";
	}

	@RequestMapping(value = "/passwordChange.djdn", method = RequestMethod.POST)
	public String changePasswordPage(String pwd, HttpSession session) {
		Member loginMember = (Member) session.getAttribute(Member.LOGIN);
		memberService.changePassword(pwd, loginMember.getMemberNo());
		return "redirect:/profileUpdate.djdn";
	}

	
}
