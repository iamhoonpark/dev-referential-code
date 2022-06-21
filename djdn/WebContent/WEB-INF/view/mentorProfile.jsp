<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>다재다능 | 멘토정보</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<link rel="stylesheet" href="/css/tui-date-picker.css">
<link rel="stylesheet" href="/css/index.css"> 
<link rel="stylesheet" href="/css/mentorProfile.css"> 
<style>
	.datepicker-container{
		margin-right: 30px;
		display: inline-block;
	}
	.plustab_career textarea{
		padding: 10px;
		width: 780px;
		height: 70px;
		resize: none;
		outline-color: #008e97;
		border-radius: 2px;
	}
	.career_remove_btn{
	    margin-left: 15px;		
	}
	.plustab_career{
		margin-bottom: 50px;
	}
	.plustab_certificate{
		margin-bottom: 20px;
	}
	.class_card_box{
		min-height : 200px;
	}
   		/* 별점 */
	.content_review_img {
		display: inline-block;
		width: 106px;
		height: 23px;
		background: url("img/ico_newsview_200522.png") no-repeat 0 7px;
	}
	.content_review_img_inner {
		overflow: hidden;
		font-size: 0;
		line-height: 0;
		background: url("img/ico_newsview_200522.png") no-repeat 0 -15px;
		text-indent: -9999px;
		height: 20px;
		z-index: 1;
		display: inline-block;
	}
	.slide_btn {
	    position: absolute;
	    right: 30px;
	    top: 0px;
	    z-index: 1000;
	}
	.slide_btn .prev {
	    
	   font-size: 25px;
	    border: none;
	    background-color: white;
	    outline: none;
	    cursor: pointer;
	}
	.slide_btn .next {
	   margin-left: 15px;
	    font-size: 25px;
	    border: none;
	    background-color: white;
	    outline: none;
	    cursor: pointer;
	}
	.class_card_list{
		transform: scaleX( 0.87 );
	}
	.tui-datepicker{
		z-index: 1000;
	}
	.certificate_plus_btn{
		float: right;
		margin-right: 30px; 
	}
	.career_plus_btn{
		float: right;
		margin-right: 30px; 
	}
	.tui-datetime-input{
		margin-top: -5px;
	}
	.plustab_career textarea{
		margin-top: 7px;
	    width: 714px;
	}
	.class_card_list{
	    left: -60px;
	}
	#header{
	    position: fixed;
	    width: 100%;
	    border-bottom: 1px solid #424242;
	    color: #000;
	    z-index: 1000;
	    font-size: 16px;
	    background-color: #fff;
	    height: 100px;
	    box-sizing: border-box;
	    transition: 0.3s all ease-in-out;
	}
	.header_wrapper{
	    background-color: #fff;
	    border-bottom: 1px solid #424242;
	}
	#header .header_wrapper a{
		color: #000;
	}
	#header .mentor_link{
		color: #000;
	}
	.sub_menu{
		background-color: #fff;
	}
	.sub_menu::after{
		display: none;
	}
	.cancel_btn, .okay_btn{
		display: inline-block;
		text-align: center;
		line-height: 40px;
	    font-size: 14px;
	}
	.introduce_myself_article {
		line-height : 30px;
	}
	.introduce_fill_in {
		white-space: pre;
	}
	.career_fill_in p {
		line-height : 20px;
	}
	.plustab_categories input:checked+label{
		color: #fff;
	    background-color: #008e97;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>

	<!-- #wrapper 시작 -->
	<div id="wrapper">
		<div class="mentor_tit">멘토 정보</div>
		<div class="mentor_introduce_card">
			<div class="profile_picture">
				<img class="profile_image" src="/profile/${mentor.profileImg }" alt="멘티프로필사진">
			</div>
			<div class="mentor_introduce">
				<div class="mentor_introduce_label">
					<ul>
						<li class="nickname">${mentor.nickname }</li>
						<li>학력</li>
						<li>공개수업수</li>
					</ul>
				</div>
				<div class="mentor_introduce_data">
					<ul>
						<li><a href="/mentorUpdate.jsp" class="introduce_change_btn">정보수정</a></li>
						<c:forEach items="${backgrounds}" var="background">
							<li>
								${background.school }
								
								<c:if test="${background.major!=null}">
									${background.major }
								</c:if>
								
								<c:choose>
									<c:when test="${background.graduation eq 'C'.charAt(0)}">수료</c:when>
									<c:when test="${background.graduation eq 'G'.charAt(0)}">졸업</c:when>
									<c:otherwise>재학</c:otherwise>
								</c:choose>
								
								<c:choose>
									<c:when test="${background.proof }!=null">(인증됨)</c:when>
								</c:choose>
							</li>
						</c:forEach>
							<li>${lessonCount }개</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- //멘토 정보 -->

		<!--하나의 수업 탭 추가 템플릿-->
		<div class="category_tab">
			<ul class="tab">
				<c:forEach items="${appeals}" var="appeal">
					<li data-name="${appeal.categoryName }" class="category_tab_lesson"><a href="">${appeal.categoryName }</a></li>
				</c:forEach>
				<c:if test="${fn:length(appeals) < 4}">
					<li data-id="contentPlus" class="category_tab_plus"><a href="">카테고리 추가</a></li>
				</c:if>
				
			</ul>
		</div>
		
		<!--카테고리 수업탭-->
		<div id="contentLanguage" class="article_plus_contents" style="margin-top: 100px;">
		
		</div>
		
		<!--카테고리 추가-->
		<form action="" method="post">
			<div id="contentPlus" class="article_plus_contents" style="margin-top: 100px;">
				<div id="plustabCategory">
					<div class="plustab_category_article">카테고리</div>
					<div class="plustab_categories">
						<!-- value값을 카테고리 번호에 맞게 넘겨주세요. -->
						<input type="radio" name="category" id="IT" value="IT/개발">
						<label class="label label1" for="IT">IT/개발</label> 
						<input type="radio" name="category" id="game" value="게임">
						<label class="label label2" for="game">게임</label> 
						<input type="radio" name="category" id="craft" value="공예">
						<label class="label label3" for="craft">공예</label> 
						<input type="radio" name="category" id="design" value="디자인"> 
						<label class="label label4" for="design">디자인</label> 
						<input type="radio" name="category" id="marketing" value="마케팅"> 
						<label class="label label5" for="marketing">마케팅</label> 
						<input type="radio" name="category" id="art" value="미술"> 
						<label class="label label6" for="art">미술</label> 
						<input type="radio" name="category" id="beauty" value="뷰티"> 
						<label class="label label7" for="beauty">뷰티</label> 
						<input type="radio" name="category" id="capacity" value="실무역량"> 
						<label class="label label8" for="capacity">실무역량</label> 
						<input type="radio" name="category" id="foreignLanguage" value="외국어">
						<label class="label label9" for="foreignLanguage">외국어</label>
						<input type="radio" name="category" id="video" value="영상">
						<label class="label label10" for="video">영상</label> 
						<input type="radio" name="category" id="cooking" value="요리/베이킹"> 
						<label class="label label11" for="cooking">요리/베이킹</label> 
						<input type="radio" name="category" id="sports" value="운동/스포츠"> 
						<label class="label label12" for="sports">운동/스포츠</label> 
						<input type="radio" name="category" id="music" value="음악"> 
						<label class="label label13" for="music">음악</label> 
						<input type="radio" name="category" id="investment" value="재태크"> 
						<label class="label label14" for="investment">재태크</label> 
						<input type="radio" name="category" id="getJob" value="취업"> 
						<label class="label label15" for="getJob">취업</label>
					</div>
					<!--카테고리 항목-->
					
				</div>
				<!-- 카테고리 기입 -->
				
				<div id="plustabCertificate">
					<div class="plustab_certificate_article">자격증</div>
					<div class="plustab_certificate_fill_in">
						<div class="plustab_certificate">
							<label>자격증명</label> 
							<input name="certificate" placeholder="자격증을 입력해주세요" autocomplete="off"> 
							<label>자격번호</label> 
							<input name="proof" placeholder="자격번호를 입력해주세요"  autocomplete="off">
							<button class="certificate_remove_btn">삭제</button>
						</div>
					</div>
					<button class="certificate_plus_btn">추가</button>
				</div>
				<!-- //자격증 기입란 -->
				
				<div id="plustabCareer">
					<div class="plustab_career_article">경력</div>
					<div class="plustab_career_fill_in">
						<div class="plustab_career">
							<label>회사명</label> 
							<input name="company" placeholder="회사명을 입력해주세요">
							<label>재직기간</label>
							<div class="datepicker-container">
								<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
									<input name="hireDate" class="startpicker-input1" type="text" aria-label="Date"  autocomplete="off">
									<span class="tui-ico-date"></span>
									<div class="startpicker-container1" style="margin-left: -1px;"></div>
								</div>
								<span>to</span>
								<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
									<input name="leaveDate" class="endpicker-input1" type="text" aria-label="Date"  autocomplete="off">
									<span class="tui-ico-date"></span>
									<div class="endpicker-container1" style="margin-left: -1px;"></div>
								</div>
							</div>
							<textarea name="task" placeholder="업무내용을 적어주세요."></textarea>
							<button class="career_remove_btn">삭제</button>
						</div>
					</div>
					<button class="career_plus_btn">추가</button>
				</div>
				<!--//경력 기입란-->
					
				<div id="plustabIntroduce">
					<div class="plustab_introduce_myself_article">내 소개</div>
					<div class="plustab_introduce_fill_in">
						<div>
							<textarea class="introduce_txt" name="introduce" placeholder="수업에 관한 자기소개를 해주세요"></textarea>
						</div>
					</div>
				</div>
				<!-- //내소개 기입란-->
				
				<div class="register">
					<button disabled class="register_btn">등록하기</button>
				</div>
			</div>
			<!-- //탭 이후 전체 -->
		</form>
		<!--//카테고리 추가탭 -->
	</div>
	<!-- //#wrapper -->
	<c:import url="/WEB-INF/template/footer.jsp"></c:import>
    <script src="/js/underscore-min.js"></script>
    <script type="text/template" id="cardTmpl">
		<div class="slide_btn">
	                    <button class="ranking_theme_prev prev" disabled><i class="fas fa-chevron-left"></i></button>
	                    <button class="ranking_theme_next next"><i class="fas fa-chevron-right"></i></button>
	            </div>
	            <div class="ranking_theme_card_slides slides">
	                <ul class="ranking_theme_card card">
					<@ _.each(cards,function(card){ @>
	                    <li><a href="/lessonDetail.djdn?lessonNo=<@=card.lessonNo@>">
	                    <img src="/upload/<@=card.thumnail@>" alt="">	                    
	                        <div class="ranking_theme_card_content card_content">
	                            <h3 class="ranking_theme_card_content_title content_title"><@=card.title@></h3>
	                            <div class="ranking_theme_card_content_review content_review">
	                                <span class="content_review_img"> 
	                                    <span class="content_review_img_inner" style="width : <@=card.scoreAvg@>%"></span>
	                                </span>
	                                <span class="ranking_theme_card_content_review_count content_review_count">(<@=card.count@>)</span></div>
	                            <div class="ranking_theme_card_content_info content_info">
	                                <div class="ranking_theme_card_content_info2 content_info2">
	                                    <span class="ranking_theme_card_content_location content_location"><@=card.sido@>, <@=card.address@> | </span>
	                                    <span class="ranking_theme_card_content_type content_type">
		                                    <@if(card.personnel=="P"){ @>
		                                    	1대1
		                                    <@}else{@>
												그룹
											<@}@>
										</span>
	                                </div>
	                                <div class="ranking_theme_card_content_price content_price"><@= card.formatPrice@><span class="ranking_theme_card_content_priece_time content_priece_time">/시간</span></div>
	                            </div>
	                        </div>
	                        <div class="ranking_theme_card_content_tag content_tag">
		                        <@ if(card.lessonTags.length>0){ @>
	                        		<@ _.each(card.lessonTags,function(tag){ @>
	                        			<span class="tag1"># <@=tag.tag@></span>
	                        		<@}) @>
		                        <@} else { @>
	                        		<span class="tag1">태그가 없습니다</span>
	                        	<@}@>
	                        </div>
	                    </a>
	                    </li>
	                <@}) @>
	                </ul>
	            </div>
	</script>
    <script type="text/template" id="contentTmpl">
			<div id="career">
				<div class="career_article">자격증	</div>
				<div class="career_fill_in">
					<@ _.each(contents,function(content){ @>
						<p><@=content.certificateNameStr @> </p>
					<@})@>
				</div>
			</div>
			
			<div id="career">
				<div class="career_article">경력</div>
				<div class="career_fill_in">
					<@ _.each(contents,function(content){ @>
						<p style="margin-bottom: 20px;"><@=moment(content.hireDateStr).format("YYYY-MM-DD") @> ~ <@=moment(content.leaveDateStr).format("YYYY-MM-DD") @> : <@=content.companyStr @> <br> 업무 : <@=content.taskStr @></p>
					<@})@>
				</div>
			</div>

			<div id="introduceMyself">
				<div class="introduce_myself_article">내 소개</div>
				<div class="introduce_fill_in"><@=contents[0].introduce @></div>
			</div>
			
			<div id="classList">
				<div class="class_list_article">수업목록</div>
				<div class="class_card_box">
					<div class="class_card_list">
						
					</div>
				</div>
			</div>
			<@ if( contents[0].memberNo==${mentor.memberNo }){ @>
				<div class="button">
					<a href="/mentorCateRemove.djdn?categoryName=<@=contents[0].categoryName@>" class="cancel_btn">삭제</a>
					<a href="" class="okay_btn">수정</a>
				</div>
			<@ } @>

	</script>
    <script type="text/template" id="careerTmpl">
	    <div class="plustab_career">
			<label>회사명</label> 
			<input name="career" placeholder="회사명을 입력해주세요">
			<label>재직기간</label>
			<div class="datepicker-container">
				<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
					<input class="startpicker-input<@=++datepickerCnt@>" type="text" aria-label="Date">
					<span class="tui-ico-date"></span>
					<div class="startpicker-container<@=datepickerCnt@>" style="margin-left: -1px;"></div>
				</div>
				<span>to</span>
				<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
					<input class="endpicker-input<@=datepickerCnt@>" type="text" aria-label="Date">
					<span class="tui-ico-date"></span>
					<div class="endpicker-container<@=datepickerCnt@>" style="margin-left: -1px;"></div>
				</div>
			</div>
			<textarea></textarea>
			<button class="career_remove_btn">삭제</button>
		</div>
    </script>
	<script type="text/template" id="certificateTmpl">
			<div class="plustab_certificate">
				<label>자격증명</label> 
				<input name="certificate" placeholder="자격증을 입력해주세요"> 
				<label>자격번호</label> 
				<input name="proof" placeholder="자격번호를 입력해주세요">
				<button class="certificate_remove_btn">삭제</button>
			</div>
	</script>
	
	<script src="/js/tui-date-picker.js"></script>
	<script src="/js/moment-with-locales.js"></script>
	<script>
		_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
		$contentTmp = _.template($("#contentTmpl").html());
		$certificateTmp = _.template($("#certificateTmpl").html());
		$careerTmp = _.template($("#careerTmpl").html());
		$cardTmpl = _.template($("#cardTmpl").html());
		
		
		
		//2020-08-12 구동범
		let datepickerCnt = 1;
		
		//카테고리 추가 클릭시 내용보이기
		$(".category_tab_plus").click(function(e) {
			//btn 새로고침 방지
			e.preventDefault();
			e.stopPropagation();
			
			//카테고리추가Form 노출
			$('#contentPlus').show();
			$('#contentLanguage').hide();
			$('.tab li').removeClass('on');
			$(this).addClass('on');
		});
		
		//2020-08-10 동범 mentorProfile 카테고리별 content찾기
		$(".category_tab_lesson").click(function(e) {
			e.preventDefault();
			e.stopPropagation();
			
			$('.tab li').removeClass('on');
			$(this).addClass('on');
			$('#contentPlus').hide();
			
			//카테고리추가Form 노출
			const cateName = $(this).data("name");
			console.log(cateName);
			
			contentAjax(cateName);
			setTimeout(function() {
				lessonAjax();
			}, 100);
			
		});
		
		//카테고리별 Content띄우기 Ajax
		function contentAjax(cateName) {
			$.ajax({
				url : "/ajax/categoryContent.djdn",
				dataType : "json",
				type : "GET",
				data : {
					categoryName : cateName
				},
				error : function () {
					alert("점검중");
				},
				success : function (json) {
					console.log(json);
					$('#contentLanguage').show();
					$('#contentLanguage').html($contentTmp({contents:json}));
				}
			})//ajax end
		}
		
		//카테고리별 lesson띄우기 Ajax
		function lessonAjax() {
			$.ajax({
				url : "/ajax/lessonCard.djdn",
				dataType : "json",
				type : "GET",
				error : function () {
					alert("점검중");
				},
				success : function (json) {
					console.log(json);
					const markup = $cardTmpl({cards:json});
					$('.class_card_list').html(markup);
				}
			})//ajax end
		}
		
		
		//카테고리 클릭시 content보이기
		$(".category_tab").on('click', '.category_tab_lesson', function() {
			
		});
		
		//카테고리 선택시
		for (var i = 0; i < $(".plustab_categories input").length; i++) {
			$(".plustab_categories .label" + i).click(function() {
				
				//모든 radio checked 해제
				$('input[type="radio"]').attr('checked', false);
				
				//클릭한 radio checked 부여(parameter로 category넘기면 됨)
				console.log($(this).text());
				$('input[type="radio"][value="'+$(this).text()+'"]').attr('checked', true);
				
				//카테고리추가 > 카테고리 클릭시 버튼 활성화
				$(".register_btn").prop("disabled", false).css({
					"background-color" : "#008e97",
					"color" : "#fff",
					"border" : "1px solid rgb(22, 160, 133)",
					"cursor" : "pointer",
					"border-radius" : "3px"
				});
			});
		}
		
		//자격증 추가 클릭시
		$('.certificate_plus_btn').click(function(e) {
			e.preventDefault();
			e.stopPropagation();
			$('.plustab_certificate_fill_in').append($certificateTmp);
		})
		
		//자격증 삭제 클릭시
		$('#plustabCertificate').on('click', '.certificate_remove_btn', function(e) {
			e.preventDefault();
			e.stopPropagation();
			
			console.log($(this).parent());
			$(this).parent().remove();
		})
		
	
		
		//date-picker 설정
		const end = new Date();
		const start = new Date(end.getFullYear() - 5,end.getMonth(),end.getDate());
		
		function rangepicker() {
			var datepicker = tui.DatePicker.createRangePicker({
				startpicker : {
					date : start,
					input : '.startpicker-input'+datepickerCnt,
					container : '.startpicker-container'+datepickerCnt
				},
				endpicker : {
					date : end,
					input : '.endpicker-input'+datepickerCnt,
					container : '.endpicker-container'+datepickerCnt
				},
				selectableRanges : [ [
					start,
					end
				] ],
				language : 'ko'
			});//date-picker end
			datepicker.addRange(start, end);
		}
		
		rangepicker();
		
		
		/* $("body").on("click",".startpicker-input",function(){
		dataepicker(today);
	}) */
	
	
	//경력 추가 클릭시
	$('.career_plus_btn').click(function(e) {
		e.preventDefault();
		e.stopPropagation();

		$('.plustab_career_fill_in').append($careerTmp);
		
		
		setTimeout(function() {
			rangepicker();
		}, 10);
		
		
		console.log($('.plustab_career_fill_in').last());
		//마지막요소 datepicker에 import
	})
	
	//경력 삭제 클릭시
	$('#plustabCareer').on('click', '.career_remove_btn', function(e) {
		e.preventDefault();
		e.stopPropagation();			
		
		$(this).parent().remove();
	})
	
	</script>
	<script>
		// 카드 슬라이드
	    let marginRight = 60;
	    let imgWidth = 300;
	    let rankingSlideCount = $(".ranking_theme_card li").length;
	    console.log(rankingMoveToSlide);
	    let rankingCurrenIdx = 0;
	
		$(".ranking_theme_card").css("width",(imgWidth+marginRight) * rankingSlideCount - marginRight + 'px');
	      
	
	
	    $(".ranking_theme_next").on("click",function(){
	    	console.log(rankingCurrenIdx);
	        console.log(rankingSlideCount);
	        
	        
	    	if(rankingCurrenIdx < rankingSlideCount-3) {
	        rankingMoveToSlide(rankingCurrenIdx+1);
	          $(".ranking_theme_prev").prop("disabled",false)
	        }
	
	        else {
	            $(".ranking_theme_next").prop('disabled',true)
	        }
	    })
	
	    $(".ranking_theme_prev").on("click",function(){
	        
	        
	    	if(rankingCurrenIdx > 0) {
	            rankingMoveToSlide(rankingCurrenIdx-1);
	        	$(".ranking_theme_next").prop('disabled',false)
	          
	        }
	
	        else {
	            $(".ranking_theme_prev").prop("disabled",true)
	        }
	    })
	      
	    function rankingMoveToSlide(num) {
	    	$(".ranking_theme_card").css("left",-num * (imgWidth+marginRight) + "px"); 
	        rankingCurrenIdx = num;
	    }
	
	    rankingMoveToSlide(rankingCurrenIdx);
	</script>
</body>
</html>