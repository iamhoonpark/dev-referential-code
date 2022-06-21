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
<link rel="stylesheet" href="/css/paginate.css" />
<style>
	#wrapper {
		width: 1080px;
		margin: auto;
		padding-top: 100px;
		padding-bottom: 350px;
	}
	
	.wish_tit {
		line-height: 90px;
		font-size: 24px;
		font-weight: bold;
		border-bottom: 1px solid rgb(184, 184, 184);
		margin-bottom: 10px;
	}
	
	.card {
		position: relative;
		display: flex;
		flex-wrap: wrap;
		width: 1080px;
		justify-content: flex-start;
	}
	
	.card li {
		width: 300px;
		height: 320px;
		border: 1px solid lightgray;
		box-sizing: border-box;
		position: relative;
		margin-right: 30px;
		margin-left: 30px;
		margin-top: 20px;
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
	}
	.card_wish .fa-star {
		line-height: 40px;
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
		height: 200px
	}
	
	.content_review_img {
		display: inline-block;
		width: 106px;
		height: 15px;
		background: url("img/reviewStar.png") no-repeat 0 0;
	}
	
	.content_review_img_inner {
		overflow: hidden;
		font-size: 0;
		line-height: 0;
		background: url("img/reviewStar.png") no-repeat 0 -20px;
		text-indent: -9999px;
		width: 40%;
		height: 15px;
		z-index: 1;
		display: inline-block;
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
	}
	
	.content_review {
		color: red;
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
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>
	
	<div id="wrapper">
		<h2 class="wish_tit">위시리스트</h2>
		<div>${review.reviewCount}</div>
		<ul class="dating_theme_card card">

		</ul>
		<div id="paginate"></div>
	</div>

<script type="text/template" id="wishListTmpl">
	<@ _.each(wishLists,function(wishList) { @>
		<li>
			<a href="/lessonDetail.djdn?lessonNo=<@=wishList.lessonNo@>">
				<img src="/upload/<@=wishList.thumnail@>" alt=""/>
                <div class="card_wish on" data-like = "<@=wishList.wishlistNo@>"> 
                	<i class="fas fa-star"></i>
                </div>
                
                <div class="ranking_theme_card_content card_content">
                    <h3 class="ranking_theme_card_content_title content_title"><@=wishList.title@></h3>
                    <div class="ranking_theme_card_content_review content_review">
                        <span class="content_review_img">
                            <span class="content_review_img_inner" style="width : <@=wishList.review.scoreAvg@>%"></span>
                        </span>
                        <span class="ranking_theme_card_content_review_count content_review_count">(<@=wishList.review.reviewCount@>)</span>
					</div>

                    <div class="ranking_theme_card_content_info content_info">
                        <div class="ranking_theme_card_content_info2 content_info2">
                            <span class="ranking_theme_card_content_location content_location"><@=wishList.sido @>, <@=wishList.gungu @> | </span>
                            <span class="ranking_theme_card_content_type content_type">
                            	<@if(wishList.personnel=='P'){ @>1:1<@}else{ @>그룹<@} @>
                            </span>
                        </div>
                        <div class="ranking_theme_card_content_price content_price"><@=wishList.formatPrice @>
							<span class="ranking_theme_card_content_priece_time content_priece_time">/시간</span>
						</div>
                    </div>
                </div>

                <div class="ranking_theme_card_content_tag content_tag">
                <@ if (wishList.lessonTags.length==0) { @>
                    <span class="tag2">태그가 없습니다.</span>
                <@ }else{ @>
					<@ _.each(wishList.lessonTags,function(lessonTag) { @>
                		<span class="tag1">#<@=lessonTag.tag@></span>
					<@ }) @>
                <@ } @> 
                </div>
            </a>
		</li>
	<@})@>
</script>

<c:import url="/WEB-INF/template/footer.jsp"></c:import>
<script src="/js/underscore-min.js"></script>

<script>
	//2020-08-07 임현우
	//% -> @로 바꿔주기
	_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
	
	const wishListTmp = _.template($("#wishListTmpl").html());
	
	const $wishListBox = $(".dating_theme_card");
	
	let pageNo = 1;

	function getWishList(pageNo) {
		$.ajax({
			url : "/ajax/getWishList.djdn",
			type : "GET",
			dataType : "json",
			data : {"page" : pageNo},
			error : function() {
				alert("서버 점검중");
			},
			success : function(json) {
				//console.log(json);
				$wishListBox.html(wishListTmp(json));
				$("#paginate").html(json.paginate);
			}
		});//$.ajax end
	}//getWishList() end

	getWishList(pageNo);

	//인자 3개짜리 호출해서 페이지번호 누를시 변환
	$("#paginate").on("click", ".paginate a", function(e) {
		e.preventDefault();
		pageNo = this.dataset.page;
		//위시리스트를 불러오는 함수 호출
		getWishList(pageNo);
	});

	//2020.08.10 임현우
	$(".dating_theme_card").on("click", ".card_wish", function(e) {
		const wishlistNo = this.dataset.like;
		const $that = $(this);
		e.preventDefault();
		
		if ($(this).hasClass("on")) {
			if (confirm("해당 과목을 정말 위시리스트에서 삭제하시겠습니까?")) {
				$.ajax({
					url : "/ajax/deleteWishlist.djdn",
					type : "GET",
					dataType : "json",
					data : {wishlistNo : wishlistNo},
					error : function() {
						alert("서버 점검중");
					},
					success : function(json) {
						//console.log(json);
						if (json.flag) {
							//$that.removeClass("on");
							getWishList(1);
						} else {
							alert("안지워졌음!");
						}//if~else end
					}
				})//$.ajax() end
			}
			;
		}
		;
	});
</script>
</body>
</html>