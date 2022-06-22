package com.jbp.djdn.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jbp.djdn.service.CourseService;
import com.jbp.djdn.vo.Blacklist;
import com.jbp.djdn.vo.Lesson;
import com.jbp.djdn.vo.Member;

@Controller
public class CourseController {

	private CourseService courseService;

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	// 달력 json
	// 2020-08-11 주영
	@RequestMapping(value = "/ajax/myActivityCalAjax.djdn", method = RequestMethod.GET)
	@ResponseBody
	public List<Lesson> myCourseCalendar(HttpSession session) {
		Member loginMember = (Member)session.getAttribute("loginMember");
		return courseService.getMyCourseSchedules(loginMember.getMemberNo());
	}

	// 달력
	// 2020-08-11 주영
	@RequestMapping(value = "/myActivityCal.djdn", method = RequestMethod.GET)
	public void myCourseListCal(Model model, HttpSession session) {

	}

	// 2020-08-11 주영
	@RequestMapping(value = "/ajax/myActivityAjax.djdn", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> myCoursesAjax(HttpSession session, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "*") String courseStatus) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		int no = loginMember.getMemberNo();
		return courseService.getMyCourses(page, no, courseStatus);
	}

	// 2020-08-08 주영
	@RequestMapping(value = "/myActivity.djdn", method = RequestMethod.GET)
	public void myCourseList(Model model, HttpSession session, String courseStatus) {

	}

	// 2020-08-08 강정현 수업 신청 완료 페이지
	@RequestMapping(value = "/courseComplete.djdn", method = RequestMethod.GET)
	public String getCourse(Model model, HttpSession session) {
		Member loginMember = (Member) session.getAttribute(Member.LOGIN);
		model.addAllAttributes(courseService.getCourse(loginMember.getMemberNo()));
		return "courseComplete";
	}

	// 2020-08-07 박혜민 멘티목록출력, int lessonNo는 파라미터
	@RequestMapping(value = "/menteeList.djdn", method = RequestMethod.GET)
	public void menteeList(Model model, int lessonNo) {
		model.addAttribute("courses", courseService.getMenteeList(lessonNo));
	}

	// 2020-08-07 박혜민 블랙리스트 사유추가
	@RequestMapping(value = "/menteeBlack.djdn", method = RequestMethod.POST)
	public String menteeBlack(Blacklist blacklist, @RequestHeader String referer) {
		courseService.addMenteeBlack(blacklist);
		return "redirect:" + referer;
	}

}
