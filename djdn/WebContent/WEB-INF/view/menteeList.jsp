<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>다재다능 멘티목록</title>
<c:import url="/WEB-INF/template/link.jsp" />
<style>
	/* setting */
	body, input, button, textarea, select, option {
		margin: 0;
		font-family: 'Noto Sans KR', sans-serif;
		color: #424242;
	}
	
	button, select {
		cursor: pointer;
	}
	
	legend {
		position: absolute;
		width: 1px;
		height: 1px;
		margin: -1px;
		overflow: hidden;
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
	
	.content_box {
		width: 518px;
		height: 172px;
		border: 1px solid #BDBDBD;
		float: left;
		margin: 10px;
		border-radius: 3px;
		position: relative;
	}
	
	.content_box_empty {
		text-align: center;
		font-size: 18px;
		padding-top: 150px;
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
		padding: 30px 0 0 10px;
	}
	
	.txt {
		margin-bottom: 15px;
		font-size: 15px;
	}
	
	.txt span {
		font-weight: 500;
	}
	
	.box_btn_wrap {
		display: inline-block;
		position: absolute;
		bottom: 0;
		right: 0;
		margin-right: 15px;
		margin-bottom: 12px;
	}
	
	.btn {
		width: 80px;
		height: 31px;
		font-size: 13px;
		font-weight: 400;
		border-radius: 3px;
		color: #fff;
		border: none;
		outline: none;
		background: rgb(127, 127, 127);
	}
	
	.btn:hover {
		background: #008e97;
	}
	
	/* 요청사항 보기 */
	.request_box {
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
	
	/* 차단하기 팝업창 */
	#layerWrap {
		width: 100%;
		height: 100%;
		left: 0;
		top: 0;
		position: fixed;
		background-color: rgba(0, 0, 0, 0.7);
		display: none;
		z-index: 9999;
	}
	
	#popUp {
		width: 525px;
		position: absolute;
		left: 50%;
		top: 50%;
		margin: -293px 0 0 -262.5px;
		background-color: #fff;
	}
	
	.pop_up_tit {
		font-size: 22px;
		font-weight: 500;
		border-bottom: 1px solid #9E9E9E;
		margin-bottom: 30px;
		color: #fff;
		line-height: 80px;
		padding-left: 20px;
		background-color: #008e97;
	}
	
	.btn_close {
		position: absolute;
		top: 28px;
		right: 20px;
		border: none;
		background: none;
		outline: none;
	}
	
	.fa-times:hover {
		color: #fff;
	}
	
	.fa-times {
		font-size: 25px;
		color: #616161;
	}
	
	.pop_up_con {
		margin: 0 20px;
	}
	
	.blacklist_explain {
		background-color: #EEEEEE;
		padding: 15px;
		margin-bottom: 30px;
		border-radius: 3px;
		line-height: 26px;
	}
	
	.con_reason_tit {
		margin-bottom: 30px;
		font-size: 16px;
		margin-left: 15px;
	}
	
	#reason_select, .reason_txt {
		display: block;
		font-size: 14px;
		padding-left: 5px;
		margin-left: 15px;
		outline-color: #008e97;
	}
	
	#reason_select {
		width: 458px;
		height: 40px;
		margin-bottom: 200px;
	}
	
	option {
		font-size: 14px;
	}
	
	.reason_txt {
		display: none;
		resize: none;
		width: 446px;
		height: 144px;
		padding: 5px;
		overflow: auto;
	}
	
	.pop_up_btn_wrap {
		text-align: center;
		margin: 30px 0;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp" />

	<!-- 2020-08-08 박혜민 Spring변환  -->
	<!-- #wrapper 시작 -->
	<div id="wrapper">
		<h2 class="content_tit">멘티 목록</h2>

		<c:if test="${list.isEmpty() }">
			<!-- 멘티목록이 비었을 경우 -->
			<div class="content_box_empty">아직 수강신청한 멘티가 없습니다.</div>
		</c:if>

		<!-- 멘티목록이 있을 경우 -->
		<c:forEach items="${courses }" var="course">
			<div class="content_box">
				<div class="click_before">
					<div class="box_left">
						<img src="/profile/${course.profileImg }" alt="멘티 프로필사진">
						<div class="name">${course.name }</div>
					</div>
					<div class="box_right">
						<div class="txt start_date">
							<span>수업시작일 │ </span>${course.formatedStartDate }
						</div>
						<div class="txt phone_num">
							<span>핸드폰번호 │ </span>${course.phone }
						</div>
						<div class="txt level">
							<span>레벨 │ </span>
							<c:choose>
								<c:when test="${course.menteeLevel == 65}">
								잘해요
								</c:when>
								<c:when test="${course.menteeLevel == 66}">
								어느 정도 해요
								</c:when>
								<c:when test="${course.menteeLevel == 67}">
								한 두번 해봤어요
								</c:when>
								<c:otherwise>
								처음 해봐요
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="box_btn_wrap">
						<button class="btn btn_block" data-no="${course.memberNo }">차단하기</button>
						<button class="btn btn_request">요청보기</button>
					</div>
				</div>
				<div class="request_box">
					<div class="box_txt">
						<h3 class="box_tit">요청사항</h3>
						<div class="box_con">${course.request }</div>
					</div>
					<div class="box_btn_wrap">
						<button class="btn btn_ok">확인</button>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- //#wrapper -->

	<!-- 팝업창 시작 -->
	<div id="layerWrap"></div>
	<!-- //팝업창 -->

	<c:import url="/WEB-INF/template/footer.jsp" />

	<c:if test="${blacklistMsg!=null}">
		<script>
			alert("${blacklistMsg}");
		</script>
	</c:if>

	<script src="/js/underscore-min.js"></script>

	<script type="text/template" id="blackList">
		<div id="popUp">
			<h2 class="pop_up_tit">블랙리스트 등록</h2>
			<button class="btn_close">
				<i class="fas fa-times"></i>
			</button>

			<div class="pop_up_con">
				<div class="blacklist_explain">
					블랙리스트로 등록할 경우, <br> 해당 학생이 멘토님의 다른 수업에 신청할 수 없게 됩니다.
				</div>
				<div class="con_reason_tit">블랙리스트로 차단하는 이유가 무엇인가요?</div>
				<form id="blacklistInsertForm" action="/menteeBlack.djdn" method="post">
				<input type="hidden" name="memberNo" value="<@=memberNo @>"/>
				<input type="hidden" name="lessonNo" value="<@=lessonNo @>"/>
					<fieldset>
						<legend>블랙리스트 등록</legend>
						<select id="reason_select" name="blackReasonNo">
							<option value="0" class="select_initial" selected>선택</option>
							<option value="1">수업을 방해함</option>
							<option value="2">잦은 지각 및 결석</option>
							<option value="3">비속어 / 폭언 / 비하 / 음란 등</option>
							<option value="4">갈등 조장 및 허위 사실 유포 등</option>
							<option value="5">수업 목적에 맞지 않는 행위를 함</option>
							<option value="6">다른 사람들에게 불편함을 주는 행위를 함</option>
							<option value="7">명예훼손 / 사생활 침해 / 저작권 침해 등</option>
							<option value="8">기타</option>
						</select>
						<textarea name="detailReason" class="reason_txt" cols="30"
							rows="10" placeholder="블랙리스트로 차단하게 된 이유를 작성해주세요."></textarea>
						<div class="pop_up_btn_wrap">
							<button type="submit" class="btn btn_block_go">차단하기</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</script>

	<script>
		_.templateSettings = {interpolate : /\<\@\=(.+?)\@\>/gim, evaluate : /\<\@([\s\S]+?)\@\>/gim, escape : /\<\@\-(.+?)\@\>/gim};

		const $subMenuTop = $(".sub_menu_top");
		const $btnRequest = $(".btn_request");
		const $btnOk = $(".btn_ok");
		const $btnBlock = $(".btn_block");
		const $layerWrap = $("#layerWrap");
		const $btnBlockGo = $(".btn_block_go");
		const $popUp = $("#popUp");
		const $selectInitial = $(".select_initial");
		const $reasonTxt = $(".reason_txt");
		const $reasonSelect = $("#reason_select");

		//ajax 템플릿
		const blackListTmp = _.template($("#blackList").html());

		//2002-08-07 박혜민		"차단하기" 버튼클릭
		$(".btn_block").on("click", function() {
			let memberNo = this.dataset.no;
			$("#layerWrap").html(blackListTmp({memberNo : memberNo, lessonNo : "${param.lessonNo}"}));
		});

		/* 요청보기 버튼 클릭 */
		$btnRequest.on('click', function() {
			$(this).parents(".click_before").css('display', 'none');
			$(this).parents(".click_before").siblings(".request_box").css('display', 'block');
		});

		/* 요청사항 확인 버튼 클릭 */
		$btnOk.on('click', function() {
			$(this).parents(".request_box").css('display', 'none');
			$(this).parents(".request_box").siblings(".click_before").css('display', 'block');
		});

		/* 차단하기 팝업 여는 버튼 클릭 */
		$btnBlock.on('click', function(e) {
			$layerWrap.show();
			if ($("#reason_select").val() == 0) {
				e.preventDefault();
			}
		});

		/* 차단하기 팝업창 */
		$("#layerWrap").on("click", ".btn_block_go", function(e) {
			if ($("#reason_select").val() == 0) {
				alert("차단 이유를 선택해주세요.");
				e.preventDefault();
			} else {
				//alert("차단되었습니다.");
				//$layerWrap.hide();
			}
		});

		$("#layerWrap").on("click", "#popUp", function(e) {
			e.stopPropagation();
		});

		$("#layerWrap").click(function(e) {
			cancel();
		});

		$("#layerWrap").on("click", ".btn_close", function(e) {
			cancel();
		});

		function cancel() {
			if (confirm("블랙리스트 등록을 취소하시겠습니까?")) {
				$layerWrap.hide();
				$selectInitial.prop("selected", true);
				$reasonTxt.val("");
				$reasonTxt.hide();
				$reasonSelect.css('margin-bottom', '200px');
			}
		}

		/* 차단하기 팝업창 esc */
		$(document).keydown(function(e) {
			if ($('#layerWrap').css('display') != 'none' && e.keyCode == 27) {
				cancel();
			}
		});

		/* select option 선택 안할 경우, '기타' 선택할 경우 */
		$("#layerWrap").on("change", "#reason_select", function(e) {
			//'기타' 선택할 경우
			if ($("#reason_select").val() == 8) {
				$(".reason_txt").show();
				$("#reason_select").css('margin-bottom', '30px');
			} else {
				$(".reason_txt").hide();
				$(".reason_txt").val("");
				$("#reason_select").css('margin-bottom', '200px');
			}//if~else end
		});
	</script>
</body>
</html>