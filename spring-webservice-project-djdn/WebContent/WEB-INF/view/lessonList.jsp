<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>다재다능 - 오프라인 전문 코칭 중개</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<style>
	body {
		margin: 0;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	a {
		text-decoration: none;
		color: #000;
	}
	
	#wrapper {
		height: 100%;
		width: 1080px;
		margin: auto;
		padding-top: 100px;
		padding-bottom: 250px;
	}
	
	.categories {
		width: 100%;
		height: 50px;
		display: flex;
		align-items: center;
		justify-content: space-around;
		margin: auto;
		border-bottom: 1px solid black;
		padding: 0 15px;
		box-sizing: border-box;
	}
	
	.filter {
		width: 100%;
		height: 100%;
		background-color: #eeeeee;
		position: relative;
		padding: 15px;
		box-sizing: border-box;
	}
	
	.filter_wrapper {
		border-bottom: 1px solid black;
	}
	
	.filter_tit {
		width: 100px;
		float: left;
	}
	
	.filter_choice {
		width: 950px;
		display: flex;
		justify-content: flex-start;
		flex-wrap: wrap;
		align-items: center;
		margin: 0;
	}
	
	.filter_choice_li, .filter_choice_li_all {
		border: 1px solid #616161;
		margin-right: 10px;
		margin-bottom: 10px;
		background-color: #fff;
		border-radius: 3px;
		box-sizing: border-box;
		padding: 5px 10px;
		cursor: pointer;
		color: #616161;
	}
	
	.filter_choice_li.on, .filter_choice_li_all.on {
		border: 1px solid #008e97;
		margin-right: 10px;
		margin-bottom: 10px;
		background-color: #008e97;
		border-radius: 5px;
		box-sizing: border-box;
		padding: 5px 10px;
		cursor: pointer;
		color: #fff;
	}
	
	.filter_location_wrapper {
		margin-bottom: 10px;
	}
	
	.filter_location, .filter_location2 {
		width: 70px;
		height: 27px;
		border: 1px solid #616161;
		color: #616161;
		border-radius: 5px;
		outline: none;
		padding-left: 5px;
		cursor: pointer;
		vertical-align: middle;
	}
	
	.selected_filter {
		padding-top: 15px;
		width: 200px;
	}
	
	.selected_filter_tit {
		display: inline-block;
	}
	
	.selected_filter_icon {
		margin-left: 15px;
		font-size: 14px;
		color: #616161;
		cursor: pointer;
		display: inline-block;
	}
	
	.selected_filter_list {
		display: flex;
		width: 1080px;
		justify-content: flex-start;
		flex-wrap: wrap;
		margin-top: 10px;
	}
	
	.selected_filter_list li {
		border: 1px solid #616161;
		margin-right: 10px;
		margin-bottom: 10px;
		background-color: #fff;
		border-radius: 5px;
		box-sizing: border-box;
		padding: 5px 10px;
		cursor: pointer;
		color: #616161;
	}
	
	.selected_filter_list li:after {
		content: "X";
		font-weight: 600;
		margin-left: 10px;
	}
	
	.class_list_top {
		margin-top: 20px;
		margin-bottom: 40px;
		display: flex;
		justify-content: space-between;
		width: 100%;
		font-size: 14px;
	}
	
	.class_list_top span {
		cursor: pointer;
	}
	
	.ranking_theme {
		position: relative;
	}
	
	.slides {
		width: 1080px;
		overflow: hidden;
		position: relative;
		margin: auto;
	}
	
	.card {
		position: relative;
		transition: left 0.3s ease-out;
		display: flex;
		flex-wrap: wrap;
		justify-content: flex-start;
	}
	
	.card li {
		width: 300px;
		height: 320px;
		border: 1px solid lightgray;
		box-sizing: border-box;
		position: relative;
		margin: 0 30px 30px 30px;
	}
	
	.card_wish {
		right: 5px;
		top: 5px;
		color: white;
		font-size: 20px;
		position: absolute;
		background-color: black;
		border-radius: 50%;
		background-color: #424242;
		width: 40px;
		height: 40px;
		text-align: center;
		line-height: 36px;
	}
	
	.card_wish.on {
		color: yellow;
	}
	
	.card_wish:hover {
		color: yellow;
	}
	
	.card li:last-child {
		margin-right: 0;
	}
	
	.card li a {
		padding: 0;
	}
	
	.card li img {
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
	
	.content_title {
		font-size: 18px;
		font-weight: 600;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	
	.content_review_img {
		display: inline-block;
		width: 106px;
		height: 15px;
		background: url("img/ico_newsview_200522.png") no-repeat 0 0;
	}
	
	.content_review_img_inner {
		overflow: hidden;
		font-size: 0;
		line-height: 0;
		background: url("img/ico_newsview_200522.png") no-repeat 0 -20px;
		text-indent: -9999px;
		width: 40%;
		height: 15px;
		z-index: 1;
		display: inline-block;
	}
	
	.bold_font {
		font-weight: blod;
	}
	
	.content_review_count {
		color: black;
	}
	
	.content_type {
		color: orange;
	}
	
	.content_info2 {
		float: left;
		font-size: 14px;
	}
	
	.content_price {
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
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	
	#loader {
		position: fixed;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
		background-image: url("img/Cube-1s-100px.svg");
		width: 100px;
		height: 100px;
		background-repeat: no-repeat;
		display: none;
	}
	.card_wish .fas {
		color : #fff;
	}
	.card_wish.like .fas {
		color : yellow;
	}
	
	.clicked{
		border: 1px solid rgb(0, 142, 151);
	    margin-right: 10px;
	    margin-bottom: 10px;
	    background-color: rgb(0, 142, 151);
	    border-radius: 5px;
	    box-sizing: border-box;
	    padding: 5px 10px;
	    cursor: pointer;
	    color: rgb(255, 255, 255);
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>
	<div id="wrapper">
		<div class="categories_wrapper">
			<ul class="categories">
				<li class="categories_li"><a href="" data-cateno="2">게임 </a></li>
				<li class="categories_li"><a href="" data-cateno="1"> IT/개발</a></li>
				<li class="categories_li"><a href="" data-cateno="9">영상 </a></li>
				<li class="categories_li"><a href="" data-cateno="3">공예 </a></li>
				<li class="categories_li"><a href="" data-cateno="4">디자인 </a></li>
				<li class="categories_li"><a href="" data-cateno="5">마케팅 </a></li>
				<li class="categories_li"><a href="" data-cateno="6">미술 </a></li>
				<li class="categories_li"><a href="" data-cateno="7">뷰티 </a></li>
				<li class="categories_li"><a href="" data-cateno="10">요리/베이킹 </a></li>
				<li class="categories_li"><a href="" data-cateno="11">외국어</a></li>
				<li class="categories_li"><a href="" data-cateno="12">운동/스포츠</a></li>
				<li class="categories_li"><a href="" data-cateno="8">실무역량 </a></li>
				<li class="categories_li"><a href="" data-cateno="13">음악 </a></li>
				<li class="categories_li"><a href="" data-cateno="14">재테크 </a></li>
				<li class="categories_li"><a href="" data-cateno="15">취업 </a></li>
			</ul>
		</div>
		<div class="filter">
			<div class="filter_wrapper">
				<div class="filter_tit">카테고리</div>
				<ul class="filter_choice filter_categories">
					<li class="filter_choice_li_all on" data-id="cAll">ALL</li>
					<!-- <li class="filter_choice_li filter_categories_li" data-id="c1">영어</li> -->
				</ul>
				<div class="filter_tit">지역</div>
				<div class="filter_location_wrapper">
					<select name="sido" id="" class="filter_location">
						<option value=999 selected>ALL</option>
						<c:forEach items="${sido }" var="sido">
							<option value="${sido.addressNo }">${sido.address }</option>
						</c:forEach>
					</select>
					<select name="gungu" id="" class="filter_location2">						
						<option value=999 selected>ALL</option>
					</select>
				</div>



				<!-- <div class="filter_tit">요일</div>
				<ul class="filter_choice filter_day">
					<li class="filter_choice_li_all on" data-id="dAll">ALL</li>
					<li class="filter_choice_li filter_day_li" data-id="d1">월</li>
					<li class="filter_choice_li filter_day_li" data-id="d2">화</li>
					<li class="filter_choice_li filter_day_li" data-id="d3">수</li>
					<li class="filter_choice_li filter_day_li" data-id="d4">목</li>
					<li class="filter_choice_li filter_day_li" data-id="d5">금</li>
					<li class="filter_choice_li filter_day_li" data-id="d6">토</li>
					<li class="filter_choice_li filter_day_li" data-id="d7">일</li>
				</ul> -->
				

				<!-- 2020-08-09 민겸 -->
				<!-- <div class="filter_tit">시간</div>
				<ul class="filter_choice filter_time">
					<li class="filter_choice_li_all on" data-id="tAll">ALL</li>
					<li class="filter_choice_li" data-id="t1">오전(6시~12시)</li>
					<li class="filter_choice_li" data-id="t2">오후(12시~18시)</li>
					<li class="filter_choice_li" data-id="t3">저녁(18시~24시)</li>

				</ul> -->

				<div class="filter_tit">가격</div>
				<ul class="filter_price filter_choice">
					<li class="filter_choice_li_all on" data-id="pAll">ALL</li>
					<li class="filter_choice_li filter_price li" data-id="p1" data-price="1">1만원
						이하</li>
					<li class="filter_choice_li filter_price li" data-id="p2" data-price="2">2만원
						이하</li>
					<li class="filter_choice_li filter_price li" data-id="p3" data-price="3">3만원
						이하</li>
					<li class="filter_choice_li filter_price li" data-id="p4" data-price="4">4만원
						이하</li>
					<li class="filter_choice_li filter_price li" data-id="p5" data-price="5">5만원
						이상</li>
				</ul>

				<div class="filter_tit">수업형태</div>
				<ul class="filter_choice filter_price filter_study_type">
					<li class="filter_choice_li_all on" data-id="tyAll">ALL</li>
					<li class="filter_choice_li filter_study_type" data-id="ty1" data-type="O">원데이</li>
					<li class="filter_choice_li filter_study_type" data-id="ty2" data-type="P">1대1</li>
					<li class="filter_choice_li filter_study_type" data-id="ty3" data-type="G">그룹</li>

				</ul>


			</div>
			<div class="selected_filter ">
				<div class="selected_filter_tit">선택한 속성</div>
				<div class="selected_filter_icon">

					<i class="fas fa-undo-alt"></i> 전체해제

				</div>
				<ul class="selected_filter_list">



				</ul>

			</div>
		</div>

		<section class="class_list_wrapper">
			<div class="class_list_top">
				<div class="class_list_top_total">
					총 <strong>0</strong>개의 수업
				</div>
				<div class="class_list_top_order">
					<span class="new card_order" data-order="1">최신순</span> | <span class="low card_order" data-order="2">낮은가격순</span> | <span
						class="high card_order" data-order="3">높은가격순</span> | <span class="many card_order" data-order="4">리뷰많은순</span> | <span
						class="much card_order" data-order="5">평점높은순</span>
						
				</div>
			</div>

			<div class="class_list">

				<div class="slides">
					<ul class="card">

					</ul>
				</div>
			</div>
		</section>
	</div>
	<div id="loader"></div>
	<c:import url="/WEB-INF/template/footer.jsp"></c:import>
	<a id="back-to-top" href="#">Top</a>
	<script src="/js/underscore-min.js"></script>

	<script type="text/template" id="locationTmpl">
				<option value=999 selected>ALL</option>
                <@ _.each(location,function(gungu){@>
               		<option value=<@=gungu.addressNo@>><@=gungu.address@></option>
                <@})@>
    </script>


	<script type="text/template" id="categoryListTmpl">
                <@ _.each(categories,function(category){@>
               		<li class="filter_choice_li filter_categories_li" data-subno="<@=category.categoryNo@>" data-id="c<@=category.categoryNo@>"><@=category.name@></li>
                <@})@>
    </script>


	<script type="text/template" id="classCardTmpl">
                <@ _.each(lessons,function(lesson){@>
                
                    <li><a href="/lessonDetail.djdn?lessonNo=<@=lesson.lessonNo@>"><img src="/upload/<@=lesson.thumnail@>" alt="">
                        <div class="card_wish <@ if(lesson.flag) { @>like<@ } @>  " data-like="<@=lesson.lessonNo@>" >
                            <i class="fas fa-star"></i>
                        </div>
                        <div class="card_content">
                            <h3 class="content_title"><@=lesson.title@></h3>
                            <div class="content_review">
                                <span class="content_review_img">
                                    <span class="content_review_img_inner" style="width:<@=lesson.avgScore@>"></span>
                                </span>
                                <span class="content_review_count">(<@=lesson.sumReview@>)</span></div>
                            <div class="content_info">
                                <div class="content_info2">
                                    <span class="content_location"><@=lesson.sido@>, <@=lesson.gungu@> | </span>
                                    <span class="content_type"><@if(lesson.type=="M"){@>
                                        1대1 <@} else if(lesson.type=="G"){@>
                                            그룹 <@}@></span>
                                </div>
                                <div class="content_price"><@=lesson.price@>원<span class="content_priece_time">/시간</span></div>
                            </div>
                        </div>
                        <div class="content_tag">
							<@if(lesson.tags.length==0){@>
							<span>태그가 없습니다.</span>
							<@} @>
							<@ _.each(lesson.tags, function(tag){@>
                            <span>#<@=tag.tag@></span>
						 	<@ }) @>
                    </a>
                    </li>
                <@})@>
            </script>
	<script src="/js/underscore-min.js"></script>
	<script>
		_.templateSettings = {
			interpolate : /\<\@\=(.+?)\@\>/gim,
			evaluate : /\<\@([\s\S]+?)\@\>/gim,
			escape : /\<\@\-(.+?)\@\>/gim
		};
	
		$(".card").on("click",".card_wish", function(e) {
			e.preventDefault();
			const likeStr = $(this).data("like");
			const like = parseInt(likeStr);
			console.log(like);
		    <c:choose>
		    	<c:when test="${loginMember==null}">
			    	alert("로그인이 필요합니다");
					location.href ="/login.djdn";
		    	</c:when>
		    	<c:otherwise>
			    	$.ajax({
						url : "/ajax/like.djdn",
						dataType : "json",
						type : "GET",
						data : {lessonNo : like},
						error : function () {
							alert("점검중");
						},
						success : function (json) { 
							console.log(json);
							if(json.flag){
								$("[data-like="+like+"]").addClass("like");
							}else {
								$("[data-like="+like+"]").removeClass("like");
							}//if~else end
						}
					});//$.ajax() end
		    	</c:otherwise>
	  	    </c:choose>
		});
		
		//현재페이지
		let curPage = 1;
		const classTmp = _.template($("#classCardTmpl").html());
		//2020-08-10 민겸
		const locationTmp = _.template($("#locationTmpl").html());
		//2020-08-08 민겸
		const categoryTmp = _.template($("#categoryListTmpl").html());
		const $movieList = $(".movieList");
		const $window = $(window);

		// 문서객체를 제이쿼리 객체로
		const $document = $(document);

		//2020-08-08 민겸
		//let categoryNo = '${param.cateno}';
		let categoryNo = "${cateno}";
		//2020-08-10 민겸
		let addressNo = null;

		//2020-08-10 민겸
		let categoryNos = "";
		let sidoNos = "";
		let gunguNos = "";
		let price = 0;
		let types ="";
		let order=1;

		
		
		//2020-08-11 민겸
		//정렬 순서 클릭했을 때
		$(".card_order").on("click",function(){
				order="";
				order=this.dataset.order;
				if(order==""){
					order=1;
				}
				console.log(order);
				
				getClassList();
		})//정렬 순서 클릭했을 때
					
		
		
		//2020-08-10 민겸		
		//카테고리를 클릭 했을 때
		$(".filter_location").on("change", function(e) {
			e.preventDefault();
			//넘어오는 파라미터 자바스크립트로 받기
			addressNo = $(this).val();
			getGungu(addressNo);			
		});//$(".filter_location")end

		//2020-08-10 민겸
		//구군 json 불러오기
		function getGungu(addressNo) {
			$.ajax({
				url : "/ajax/gunguList.djdn",
				data : {
					addressNo : addressNo
				},
				error : function() {
					alert("에러!");
				},
				success : function(location) {
					const markup = locationTmp({
						location : location
					});
					
					$(".filter_location2 option").remove();
					$(".filter_location2").append(markup);
					
					
				}

			});
		}//getGungu()

		//2020-08-07 민겸		
		//카테고리를 클릭 했을 때
		$(".categories_li a").on("click", function(e) {
			$('.categories_li a').removeClass('clicked');
			e.preventDefault();
			//넘어오는 파라미터 자바스크립트로 받기
			categoryNo = this.dataset.cateno;
			$(this).addClass('clicked');
			getCategoryList(categoryNo);

		});// $(".categories_li a") end
		
		//clicked 받기
		$('a[data-cateno=${cateno}]').addClass('clicked');

		//2020-08-08 민겸
		//카테고리 json 불러오기
		function getCategoryList(categoryNo) {
			$.ajax({
				url : "/ajax/categoryList.djdn",
				data : {
					categoryNo : categoryNo
				},
				error : function() {
					alert("에러!");
				},
				success : function(categories) {
					const markup = categoryTmp({
						categories : categories
					});
					$(".filter_categories_li").remove();
					$(".filter_categories").append(markup);

				}

			});
		}//getCategoryList
		getCategoryList(categoryNo);
		
		function getClassList() {
			$.ajax({
				url : "/ajax/classList.djdn",
				data : {
					categoryNos : categoryNos,
					sidoNos:sidoNos,
					gunguNos:gunguNos,
					price:price,
					types:types,
					order:order
				},
				error : function() {
					alert("/ajax/classList.djdn 에러!");
				},
				success : function(lessons) {
					$(".class_list_top_total strong").text(lessons.length);

					const markup = classTmp({
						lessons : lessons
					});

					$(".card").html(markup);

				}

			});
		}//getClass

		getClassList();

		const $loader = $("#loader");

		$window.on("scroll", function() {
			const sTop = $window.scrollTop();
			const dHeight = $document.height();
			const wHeight = $window.height();
			console.log(sTop + ":" + dHeight + ":" + wHeight);

			if (sTop + wHeight == dHeight) {
				$loader.show();
				curPage++;
				//스크롤 끝에서 호출
				getClassList();
				$loader.hide();
			}
		})//on()

		let filterBox = $(".filter_choice_li");
		let selectedList = $(".selected_filter_list");
		let locationBox = $(".filter_location");
		let seletedTxt = $(".selected_filter_list li");
		let icon = $(".selected_filter_icon");
		let empty = $(".selected_filter_icon");

		//시도 클릭시 선택한 속성에 추가되는 부분
		$(".filter_location").on("change", function() {
			let locationClass = $(this).attr("class") + "_li";
			let locationValue = $(this).val();
	
			console.log("locationClass : "+locationClass);	
			console.log("locationValue : "+locationValue);	
			
			
			
			let a = $(".filter_location option:selected").text();

			const $li = $("<li class="+locationClass+">").text(a).css({
				"background-color" : "white",
				"color" : "#008e97",
				"border" : "1px solid #008e97"
			}).attr("data-sido", locationValue);
			if (a != "ALL") {
				$(".selected_filter_list").append($li);
			}else {
				$("."+locationClass).remove();
			}//if ~ else end
			
			filterVal();

		})

		//구군 클릭시 선택한 속성에 추가되는 부분
		$(".filter_location2").on("change", function() {
			let locationClass = $(this).attr("class") + "_li";
			let locationValue = $(this).val();

			let a = $(".filter_location2 option:selected").text();

			const $li = $("<li class="+locationClass+">").text(a).css({
				"background-color" : "white",
				"color" : "#008e97",
				"border" : "1px solid #008e97"
			}).attr("data-gungu", locationValue);

			if (a != "ALL") {
				$(".selected_filter_list").append($li);
			}else {
				$("."+locationClass).remove();
			}//if ~ else end
			
			filterVal();
		})

		// ALL 선택시 이벤트
		$(".filter_choice_li_all").on("click", function() {
			
			console.log(this.dataset.id);
			
			$(this).toggleClass("on");
			$(this).siblings(filterBox).removeClass("on");

			$(this).siblings(filterBox).each(function() {
				const id = this.dataset.id;
				

				$(".selected_filter_list li").each(function() {
					const nowId = this.dataset.id;
					if (id == nowId) {
						
						$(this).remove();
					}
				})
			})
			filterVal();
		});

		//2020-08-09 민겸 인자3개 수정
		//Filter 안에 리스트 선택시 이벤트
		$(".filter").on("click", ".filter_choice_li", function() {
			
			$(this).toggleClass("on");

			if ($(this).hasClass("filter_price")) {

				$(this).siblings().removeClass("on");
			}

			if ($(this).hasClass("on")) {

				if ($(this).hasClass("filter_price")) {

					$(".selected_filter_list li").each(function() {

						if ($(this).hasClass("filter_price")) {

							$(this).remove();
						}
					})
				}

				$(this).clone().css({
					"background-color" : "white",
					"color" : "#008e97",
					"border" : "1px solid #008e97"
				}).appendTo(selectedList);
				$(this).siblings(".filter_choice_li_all").removeClass("on");

			} else {

				const id = this.dataset.id;

				$(".selected_filter_list li").each(function() {

					let nowId2 = this.dataset.id;

					if (id == nowId2) {

						$(this).remove();
					}
				});
			}
			
			
			//===============================================
			//2020-08-10 서브카테고리 클릭 시 넘기는 곳
			

			filterVal();
			
		});
		
		function filterVal() {
			
			categoryNos = "";
			sidoNos = "";
			gunguNos = "";
			price = 0;
			types = "";
			
			$(".selected_filter_list").children().each(function() {

				//카테고리라면
				if ($(this).hasClass("filter_categories_li")) {

					console.log("filter_categories_li");

					categoryNos += this.dataset.subno+",";
					

				}//if end
			
				
				//시도라면
				else if ($(this).hasClass("filter_location_li")) {

					console.log("filter_location_li");

					sidoNos += this.dataset.sido+",";
					

				}//if end
				
				//군구라면
				else if ($(this).hasClass("filter_location2_li")) {

					console.log("filter_location2_li");

					gunguNos += this.dataset.gungu + ",";
					

				}//if end
				
				//가격이라면
				else if ($(this).hasClass("filter_price")) {

					console.log("filter_price");

					price = this.dataset.price;

				}//if end
				
				//수업형태이라면
				else if ($(this).hasClass("filter_study_type")) {

					console.log("filter_study_type");
					
					types += "'"+this.dataset.type + "',";		

				}//if end
			
			});//선택된 리스트 선택시 이벤트
			
			categoryNos = categoryNos.substring(0, categoryNos.length - 1);
			sidoNos = sidoNos.substring(0, sidoNos.length - 1);
			gunguNos = gunguNos.substring(0, gunguNos.length - 1);
			types = types.substring(0, types.length - 1);
		
			
			console.log("시도 : " + sidoNos);
			console.log("구군 : " + gunguNos);
			console.log("카테고리 : " + categoryNos);
			console.log("가격 : "+ price)
			console.log("수업형태 : "+types);
			
			getClassList();
			
		}

			
			/* //===============================================			
			//2020-08-11 시도 클릭 시 넘기는 곳
			

				//시도라면
				if ($(this).hasClass("filter_location_li")) {

					console.log("filter_location_li");

					sidoNos += this.dataset.sido+",";

				}//if end


			sidoNos = sidoNos.substring(0, sidoNos.length - 1);
			
			
			//===============================================

			//2020-08-11 군구 클릭 시 넘기는 곳
			

				//군구라면
				if ($(this).hasClass("filter_location2_li")) {

					console.log("filter_location2_li");

					gunguNos += this.dataset.gungu + ",";

				}//if end

			});//each() end

			gunguNos = gunguNos.substring(0, gunguNos.length - 1);
			

			
			
				
			console.log(sidoNos);
			console.log(gunguNos);	 */	
			

		selectedList.on("click", "li", function() {
			const id = this.dataset.id;
			$(this).remove();

			filterBox.each(function() {

				const nowId = this.dataset.id;

				if (id == nowId) {
					$(this).removeClass("on");
				}
			});
			
			
			
			filterVal();

		});
		empty.on("click", function() {
			selectedList.empty();
			filterBox.removeClass("on");
			$(".filter_choice_li_all").addClass("on");
			$(".filter_location option").eq(0).prop("selected", true);
			$(".filter_location2 option").eq(0).prop("selected", true);
		});

		// 스크롤 내리면 업 버튼 생성
		//html 문서 자체를 가져옴
		let docEle = document.documentElement;

		//html 문서 자체의 높이값
		let docHeight = docEle.offsetHeight;
		let currentScroll;
		let header = document.querySelector("#header");
		//스크롤 내릴시 활성화 될 기준 높이
		let offset = docHeight / 5;

		let btt = document.querySelector("#back-to-top");

		window.addEventListener("scroll", function() {
			let currentScroll = docEle.scrollTop;

			// 버튼에 visible 클래스 명 넣기. 
			// className은 클래스를 추가하는게 아니라 없으면 넣고, 있으면 저걸로 교체하는거임
			btt.className = (currentScroll > offset) ? "visible" : "";
		})

		btt.addEventListener("click", function(e) {
			e.preventDefault();
			//문서의 스크롤 값을 0으로
			docEle.scrollTop = 0;
		})
		
		
		/* console.log($('.categories_li a').data('cateno'));
		if($('.categories_li a').data('cateno')==${cateno}){
			$(this).css('background-color','red');
		} */
		
		
	</script>
</body>
</html>