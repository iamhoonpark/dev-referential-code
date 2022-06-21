<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<title>다재다능 - 오프라인 전문 코칭 중개</title>
<style>
	body {
		margin: 0;
	}
	
	ul li {
		list-style: none;
		padding: 0;
	}
	
	img {
		width: 70px;
		height: 70px;
	}
	
	#wrapper {
		width: 1080px;
		margin: auto;
		height: 1000px;
	}
	
	.complete_info {
		width: 600px;
		text-align: center;
		border: 1px solid lightgray;
		padding-bottom: 30px;
		margin: auto;
	}
	
	.complete_info_txt {
		font-size: 32px;
		font-weight: bold;
		margin: 26px 0;
		line-height: 50px;
	}
	
	.profile_mentor_img {
		width: 80px;
		height: 80px;
		border-radius: 50%;
	}
	
	.profile_talk_btn {
		margin-top: 10px;
		margin-bottom: 20px;
	}
	
	.payment {
		padding: 0 65px;
		text-align: left;
	}
	
	.payment ul {
		background-color: rgb(234, 234, 234);
		border-radius: 3px;
		margin: 16px 0;
		padding: 15px 10px;
	}
	
	.payment ul li {
		line-height: 24px;
	}
	
	.payment ul li:nth-child(1) {
		margin-bottom: 15px;
	}
	
	.complete_info_detail {
		width: 450px;
		height: 200px;
		line-height: 24px;
		margin: auto;
		text-align: left;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}
	
	.total_class {
		font-size: 20px;
		margin: 20px 0;
		padding: 0;
	}
	
	.total_class li {
		line-height: 30px;
		margin-bottom: 10px;
	}
	
	.complete_info button {
		width: 130px;
		height: 40px;
		margin: 10px;
		background-color: #008e97;
		border: none;
		color: #fff;
		font-size: 14px;
		border-radius: 5px;
		outline: none;
		cursor: pointer;
	}
	
	.complete_info_tit {
		color: #000;
		font-weight: 500;
	}
	
	span {
		color: red;
		font-weight: bold;
	}
	
	.button {
		display: inline-block;
		width: 130px;
		height: 40px;
		line-height: 40px;
		margin: 10px;
		background-color: #008e97;
		border: none;
		color: #fff;
		font-size: 14px;
		border-radius: 5px;
		outline: none;
		cursor: pointer;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>
	<div id="wrapper">
		<section class="complete_info">
			<h2 class="complete_info_txt">수강신청이 완료되었습니다</h2>
			<div class="profile">
				<img src="/profile/${lesson.profileImg}" alt="멘토이미지" class="profile_mentor_img">
				<div class="profile_name">${lesson.nickname}</div>
				<button class="profile_talk_btn">멘토와 대화하기</button>
			</div>
			<div class="payment">
				<ul>
					<li><span class="complete_info_tit">결제금액</span> : ${lesson.getTotalPrice()}</li>
					<li><span class="complete_info_tit">결제날짜</span> : ${lesson.getFormatRegdate()}</li>
				</ul>
			</div>
			<div class="complete_info_detail">
				<div class="complete_info_detail_text">
					<span class="complete_info_tit">제목</span> : ${lesson.title}
				</div>
				<div class="complete_info_detail_type">
					<span class="complete_info_tit">형태</span> :
					<c:choose>
						<c:when test="${lesson.personnel eq 'G'.charAt(0)}">그룹</c:when>
						<c:otherwise>1대1</c:otherwise>
					</c:choose>
				</div>
				<div class="complete_info_detail_location">
					<span class="complete_info_tit">장소</span> : 
					<span>${location.addressSido}
						- ${location.address}, 
						<c:choose>
							<c:when test="${lesson.detailAddress==null }">협의가능</c:when>
							<c:otherwise>${lesson.detailAddress}</c:otherwise>
						</c:choose>
					</span>
				</div>
				<div class="complete_info_detail_time">
					<span class="complete_info_tit">시간 / 총 횟수</span> : ${lesson.getFormatRoundHour()} / ${lesson.round}회
				</div>
				<div class="complete_info_detail_starting">
					<span class="complete_info_tit">수업 시작일</span> : <span>${menteeSchedules.get(0).getDate()}</span>
				</div>
			</div>
			<ul class="total_class">
				<c:forEach items="${menteeSchedules}" var="menteeSchedule">
					<li>${menteeSchedule.num}회차: ${menteeSchedule.getDate()} ~
						${menteeSchedule.getTimeType()} 
						<c:choose>
							<c:when test="${menteeSchedule.getHour()+lesson.getHour()>12}">
	            				${menteeSchedule.getHour+lesson.getHour()-12}시
	            			</c:when>
							<c:otherwise>
	            				${menteeSchedule.getHour()+lesson.getHour()}시
	            			</c:otherwise>
						</c:choose> 
						<c:if test="${menteeSchedule.getMinute()+lesson.getMinute()!=0}">
		            		${menteeSchedule.getMinute()+lesson.getMinute()}분
		            	</c:if>
					</li>
				</c:forEach>
				<!-- <li>2회차 : 2020-06-29(토) 오후 12시 30분 ~ 오후 1시 30분</li> -->
			</ul>

			<div class="btn">
				<a href="/" class="button complete_info_btn_home">홈으로</a> 
				<a href="/myActivity.djdn" class="button complete_info_btn_lesson_list">내 수강 목록으로</a>
			</div>
		</section>
	</div><!-- //#wrapper -->
	
	<c:import url="/WEB-INF/template/footer.jsp"></c:import>
</body>
</html>