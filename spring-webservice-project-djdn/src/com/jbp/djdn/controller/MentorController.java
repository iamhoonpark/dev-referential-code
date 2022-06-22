package com.jbp.djdn.controller;

import java.io.File;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jbp.djdn.service.MentorService;
import com.jbp.djdn.util.FileRenameUtil;
import com.jbp.djdn.util.ResizeImageUtil;
import com.jbp.djdn.vo.Lesson;
import com.jbp.djdn.vo.Member;
import com.jbp.djdn.vo.Mentor;

@Controller
public class MentorController {

	private MentorService mentorService;

	public void setMentorService(MentorService mentorService) {
		this.mentorService = mentorService;
	}

	// 2020-08-09 임현우
	// ajax 이용한 파일 업로드 controller
	@RequestMapping(value = "/mentorInsertImg.djdn", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String registMentor(Mentor mentor, MultipartFile uploadImg, HttpServletRequest req) throws Exception {
		System.out.println("formData : " + uploadImg);
		ServletContext application = req.getServletContext();
		String root = application.getRealPath("/");
		String uploadPath = root + "upload" + File.separator;
		String profilePath = root + "profile" + File.separator;
		String fileName = uploadImg.getOriginalFilename();
		/*
		 * //중복된 랜덤값 UUID uuid = UUID.randomUUID(); //중복없는 파일이름 fileName =
		 * uuid+fileName;
		 */
		
		
		// 파일
		FileRenameUtil rename = new FileRenameUtil();
		File file = new File(uploadPath + fileName);
		file = rename.rename(file);
		// 실제파일 업로드,throw Exception해줘야 함
		uploadImg.transferTo(file);
		
		ResizeImageUtil.resize(uploadPath+fileName, profilePath+fileName, 150, 100);
		
		return "{\"fileName\" : \"" + fileName + "\"}";
	}// registerMentor end

	// 멘토 등록 페이지
	@RequestMapping(value = "/mentorInsert.djdn", method = RequestMethod.GET)
	public void mentor() {

	}

	// 멘토 등록 정보 insert
	@RequestMapping(value = "/mentorInsert.djdn", method = RequestMethod.POST)
	public String InsertMentor(HttpSession session, Mentor mentor, String[] school, String[] major, char[] graduation, String[] proof) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		mentor.setMemberNo(loginMember.getMemberNo());
		System.out.println(mentor.getMemberNo());
		System.out.println(mentor.getNickname());
		System.out.println(mentor.getProfileImg());
		System.out.println(mentor.getIdCard());
		System.out.println(mentor.getAccount());
		System.out.println(mentor.getBankNo());
		System.out.println("school length :"+school.length);
		System.out.println("major length:"+major.length);
		System.out.println("graduation length:"+graduation.length);
		System.out.println("proof length:"+proof.length);
		mentorService.putMentor(mentor, school, major, graduation, proof);
		
		return "redirect:/mentorProfile.djdn";
	}

	/*
	 * @RequestMapping(value = "/backgroundInsert",method = RequestMethod.POST)
	 * public String background(Background background, String[] school,String[]
	 * major, char[] graduation,String[] proof) {
	 * 
	 * 
	 * 
	 * 
	 * mentorService.putBackground();
	 * 
	 * 
	 * 
	 * }
	 */
	//2020-08-08 동범 mentorProfile.djdn 창 Mapping
	@RequestMapping(value = "/mentorProfile.djdn", method = RequestMethod.GET)
	public void mentorProfile(Model model, HttpSession session, Member member) {
		member = (Member)session.getAttribute(Member.LOGIN);
		
		//model에 mentorService의 modelMap 추가
		Map<String, Object> modelMap = mentorService.searchMentor(member.getMemberNo());
		
		Integer count = (Integer) modelMap.get("count");
		session.setAttribute("count", count);
		if (count == 1) {
			session.setAttribute("loginMentor", modelMap.get("loginMentor"));
		} // if end
		
		model.addAllAttributes(modelMap);
		
		
	}
	//2020-08-10 동범 mentorProfile 카테고리별 content찾기 Ajax
	@RequestMapping(value = "/ajax/categoryContent.djdn", method = RequestMethod.GET)
	@ResponseBody
	public List<Mentor> categoryContent(HttpSession session, Member member, Mentor mentor) {
		member = (Member)session.getAttribute(Member.LOGIN);
		mentor.setMemberNo(member.getMemberNo());
		
		return mentorService.searchContentInfo(mentor);
	}
	//2020-08-10 동범 mentorProfile Lesson별 lessonCard찾기 Ajax
	@RequestMapping(value = "/ajax/lessonCard.djdn", method = RequestMethod.GET)
	@ResponseBody
	public List<Lesson> categoryContent(HttpSession session, Member member) {
		member = (Member)session.getAttribute(Member.LOGIN);
		
		return mentorService.searchLessonsByMentor(member.getMemberNo());
	}
		
	//2020-08-08 동범 mentorProfile.djdn 창 Mapping
	@RequestMapping(value = "/mentorProfile.djdn", method = RequestMethod.POST)
	public String mentorProfileInsert(HttpSession session, Member member, Mentor mentor) throws ParseException {
		
		member = (Member)session.getAttribute(Member.LOGIN);
		
		
		mentorService.addMentorInfo(mentor, member.getMemberNo());
		
		
		return "redirect:/mentorProfile.djdn";
	}
		
	//2020-08-12 동범 mentorCateRemove
	@RequestMapping(value = "/mentorCateRemove.djdn", method = RequestMethod.GET)
	public String mentoCateRemove(HttpSession session, Member member, Mentor mentor) {
		member = (Member)session.getAttribute(Member.LOGIN);
		
		//mentor 객체 세팅
		mentor.setMemberNo(member.getMemberNo());
		
		//mentorProfile category 삭제
		mentorService.removeMentorCate(mentor);
		
		return "redirect:/mentorProfile.djdn";
	}

}