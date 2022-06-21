<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>다재다능 수업등록 - 가격 및 일정/장소</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<link href="/css/tui-date-picker.css" rel="stylesheet" />
<link href="/css/tui-time-picker.css" rel="stylesheet" />
<style>
	/* setting */
	body, input, button, textarea, select {
		margin: 0;
		font-family: 'Noto Sans KR', sans-serif;
		color: #424242;
	}
	
	input, textarea {
		outline-color: #008e97;
		border-radius: 3px;
	}
	
	button {
		cursor: pointer;
		color: #fff;
	}
	
	/* wrapper */
	#wrapper {
		position: relative;
		max-width: 1080px;
		margin: 0 auto 200px auto;
		padding: 100px 0 95px 0;
	}
	
	.content_top {
		position: relative;
		border-bottom: 1px solid #9E9E9E;
	}
	
	.content_tit {
		display: inline-block;
		font-weight: bold;
		font-size: 24px;
		line-height: 90px;
	}
	
	.content_progress {
		display: inline-block;
		position: absolute;
		line-height: 90px;
		right: 0;
		font-weight: 500;
	}
	
	.point {
		color: red;
	}
	
	.point_green {
		color: #008e97;
	}
	
	.point_bold {
		font-weight: 600;
	}
	
	.required {
		text-align: right;
		font-size: 10px;
		padding: 10px 0;
		color: red;
		border-bottom: 1px solid #E0E0E0;
	}
	
	legend {
		position: absolute;
		width: 1px;
		height: 1px;
		margin: -1px;
		overflow: hidden;
	}
	
	.row {
		overflow: hidden;
		width: 1080px;
		border-bottom: 1px solid #E0E0E0;
	}
	
	.row_tit {
		float: left;
		width: 115px;
		height: 30px;
		line-height: 30px;
		font-size: 16px;
		font-weight: 500;
		padding: 32px 31px 32px;
	}
	
	.row_con {
		float: left;
		width: 873px;
		min-height: 30px;
		padding: 32px 0 5px 30px;
		font-size: 14px;
	}
	
	/* 1번째 row - 가격/시간 */
	h4 {
		line-height: 31px;
		font-size: 15px;
		font-weight: 500;
		margin: 20px 0 4px;
	}
	
	h4:nth-child(1) {
		margin-top: 0;
	}
	
	.input_num_model {
		outline-color: #008e97;
		line-height: 27px;
		height: 27px;
		vertical-align: top;
		color: #333;
		border: 1px solid #ccc;
		border-radius: 3px;
		opacity: 1;
	}
	
	input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
		{
		-webkit-appearance: none;
		margin: 0;
	}
	
	#price {
		text-align: right;
	}
	
	.won {
		line-height: 32px;
		margin-left: 5px;
	}
	
	.min_price {
		font-size: 13px;
		margin-left: 10px;
	}
	
	.hour_radio {
		display: none;
	}
	
	.hour_label {
		border: 1px solid #9E9E9E;
		border-radius: 3px;
		cursor: pointer;
		color: #616161;
		padding: 3px 10px;
	}
	
	.hour_only {
		margin-top: 10px;
		margin-bottom: 20px;
	}
	
	.hour_only>label {
		margin-right: 8px;
		padding-left: 15px;
		padding-right: 15px;
	}
	
	.hour_radio:checked+label {
		border: 1px solid #008e97;
		background-color: #008e97;
		color: #fff;
	}
	
	.tuition {
		font-size: 15px;
		font-weight: 500;
		margin: 30px 20px 0 0;
		text-align: right;
	}
	
	.tuition>span {
		margin: 10px;
	}
	
	/* 2번째 row - 수업횟수 */
	#classCount {
		text-align: center;
		width: 50px;
	}
	
	.btn_count {
		border: none;
		background-color: transparent;
		outline-color: transparent;
		cursor: pointer;
		line-height: 30px;
		font-size: 13px;
		color: #fff;
	}
	
	.fa-minus, .fa-plus {
		color: #008e97;
		border-radius: 50%;
		border: 2px solid #008e97;
		padding: 4px;
	}
	
	/* 6번째 row - 날짜 */
	.tui-datepicker-input.tui-datetime-input.tui-has-focus {
		display: none;
	}
	
	/* 위에 뜨는거 없애기 */
	.tui-datepicker-input.tui-datetime-input.tui-h.as-focus {
		display: none;
	}
	
	/* timepicker 위로 올리기 */
	.tui-timepicker {
		position: relative;
		top: -89px;
		width: 234px;
	}
	
	.tui-datepicker .tui-is-selectable.tui-is-selected, .tui-datepicker.tui-rangepicker .tui-is-selectable.tui-is-selected
		{
		background-color: #008e97;
	}
	
	.tui-calendar-body-inner th, .tui-calendar-body-inner td {
		vertical-align: middle;
	}
	
	.tui-calendar-date.tui-calendar-sun.tui-is-selectable {
		color: red;
	}
	
	.tui-calendar-date.tui-calendar-sat.tui-is-selectable {
		color: blue;
	}
	
	.selected_dates {
		position: relative;
		top: -70px;
		width: 300px;
		min-height: 356px;
		margin-left: 300px;
		margin-right: 27px;
		display: flex;
		flex-direction: column;
		flex-wrap: wrap;
		justify-content: flex-start;
		height: 410px;
	}
	
	.selected_date {
		border: 1px solid #9E9E9E;
		border-radius: 3px;
		padding: 10px 10px 10px 0px;
		width: 200px;
		text-align: center;
		letter-spacing: 1px;
		margin-bottom: 5px;
		margin-right: 10px;
		user-select: none;
	}
	
	.selected_date:hover {
		border: 1px solid #008e97;
	}
	
	.selected_date::after {
		content: " X";
		position: absolute;
		margin-left: 5px;
		cursor: pointer;
	}
	
	.selected_date:hover::after {
		color: #008e97;
	}
	
	/* time picker */
	#timepicker-selectbox-step {
		position: absolute;
	}
	
	/* 3번째 row - 총 수업료 */
	.con_explain {
		margin-bottom: 10px;
	}
	
	.total_tuition_box {
		background-color: #E0E0E0;
		overflow: hidden;
		color: #424242;
		padding: 20px;
		border-radius: 3px;
		margin-right: 26px;
	}
	
	.total_tuition_box span {
		margin: 5px;
	}
	
	.total_tuition_box_left {
		float: left;
		margin-left: 5px;
	}
	
	.total_tuition_box_right {
		float: right;
		text-align: right;
		margin-right: 5px;
	}
	
	.total_tuition_box_result {
		font-size: 18px;
		font-weight: 700;
		margin-bottom: 15px;
	}
	
	.total_tuition_box_fee {
		font-size: 17px;
		font-weight: 500;
	}
	
	/* 4번째 row - 지역 */
	.location {
		width: 120px;
		height: 27px;
		border: 1px solid #9E9E9E;
		color: #616161;
		border-radius: 3px;
		padding-left: 5px;
		cursor: pointer;
		outline-color: #008e97;
		margin-right: 2px;
	}
	
	#directInput {
		width: 460px;
		height: 23px;
		padding-left: 5px;
		border: 1px solid #9E9E9E;
		color: #616161;
		border-radius: 3px;
	}
	
	/* 5번째 row - 코멘트 */
	.explain_box {
		width: 826px;
		font-size: 12px;
		padding: 15px 0 8px 22px;
		margin-bottom: 21px;
		color: rgb(127, 127, 127);
		background-color: #F5F5F5;
	}
	
	.explain_box li {
		list-style: disc;
		margin: 0 0 8px 8px;
	}
	
	textarea {
		resize: none;
		width: 837px;
		height: 150px;
		padding: 2px 4px;
		outline-color: rgb(22, 160, 133);
	}
	
	/* 페이지 하단 버튼 */
	.btn_wrap {
		overflow: hidden;
		text-align: center;
		margin-top: 50px;
		margin-bottom: 50px;
	}
	
	.btn {
		width: 68px;
		height: 28px;
		font-size: 12px;
		font-weight: 400;
		border-radius: 2px;
		cursor: pointer;
		color: #fff;
	}
	
	.btn_grey {
		border: 1px solid rgb(127, 127, 127);
		background: rgb(127, 127, 127);
		outline-color: rgb(127, 127, 127);
	}
	
	.btn_green {
		border: 1px solid #008e97;
		background: #008e97;
		outline-color: #008e97;
	}
	
	.btn_bottom {
		width: 100px;
		height: 40px;
		margin: 0 5px;
		font-size: 14px;
	}
	
	.row_con.date {
		position: relative;
	}
	
	.row_con_date {
		margin-top: 100px;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>

	<!-- #wrapper 시작 -->
	<div id="wrapper">
		<div class="content_top">
			<h2 class="content_tit">수업 등록</h2>
			<div class="content_progress">
				<span>기본정보</span> <i class="fas fa-chevron-right"></i> <span
					class="point">가격 및 일정/장소</span> <i class="fas fa-chevron-right"></i>
				<span>수업내용</span>
			</div>
		</div>
		<p class="required">* 는 필수입력 항목입니다.</p>

		<form id="lessonInsertForm" action="/lessonInsert3.djdn" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend>수업 등록 - 가격 및 일정/장소</legend>
				<!-- 1번째 row -->
				<input type="hidden" name="categoryNo" value="${lesson.categoryNo }"/>
				<input type="hidden" name="type" value="${lesson.type }"/>
				<input type="hidden" name="personnel" value="${lesson.personnel }"/>
				<input type="hidden" name="minPersonnel" value="${lesson.minPersonnel }"/>
				<input type="hidden" name="maxPersonnel" value="${lesson.maxPersonnel }"/>
				<input type="hidden" name="title" value="${lesson.title }"/>
				<c:forEach items="${lesson.lessonImg }" var="img">
					<input type="hidden" name="lessonImg" value="${img }"/>
				</c:forEach>
				<input type="hidden" name="thumnail" value="${lesson.thumnail }"/>
				<div class="row">
					<h3 class="row_tit">
						가격/시간 <span class="point">*</span>
					</h3>
					<div class="row_con">
						<h4>시간당 가격</h4>
						<label for="price"></label> 
						<input type="number" min="0" id="price" step="1000" name="price" class="input_num_model" maxLength="6" oninput="numMaxlength(this);" pattern='\d*' />
						<span class="won">원</span> 
						<span class="point min_price"> 최소 가격은 1,000원입니다.</span>
						<h4>1회당 수업시간</h4>
						<div class="hour_only">
							<input type="radio" value="1" name="roundHour" id="oneHour" class="hour_radio" /> 
							<label for="oneHour" class="hour_label">1시간</label>
							<input type="radio" value="2" name="roundHour" id="twoHour" class="hour_radio" /> 
							<label for="twoHour" class="hour_label">2시간</label>
							<input type="radio" value="3" name="roundHour" id="threeHour" class="hour_radio" /> 
							<label for="threeHour" class="hour_label">3시간</label>
							<input type="radio" value="4" name="roundHour" id="fourHour" class="hour_radio" /> 
							<label for="fourHour" class="hour_label">4시간</label>
							<input type="radio" value="5" name="roundHour" id="fiveHour" class="hour_radio" /> 
							<label for="fiveHour" class="hour_label">5시간</label>
							<input type="radio" value="6" name="roundHour" id="sixHour" class="hour_radio" /> 
							<label for="sixHour" class="hour_label">6시간</label>
						</div>
						<div class="hour_minute">
							<input type="radio" value="1.5" name="roundHour" id="oneThirty" class="hour_radio" /> 
							<label for="oneThirty" class="hour_label">1시간 30분</label> 
							<input type="radio" value="2.5" name="roundHour" id="twoThirty" class="hour_radio" /> 
							<label for="twoThirty" class="hour_label">2시간 30분</label> 
							<input type="radio" value="3.5" name="roundHour" id="threeThirty" class="hour_radio" /> 
							<label for="threeThirty" class="hour_label">3시간 30분</label> 
							<input type="radio" value="4.5" name="roundHour" id="fourThirty" class="hour_radio" /> 
							<label for="fourThirty" class="hour_label">4시간 30분</label> 
							<input type="radio" value="5.5" name="roundHour" id="fiveThirty" class="hour_radio" /> 
							<label for="fiveThirty" class="hour_label">5시간 30분</label>
						</div>
						<p class="tuition">
							1회 수강료 : <span class="tuition_price"> 0</span>원 &nbsp;&nbsp; X <span class="tuition_hour"> 0 &nbsp;시간 </span> = <span class="point_green"><span class="onePrice"> 0</span> 원 </span>
						</p>
					</div>
				</div>
				<!-- //1번째 row -->

				<!-- 2번째 row -->
				<div class="row">
					<h3 class="row_tit">
						수업회차 <span class="point">*</span>
					</h3>
					<div class="row_con">
						<button class="btn_count btn_minus">
							<i class="fas fa-minus"></i>
						</button>
						<label for="classCount"></label> 
						<input type="number" name="round" id="classCount" class="input_num_model" value="1" readonly />
						<button class="btn_count btn_plus">
							<i class="fas fa-plus"></i>
						</button>
					</div>
				</div>
				<!-- //2번째 row -->

				<!-- 3번째 row -->
				<div class="row">
					<h3 class="row_tit">
						수업가능날짜 <span class="point">*</span>
					</h3>
					<div class="row_con date">

						<div class="row_con_date">
							<div class="tui-datepicker-input tui-datetime-input tui-h  as-focus">
								<input type="text" id="datepicker-input" aria-label="Date-Time"/>
								<span class="tui-ico-date"></span>
							</div>
							<div id="dateWrapper" style="margin-top: -1px;"></div>
							<table>
								<tbody>
									<tr>
										<td>
											<div id="timepicker-selectbox-step"></div>
										</td>
									</tr>
								</tbody>
							</table>

						</div>

						<ul class="selected_dates">

						</ul>
					</div>
				</div>
				<!-- //3번째 row -->

				<!-- 4번째 row -->
				<div class="row">
					<h3 class="row_tit">총 수업료</h3>
					<div class="row_con">
						<p class="con_explain">총 수업료는 (시간당 가격 X 1회당 수업시간 X 수업횟수)로 계산됩니다.</p>
						<p class="con_explain">수수료는 총 수업료의 10% 입니다.</p>
						<div class="total_tuition_box">
							<div class="total_tuition_box_left">
								<span><span class="total_tuition_box_left_price">0</span>원 </span> X <span class="total_tuition_box_left_hour"> 0시간 </span> X <span class="total_tuition_box_left_count"> 1</span>회
							</div>
							<div class="total_tuition_box_right">
								<div class="total_tuition_box_result">
									총 <span class="point total_price"> 0</span>원
								</div>
								<div class="total_tuition_box_fee">
									수수료 <span class="point_bold total_price_commission"> 0</span>원
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- //4번째 row -->

				<!-- 5번째 row -->
				<div class="row">
					<h3 class="row_tit">
						수업장소(대표) <span class="point">*</span>
					</h3>
					<div class="row_con">
						<label for="sido"></label> 
						<select name="sidoCd" id="sido" class="location">
							<option>시/도</option>
							<c:forEach items="${sidoFirst }" var="sidoFirst">
							<option value="${sidoFirst.addressNo }">${sidoFirst.address }</option>
							</c:forEach>
						</select> 
						<label for="gugun"></label> 
						<select name="addressNo" id="gugun" class="location">
							<option>선택</option>
						</select> 
						<label for="detailAddress"></label> 
						<select id="detailAddress" class="location">
							<option value="">상세 위치 선택</option>
							<option value="협의">협의 후 결정</option>
							<option value="입력">직접 입력</option>
						</select> 
						<label for="directInput"></label> 
						<input type="text" name="detailAddress" id="directInput" placeholder="직접 입력" autocomplete="off" />
					</div>
				</div>
				<!-- //5번째 row -->

				<!-- 6번째 row -->
				<div class="row">
					<h3 class="row_tit">장소 및 추가비용 코멘트 / 학생에게 전달할 말</h3>
					<div class="row_con">
						<div class="explain_box">
							<ul>
								<li>스터디룸, 준비물 등 추가비용이 있을 경우 반드시 입력해주세요.</li>
							</ul>
						</div>
						<label for="comment"></label>
						<textarea id="" name="message" placeholder="스터디룸, 준비물 등 추가비용이 있을 경우 반드시 입력해주세요."></textarea>
					</div>
				</div>
				<!-- //6번째 row -->

				<!-- 페이지 하단 버튼 -->
				<div class="btn_wrap">
					<button class="btn btn_bottom btn_grey" type="button" onclick="history.go(-1)">이전으로</button>
					<button type="submit" class="btn btn_bottom btn_green">다음으로</button>
				</div>

			</fieldset>
		</form>
	</div>
	<!-- //#wrapper -->
	
	<script type="text/template" id="sidoSecondTmpl">
		<@ _.each(guguns,function(gugun) { @>
			<option value="<@=gugun.addressNo@>"><@=gugun.address@></option>
		<@ }) @>
	</script>
	
	<c:import url="/WEB-INF/template/footer.jsp"></c:import>
	
	<script src="/js/underscore-min.js"></script>
	<script src="/js/moment-with-locales.js"></script>
	<script src="/js/tui-date-picker.js"></script>
	<script src="/js/tui-time-picker.js"></script>
	
	<script>
		_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
	
		const $subMenuTop = $(".sub_menu_top");
		const $price = $("#price");
		let $hour = $(".hour_radio");
		const $btnPlus = $(".btn_plus");
		const $btnMinus = $(".btn_minus");
		let $classCount = $("#classCount");
		let count = 1;
		const $directInput = $("#directInput");
		const $detailAddress = $("#detailAddress");

		/* header */
		$subMenuTop.on("click", function(e) {
			e.preventDefault();
			$(this).children(".sub_menu").toggleClass("on");
			$(this).siblings(".sub_menu_top").children(".sub_menu").removeClass("on");
		});

		/* 시간당 가격 e,.,- 입력 막기 */
		$price.keydown(function(e) {
			if (e.keyCode == 69 || e.keyCode == 107 || e.keyCode == 187 || e.keyCode == 109 || e.keyCode == 189 || e.keyCode == 110 || e.keyCode == 190) {
				return false;
			}
		});

		/* 시간당 가격 입력 글자 수 제한 */
		function numMaxlength(e) {
			if (e.value.length > e.maxLength) {
				e.value = e.value.slice(0, e.maxLength);
			}
		}

		/* 수업횟수 + 버튼 */
		$btnPlus.click(function(e) {
			e.preventDefault();
			if ($classCount.val() < 20) {
				count++;
				$classCount.val(count);
				console.log($classCount.val());
				$(".total_tuition_box_left_count").text(count);
				toCal();
			}//if end
			
			if ($(".total_tuition_box_left_count").text() == "20") {
				$(this).hide();
			}//if end
		});

		/* 수업횟수 - 버튼 */
		$btnMinus.click(function(e) {
			e.preventDefault();
			$btnPlus.show();
			if ($classCount.val() < 2) {
				$btnMinus.prop("disabled", true);
			} else {
				$btnMinus.prop("disabled", false);
				count--;
				$classCount.val(count);
				$(".total_tuition_box_left_count").text(count);
				toCal();
			}
			$btnMinus.prop("disabled", false);
		});

		/* 가격, 시간 입력 시 글자 자동 변경 */
		function numberWithCommas(x) {
			x = x.toString();
			var pattern = /(-?\d+)(\d{3})/;
			while (pattern.test(x))
				x = x.replace(pattern, "$1,$2");
			return x;
		}

		$hour.on("click", function() {
			let hour = Number($(this).val());
			$(".tuition_hour,.total_tuition_box_left_hour").text(numberWithCommas(hour) + "시간");
			oneCal();
			toCal();
		});

		$(".input_num_model").on("keyup", function() {
			let price = Number($(this).val());
			$(".tuition_price,.total_tuition_box_left_price").text(numberWithCommas(price));
			oneCal();
			toCal();
		});

		function oneCal() {
			let price = Number($(".input_num_model").val());
			let hour = Number($(".hour_radio:checked").val());
			$(".onePrice").text(numberWithCommas(price * hour));
			if ($(".onePrice").text() == "NaN") {
				$(".onePrice").text("0");
			}
		}

		function toCal() {
			let price = Number($(".input_num_model").val());
			let hour = Number($(".hour_radio:checked").val());
			let count = Number($("#classCount").val());
			
			$(".total_price").text(numberWithCommas(price * hour * count));
			$(".total_price_commission").text(numberWithCommas(price * hour * count / 10));
			
			if ($(".total_price").text() == "NaN" || $(".total_price_commission").text() == "NaN") {
				$(".total_price").text("0");
				$(".total_price_commission").text("0");
			}
		}

		/* 수업날짜 */
		//클릭한 여러 개의 날짜를 저장하는 배열 선언
		const dates = [];
		const now = moment();
		// 6개월 후까지 나오게하기
		const range1 = [ new Date(), now.add(6, 'M') ];

		// date picker
		var datepicker = new tui.DatePicker('#dateWrapper', {
			/*date: new Date(),*/
			input : {
				element : '#datepicker-input',
				format : 'yyyy-MM-dd'
			},
			showAlways : true,
			language : "ko",
			selectableRanges : [ range1 ]
		});

		// drawDate - 달력에 선택된 날짜 표시
		function drawDate() {
			$(".tui-calendar-date").removeClass("tui-is-selected");
			
			$(dates).each(function() {
				const timestamp = parseInt(this);
				$(".tui-calendar-date").each(function() {
					if (timestamp == this.dataset.timestamp) {
						$(this).addClass("tui-is-selected");
					}
				});
			});//each end
		}

		// bind the 'draw' event
		datepicker.on('draw', function(event) {
			drawDate();
		});

		//날짜 중복선택 - 달력에 표시
		$("body").on("click", ".tui-is-selectable", function() {

			let timestamp = this.dataset.timestamp;

			$(".selected_date").each(function() {
				let selectedTimestamp = this.dataset.timestamp;
				if (selectedTimestamp == timestamp) {
					$(this).remove();
				}
			});

			if ($(this).hasClass("tui-is-selected")) {
				//index 얻어와서 splice메서드 사용 -> 선택해제
				const idx = _.indexOf(dates, timestamp);
				//console.log(dates);
				dates.splice(idx, 1);
				//console.log(dates);
			} else {
				if ($classCount.val() > dates.length) {
					dates.push(timestamp);
					let date = new Date(timestamp * 1);
					let selectedYear = date.getFullYear();
					let selectedMonth = date.getMonth() + 1;
					let selectedDate = date.getDate();
					let selectedDay = selectedYear +"년 " + selectedMonth  +"월 "+ selectedDate  + "일" +" "+ tpSelectboxWithStep.getHour()+"시" + tpSelectboxWithStep.getMinute()+"분";
	                let dayBox = $("<li class='selected_date'>").text(selectedDay).attr("data-timestamp",timestamp);
	                let inputBox = $("<input type='hidden' name='startDate'>").val(selectedYear+ "-" + selectedMonth+ "-"+selectedDate + " " + tpSelectboxWithStep.getHour() + ":" + tpSelectboxWithStep.getMinute() + ":00.0")
					
	               // console.log(tpSelectboxWithStep.getHour());
	               // console.log(tpSelectboxWithStep.getMinute());
	                
	                $(".selected_dates").append(dayBox)
	                $(".selected_date").last().append(inputBox);
	               // console.log(dates);
	               // console.log(timestamp);
	             
	                /* 리스트 뜨는거 배열해서 넣기 */
	                $(".selected_dates").html($(".selected_date").sort(function(a, b){
	        			return $(a).data("timestamp") - $(b).data("timestamp"); 
	        		}));
				} else {
					alert("수업횟수만큼만 선택 가능합니다.");
				}
			}
			displayDate();
		});

		datepicker.on("change", displayDate);

		function displayDate() {
			$(".tui-calendar-date").removeClass("tui-is-selected");

			$(dates).each(function() {
				const timestamp = parseInt(this);
				$(".tui-calendar-date").each(function() {
					if (timestamp == this.dataset.timestamp) {
						$(this).addClass("tui-is-selected");
					}
				});
			});//each end
		}

		//선택된 날짜 li 클릭 시 제거
		$(".selected_dates").on("click", "li", function() {
			console.log(dates);
			let timestamp = this.dataset.timestamp;
			const idx = _.indexOf(dates, timestamp);
			console.log("idx:" + idx);
			dates.splice(idx, 1);
			console.log(dates);
			drawDate();
			$(this).remove();

		});

		//time picker
		var tpSelectboxWithStep = new tui.TimePicker('#timepicker-selectbox-step', {
			initialHour : 19,
			initialMinute : 30,
			// inputType: 'selectbox',
			hourStep : 2,
			minuteStep : 30
		});

    	let sidoSecondTempl = _.template($("#sidoSecondTmpl").html());
		let $gugun = $("#gugun");
    	
    	$("#sido").change(function () {
	        let addressNo = $(this).val();
	        $.ajax({
	        	url:"/ajax/sidoInsert.djdn",
	        	type:"get",
	        	data:{addressNo:addressNo},
	        	error : function() {
	        		alert("두번째 시도 출력 오류");
	        	},
	        	success : function(json) {
	        		console.log(json);
	        		$gugun.html(sidoSecondTempl({guguns:json}));
	        	}
	        });
	    });

		// 장소 '직접 입력' 선택 시 input 등장
		$(function() {
			$directInput.hide();
			$detailAddress.change(function() {
				if ($detailAddress.val() == "입력") {
					$directInput.show();
				} else {
					$directInput.hide();
					$directInput.val("");
				}
			});
		});
	</script>
</body>
</html>