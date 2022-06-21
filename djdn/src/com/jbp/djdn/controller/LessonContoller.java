package com.jbp.djdn.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jbp.djdn.service.CategoryService;
import com.jbp.djdn.service.LessonService;
import com.jbp.djdn.service.WishlistService;
import com.jbp.djdn.vo.Category;
import com.jbp.djdn.vo.CheckRule;
import com.jbp.djdn.vo.Course;
import com.jbp.djdn.vo.Lesson;
import com.jbp.djdn.vo.Location;
import com.jbp.djdn.vo.Member;
import com.jbp.djdn.vo.Tag;

@Controller
public class LessonContoller {

	private LessonService lessonService;
	private CategoryService categoryService;
	//2020-08-08 구동범
	private WishlistService wishlistService;
		
	public void setLessonService(LessonService lessonService) {
		this.lessonService = lessonService;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public void setWishlistService(WishlistService wishlistService) {
		this.wishlistService = wishlistService;
	}
	
	//2020-08-07 민겸 
		@RequestMapping(value="/lessonList.djdn",method=RequestMethod.GET)
		public void lessonList(Model model,HttpSession session, int cateno) {
			//시도 model에 삽입
			model.addAttribute("sido",lessonService.getSido());
			model.addAttribute("cateno", cateno);
			//수업카드 model에 삽입
//			model.addAttribute("lessons",lessonService.getLessonCard(lesson));
			//태크 model에 삽입
//			model.addAttribute("tags",lessonService.getTags(lesson.getLessonNo()));		
		}
		
		//2020-08-07 민겸 	
		@RequestMapping(value="/ajax/categoryList.djdn",method=RequestMethod.GET)
		@ResponseBody
		public List<Category> categoryList(int categoryNo) {
			return categoryService.getCategory(categoryNo);
		}
		
		
		
		//2020-08-09 민겸 	
		@RequestMapping(value="/ajax/classList.djdn",method=RequestMethod.GET)
		@ResponseBody
		public List<Lesson> lessionList(CheckRule checkRule, HttpSession session) {
			Member loginMember = (Member)session.getAttribute(Member.LOGIN);
			int memberNo = 0;
			if(loginMember!=null) {
				memberNo = loginMember.getMemberNo();
			}
			List<Lesson> lessons = lessonService.getLessonCard(checkRule,memberNo);
			for(Lesson lesson : lessons) {
				lesson.setCourseStatus("RI");
			}
			return lessons;
		}
		
		//2020-08-10 민겸
		@RequestMapping(value="/ajax/gunguList.djdn",method=RequestMethod.GET)
		@ResponseBody
		public List<Location> getGungu(int addressNo){
			return lessonService.getGungo(addressNo);		
		}

	// 달력 json
	// 2020-08-11 주영
	@RequestMapping(value = "/ajax/myLessonCalAjax.djdn", method = RequestMethod.GET)
	@ResponseBody
	public List<Lesson> myLessonCalendar(HttpSession session, @RequestParam(defaultValue = "String") String formatCourseStatus) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		return lessonService.getMyLessonSchedules(loginMember.getMemberNo());
	}

	// 2020-08-09 주영
	@RequestMapping(value = "/myLessonCal.djdn", method = RequestMethod.GET)
	public void myLessonListCal(Model model, HttpSession session) {

	}

	// 2020-08-09 주영
	@RequestMapping(value = "/myLesson.djdn", method = RequestMethod.GET)
	public void myLessonList(Model model, @RequestParam(defaultValue = "1") int page, HttpSession session,
			@RequestParam(defaultValue = "O") char status) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		int no = loginMember.getMemberNo();
		model.addAllAttributes(lessonService.getMyLessons(page, no, status));
	}

	// 0808 신승훈 이미지 업로드
	@RequestMapping(value = "/ajax/adImgList.djdn", method = RequestMethod.POST)
	@ResponseBody
	private String imgUpload(MultipartFile fileImg, HttpServletRequest request) {
		ServletContext application = request.getServletContext();
		String root = application.getRealPath("/");
		String uploadPath = root + "upload" + File.separator;
		//System.out.println(uploadPath);
		String fileName = fileImg.getOriginalFilename();
		File file = new File(uploadPath + fileName);
		// 실제 파일 업로드
		try {
			fileImg.transferTo(file);
		} catch (Exception e) {

		}
		return "{\"imageName\":\"" + fileName + "\"}";

	}

	// 0807 신승훈 수업신청
	@RequestMapping(value = "/lessonInsert.djdn", method = RequestMethod.GET)
	private void lessonInsert(Model model) {
		List<Category> upper = lessonService.getUpperCate();
		model.addAttribute("upper", upper);
	}

	@RequestMapping(value = "/lessonInsert2.djdn", method = RequestMethod.POST)
	private void lessonInsert2(Model model, Lesson lesson, HttpSession session) {
		session.setAttribute("lesson", lesson);
		List<Location> sidoFirst = lessonService.getSidoFirst();
		model.addAttribute("sidoFirst", sidoFirst);
	}

	@RequestMapping(value = "/lessonInsert3.djdn", method = RequestMethod.POST)
	private void lessonInsert3(Model model, Lesson lesson, HttpSession session) {
		// System.out.println("레슨1" + lesson.getCategoryNo());
		// System.out.println("수업이미지1" + lesson.getLessonImg());
		// insert1에서 받았던 세션은 초기화 되고 여기서 새롭게 다시 받아지는건가? 그럼 vo를 3개 만들어야하는건가?
		session.setAttribute("lesson", lesson);
	}

	@RequestMapping(value = "/lessonInsertDB.djdn", method = RequestMethod.POST)
	private String lessonInsertDB(Lesson lesson, HttpSession session) {
		session.setAttribute("lesson", lesson);
		lesson = (Lesson)session.getAttribute("lesson");
		Member loginMember = (Member) session.getAttribute(Member.LOGIN);
		lesson.setMemberNo(loginMember.getMemberNo());
		lessonService.insertLesson(lesson);
		System.out.println(lesson.getLessonNo());
		session.removeAttribute("lesson");
		return "redirect:/lessonDetail.djdn?lessonNo="+lesson.getLessonNo();
		
	}

	@RequestMapping(value = "/ajax/subCategory.djdn", method = RequestMethod.GET)
	@ResponseBody
	private List<Category> subCate(int categoryNo) {
		return lessonService.getSubCate(categoryNo);
	}

	@RequestMapping(value = "/ajax/sidoInsert.djdn", method = RequestMethod.GET)
	@ResponseBody
	private List<Location> sidoSecond(int addressNo) {
		return lessonService.getSidoSecond(addressNo);
	}

	// 2020-08-08 강정현 수업 상태 업데이트
	@RequestMapping(value = "/lessonUpdate.djdn", method = RequestMethod.GET)
	public String lessonStatusUpdate(Lesson lesson, RedirectAttributes ra) {
		boolean flag = lessonService.updateLessonStatus(lesson);
		if (flag) {
			return "redirect:/lessonDetail.djdn?lessonNo=" + lesson.getLessonNo();
		} else {
			ra.addFlashAttribute("error", "수업 상태 변화 에러");
			return "redirect:/lessonDetail.djdn?lessonNo=" + lesson.getLessonNo();
		} // if~else end

	}

	// 2020-08-07 강정현 수업 신청
	@RequestMapping(value = "/lessonDetail.djdn", method = RequestMethod.POST)
	public String lessonRequest(Course course, String[] classDate, HttpSession session) {
		Member loginMember = (Member) session.getAttribute(Member.LOGIN);
		lessonService.addCourse(course, classDate, loginMember.getMemberNo());
		return "redirect:/courseComplete.djdn";
	}

	// 2020-08-07 강정현 수업 상세 페이지
	@RequestMapping(value = "/lessonDetail.djdn", method = RequestMethod.GET)
	public String lessonDetail(Model model, int lessonNo, HttpSession session) {
		Member loginMember = (Member) session.getAttribute(Member.LOGIN);
		model.addAllAttributes(lessonService.getLesson(lessonNo, loginMember));
		return "/lessonDetail";
	}
	
	//2020-08-07 동범 index 창 띄우기
	@RequestMapping(value = "/index.djdn", method = RequestMethod.GET)
	public void index(Model model, HttpSession session, Member member ) {
		lessonService.courseCompare();
		//로그인확인
		int memberNo = 0;
		try {
			member = (Member)session.getAttribute(Member.LOGIN);
			//System.out.println(member.getMemberNo());
			model.addAttribute("loginMember", member);
			//System.out.println(member.getMemberNo());
			memberNo = member.getMemberNo();
		} catch (Exception e) {
			// TODO: handle exception
		}
		//Map
		model.addAllAttributes(lessonService.searchLessonThemeList(memberNo));
		model.addAllAttributes(lessonService.searchByTag(memberNo));
		model.addAllAttributes(lessonService.searchCategory(memberNo));
		model.addAllAttributes(lessonService.searchSeason(memberNo));
	}//index() end	
	
	//2020-08-08 indexAjaxLike json 
	@RequestMapping(value = "/ajax/like.djdn", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String inexAjaxLike(int lessonNo, Member member, HttpSession session) {
		//로그인확인
		try {
			member = (Member)session.getAttribute(Member.LOGIN);
			//wishControl에 필요한 memberNo, lessonNo 보내주기
			//System.out.println("LikeBtnAjax lessonNo : " + lessonNo);
			return wishlistService.wishControl(member.getMemberNo(), lessonNo);
		} catch (Exception e) {
			// TODO: handle exception
		}
		//비로그인시
		return null;
	}//inexAjaxLike() end
	
	//2020-08-08 상단 searchBar 검색
	@RequestMapping(value = "/ajax/searchBoxList.djdn", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Tag> searchBarAjax(String keyword) {		
		return lessonService.searchBar(keyword);
	}//searchBarAjax() end

}
