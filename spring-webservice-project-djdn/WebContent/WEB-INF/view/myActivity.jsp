<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>다재다능 | 내 활동 관리</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<link rel="stylesheet" href="/css/paginate.css"/>
<style>
	#wrapper {
		width: 1080px;
		padding-top: 100px;
		margin: auto;
		padding-bottom: 350px;
	}
	
	.activity_tit {
		font-size: 24px;
		border-bottom: 1px solid black;
		font-weight: bold;
		line-height: 90px;
		margin-bottom: 30px;
	}
	
	.activity_con {
		overflow: hidden;
	}
	
	.activity_tab {
		width: 140px;
		float: left;
	}
	
	.activity_tab li {
		margin-bottom: 25px;
		cursor: pointer;
	}
	
	.activity_class_list {
		float: right;
		width: 940px;
	}
	
	.activity_class_list_tit {
		line-height: 45px;
		font-size: 20px;
	}
	
	.activity_class_list_top {
		display: flex;
		justify-content: space-between;
		font-size: 16px;
	}
	
	.activity_class_list_top .activity_calendar {
		width: 100px;
		height: 40px;
		line-height: 40px;
		margin-top: 5px;
		margin-left: 360px;
		text-align: center;
		padding: 0 7px;
		border-radius: 3px;
		background-color: #008e97;
		color: #fff;
	}
	
	.activity_class_list_tab {
		display: flex;
	}
	
	.activity_class_list_tab li {
		border-bottom: 1px solid lightgray;
		cursor: pointer;
		padding: 13px 15px;
		margin-left: -1px;
	}
	
	.activity_class_list_tab li.on {
		border-bottom: none;
		border-left: 1px solid lightgray;
		border-right: 1px solid lightgray;
		position: relative;
	}
	
	.activity_class_list_tab li.on::before {
		content: "";
		position: absolute;
		width: 98%;
		left: -1px;
		top: 0;
		border: 2px solid #008e97;
	}
	
	.card {
		position: relative;
		transition: left 0.3s ease-out;
		margin-top: 20px;
	}
	
	.card::after {
		content: "";
		display: block;
		clear: both;
	}
	
	.content_situation {
		font-size: 17px;
		font-weight: 500;
		float: right;
		text-align : right;
	}
	
	.card li {
		width: 300px;
		height: 320px;
		border: 1px solid rgb(214, 214, 214);
		box-sizing: border-box;
		position: relative;
		margin-bottom: 20px;
		margin-right: 20px;
		cursor: pointer;
		float: left;
	}
	
	.card li:nth-child(3n) {
		margin-right: 0;
	}
	
	.card_hover {
		position: absolute;
		width: 300px;
		height: 320px;
		left: 0;
		top: 0;
		display: none;
		transition: all .3s ease;
		background-color: rgba(0, 0, 0, 0.7);
	}
	
	.card_hover_btn {
		position: absolute;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
		cursor: pointer;
		display: flex;
	}
	
	.card_hover_btn a {
		border-radius: 3px;
		width: 80px;
		height: 40px;
		margin: 10px;
		background-color: #008e97;
		border: none;
		color: white;
		cursor: pointer;
		outline: none;
		display: none;
		text-align: center;
		line-height: 39px;
		font-size: 15px;
		font-weight: 550;
	}
	
	.card li a {
		padding: 0;
	}
	
	.card li img {
		width: 100%;
		height: 200px;
		display: block;
	}
	
	.card_content {
		margin-top: 12px;
		padding-left: 10px;
		padding-right: 10px;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		height: 75px;
	}
	
	.content_title {
		font-size: 18px;
		font-weight: 600;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	
	.content_type {
		color: orange;
	}
	
	.content_info {
		font-size: 14px;
	}
	
	.content_info2 {
		float: left;
	}
	
	.content_price {
		font-size: 16px;
		float: right;
		color: red;
	}
	
	.content_price span {
		color: gray;
		font-size: 14px;
	}
	
	.content_tag {
		width: 100%;
		text-align: center;
		background-color: gray;
		position: absolute;
		bottom: 0;
		line-height: 22px;
		color: #fff;
		font-size: 16px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	
	.review {
		z-index: 30000;
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		padding: 30px;
		background: rgba(0, 0, 0, .75);
		display: none;
	}
	
	.review_pop {
		position: absolute;
		width: 700px;
		margin: auto;
		background: #fff;
		height: 650px;
		margin-top: 100px;
		left: 50%;
		top: 0;
		transform: translateX(-50%);
	}
	
	.review_pop_header {
		font-size: 24px;
		line-height: 60px;
		background-color: #008e97;
		color: #fff;
		padding: 0 20px;
		overflow: hidden;
		position: relative;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	.review_pop_header_close {
		cursor: pointer;
	}
	
	.review_pop_con {
		text-align: center;
		width: 400px;
		margin: auto;
	}
	
	.review_pop_con_tit {
		color: blue;
		margin-top: 10px;
		font-size: 20px;
		margin-bottom: 5px;
	}
	
	.review_pop_con_tit2 {
		font-size: 18px;
	}
	.review_pop_con_score::after {
		content : "";
		display : block;
		clear : both;
	}
	.review_pop_con_score {
		margin-top: 10px;
		font-size: 30px;
		margin-bottom: 20px;
		cursor: pointer;
		user-select: none;
	}
	.review_pop_con_score input {
		display : none;
	}
	.review_pop_con_score label {
		width : auto;
		height : auto;
		line-height : 0;
		margin : 0;
		border : none;
		font-size : 30px;
		float : none;
		display: inline;
	}
	.review_pop_con_text {
		width: 400px;
		height: 250px;
		resize: none;
		outline: none;
	}
	
	.review_pop_con_file {
		display: block;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	.review_pop_con_file_count {
		text-align: left;
		margin-bottom: 20px;
	}
	
	.review_pop_con_file_info {
		font-size: 12px;
		margin-left: 20px;
		display: inline-block;
	}
	
	.review_pop_con_upload {
		background-color: #008e97;
		border: none;
		border-radius: 5px;
		height: 40px;
		width: 100px;
		font-size: 16px;
		color: #fff;
	}
	
	label {
		width: 70px;
		height: 70px;
		border: 1px solid #424242;
		display: block;
		cursor: pointer;
		font-size: 24px;
		line-height: 70px;
		margin: 15px 0;
		float: left;
	}
	
	#file_upload {
		display: none;
	}
	
	.file_box {
		overflow: hidden;
	}
	
	.file_box_img li {
		width: 70px;
		height: 70px;
		float: left;
		margin: 15px 10px 15px 0;
	}
	
	.file_box_img li img {
		width: 100%;
		height: 100%;
	}
	
	/* 리뷰 별점 css */
	.box_grade {
		padding: 5px 0;
	}
	
	.box_grade::after {
		content: "";
		display: block;
		clear: both;
	}
	
	.box_grade .class_grade {
		display: inline-block;
		float: left;
		margin: 0;
		margin-right: 5px;
	}
	
	.box_grade .class_grade_count {
		display: inline-block;
		float: left;
		height: 18px;
	}
	
	.wrap_small_star, .box_small_star, .small_star_bg, .small_star {
		height: 18px;
	}
	
	.box_small_star .small_star_bg, .box_small_star .small_star {
		background-image: url("img/reviewStar.png");
		background-repeat: no-repeat;
		position: absolute;
		top: 0;
		left: 0;
	}
	
	.wrap_small_star {
		width: 105px;
		margin: 8px 0;
	}
	
	.wrap_small_star .box_small_star {
		position: relative;
	}
	
	.box_small_star .small_star_bg {
		width: 105px;
		background-position: 0 0;
	}
	
	.box_small_star .small_star {
		background-position: 0 -20px;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>
	
	<div id="wrapper">
		<div class="activity">
			<h2 class="activity_tit">내 활동 관리</h2>
			<div class="activity_con">
				<ul class="activity_tab">
					<li><a href="/myReview.djdn">내가 쓴 리뷰</a></li>
					<li><a href="/myActivity.djdn">내 수강 목록</a></li>
				</ul>
				<div class="activity_class_list">
					<div class="activity_class_list_top">
						<h3 class="activity_class_list_tit">내 수강 목록</h3>
						<a href="/myActivityCal.djdn" class="activity_calendar">달력으로 보기</a>
						<ul class="activity_class_list_tab">
							<li data-filter="*" class="on">전체보기</li>
							<li data-filter="CI">수강중</li>
							<li data-filter="CC">수강완료</li>
							<li data-filter="R">환불</li>
						</ul>
					</div><!-- //.activity_class_list_top -->
					<ul class="activity_class_list_bottom card">

					</ul>
				</div>
			</div>
			<!-- activity_con -->
		</div><!-- //.activity -->
		
		<div class="review">
			<div class="review_pop">
				<div class="review_pop_header">
					<h2>리뷰작성</h2>
					<div class="review_pop_header_close">
						<i class="fas fa-times"></i>
					</div>
				</div>
				<div class="review_pop_con">
					<h3 class="review_pop_con_tit"> </h3>
					<h3 class="review_pop_con_tit2">수업을 추천하시겠어요?</h3>
					<form action="/insertReview.djdn" method="post" id="reviewForm">
						<input id="courseNo" type="hidden" name="courseNo" value="">
						<div class="review_pop_con_score">
							<label for="score1"><i class="fas fa-star" aria-hidden="ture" id="s1"></i></label> 
							<input id="score1" type="radio" name="score" value="1"/> 
							<label for="score2"><i class="fas fa-star" id="s2"></i></label> 
							<input id="score2" type="radio" name="score" value="2"/> 
							<label for="score3"><i class="fas fa-star" id="s3"></i></label> 
							<input id="score3" type="radio" name="score" value="3"/> 
							<label for="score4"><i class="fas fa-star" id="s4"></i></label> 
							<input id="score4" type="radio" name="score" value="4"/> 
							<label for="score5"><i class="fas fa-star" id="s5"></i></label> 
							<input id="score5" type="radio" name="score" value="5"/>
						</div>
						<textarea name="content" value="" class="review_pop_con_text" id="" cols="30" rows="10" placeholder="수업에 대한 리뷰를 작성해주세요!"></textarea>
						<div class="file_box">
							<ul class="file_box_img">
											
							</ul>
							<label class="file_upload_label" for="file_upload"><i class="fas fa-plus"></i></label>
							<input id="file_upload" class="review_pop_con_file" type="file"/>
						</div>
						<div class="review_pop_con_file_count">
							사진 업로드 수 : <span class="current_count">0</span> / 4 
							<span class="review_pop_con_file_info">사진은 최대 4장까지 업로드 가능합니다</span>
						</div>
						<button class="review_pop_con_upload" type="submit">등록하기</button>
					</form>
				</div>
			</div>
		</div>
		
	</div><!-- //#wrapper -->
	
	<c:import url="/WEB-INF/template/footer.jsp"></c:import>

	<script type="text/template" id="cardTmpl">
	<@_.each(cards,function(card){ @>
	<li data-situ="<@=card.courseStatus@>">
	<img src="/upload/<@=card.thumnail@>" alt="수업이미지">
	<div class="ranking_theme_card_content card_content">
		<h3 class="ranking_theme_card_content_title content_title">
			 <@=card.title@>
		</h3>
		<span class="content_situation"><@=card.formatCourseStatus@></span>
		<div class="ranking_theme_card_content_review content_review">
			<div class="box_grade">
				<div class="wrap_small_star class_grade">
					<div class="box_small_star">
						<div class="small_star_bg"></div>
						<div class="small_star" style="width : <@=card.scoreAvg@>%"></div>
					</div>
					<!-- //box_small_star -->
				</div>
				<!-- //wrap_small_star -->
				<span class="class_grade_count">(<@=card.count@>)</span>
			</div>
			<!-- //box_grade -->
		</div>
		<div class="ranking_theme_card_content_info content_info">
			<div class="ranking_theme_card_content_info2 content_info2">
				<span class="ranking_theme_card_content_location content_location"><@=card.sido@>, <@=card.gungu@> | </span>
			    <span class="ranking_theme_card_content_type content_type">
					<@ if (card.personnel == 'P') { @>
						1대1
					<@ } else { @>
						그룹
					<@ } @>
			    </span>
			</div>
			<div class="ranking_theme_card_content_price content_price">
				<@=card.price@>
				<span class="ranking_theme_card_content_priece_time content_priece_time">/시간</span>
			</div>
		</div>	
		</div>
		<div class="ranking_theme_card_content_tag content_tag">
			<@ if(card.lessonTags == null) { @>
				<span class="tag1">태그가 없습니다.</span>
			<@ } else { @>
				<@ _.each(card.lessonTags, function(lessonTag) { @>
					<span class="tag1">#<@=lessonTag.tag@></span>
				<@ }) @>
			<@ } @>
        </div>
	<div class="card_hover">
		<div class="card_hover_btn">
			<@ if (card.courseStatus == 'CI') { @>
				<a href="/lessonDetail.djdn?lessonNo=<@=card.lessonNo@>">수업상세</a>
				<a>신청내역</a>
				<a href="/refund.djdn?courseNo=<@=card.courseNo@>">환불하기</a>
			<@ } else if(card.courseStatus == 'CC') { @>
				<a href="/lessonDetail.djdn?lessonNo=<@=card.lessonNo@>">수업상세</a>
				<a >신청내역</a>
				<a class="card_hover_review" data-courseNo="<@=card.courseNo@>">리뷰작성</a>
			<@ } else if(card.courseStatus == 'RI') { @>
				<a href="/lessonDetail.djdn?lessonNo=<@=card.lessonNo@>">수업상세</a>
				<a >환불취소</a>
			<@ } else { @>
				<a href="/lessonDetail.djdn?lessonNo=<@=card.lessonNo@>">수업상세</a>
			<@ } @>
		</div>
	</div>
</li>
<@})@>
	</script>
	
	<script type="text/template" id="fileImg">
        <li>
			<img src="/upload/<@=img.imageName@>" alt="">
			<input type="hidden" name="imgName" value="<@=img.imageName@>"/>
		</li>
    </script>
	
	<script src="/js/underscore-min.js"></script>
	<script>
		_.templateSettings = {interpolate : /\<\@\=(.+?)\@\>/gim,evaluate : /\<\@([\s\S]+?)\@\>/gim,escape : /\<\@\-(.+?)\@\>/gim};
		
		const cardTmp = _.template($("#cardTmpl").html());
		const imgTmp = _.template($("#fileImg").html());
		const $imgList = $(".file_box_img");
		const $fileUpload = $("#file_upload");
		const $activityClassListBottom = $(".activity_class_list_bottom");
		
		$("#reviewForm").submit(function() {
			
			if ($('input:radio[name=score]').is(':checked') == false) {
				alert("리뷰 별점을 선택해주세요.");
				return false;
			}
			
			if($(".review_pop_con_text").val()=="") {
				alert("내용을 입력해주세요.");
				$(".review_pop_con_text").focus();
				return false;
			}
			
			alert("리뷰가 등록되었습니다.");
			
		});
		
		/* 탭 */
		$(".activity_class_list_tab li").on("click", function() {
			filterData = this.dataset.filter;
			$(".activity_class_list_tab li").removeClass("on");
			$(this).addClass("on");

			$(".card li").each(function() {
				const cardData = this.dataset.situ;

				if (filterData == cardData || filterData == "*") {
					this.style.display = "block";
				} else {
					this.style.display = "none";
				}
			});
			getCard();
		});
		
		/* 카드 */
		let filterData = "*";
		
		function getCard() {
			$.ajax({
				url: "/ajax/myActivityAjax.djdn",
				type: "GET",
				dataType: "json",
				data:{courseStatus:filterData},
				error: function () {
					alert("서버 점검중입니다.");
				},
				success: function (json) {
					$activityClassListBottom.html(cardTmp({cards:json.lessons}));
					$(".paginate").remove();
					$(".activity_class_list").append(json.paginate);
				}
			});
		}
		
		getCard();
		
		$("body").on("mouseenter", ".card li",function() {
			//console.log($(this).children(".card_hover").html());
			$(this).find(".card_hover").show();
			$(this).find(".card_hover_btn a").show();
		});

		$("body").on("mouseleave", ".card li", function() {
			$(this).find(".card_hover").hide();
			$(this).find(".card_hover_btn a").hide();
		});
		
		/* 리뷰 팝업 */
		//별점
		$("#s1").on("click", function() {
			$(".fa-star").css("color", "#000");
			$("#s1").css("color", "#f9bf2d");
		});
		$("#s2").on("click", function() {
			$(".fa-star").css("color", "#000");
			$("#s1,#s2").css("color", "#f9bf2d");
		});
		$("#s3").on("click", function() {
			$(".fa-star").css("color", "#000");
			$("#s1,#s2,#s3").css("color", "#f9bf2d");
		});
		$("#s4").on("click", function() {
			$(".fa-star").css("color", "#000");
			$("#s1,#s2,#s3,#s4").css("color", "#f9bf2d");
		});
		$("#s5").on("click", function() {
			$(".fa-star").css("color", "#000");
			$("#s1,#s2,#s3,#s4,#s5").css("color", "#f9bf2d");
		});
		
		//이미지파일 업로드하는 ajax
		$("body").on("change", "#file_upload", function() {
			const file = this.files[0];
			console.log(file);
			const formData = new FormData();
			console.log(formData);
			formData.append("uploadImg", file, file.name);

			$.ajax({
				url : "/ajax/uploadReviewImg.djdn",
				type : "post",//multipart/form-data니까
				dataType : "json",
				contentType : false,//multipart/form-data니까
				processData : false,//multipart/form-data니까
				data : formData,//multipart/form-data니까
				error : function() {
					alert("서버점검중!");
				},
				success : function(img) {
					console.log(img);

					//유저에게 미리보기 제공
					if ($(".file_box_img li").length < 4) {
						$(".file_box_img").append(imgTmp({img : img}));
						$(".current_count").text($(".file_box_img li").length);

						if ($(".file_box_img li").length == 4) {
							$(".file_upload_label").hide();
						}
					}
				}// success end
			});// ajax end
		});
		
		// 리뷰 작성 팝업 보여주는 ajax
		$(".activity_class_list_bottom").on("click", ".card_hover_review", function() {
			$(".review").css("display", "block");
			let courseNo = this.dataset.courseno;
			const title = $(this).parents(".card_hover").siblings(".ranking_theme_card_content").find(".ranking_theme_card_content_title").text();
			$(".review_pop_con_tit").text(title);
			$("#courseNo").val(courseNo);
		});//.review_change_btn click() end
		
    	$(".file_box").on("click","li",function(e){
    		e.stopPropagation();
   			// this의 li 삭제
   			$(this).remove();
   			$(".current_count").text($(".file_box_img li").length);
        	$(".file_upload_label").show();
    	});
		
		
		/* 팝업 나가기 */
		const $review = $(".review");
		const $reviewPopConText = $(".review_pop_con_text");
		const $fileUploadLabel = $(".file_upload_label");
		const $currentCount = $(".current_count");
		
		function cancel() {
			if (confirm("리뷰 등록을 취소하시겠습니까?")) {
				$('input:radio[name=score]').prop("checked", false);
				$(".fa-star").css("color", "#000");
				$reviewPopConText.val("");
	        	$(".file_box_img li").remove();
	        	$currentCount.text($(".file_box_img li").length);
				$fileUploadLabel.show();
				$review.hide();
			}
		}
		
		// 팝업 상단 X 버튼 
		$(".review_pop_header_close").on("click", function() {
			cancel();
		});
		
		//팝업 바깥 레이아웃 눌렀을 때
		$(".review").on("click",".review_pop",function(e) {
			e.stopPropagation();
		});
		
		$(".review").click(function() {
			cancel();
		});
		
		// 팝업에서 esc 눌렀을 때
		$(document).on("keydown", function(e) {
			if ($('.review').css('display') != 'none' && e.keyCode == 27) {
				cancel();
			}
		});
	</script>
</body>
</html>