<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>다재다능 | 환불신청</title>
<c:import url="/WEB-INF/template/link.jsp" />
<style>
	body {
		margin: 0;
	}
	
	ul li {
		list-style: none;
		padding: 0;
	}
	
	textarea {
		resize: none;
	}
	
	img {
		width: 70px;
		height: 70px;
	}
	
	#wrapper {
		width: 1080px;
		margin: auto;
		height: 1000px;
		position: relative;
		padding-top: 100px;
	}
	
	.refund {
		width: 100%;
	}
	
	.refund_tit {
		border-bottom: 1px solid rgb(184, 184, 184);
		width: 100%;
		line-height: 90px;
		font-size: 24px;
		font-weight: bold;
		margin: 0;
	}
	
	.refund_wrapper {
		margin-top: 50px;
		box-sizing: border-box;
	}
	
	.info {
		position: relative;
	}
	
	.class_img {
		width: 200px;
		height: 150px;
	}
	
	.info_detail {
		height: 100%;
		position: absolute;
		top: 0;
		left: 220px;
		line-height: 30px;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}
	
	.info_detail_tit {
		margin: 0;
		font-size: 19px;
		font-weight: bold;
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
	
	.info_detail_status {
		position: absolute;
		top: 0;
		right: 0;
	}
	
	.info_detail_review {
		color: red;
		margin-left: 10px;
	}
	
	.info_detail_price {
		color: red;
		font-size: 25px;
		font-weight: 900;
	}
	
	.done_class {
		margin-top: 50px;
	}
	
	.done_class_info {
		display: flex;
		justify-content: space-between;
	}
	
	.expected_price {
		display: inline-block
	}
	
	.expected_price_num {
		color: red;
		font-size: 20px;
		font-weight: 500;
	}
	
	.refund_reason_option {
		width: 300px;
		height: 30px;
		display: block;
	}
	
	.refund_reason .refund_reason_tit {
		margin-top: 40px;
		margin-bottom: 19px;
		font-size: 19px;
		font-weight: bold;
	}
	
	.refund_reason_txt {
		margin-top: 30px;
		display: block;
		width: 500px;
		padding: 5px;
	}
	
	.refund_reason_warning_important {
		color: red;
		font-weight: 500;
	}
	
	.refund_reason_warning {
		margin-top: 5px;
	}
	
	.refund_reason_warning .refund_left {
		float: left;
	}
	
	.refund_reason_warning .refund_right {
		float: right;
	}
	
	.refund_reason_warning::after {
		content: "";
		display: block;
		clear: both;
	}
	
	.refund_agree {
		width: 100%;
		height: 55px;
		text-align: center;
		display: flex;
		align-items: center;
		justify-content: center;
		margin-top: 30px;
	}
	
	.refund_btn {
		width: 100%;
		text-align: center;
		margin-top: 30px;
	}
	
	.refund_btn .refund_cancle {
		background-color: rgb(127, 127, 127);
		color: #fff;
	}
	.btn {
		cursor: pointer;
	}
	
	.refund_agree_tit {
		margin-right: 10px;
	}
	
	.refund_btn button {
		width: 100px;
		height: 40px;
		margin: 10px;
		outline: none;
		border-radius: 3px;
		border: none;
	}
	
	.refund_go {
		background-color: #008e97;
		color: #fff;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp" />
	
	<!-- 2020-08-07 박혜민 Spring변환  -->
	<main id="wrapper">
		<section class="refund">
			<h2 class="refund_tit">환불 신청</h2>
			<div class="refund_wrapper">
				<div class="info">
					<img src="/upload/${course.thumbnail }" alt="수업썸네일" class="class_img" />
					<div class="info_detail">
						<h3 class="info_detail_tit">
							<a href="/lessonDetail.jsp?lessonNo=">${course.title }</a>
						</h3>
						<div class="info_detail_first">
							<span class="info_detail_type">
							<c:choose>
								<c:when test="${course.personnel eq 'P'.charAt(0)}">
									1대1 수업 |
								</c:when>
								<c:otherwise>
									그룹 수업 |
								</c:otherwise>
							</c:choose>
							</span>
							<span class="info_detail_location">${course.sido } ${course.gungu } </span> 
							<span class="content_review_img"> 
								<span class="content_review_img_inner" style="width:${review.avgScore*20}%"> </span> 
							</span> 
							<span class="info_detail_review_count"> (${review.count })</span>
						</div>
						<div class="info_detail_second">
							<span class="info_detail_starting_tit">수강신청일 | </span> 
							<span class="info_detail_starting_date">${course.formatedRegdate }</span>
						</div>
						<div class="info_detail_third">
							<span class="info_detail_price">${course.formatedPayment } 원</span>
						</div>
					</div>
				</div>

				<div class="refund_reason">
					<h3 class="refund_reason_tit">환불 사유가 어떻게 되시나요?</h3>
					<form action="/refundInsert.djdn" method="post">
						<input type="hidden" name="courseNo" value="${course.courseNo }"/>
						<input type="hidden" name="refund" value="${course.payment }"/>
						<select name="refundReasonNo" class="refund_reason_option">
							<option value="1">수강 최소인원이 충족되지 않아 취소합니다.</option>
							<option value="2">단순 변심으로 수강을 원치 않습니다.</option>
							<option value="3">실수로 신청했습니다.</option>
							<option value="4">시간과 장소가 맞지 않습니다.</option>
							<option value="5">멘토에게 문제가 있습니다.</option>
							<option value="6">수업 내용이 불만족스럽습니다.</option>
							<option value="7">기타</option>
						</select>
						<textarea name="detailReason" cols="300" rows="8" class="refund_reason_txt" placeholder="자세한 내용을 입력해주세요"></textarea>
						<div class="refund_reason_warning">
							<span class="refund_left">
								<a href="" class="refund_reason_warning_important">환불규정</a>을 꼭! 읽어주세요
							</span>
							<span class="refund_right">
								예상 환불 금액 : <span class="expected_price_num">${course.getFormatedPayment() }</span>원
							</span>
						</div>
						<!-- //refund_reason_warning -->
				</div>

				<div class="refund_agree">
					<p class="refund_agree_tit">환불규정에 동의하시나요? </p> 
					<label for="yes"> 예 </label> 
					<input id="yes" name="refundRaido" type="radio"/> 
					<label for="no"> 아니오</label> 
					<input id="no" name="refundRaido" type="radio"/>
				</div>

				<div class="refund_btn">
					<button class="refund_cancle btn" type="button">취소</button>
					<button class="refund_go btn" type="submit">환불신청</button>
				</div>
				</form>
			</div>
		</section>
	</main>
	
	<c:import url="/WEB-INF/template/footer.jsp" />

	<script>
		const $refundGo = $(".refund_go");
		const $refundCancle = $(".refund_cancle");
		
		$refundGo.prop("disabled", true).css("background-color","rgb(127, 127, 127)");
		
		$(".refund_agree input").on("click", function () {
		    if($(this).attr("id")=='yes') {
		        $refundGo.prop("disabled", false).css("background-color","#008e97");
		    } else {
		        $refundGo.prop("disabled", true).css("background-color","rgb(127, 127, 127)");
		    }
		});
		
		$refundCancle.on("click", function () {
	        let result = confirm("환불신청을 취소하시겠습니까?");
	        if (result) {
	            // confirm 확인 시
	            //location.replace('/index.jsp');
	            history.back();
	        } else {
	            // confirm 취소 시
	        }
	    });
	</script>
</body>
</html>