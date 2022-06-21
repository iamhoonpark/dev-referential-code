<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>다재다능 | 내 수업 목록</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<link rel="stylesheet" href="/css/paginate.css"/>
<style>
	a {
		text-decoration: none;
		color: #000;
	}
	
	#wrapper {
		width: 1080px;
		margin: auto;
		padding-top: 100px;
	}
	
	/* 내 수업 목록 페이지 제목 css */
	.wrapper_class_tit {
		line-height: 90px;
		font-size: 24px;
		font-weight: bold;
		border-bottom: 1px solid rgb(184, 184, 184);
		margin-bottom: 30px;
	}
	
	.wrapper_class {
		margin-bottom: 30px;
	}
	
	.clear {
		clear: both;
	}
	
	.wrapper_class .class_side {
		width: 140px;
		float: left;
	}
	
	.wrapper_class .class_side li {
		font-size: 16px;
		margin-bottom: 25px;
		cursor: pointer;
	}
	
	.wrapper_class .class_list {
		width: 940px;
		float: left;
	}
	
	.class_list .box_list_top {
		width: 940px;
		height: 50px;
		margin-bottom: 20px;
	}
	
	.class_list .class_list_tit {
		width: 800px;
		font-size: 20px;
		line-height: 40px;
		float: left;
	}
	
	.box_close_class {
		display: none;
	}
	
	.box_end_class {
		display: none;
	}
	
	.box_expiration_class {
		display: none;
	}
	
	/* btn css */
	.calendar_btn {
		float: right;
		display: block;
		text-align: center;
		line-height: 40px;
		padding: 0 7px;
	}
	
	.btn {
		width: 100px;
		height: 40px;
		background-color: #008e97;
		color: #ffffff;
		border: none;
		border-radius: 3px;
		cursor: pointer;
		outline: none;
	}
	
	/* card css */
	.card_proceeding_class::after {
		content: "";
		display: block;
		clear: both;
	}
	
	.card_proceeding_class li {
		float: left;
		width: 300px;
		height: 320px;
		box-sizing: border-box;
		border: 1px solid rgb(214, 214, 214);
		position: relative;
		margin-right: 20px;
		margin-bottom: 20px;
	}
	
	.card_proceeding_class li:nth-child(3n+3) {
		margin: 0;
	}
	
	.card_proceeding_class li img {
		width: 100%;
		height: 200px;
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
	
	.card_tit {
		font-size: 16px;
		font-weight: 600;
		white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	}
	
	.card_open_close {
		width: 70px;
		font-size: 15px;
		float: right;
		text-align: right;
		font-weight: 500;
	}
	
	.card_type {
		color: orange;
	}
	
	.card_info {
		float: left;
		font-size: 14px;
	}
	
	.card_price {
		float: right;
		color: red;
	}
	
	.card_price span {
		color: gray;
		font-size: 14px;
	}
	
	.card_tag {
		width: 100%;
		text-align: center;
		background-color: gray;
		position: absolute;
		bottom: 0;
		line-height: 22px;
		color: #fff;
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	}
	
	/* 카드에 마우스 오버했을 때 나오는 버튼 */
	.card_cover {
		width: 300px;
		height: 320px;
		position: absolute;
		left: 0;
		top: 0;
		background-color: rgba(0, 0, 0, .7);
		z-index: 1000;
		display: none;
	}
	
	.card_proceeding_class .btn_cover {
		width: 210px;
		position: absolute;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
		text-align: center;
		z-index: 2000;
	}
	
	.btn_cover a {
		line-height: 40px;
	}
	
	.btn_cover .btn {
		display: none;
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
		background-image: url("/img/reviewStar.png");
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
	
	/* 페이징처리 */
	.paginate {
		margin-top: 40px;
	}
	.paginate strong {
		background: #008e97;
		border-color: #008e97;
	}
	
	.paginate span {
		cursor: default;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>
	<div id="wrapper">
		<div class="wrapper_tit">
			<h2 class="wrapper_class_tit">내 수업 목록</h2>
		</div>
		<!-- //wrapper_tit -->
		
		<div class="wrapper_class">
			<div class="class_side">
				<ul class="class_side_list">
					<li class="proceeding_class">
						<a href="/myLesson.djdn?status=O">진행중인 수업</a>
					</li>
					<li class="close_class">
						<a href="/myLesson.djdn?status=C">비공개한 수업</a>
					</li>
					<li class="end_class">
						<a href="/myLesson.djdn?status=F">종료된 수업</a>
					</li>
					<li class="expiration_class">
						<a href="/myLesson.djdn?status=E">만료된 수업</a>
					</li>
				</ul>
			</div>
			<!-- //class_side -->
			
			<!-- 수업 -->
			<div class="class_list box_proceeding_class">
				<div class="box_list_top">
					<c:choose>
						<c:when test="${param.status == 'C' }">
							<h3 class="class_list_tit">비공개한 수업</h3>
						</c:when>
						<c:when test="${param.status == 'F' }">
							<h3 class="class_list_tit">종료된 수업</h3>
						</c:when>
						<c:when test="${param.status == 'E' }">
							<h3 class="class_list_tit">만료된 수업</h3>
						</c:when>
						<c:otherwise>
							<h3 class="class_list_tit">진행중인 수업</h3>
							<a href="/myLessonCal.djdn" class="btn calendar_btn">달력으로보기</a>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- //box_list_top -->
				
				<ul class="card_proceeding_class">
					<c:choose>
						<c:when test="${lessons.isEmpty()}">
							<div>수업 목록이 없습니다.</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${lessons }" var="lesson">
								<li>
									<div class="card_box_img">
										<img src="/upload/${lesson.thumnail }" alt="수업이미지"/>
									</div>
									<div class="card_content">
										<h3 class="card_tit">
											${lesson.title } <span class="card_open_close">${lesson.getFormatStatus() }</span>
										</h3>
										<div class="card_review">
											<div class="box_grade">
												<div class="wrap_small_star class_grade">
													<div class="box_small_star">
														<div class="small_star_bg"></div>
														<div class="small_star" style="width: ${lesson.scoreAvg }%"></div>
													</div>
													<!-- //box_small_star -->
												</div>
												<!-- //wrap_small_star -->
												<span class="class_grade_count">(${lesson.count })</span>
											</div>
											<!-- //box_grade -->
										</div>
										<!-- //card_review -->
										<div class="card_box_info">
											<div class="card_info">
												<span class="card_location">${lesson.sido }, ${lesson.gungu } | </span> 
												<span class="card_type">${lesson.getFormatPersonnel() }</span>
											</div>
											<div class="card_price">
												${lesson.getFormatPrice() } <span class="card_time">/시간</span>
											</div>
											<!-- //card_price -->
										</div>
										<!-- //card_info -->
									</div>
									<!-- //card_content -->
									
									<div class="card_tag">
										<c:choose>
										<c:when test="${empty lesson.lessonTags }">
											<span class="tag1">태그가 없습니다.</span>
										</c:when>
										<c:otherwise>
											<c:forEach items="${lesson.lessonTags}" var="lessonTag">
												#${lessonTag.tag}
											</c:forEach>
										</c:otherwise>		
										</c:choose>
									</div>
									<!-- //card_tag --> 
									<a href="/lessonDetail.djdn?lessonNo=${lesson.lessonNo }" class="card_cover"></a>
									<div class="btn_cover">
										<c:choose>
											<c:when test="${param.status == 'C' }">
												<a href="/lessonDetail.djdn?lessonNo=${lesson.lessonNo }" class="btn">공개하러가기</a> 
												<a href="/menteeList.djdn?lessonNo=${lesson.lessonNo }" class="btn">멘티보기</a>
											</c:when>
											<c:when test="${param.status == 'F' }">
												<a href="/lessonUpdate.djdn?lessonNo=${lesson.lessonNo }" class="btn">재등록하기</a> 
												<a href="/menteeList.djdn?lessonNo=${lesson.lessonNo }" class="btn">멘티보기</a>
											</c:when>
											<c:when test="${param.status == 'E' }">
												<a href="/lessonUpdate.djdn?lessonNo=${lesson.lessonNo }" class="btn">연장하기</a> 
												<a href="/menteeList.djdn?lessonNo=${lesson.lessonNo }" class="btn">멘티보기</a>
											</c:when>
											<c:otherwise>
												<a href="/lessonDetail.djdn?lessonNo=${lesson.lessonNo }" class="btn">수업상세</a> 
												<a href="/menteeList.djdn?lessonNo=${lesson.lessonNo }" class="btn">멘티보기</a>
											</c:otherwise>
										</c:choose>
									</div>
								</li>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</ul>
				${paginate}
				<!-- //card_proceeding_class -->
			</div>
			<!-- //box_proceeding_class -->
			
			<div class="clear"></div>
		</div>
		<!-- //wrapper_class -->
	</div>
	<!-- //wrapper -->
	
	<c:import url="/WEB-INF/template/footer.jsp"></c:import>
	
	<script>
		const $proceedingClass = $(".proceeding_class");
		const $closeClass = $(".close_class");
		const $endClass = $(".end_class");
		const $expirationClass = $(".expiration_class");
		const $classList = $(".class_list");
		const $boxProceedingClass = $(".box_proceeding_class");
		const $boxCloseClass = $(".box_close_class");
		const $boxEndClass = $(".box_end_class");
		const $boxExpirationClass = $(".box_expiration_class");
		const $cardProceedingClass = $(".card_proceeding_class li");

		$(".class_side_list a").click(function() {
			//e.preventDefault();
			//clickClass();
		});
		
		// $(".btn").click(function (e) {
		//     e.stopPropagation();
		// });
		
		function clickClass() {
			$classList.hide();
			if ($(this).hasClass("proceeding_class")) {
				$boxProceedingClass.show();
			}//if() end
			if ($(this).hasClass("close_class")) {
				$boxCloseClass.show();
			}//if() end
			if ($(this).hasClass("end_class")) {
				$boxEndClass.show();
			}//if() end
			if ($(this).hasClass("expiration_class")) {
				$boxExpirationClass.show();
			}//if() end
		}//clickClass() end
		
		$cardProceedingClass.mouseenter(function() {
			$(this).children(".card_cover").css("display", "inline-block");
			$(this).children(".btn_cover").show();
			$(this).children(".btn_cover").children(".btn").css("display", "inline-block");
		});//$cardProceedingClass mouseenter() end
		
		$cardProceedingClass.mouseleave(function() {
			$(this).children(".card_cover").hide();
			$(this).children(".btn_cover").hide();
			$(this).children(".btn_cover").children(".btn").hide();
		});//$cardProceedingClass mouseleave() end
	</script>
</body>
</html>