<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>다재다능 블랙리스트 관리</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<link rel="stylesheet" href="/css/paginate.css" />
<style>
	/* setting */
	body, input, button {
		margin: 0;
		font-family: 'Noto Sans KR', sans-serif;
		color: #424242;
	}
	
	/* wrapper */
	#wrapper {
		max-width: 1080px;
		margin: 0 auto 200px auto;
		padding: 100px 0 95px 0;
		overflow: hidden;
	}
	
	.content_tit {
		font-size: 24px;
		font-weight: bold;
		line-height: 90px;
		border-bottom: 1px solid #9E9E9E;
		margin-bottom: 30px;
	}
	
	.content_wrap {
		height: 585px;
	}
	
	.content_box {
		width: 518px;
		height: 172px;
		border: 1px solid #BDBDBD;
		float: left;
		margin: 10px;
		border-radius: 3px;
		position: relative;
	}
	
	.box_left {
		display: inline-block;
		text-align: center;
		width: 100px;
		margin: 20px;
	}
	
	.box_left>img {
		width: 100px;
		height: 100px;
		border-radius: 50%;
	}
	
	.name {
		text-align: center;
		margin-top: 15px;
		font-weight: 500;
	}
	
	.box_right {
		display: inline-block;
		position: absolute;
		top: 0;
		width: 366px;
		height: 90px;
		padding: 35px 0 0 10px;
	}
	
	.txt {
		margin-bottom: 20px;
		font-size: 15px;
	}
	
	.txt span {
		font-weight: 500;
	}
	
	.blacklist_lesson {
		width: 50px;
		height: 50px;
		line-height: 1.5em;
		float: left;
		font-weight: 500;
	}
	
	.lesson_title {
		width: 301px;
		height: 50px;
		line-height: 1.5em;
		float: left;
	}
	
	.box_btn_wrap {
		display: inline-block;
		position: absolute;
		bottom: 0;
		right: 0;
		margin-right: 15px;
		margin-bottom: 12px;
		overflow: hidden;
	}
	
	.btn {
		width: 80px;
		height: 31px;
		font-size: 13px;
		font-weight: 400;
		border-radius: 3px;
		cursor: pointer;
		color: #fff;
		border: none;
		outline: none;
	}
	
	.btn:hover {
		background: #008e97;
	}
	
	.btn_grey {
		background: rgb(127, 127, 127);
	}
	
	.btn_unblock {
		display: inline-block;
		text-align: center;
		float: right;
		margin-right: 5px;
		line-height: 30px;
	}
	
	.btn_reason {
		display: inline-block;
		text-align: center;
		float: right;
		line-height: 30px;
	}
	
	/* 차단사유 박스 */
	.reason_box {
		display: none;
	}
	
	.box_txt {
		margin: 20px;
	}
	
	.box_tit {
		font-size: 16px;
		font-weight: 500;
		margin-bottom: 15px;
	}
	
	.box_con {
		height: 67px;
		overflow: auto;
		line-height: 150%;
	}
	
	/* 페이징처리 */
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

	<!-- #wrapper 시작 -->
	<div id="wrapper">
		<h2 class="content_tit">블랙리스트 관리</h2>

		<c:choose>
			<c:when test="${empty list }">
				<!-- 블랙리스트 목록이 비었을 경우 -->
				<div class="content_box_empty">블랙리스트가 없습니다.</div>
			</c:when>
			
			<c:otherwise>
				<!-- 블랙리스트 목록이 있을 경우 -->
				<div class="content_wrap">
				<c:forEach items="${list }" var="blacklist">
					<div class="content_box">
						<div class="click_before">
							<div class="box_left">
								<img src="/profile/${blacklist.profileImg }" alt="멘티 프로필사진">
								<div class="name">${blacklist.name }</div>
							</div>
							<div class="box_right">
								<div class="txt">
									<span>블랙리스트 등록일 │ </span>${blacklist.getFormatedRegdate() }
								</div>
								<div class="txt">
									<div class="blacklist_lesson">수업 │ </div>
									<div class="lesson_title">${blacklist.title }</div>
								</div>
							</div>
							<div class="box_btn_wrap">
								<a class="btn btn_grey btn_reason">차단사유</a>
								<a class="btn btn_grey btn_unblock" href="/blacklistDelete.djdn?blacklistNo=${blacklist.blacklistNo }">차단해제</a>
							</div>
						</div>
						<div class="reason_box">
							<div class="box_txt">
								<h3 class="box_tit">차단사유</h3>
								<div class="box_con">
								<c:if test="${blacklist.blackReasonNo!=8 }">
									${blacklist.reason }
								</c:if>
								<br/>
								<c:if test="${blacklist.detailReason!=null }">
									${blacklist.detailReason }
								</c:if>
								</div>
							</div>
							<div class="box_btn_wrap">
								<button class="btn btn_grey btn_ok">확인</button>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
				${paginate }
			</c:otherwise>
		</c:choose>
	</div>
	<!-- //wrapper -->

	<c:import url="/WEB-INF/template/footer.jsp"></c:import>

	<script>
		const $subMenuTop = $(".sub_menu_top");
		const $btnReason = $(".btn_reason");
		const $btnOk = $(".btn_ok"); 
		const $btnUnblock = $(".btn_unblock");

		/* 차단사유 버튼 클릭 */
		$btnReason.on('click', function() {
			$(this).parents(".click_before").css('display', 'none');
			$(this).parents(".click_before").siblings(".reason_box").css('display', 'block');
		});

		/* 확인 버튼 클릭 */
		$btnOk.on('click', function() {
			$(this).parents(".reason_box").css('display', 'none');
			$(this).parents(".reason_box").siblings(".click_before").css('display', 'block');
		});

		/* 차단해제 버튼 클릭 */
		$btnUnblock.on('click', function(e) {
			if (confirm("차단을 해제하시겠습니까?")) {
				
			} else {
				e.preventDefault();
			}
		});
	</script>
</body>
</html>