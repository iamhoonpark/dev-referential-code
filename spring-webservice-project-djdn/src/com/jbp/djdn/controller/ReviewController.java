package com.jbp.djdn.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jbp.djdn.service.ReviewService;
import com.jbp.djdn.util.FileRenameUtil;
import com.jbp.djdn.vo.Member;
import com.jbp.djdn.vo.Review;
import com.jbp.djdn.vo.ReviewImg;

@Controller
public class ReviewController {

	private ReviewService reviewService;

	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}

	// 2020-08-12 주영
	// myActivity 페이지 팝업에서 리뷰작성
	@RequestMapping(value = "/insertReview.djdn", method = RequestMethod.POST)
	public String postReview(Review review, String[] imgName, HttpSession session) throws Exception {
		Member loginMember = (Member) session.getAttribute(Member.LOGIN);
		review.setMemberNo(loginMember.getMemberNo());
		// 별점, 리뷰내용 insert
		reviewService.postReview(review);
		
		if(imgName!=null) {
			reviewService.postReviewImg(imgName);	
		}
		
		return "redirect:/myActivity.djdn";
	}

	// 2020-08-08 리뷰 얻어오는 메서드(ajax)
	@RequestMapping(value = "/ajax/getReviewList.djdn", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getReviews(int lessonNo, @RequestParam(defaultValue = "1") int page) {
		return reviewService.getReviews(lessonNo, page);
	}

	// 2020-08-08 주현 : 리뷰 목록 selectReviewList
	@RequestMapping(value = "/myReview.djdn", method = RequestMethod.GET)
	public void myReview(@RequestParam(defaultValue = "1") int page, HttpSession session, Model model) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		int no = loginMember.getMemberNo();
		model.addAllAttributes(reviewService.getMyreviews(page, no));

	}

	// 2020-08-08 주현 : 리뷰 삭제
	@RequestMapping(value = "/myReviewDelete.djdn", method = RequestMethod.GET)
	public String deleteReview(int reviewNo) {
		reviewService.deleteReview(reviewNo);
		return "redirect:/myReview.djdn";
	}

	// 2020-08-08 주현 : 리뷰 수정 눌렀을 때 에이잭스(별점, 글) 불러오기
	@RequestMapping(value = "/ajax/myReview.djdn", method = RequestMethod.GET)
	@ResponseBody
	public Review myReviewAjax(int reviewNo) {

		return reviewService.getMyReview(reviewNo);

	}

	// 2020-08-09 주현 : 리뷰 수정 눌렀을 때 에이잭스(이미지) 불러오기
	@RequestMapping(value = "/ajax/myReviewImg.djdn", method = RequestMethod.GET)
	@ResponseBody
	public List<ReviewImg> myReviewImgAjax(int reviewNo) {
		return reviewService.getMyReviewImgList(reviewNo);
	}

	// 2020-08-11 주현 : 리뷰 수정팝업 - 별점, 내용, 사진 수정 GET
	@RequestMapping(value = "/updateReview.djdn", method = RequestMethod.GET)
	public String updateReview(Review review, ReviewImg reviewImg, MultipartFile uploadImg, HttpServletRequest request)
			throws Exception {

		return "myReview";
	}

	// 2020-08-11 주현 : 리뷰 수정팝업 - 별점, 내용, 사진 수정 POST
	@RequestMapping(value = "/ajax/uploadReviewImg.djdn", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String updateMyReview(Review review, ReviewImg reviewImg, MultipartFile uploadImg,
			HttpServletRequest request) throws Exception {

		// 여기가 파일 업로드 하는 곳 / multi-part/formdata가 여기로 넘어온다
		ServletContext application = request.getServletContext();
		String root = application.getRealPath("/");
		System.out.println(root);

		String uploadPath = root + "upload" + File.separator;

		System.out.println(uploadPath);

		// 파일 이름
		String fileName = uploadImg.getOriginalFilename();
		// 파일(이름 변경)
		File file = new File(uploadPath + fileName);
		FileRenameUtil rename = new FileRenameUtil();
		rename.rename(file);
		// 실제 파일 업로드
		uploadImg.transferTo(file);

		return "{\"imageName\":\"" + fileName + "\"}";
	}

	// 2020-08-11 주현 : 리뷰수정 팝업에서 '수정하기' 누르면 글과 별점 업데이트, 사진 인서트
	@RequestMapping(value = "/updateReview.djdn", method = RequestMethod.POST)
	public String updateReview(Review review, String[] file, BindingResult br) {

		System.out.println("review NO : " + review.getReviewNo());

		if (file != null) {
			for (String string : file) {
				System.out.println("file name : " + string);
			}
		}
		List<FieldError> errors = br.getFieldErrors();

		for (FieldError fieldError : errors) {
			System.out.println(fieldError.getField());
		} // for end

		// 별점, 글 업데이트
		reviewService.updateReview(review, file);

		return "redirect:/myReview.djdn";
	}

}
