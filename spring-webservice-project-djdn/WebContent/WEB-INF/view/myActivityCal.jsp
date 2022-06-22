<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>다재다능 | 내 수강 목록</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<link rel="stylesheet" href="/css/main.css" />
<style>
	a {
		text-decoration: none;
		color: #000;
	}
	
	#wrapper {
		width: 1080px;
		margin: auto;
		padding-top: 100px;
	}
	
	/* 내 수업 목록 페이지 제목 css */
	.wrapper_class_tit {
		line-height: 90px;
		font-size: 24px;
		font-weight: bold;
		border-bottom: 1px solid rgb(184, 184, 184);
		margin-bottom: 30px;
	}
	
	.wrapper_class::after {
		content: "";
		width: 0;
		height: 0;
		clear: both;
	}
	
	.wrapper_class .class_list {
		width: 940px;
	}
	
	.class_list .box_list_top {
		width: 1080px;
		height: 40px;
		line-height: 40px;
	}
	
	.box_list_top .calendar_btn {
		display: block;
		line-height: 40px;
		text-align: center;
		padding: 0 5px;
	}
	
	.class_list .class_list_tit {
		font-size: 20px;
		float: left;
	}
	
	/* btn css */
	.calendar_btn {
		float: right;
	}
	
	.btn {
		width: 100px;
		height: 40px;
		background-color: #008e97;
		color: #ffffff;
		border: none;
		border-radius: 3px;
		cursor: pointer;
	}
	
	/* 캘린더 css */
	.class_list .box_calendar {
		width: 1080px;
		margin-top: 20px;
		margin-bottom: 50px;
	}
	
	#calendar {
		font-family: 'Noto Sans KR', sans-serif;
		width: 1080px;
		margin: 0 auto;
	}
	
	div.fc-event-title-container {
		line-height: 25px;
	}
	
	.fc .fc-toolbar-title {
		font-weight: bold;
		margin-right: 200px;
	}
	
	.fc-daygrid-block-event .fc-event-time, .fc-daygrid-block-event .fc-event-title
		{
		padding-left: 5px;
	}
	
	.fc .fc-col-header-cell-cushion {
		padding: 6px 4px;
	}
	
	.fc .fc-daygrid-day.fc-day-today {
		background-color: rgba(22, 160, 133, 0.2);
	}
	
	.fc-daygrid-day.fc-day.fc-day-sat {
		background-color: rgba(0, 0, 255, 0.05);
		color: blue;
	}
	
	.fc-daygrid-day.fc-day.fc-day-sat .fc-daygrid-day-number {
		color: blue;
	}
	
	.fc-daygrid-day.fc-day.fc-day-sun {
		background-color: rgba(255, 0, 0, 0.05);
		color: red;
	}
	
	.fc-daygrid-day.fc-day.fc-day-sun .fc-daygrid-day-number {
		color: red;
	}
	
	.fc .fc-button-primary {
		border-color: #008e97;
		background-color: #008e97;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>
	
	<div id="wrapper">
		<div class="wrapper_tit">
			<h2 class="wrapper_class_tit">내 수강 목록</h2>
		</div>
		<!-- //wrapper_tit -->
		<div class="wrapper_class">
			<div class="class_list box_proceeding_class">
				<div class="box_list_top">
					<h3 class="class_list_tit">진행중인 수업</h3>
					<a href="/myActivity.djdn" class="btn calendar_btn">수강목록보기</a>
				</div>
				<div class="box_calendar">
					<div id="calendar"></div>
				</div>
			</div>
			<!-- //class_list -->
		</div>
		<!-- //wrapper_class -->
	</div>
	<!-- //wrapper -->
	
	<c:import url="/WEB-INF/template/footer.jsp"></c:import>
	
	<script src="/js/main.js"></script>
	<script src="/js/moment-with-locales.js"></script>
	
	<script>
		let today = moment();
		const year = today.year();
		let month = today.month() + 1;
		let date = today.date();
		let string = "";
		
		if (month < 10) {
			month = "0" + month;
		}//if() end
		
		if (date < 10) {
			date = "0" + date;
		}//if() end
		
		document.addEventListener('DOMContentLoaded', function() {
			
			var calendarEl = document.getElementById('calendar');
					
			var calendar = new FullCalendar.Calendar(calendarEl, {
				locale : 'ko',
				headerToolbar : {
					left : 'prevYear,prev,next,nextYear today',
					center : 'title',
					right : 'dayGridMonth',
				},
				initialDate : year + '-' + month + '-' + date,
				navLinks : true, // can click day/week names to navigate views
				editable : false, //달력에 있는 이벤트를 움직이게 하려면 true 아니면 false
				dayMaxEvents : true, // allow "more" link when too many events,
				buttonText : {
					today : "오늘",
					month : "월별"
				},
				events : function(start, callback) {
					$.ajax({
						url: "/ajax/myActivityCalAjax.djdn",
						type: "GET",
						dataType: "json",
						error: function () {
							alert("서버 점검중입니다.");
						},
						success: function (json) {
							let events = [];
							$.each(json, function() {
								events.push({
									title : this.title,
									start : moment(this.startTimestamp).format("YYYY-MM-DD"),
									url : "/lessonDetail.djdn?lessonNo="+this.lessonNo
								});
							});
							callback(events);
						}//success end
					});//ajax end
				}
			});
			calendar.render();
		});
	</script>
</body>
</html>