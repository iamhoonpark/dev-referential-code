<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>다재다능 - 오프라인 전문 코칭 중개</title>
    <c:import url="/WEB-INF/template/link.jsp"></c:import>
    <link href="/css/index.css" rel="stylesheet">
    <style type="text/css">
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
		.categoriesHeader{
			position: absolute;
			top: 100px;
			transition: 0.3s all ease-in-out;
		}
		.categories ul{
			width: 1080px;
			margin: 0 auto;
		}
    </style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>
    <div class="background">
            <div class="background_text">
                <h2>누구나 할 수 있는</h2>
                <h2>취미/자기계발 분야</h2>
                <h2>오프라인 레슨 코칭</h2>
            </div>
            <form action="/lessonList.djdn" method="get" class="background_search">
                <fieldset>
                    <input class="search" type="text" placeholder="원하시는 수업명을 입력해주세요" 
                           maxlength="15" name="keyword" autocomplete="off">
                    <button class="submit_btn"><i class="fas fa-search"></i></button>
                    <ul class="background_search_box">

                    </ul>
                </fieldset>
            </form>
            <div class="categories">
                <ul>
                    <li><a href="/lessonList.djdn?cateno=2"><i class="fas fa-gamepad"></i><span>게임</span></a></li>
                    <li><a href="/lessonList.djdn?cateno=1"><i class="fas fa-desktop"></i><span>IT/개발</span></a></li>
                    <li><a href="/lessonList.djdn?cateno=9"><i class="fab fa-youtube"></i><span>영상</span></a></li>
                    <li><a href="/lessonList.djdn?cateno=3"><i class="fas fa-american-sign-language-interpreting"></i><span>공예</span></a></li>
                    <li><a href="/lessonList.djdn?cateno=4"><i class="fas fa-pencil-alt"></i><span>디자인</span></a></li>
                    <li><a href="/lessonList.djdn?cateno=5"><i class="fab fa-adversal"></i><span>마케팅</span></a></li>
                    <li><a href="/lessonList.djdn?cateno=6"><i class="fas fa-palette"></i><span>미술</span></a></li>
                    <li><a href="/lessonList.djdn?cateno=7"><i class="fas fa-laugh-beam"></i><span>뷰티</span></a></li>
                    <li><a href="/lessonList.djdn?cateno=10"><i class="fas fa-cookie"></i><span>요리/베이킹</span></a></li>
                    <li><a href="/lessonList.djdn?cateno=11"><i class="fas fa-language"></i><span>외국어</span></a></li>
                    <li><a href="/lessonList.djdn?cateno=12"><i class="fas fa-bicycle"></i><span>운동/스포츠</span></a></li>
                    <li><a href="/lessonList.djdn?cateno=8"><i class="fas fa-user-tie"></i><span>실무역량</span></a></li>
                    <li><a href="/lessonList.djdn?cateno=13"><i class="fas fa-music"></i><span>음악</span></a></li>
                    <li><a href="/lessonList.djdn?cateno=14"><i class="fas fa-won-sign"></i><span>재테크</span></a></li>
                    <li><a href="/lessonList.djdn?cateno=15"><i class="fas fa-user-md"></i><span>취업</span></a></li>
                </ul>
            </div>
    </div>
    <div id="wrapper">
    <section class="total_theme theme">
        <section class="ranking_theme">
	            <div class="slide_btn">
	                    <button class="ranking_theme_prev prev" disabled><i class="fas fa-chevron-left"></i></button>
	                    <button class="ranking_theme_next next"><i class="fas fa-chevron-right"></i></button>
	            </div>
	            <h2 class="ranking_theme_tit tit">인기수업</h2>
	            <div class="ranking_theme_card_slides slides">
	                <ul class="ranking_theme_card card">
	                <c:forEach items="${themeOrderLikes }" var="lessonthemeLike">
	                    <li><a href="/lessonDetail.djdn?lessonNo=${lessonthemeLike.lessonNo}">
	                    <img src="/upload/${lessonthemeLike.thumnail}" alt="">	                    
	                        <div class="card_wish <c:if test="${lessonthemeLike.flag}">like</c:if>" data-like="${lessonthemeLike.lessonNo }" >
	                            <i class="fas fa-star"></i>
	                        </div>
	                        
	                        <div class="ranking_theme_card_content card_content">
	                            <h3 class="ranking_theme_card_content_title content_title">${lessonthemeLike.title}</h3>
	                            <div class="ranking_theme_card_content_review content_review">
	                                <span class="content_review_img"> 
	                                    <span class="content_review_img_inner" style="width : ${lessonthemeLike.review.scoreAvg }%"></span>
	                                </span>
	                                <span class="ranking_theme_card_content_review_count content_review_count">(${lessonthemeLike.review.count })</span></div>
	                            <div class="ranking_theme_card_content_info content_info">
	                                <div class="ranking_theme_card_content_info2 content_info2">
	                                    <span class="ranking_theme_card_content_location content_location">${lessonthemeLike.location.addressSido }, ${lessonthemeLike.location.address } | </span>
	                                    <span class="ranking_theme_card_content_type content_type">
		                                    <c:choose>
		                                    	<c:when test="${lessonthemeLike.personnel eq 'P'.charAt(0) }">1대1</c:when>
		                                    	<c:otherwise>그룹</c:otherwise>
		                                    </c:choose>
										</span>
	                                </div>
	                                <div class="ranking_theme_card_content_price content_price">${lessonthemeLike.formatPrice}<span class="ranking_theme_card_content_priece_time content_priece_time">/시간</span></div>
	                                
	                            </div>
	                        </div>
	                        <div class="ranking_theme_card_content_tag content_tag">
		                        <c:choose>
	                        		<c:when test="${!lessonthemeLike.themeOrder.isEmpty()}">
		                        		<c:forEach items="${lessonthemeLike.themeOrder}" var="lessonthemetag">
		                        			<span class="tag1"># ${lessonthemetag.tag}</span>
		                        		</c:forEach>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<span class="tag1">태그가 없습니다</span>
		                        	</c:otherwise>
	                        	</c:choose>
	                        </div>
	                    </a>
	                    </li>
	                </c:forEach>
	                </ul>
	            </div>
	        </section>
        <section class="dating_theme theme">
	            <div class="slide_btn">
	                    <button class="dating_theme_prev prev" disabled><i class="fas fa-chevron-left"></i></button>
	                    <button class="dating_theme_next next"><i class="fas fa-chevron-right"></i></button>
	            </div>
	            <h2 class="dating_theme_tit tit">이색데이트</h2>
	            <div class="dating_theme_card_slides slides">
	                <ul class="dating_theme_card card">
	                <c:forEach items="${themeOrderTags }" var="lessonthemeTag">
	                    <li><a href="/lessonDetail.djdn?lessonNo=${lessonthemeTag.lessonNo }">
	                    	<img src="/upload/${lessonthemeTag.thumnail }" alt="수업이미지">
	                        <div class="card_wish <c:if test="${lessonthemeTag.flag }">like</c:if>" data-like="${lessonthemeTag.lessonNo }" >
	                            <i class="fas fa-star"></i>
	                        </div>
	                        <div class="ranking_theme_card_content card_content">
	                            <h3 class="ranking_theme_card_content_title content_title">${lessonthemeTag.title}</h3>
	                            <div class="ranking_theme_card_content_review content_review">
	                                <span class="content_review_img">
	                                    <span class="content_review_img_inner" style="width : ${lessonthemeTag.review.scoreAvg }%"></span>
	                                </span>
	                                <span class="ranking_theme_card_content_review_count content_review_count">(${lessonthemeTag.review.count })</span></div>
	                            <div class="ranking_theme_card_content_info content_info">
	                                <div class="ranking_theme_card_content_info2 content_info2">
	                                    <span class="ranking_theme_card_content_location content_location">${lessonthemeTag.location.addressSido }, ${lessonthemeTag.location.address } | </span>
	                                    <span class="ranking_theme_card_content_type content_type">
	          	                         	<c:choose>
		                                    	<c:when test="${lessonthemeTag.personnel eq 'P'.charAt(0) }">1대1</c:when>
		                                    	<c:otherwise>그룹</c:otherwise>
		                                    </c:choose>
										</span>
	                                </div>
	                                <div class="ranking_theme_card_content_price content_price">${lessonthemeTag.formatPrice}<span class="ranking_theme_card_content_priece_time content_priece_time">/시간</span></div>
	                                
	                            </div>
	                        </div>
	                        <div class="ranking_theme_card_content_tag content_tag">
	                        	<c:choose>
	                        		<c:when test="${!lessonthemeTag.themeOrder.isEmpty()}">
		                        		<c:forEach items="${lessonthemeTag.themeOrder}" var="lessonthemetag">
		                        			<span class="tag1"># ${lessonthemetag.tag}</span>
		                        		</c:forEach>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<span class="tag1">태그가 없습니다</span>
		                        	</c:otherwise>
	                        	</c:choose>
	                        </div>
	                    </a>
	                    </li>
	                </c:forEach>
	                </ul>
	            </div>
	        </section>
        <section class="season_theme theme">
	            <div class="slide_btn">
	                    <button class="season_theme_prev prev" disabled><i class="fas fa-chevron-left"></i></button>
	                    <button class="season_theme_next next"><i class="fas fa-chevron-right"></i></button>
	            </div>
	            <h2 class="season_theme_tit tit">이번 ${month }엔 뭐하지?</h2>
	            <div class="season_theme_card_slides slides">
	                <ul class="season_theme_card card">
	                <c:forEach items="${themeOrderSeasons }" var="lessonthemeSeason">
	                    <li>
	                    <a href="/lessonDetail.djdn?lessonNo=${lessonthemeSeason.lessonNo}">
	                    <img src="/upload/${lessonthemeSeason.thumnail}" alt="">
	                        <div class="card_wish <c:if test="${lessonthemeSeason.flag }">like</c:if>" data-like="${lessonthemeSeason.lessonNo }" >
	                            <i class="fas fa-star"></i>
	                        </div>
	                        <div class="ranking_theme_card_content card_content">
	                            <h3 class="ranking_theme_card_content_title content_title">${lessonthemeSeason.title}</h3>
	                            <div class="ranking_theme_card_content_review content_review">
	                                <span class="content_review_img">
	                                    <span class="content_review_img_inner" style="width : ${lessonthemeSeason.review.scoreAvg }%"></span>
	                                </span>
	                                <span class="ranking_theme_card_content_review_count content_review_count">(${lessonthemeSeason.review.count })</span></div>
	                            <div class="ranking_theme_card_content_info content_info">
	                                <div class="ranking_theme_card_content_info2 content_info2">
	                                    <span class="ranking_theme_card_content_location content_location">${lessonthemeSeason.location.addressSido }, ${lessonthemeSeason.location.address } | </span>
	                                    <span class="ranking_theme_card_content_type content_type">
	                             	       <c:choose>
		                                    	<c:when test="${lessonthemeSeason.personnel eq 'P'.charAt(0) }">1대1</c:when>
		                                    	<c:otherwise>그룹</c:otherwise>
		                                    </c:choose>
										</span>
	                                </div>
	                                <div class="ranking_theme_card_content_price content_price">${lessonthemeSeason.formatPrice}<span class="ranking_theme_card_content_priece_time content_priece_time">/시간</span></div>
	                            </div>
	                        </div>
	                        <div class="ranking_theme_card_content_tag content_tag">
	                        	<c:choose>
	                        		<c:when test="${!lessonthemeSeason.themeOrder.isEmpty()}">
		                        		<c:forEach items="${lessonthemeSeason.themeOrder}" var="lessonthemetag">
		                        			<span class="tag1"># ${lessonthemetag.tag}</span>
		                        		</c:forEach>
		                        	</c:when>
		                        	<c:otherwise>
		                        		<span class="tag1">태그가 없습니다</span>
		                        	</c:otherwise>
	                        	</c:choose>
	                        </div>
	                    </a>
	                    </li>
	                    </c:forEach>
	                </ul>
	            </div> 
	        </section>
        <section class="defense_theme theme">
            <div class="slide_btn">
                    <button class="defense_theme_prev prev" disabled><i class="fas fa-chevron-left"></i></button>
                    <button class="defense_theme_next next"><i class="fas fa-chevron-right"></i></button>
            </div>
            <h2 class="defense_theme_tit tit">내몸은 내가 지키자!</h2>
            <div class="defense_theme_card_slides slides">
                <ul class="defense_theme_card card">
              	 <c:forEach items="${themeOrderCategory }" var="lessonthemeCategory">
                    <li><a href="/lessonDetail.djdn?lessonNo=${lessonthemeCategory.lessonNo}">
                    <img src="/upload/${lessonthemeCategory.thumnail}" alt="">
                        <div class="card_wish <c:if test="${lessonthemeCategory.flag }">like</c:if>" data-like="${lessonthemeCategory.lessonNo }" >
                            <i class="fas fa-star"></i>
                        </div>
                        <div class="ranking_theme_card_content card_content">
                            <h3 class="ranking_theme_card_content_title content_title">${lessonthemeCategory.title}</h3>
                            <div class="ranking_theme_card_content_review content_review">
                                <span class="content_review_img">
                                    <span class="content_review_img_inner" style="width : ${lessonthemeCategory.review.scoreAvg }%"></span>
                                </span>
                                <span class="ranking_theme_card_content_review_count content_review_count">(${lessonthemeCategory.review.count })</span></div>
                            <div class="ranking_theme_card_content_info content_info">
                                <div class="ranking_theme_card_content_info2 content_info2">
                                    <span class="ranking_theme_card_content_location content_location">${lessonthemeCategory.location.addressSido }, ${lessonthemeCategory.location.address } | </span>
                                    <span class="ranking_theme_card_content_type content_type">
                                   		<c:choose>
	                                    	<c:when test="${lessonthemeCategory.personnel eq 'P'.charAt(0) }">1대1</c:when>
	                                    	<c:otherwise>그룹</c:otherwise>
	                                    </c:choose>
									</span>
                                </div>
                                <div class="ranking_theme_card_content_price content_price">${lessonthemeCategory.formatPrice}<span class="ranking_theme_card_content_priece_time content_priece_time">/시간</span></div>
                            </div>
                        </div>
                        <div class="ranking_theme_card_content_tag content_tag">
	                        <c:choose>
	                       		<c:when test="${!lessonthemeCategory.themeOrder.isEmpty()}">
	                        		<c:forEach items="${lessonthemeCategory.themeOrder }" var="lessonthemetag">
	                        			<span class="tag1"># ${lessonthemetag.tag}</span>
	                        		</c:forEach>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<span class="tag1">태그가 없습니다</span>
	                        	</c:otherwise>
	                       	</c:choose>
                        </div>
                    </a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
        	</section>
    </section>
    </div>
    <c:import url="/WEB-INF/template/footer.jsp"></c:import>
	
	
    <a id="back-to-top" href="#">Top</a>
    <script type="text/template" id="categoriesTmpl">
	<div class="header_wrapper">
        <h1 class="logo">
            <a href="/"><img src="/img/logo.png" alt="다재다능"></a>
        </h1>
        <ul class="hd_left">
            <li><a href="/">HOME</a></li>
        </ul>
        
        <c:choose>
	        <c:when test="${loginMember==null }">
	        	<!-- 로그인 전 header -->
		        <ul class="hd_right">
		            <li class="sub_menu_top">
		            	<a href="/login.djdn">로그인</a>
		            </li>
		        </ul>
	        </c:when>
        
	        <c:otherwise>
		        <c:choose>
			        <c:when test="${count==1 }">
				        <!-- 멘토 header -->
				        <ul class="hd_right">
				            <li class="sub_menu_top">
				                <div class="profile">
				                    <img src="/profile/${loginMentor.profileImg }" alt="프로필이미지" class="profile_img"/>
				                    <i class="fas fa-angle-down"></i>
				                </div>
				                <ul class="sub_menu">
				                    <li><a href="/mentorProfile.djdn">내 정보</a></li>
				                    <li><a href="/myActivity.djdn?memberNo=${loginMentor.memberNo }">내 활동관리</a></li>
				                    <li><a href="/logout.djdn">로그아웃</a></li>
				                </ul>
				            </li>
				            <li><a href="/wishList.djdn?memberNo=${loginMentor.memberNo }">위시리스트</a></li>
				            <li><a href="">재능톡</a></li>
				            <li class="sub_menu_top"><span class="mentor_link">멘토 <i class="fas fa-angle-down"></i></span>
				                <ul class="sub_menu">
				                    <li><a href="/myLesson.djdn?memberNo=${loginMentor.memberNo }">내 수업목록</a></li>
				                    <li><a href="/blackList.djdn?memberNo=${loginMentor.memberNo }">블랙리스트</a></li>
				                    <li><a href="/lessonInsert.djdn">수업등록</a></li>
				                </ul>
				            </li>
				        </ul>
			        </c:when>
			        
			        <c:otherwise>
			        <!-- 멘티 header -->
			         <ul class="hd_right">
			            <li class="sub_menu_top">
			                <div class="profile">
			                    <img src="/profile/${loginMember.profileImg }" alt="프로필이미지" class="profile_img" id="headProfileImg"/>
			                    <i class="fas fa-angle-down"></i>
			                </div>
			                <ul class="sub_menu">
			                    <li><a href="/profileUpdate.djdn">내 정보</a></li>
			                    <li><a href="/myActivity.djdn?memberNo=${loginMember.memberNo }">내 활동관리</a></li>
			                    <li><a href="/logout.djdn">로그아웃</a></li>
			                </ul>
			            </li>
			            <li><a href="/wishList.djdn?memberNo=${loginMember.memberNo }">위시리스트</a></li>
			            <li><a href="">재능톡</a></li>
			            <li><a href="/mentorInsert.djdn">멘토등록</a></li>
			        </ul> 
			        </c:otherwise>
		        </c:choose>
	        </c:otherwise>
        </c:choose>
      	<c:if test="${msg!=null }">
	        <script>
	        	alert("${msg}");
	        </script>
        </c:if>
    </div>
    <div class="categories categoriesHeader">
	    <ul>
	        <li><a href="/lessonList.djdn?cateno=2"><i class="fas fa-gamepad"></i><span>게임</span></a></li>
	        <li><a href="/lessonList.djdn?cateno=1"><i class="fas fa-desktop"></i><span>IT/개발</span></a></li>
	        <li><a href="/lessonList.djdn?cateno=9"><i class="fab fa-youtube"></i><span>영상</span></a></li>
	        <li><a href="/lessonList.djdn?cateno=3"><i class="fas fa-american-sign-language-interpreting"></i><span>공예</span></a></li>
	        <li><a href="/lessonList.djdn?cateno=4"><i class="fas fa-pencil-alt"></i><span>디자인</span></a></li>
	        <li><a href="/lessonList.djdn?cateno=5"><i class="fab fa-adversal"></i><span>마케팅</span></a></li>
	        <li><a href="/lessonList.djdn?cateno=6"><i class="fas fa-palette"></i><span>미술</span></a></li>
	        <li><a href="/lessonList.djdn?cateno=7"><i class="fas fa-laugh-beam"></i><span>뷰티</span></a></li>
	        <li><a href="/lessonList.djdn?cateno=10"><i class="fas fa-cookie"></i><span>요리/베이킹</span></a></li>
	        <li><a href="/lessonList.djdn?cateno=11"><i class="fas fa-language"></i><span>외국어</span></a></li>
	        <li><a href="/lessonList.djdn?cateno=12"><i class="fas fa-bicycle"></i><span>운동/스포츠</span></a></li>
	        <li><a href="/lessonList.djdn?cateno=8"><i class="fas fa-user-tie"></i><span>실무역량</span></a></li>
	        <li><a href="/lessonList.djdn?cateno=13"><i class="fas fa-music"></i><span>음악</span></a></li>
	        <li><a href="/lessonList.djdn?cateno=14"><i class="fas fa-won-sign"></i><span>재테크</span></a></li>
	        <li><a href="/lessonList.djdn?cateno=15"><i class="fas fa-user-md"></i><span>취업</span></a></li>
	    </ul>
	</div>
    </script>
    <script type="text/template" id="searchBox">
		<%-- 2020-07-25 --%>
        <@ _.each(searchTerms,function(searchTerm){ @>
        <a href="/lessonList.djdn?tag=<@=searchTerm.tag@>" data-r="<@=searchTerm.r@>">
			<li><@=searchTerm.tag@> 
				<%--<span class="background_search_box_service">서비스 1개</span>--%>
			</li>
		</a>
        <@})@>
    </script>
    <script src="/js/underscore-min.js"></script>
    <script>
   		 _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
        const searchBoxTemp = _.template($("#searchBox").html());
        const categoriesTmp = _.template($("#categoriesTmpl").html());
        const $backgroundSearchBox = $(".background_search_box");
		const $search = $(".search");
		const $backgroundSearch = $(".background_search");
		const $backgroundSearchBoxLi = $(".background_search_box a");
		const $cardWish = $(".card_wish");
		//2020-07-27
		
		//2020-08-08 구동범 likeBtn ajax 수정
		$cardWish.on("click",function(e){
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
		})//$cardWish click() end
		
		//2020-07-25
		$("body").click(function(){
			$backgroundSearchBox.hide();
		});
		
		$search.on("keyup",function(e){
			let search = $search.val();
            $.ajax({
                url:"/ajax/searchBoxList.djdn",
                type : "GET",
                dataType : "json",
                data : {keyword : search},
                error:function(){
                    alert("실패");
                },
                success:function(searchTerm){
                	if(search.length != 0) {
                		if(searchTerm.length==0) {
                    		$backgroundSearchBox.empty();
                			$backgroundSearchBox.hide();
                		}else {
                            $backgroundSearchBox.html(searchBoxTemp({searchTerms:searchTerm}));
                			$backgroundSearchBox.show();
                			if($(".background_search_box>a").length>=7) {
                				$backgroundSearchBox.css({
                					"height" : 350,
                					"overflow-y" : "scroll"
                				});
                			}else {
                				$backgroundSearchBox.css({
                					"height" : "auto",
                					"overflow-y" : "auto"
                				});
                			}
                		}//if~else end
                	}else {
                		$backgroundSearchBox.empty();
            			$backgroundSearchBox.hide();
                	}//if~else end
                }
            });//$.ajax() end
        });//$search click() end
		
        
        //html 문서 자체를 가져옴
        let docEle = document.documentElement;

        //html 문서 자체의 높이값
        let docHeight = docEle.offsetHeight;
        let currentScroll;
        let header = document.querySelector("#header");
        //스크롤 내릴시 활성화 될 기준 높이
        let offset = docHeight / 5;
        console.log("docHeight : "+docHeight);
        console.log("offset : "+offset);
        
		// 470px까지 내리면 헤드가 흰색으로 바뀌게하기
        window.addEventListener("scroll",function() {
            let currentScroll = docEle.scrollTop;
            console.log("currentScroll : "+currentScroll);
            if(currentScroll >  455) {
                header.classList.remove("black");
                $("#header").html(categoriesTmp);
                $(".categories").css({
                	'border-radius' : '0px',
                	'width' : '100%'
                });
            }
            else {
                header.classList.add("black");
                $('.categoriesHeader').remove();
                $(".categories").css({
                	'border-radius' : '50px',
                	'width' : '1080px'
                });
            }
        });
        
// 스크롤 내리면 업 버튼 생성
let btt = document.querySelector("#back-to-top");

window.addEventListener("scroll", function() {
    let currentScroll = docEle.scrollTop;

    // 버튼에 visible 클래스 명 넣기. 
    // className은 클래스를 추가하는게 아니라 없으면 넣고, 있으면 저걸로 교체하는거임
    btt.className =  (currentScroll > offset ) ? "visible" : "";
})


btt.addEventListener("click",function(e) {
    e.preventDefault();
    //문서의 스크롤 값을 0으로
    docEle.scrollTop = 0;
})


// 인기순위 슬라이드
        let marginRight = 60;
        let imgWidth = 300;
        let rankingSlideCount = $(".ranking_theme_card li").length;
        console.log(rankingMoveToSlide)
        let rankingCurrenIdx = 0;

          //
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

//이색데이트 슬라이드
        let datingSlideCount = $(".dating_theme_card li").length;
        let datingCurrenIdx = 0;

          //
          $(".dating_theme_card").css("width",(imgWidth+marginRight) * datingSlideCount - marginRight + 'px');
          


          $(".dating_theme_next").on("click",function(){
            
            if(datingCurrenIdx < datingSlideCount-3) {
                datingMoveToSlide(datingCurrenIdx+1);
              $(".dating_theme_prev").prop("disabled",false)
            }

            else {
                $(".dating_theme_next").prop('disabled',true)
            }
          })

          $(".dating_theme_prev").on("click",function(){
            
            
            if(datingCurrenIdx > 0) {
                datingMoveToSlide(datingCurrenIdx-1);
              $(".dating_theme_next").prop('disabled',false)
              
            }

            else {
                $(".dating_theme_prev").prop("disabled",true)
            }
          })
          
          function datingMoveToSlide(num) {
            $(".dating_theme_card").css("left",-num * (imgWidth+marginRight) + "px"); 
            datingCurrenIdx = num;
          }

          datingMoveToSlide(datingCurrenIdx);


          //계절테마 슬라이드
        let seasonSlideCount = $(".season_theme_card li").length;
        let seasonCurrenIdx = 0;

    
          $(".season_theme_card").css("width",(imgWidth+marginRight) * seasonSlideCount - marginRight + 'px');



          $(".season_theme_next").on("click",function(){
            
            if(seasonCurrenIdx < seasonSlideCount-3) {
                seasonMoveToSlide(seasonCurrenIdx+1);
              $(".season_theme_prev").prop("disabled",false)
            }

            else {
                $(".season_theme_next").prop('disabled',true)
            }
          })

          $(".season_theme_prev").on("click",function(){
            
            
            if(seasonCurrenIdx > 0) {
                seasonMoveToSlide(seasonCurrenIdx-1);
              $(".season_theme_next").prop('disabled',false)
              
            }

            else {
                $(".season_theme_prev").prop("disabled",true)
            }
          })
          
          function seasonMoveToSlide(num) {
            $(".season_theme_card").css("left",-num * (imgWidth+marginRight) + "px"); 
            seasonCurrenIdx = num;
          }

          seasonMoveToSlide(seasonCurrenIdx);

          //호신술 맛보기 슬라이드

        let defenseSlideCount = $(".defense_theme_card li").length;
        let defenseCurrenIdx = 0;

    
          $(".defense_theme_card").css("width",(imgWidth+marginRight) * defenseSlideCount - marginRight + 'px');

          $(".defense_theme_next").on("click",function(){
            
            if(defenseCurrenIdx < defenseSlideCount-3) {
                defenseMoveToSlide(defenseCurrenIdx+1);
              $(".defense_theme_prev").prop("disabled",false)
            }

            else {
                $(".defense_theme_next").prop('disabled',true)
            }
          })

          $(".defense_theme_prev").on("click",function(){
            
            
            if(defenseCurrenIdx > 0) {
                defenseMoveToSlide(defenseCurrenIdx-1);
              $(".defense_theme_next").prop('disabled',false)
              
            }

            else {
                $(".defense_theme_prev").prop("disabled",true)
            }
          })
          
          function defenseMoveToSlide(num) {
            $(".defense_theme_card").css("left",-num * (imgWidth+marginRight) + "px"); 
            defenseCurrenIdx = num;
          }

          defenseMoveToSlide(defenseCurrenIdx);
          
    </script>
</body>
</html>