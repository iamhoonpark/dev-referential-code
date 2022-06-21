<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>다재다능 | 내가 쓴 리뷰</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<link rel="stylesheet" href="/css/paginate.css" />
<style>
	body, input, button {
		font-family: "Noto Sans KR", sans-serif;
	}
	
	body {
		margin: 0;
	}
	
	ul li {
		list-style: none;
		padding: 0;
	}
	
	#wrapper {
		width: 1080px;
		padding-top: 100px;
		padding-bottom: 350px;
		margin: auto;
	}
	
	.activity_list_tit {
		height: 90px;
		font-size: 24px;
		font-weight: bold;
		line-height: 90px;
		margin-bottom: 30px;
		border-bottom: 1px solid rgb(184, 184, 184);
	}
	
	.activity_list::after {
		content: "";
		display: block;
		clear: both;
	}
	
	.activity_list_tab {
		width: 140px;
		height: 100px;
		float: left;
		border-radius: 5px;
	}
	
	.activity_list_tab li {
		margin-bottom: 25px;
	}
	
	.activity_review_list {
		float: left;
		width: 940px;
	}
	
	.review_list_box {
		height: 65px;
		border-bottom: 1px solid rgb(184, 184, 184);
	}
	
	.review_list_tit {
		font-size: 20px;
		line-height: 40px;
	}
	
	.review_list {
		padding: 20px 0;
		position: relative;
		border-bottom: 1px solid rgb(184, 184, 184);
	}
	
	.review_list::after {
		content: "";
		display: block;
		clear: both;
	}
	
	.review_title_box {
		padding-right: 10px;
		padding-left: 10px;
		margin-bottom: 20px;
	}
	
	.review_title_box::after {
		content: "";
		display: block;
		clear: both;
	}
	
	.review_class_tit {
		float: left;
		padding: 10px 0;
		font-size: 20px;
		font-weight: bold;
	}
	
	.review_class_tit .review_title {
		margin-bottom: 20px;
	}
	
	.review_picture_box {
		float: right;
	}
	
	.review_picture {
		float: left;
		margin-left: 10px;
		width: 100px;
		height: 70px;
	}
	
	.review_txt {
		width: 700px;
		line-height: 20px;
		text-align: justify;
		padding: 5px 10px;
		float: left;
	}
	
	.btn {
		width: 80px;
		height: 30px;
		line-height: 30px;
		border-radius: 3px;
		background-color: #008e97;
		color: #fff;
		text-align: center;
		cursor: pointer;
		outline: none;
		font-weight: 200;
		border: none;
	}
	
	#btn {
		position: absolute;
		right: 10px;
		bottom: 20px;
	}
	
	.content_review_img {
		display: inline-block;
		width: 106px;
		height: 15px;
		background: url(/img/ico_newsview_200522.png) no-repeat 0 0;
	}
	
	.content_review_img_inner {
		overflow: hidden;
		font-size: 0;
		background: url(/img/ico_newsview_200522.png) no-repeat 0 -20px;
		text-indent: -9999px;
		height: 20px;
		z-index: 1;
		display: inline-block;
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
	
	.review_pop_con_score {
		margin-top: 10px;
		font-size: 30px;
		margin-bottom: 20px;
		cursor: pointer;
		user-select: none;
	}
	
	.review_pop_con_score label {
		cursor: pointer;
	}
	
	.review_pop_con_score input {
		display: none;
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
		cursor: pointer;
	}
	
	.file_upload_label {
		width: 70px;
		height: 70px;
		border: 1px solid #424242;
		display: block;
		cursor: pointer;
		font-size: 24px;
		line-height: 70px;
		margin: 15px 0;
		float: left;
		box-sizing: border-box;
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
		cursor: pointer;
		position: relative;
	}
		
	/* 2020-08-09 주현 : a 요소 추가 */
	.file_box_img li a {
		width: 70px;
		height: 70px;
		float: left;
		cursor: pointer;
		position: relative;
	}
	
	.file_box_img li:hover {
		width: 70px;
		height: 70px;
		background-color: rgba(0, 0, 0, 0.7);
	}
	
	.file_box_img li:hover:after {
		content: "X";
		position: absolute;
		color: black;
		font-weight: 900;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
	}
	
	.file_box_img li img {
		width: 100%;
		height: 100%;
	}
	
	.review_delete_btn a {
		color: #fff;
	}
	
	.content_review_regdate {
		color: #424242;
		font-size: 11px;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>

	<div id="wrapper" class="wrapper">
		<h2 class="activity_list_tit">내 활동 관리</h2>
		<div class="activity_list">
			<div class="activity_list_tab">
				<ul>
					<li><a href="/myReview.djdn"> 내가 쓴 리뷰</a></li>
					<li><a href="/myActivity.djdn"> 내 수강 목록</a></li>
				</ul>
			</div>
			<div class="activity_review_list">
				<div class="review_list_box">
					<h3 class="review_list_tit">내가 쓴 리뷰</h3>
				</div>
				<!--리뷰카드 시작-->
				<ul class="review_card">
					<%-- <%
						for (Review review : reviews) {
							
							
							List<ReviewImg> reviewImgs = ReviewImgsDAO.selectListImg(review.getReviewNo());
					%> --%>
					<!-- 2020-08-07 민겸 -->
					<c:forEach items="${reviews }" var="review">
					<li class="review_list">
						<div class="review_title_box">
							<div class="review_class_tit">
								<div class="review_title">
									<a href="/lessonDetail.jsp">${review.title}</a>
									<span class="content_review_regdate">리뷰 등록일 : ${review.regdateStr}</span>
								</div>
								
								<span class="content_review_img"> <span
									class="content_review_img_inner"
									style="width:  ${review.score*20}%"></span>
								</span>
								
							</div>
							
							<!-- 2020-08-08 reviewimg 주현 -->
							<div class="review_picture_box">
								<c:forEach items="${review.reviewImgs}" var="reviewImg">
								<img class="review_picture" src="/upload/${reviewImg.name}"
									alt="reviewPicture">
								</c:forEach>
							</div>
						</div>
						<div class="review_txt">${review.content }</div>
						<div id="btn">
							<button type="submit" class="review_delete_btn btn">
							
							<!-- 2020-08-08 deleteReview 주현 -->
								<a href="/myReviewDelete.djdn?reviewNo=${review.reviewNo}">리뷰삭제</a>
							</button>
							<button data-no="${review.reviewNo}" class="review_change_btn btn">리뷰수정</button>
							
						</div>
					</li>
					</c:forEach>
				</ul>
				<!--//리뷰카드 끝-->
				${paginate }
			</div>
		</div>
		
		<div class="review">
			<div class="review_pop">
				<div class="review_pop_header">
					<h2>리뷰수정</h2>
					<div class="review_pop_header_close">
						<i class="fas fa-times"></i>
					</div>

				</div>
				<div class="review_pop_con"></div>
			</div>

		</div>
	</div>
	<!-- //.review end -->
	
	<c:import url="/WEB-INF/template/footer.jsp"></c:import>
	
	<script type="text/template" id="uploadImg">
		<@ _.each(imgs,function(img) { @>
			<li>
					<img src="/upload/<@=img.name@>" alt=""/>
					<input id="reviewImg" type="hidden" name="file" value=<@=img.name@>>
			</li>
		<@ }) @>
	</script>

	<script type="text/template" id="fileImg">
		<li>
			<img src="/upload/<@=imageName@>" alt="">
			<input type="hidden" name="file" value=<@=imageName@>>
		</li>
    </script>
    
	<script type="text/template" id="reviewPopup">
		<h3 class="review_pop_con_tit"><@=review.title@></h3>
		<h3 class="review_pop_con_tit2">수업을 추천하시겠어요?</h3>
		<form action="/updateReview.djdn" method="post">
			<input type="hidden" name="courseNo" value="<@=review.courseNo@>">
			<input type="hidden" name="reviewNo" value="<@=review.reviewNo@>">
			<div class="review_pop_con_score">
				<label for="score1"><i class="fas fa-star" aria-hidden="ture" id="s1"></i></label> 
				<input id="score1" type="radio" name="score" value="1" <@if(review.score == 1) { @> checked <@ } @>/> 
				<label for="score2"><i class="fas fa-star" id="s2"></i></label> 
				<input id="score2" type="radio" name="score" value="2" <@if(review.score == 2) { @> checked <@ } @>/> 
				<label for="score3"><i class="fas fa-star" id="s3"></i></label> 
				<input id="score3" type="radio" name="score" value="3" <@if(review.score == 3) { @> checked <@ } @>/> 
				<label for="score4"><i class="fas fa-star" id="s4"></i></label> 
				<input id="score4" type="radio" name="score" value="4" <@if(review.score == 4) { @> checked <@ } @>/> 
				<label for="score5"><i class="fas fa-star" id="s5"></i></label> 
				<input id="score5" type="radio" name="score" value="5" <@if(review.score == 5) { @> checked <@ } @>/>
			</div>
			<textarea name="content" value="" class="review_pop_con_text" id="" cols="30" rows="10" class="review_pop_con_writing" placeholder=""><@=review.content@></textarea>
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
			<button class="review_pop_con_upload" type="submit">수정하기</button>
		</form>
	</script>

	<script src="/js/underscore-min.js"></script>
	<script>
   		 _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
   		const imgUploadTmp = _.template($("#uploadImg").html());
        const imgTmp = _.template($("#fileImg").html());
        const reviewTmp = _.template($("#reviewPopup").html());
        const $imgList = $(".file_box_img");
        const $fileUpload = $("#file_upload");
        /* 7/27 */
        const $reviewUpdateBtn = $(".review_change_btn");
        
        //이미지파일 업로드하는 ajax
        $("body").on("change","#file_upload",function() {
        	
        	const file = this.files[0];
        	console.log(file);
        	
        	const formData = new FormData();
        	
        	console.log(formData);
        	formData.append("uploadImg", file, file.name);
        	
        	$.ajax({
        		url:"/ajax/uploadReviewImg.djdn",
    			type:"post",//multipart/form-data니까
    			dataType:"json",
    			contentType:false,//multipart/form-data니까
    			processData:false,//multipart/form-data니까
    			data:formData,//multipart/form-data니까
    			error:function() {
    				alert("서버점검중!");
    			},
    			success:function(img) {
    				
    				//alert("dd");
    				console.log(img);
    				
    				//유저에게 미리보기 제공
    				if($(".file_box_img li").length<4) {
    					$(".file_box_img").append(imgTmp(img));
    					
    					$(".current_count").text($(".file_box_img li").length);
    					console.log($(".file_box_img li").length)
    					if($(".file_box_img li").length == 4) {
    					$(".file_upload_label").hide();
    				}
    					
    				}
    				
    				
    			}// success end
        	});// ajax end
        	
		});
        
        
        //팝업에서 사진을 클릭하면 해당 li를 지움
        $("body").on("click",".file_box_img li",function(){
        	$(this).remove();
        	$(".current_count").text($(".file_box_img li").length);
        	$(".file_upload_label").show();
        })
        
        
        // 리뷰 수정 팝업 보여주는 ajax
		$(".review_change_btn").on("click", function() {
			$(".review").css("display", "block");
			
			
			
			let reviewNo = this.dataset.no;
			/* 7/28 */
			$.ajax({
        		type:"GET",
        		url : "/ajax/myReview.djdn",
        		data : {reviewNo : reviewNo},
        		error : function() {
        			alert("오류");
        		},
        		success : function(review) {
        			console.log(review);
        			$(".review_pop_con").html(reviewTmp({"review":review}));
        			$(".review_pop_con_score input:checked").prevAll().css("color","#f9bf2d");
        			/* 07/29 이미지 업로드 에이젝스 */
        			imgUpload(reviewNo);
        		}
        	})//$.ajax() end
		})//.review_change_btn click() end
		
		//리뷰에 등록된 사진파일 보여주는 ajax
		function imgUpload(reviewNo) {
        	
        	        	$.ajax({
        	        		type:"GET",
        	        		url:"/ajax/myReviewImg.djdn",
        	        		data: {
        	        			reviewNo : reviewNo
        	        		},
        	        		error : function() {
        	        			alert("오류");
        	        		},
        	        		success : function(img) {
        	        			console.log(img);
        	        			$(".file_box_img").html(imgUploadTmp({imgs:img}));
        	        			$(".current_count").text($(".file_box_img li").length);
        	        		}
        	        	})
        	        }
        
		$(".review_pop_header_close").on("click", function() {
			$(".review").css("display", "none");
		})
		
		//별점
            $(".review_pop_con").on("click","label",function(){
                $(this).siblings().css("color","#000");
                $(this).css("color","#f9bf2d");
                $(this).prevAll().css("color","#f9bf2d");
            });
        
        //팝업 바깥 레이아웃 누르면 바뀌는것 
        $(document).click(function(e){
            const container = $(".review");
            console.log("팝업 바깥 레이아웃 누르면 바뀌는것 ");
            // 2020-08-11 주현 : '수정하기' 눌렀을 때 아래 이벤트로 인해 사진 등록하는 ajax가 안먹힘
            // -> 'x' 눌렀을 때만 팝업 닫히도록 주석처리 함
            /*
            if(container.has(e.target).length==0){
                container.hide();
                $(".review").hide();
                    $("textarea").val("");
                    $(".fa-star").css("color","#000");
            }//if end*/
            
        });
        
        
	</script>
</body>
</html>