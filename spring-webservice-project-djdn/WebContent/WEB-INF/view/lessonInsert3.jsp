<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>다재다능 수업등록 - 수업내용</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<style>
	/* setting */
	body, input, button, textarea {
		margin: 0;
		font-family: 'Noto Sans KR', sans-serif;
		color: #424242;
	}
	
	input, textarea, button {
		outline-color: #008e97;
		border-radius: 3px;
	}
	
	textarea {
		border-color: #ccc;
	}
	
	button {
		cursor: pointer;
		color: #fff;
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
		position: relative;
		max-width: 1080px;
		margin: 0 auto 300px auto;
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
	
	.required {
		text-align: right;
		font-size: 10px;
		padding: 10px 0;
		color: red;
		border-bottom: 1px solid #E0E0E0;
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
		padding: 32px 0 32px 30px;
	}
	
	/* 1번째 row - 수업소개 */
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
	}
	
	/* 3번째 row - 커리큘럼 */
	h4 {
		line-height: 31px;
		font-size: 14px;
		font-weight: 500;
		margin: 4px 0;
	}
	
	h4:nth-child(1) {
		margin-top: 0;
	}
	
	.date {
		margin-left: 1px;
		color: #757575;
	}
	
	/* 4번째 row - 수업태그 */
	.input_txt_model {
		font-size: 12px;
		width: 254px;
		line-height: 27px;
		float: left;
		height: 27px;
		padding-left: 7px;
		vertical-align: top;
		color: #333;
		border: 1px solid #ccc;
		opacity: 1;
	}
	
	#tag {
		margin-right: 10px;
	}
	
	.tag_limit_txt {
		font-size: 12px;
		color: #fff;
		line-height: 31px;
	}
	
	.tag_list_area {
		margin: 10px 0 0 0;
	}
	
	#tagList li {
		display: inline-block;
		margin: 0 5px 0 0;
		font-size: 12px;
	}
	
	li.tag_item {
		padding: 4px 7px;
		color: #008e97;
		border: 1px solid #008e97;
		border-radius: 3px;
	}
	
	.btn {
		width: 68px;
		height: 28px;
		font-size: 12px;
		font-weight: 400;
	}
	
	.btn_grey {
		border: 1px solid rgb(127, 127, 127);
		background: rgb(127, 127, 127);
		outline-color: rgb(127, 127, 127);
	}
	
	.btn_green {
		border: 1px solid #008e97;
		background: #008e97;
	}
	
	.btn_tag_delete {
		color: #424242;
		font-size: 12px;
		font-weight: 500;
		margin-left: 8px;
		cursor: pointer;
	}
	
	.btn_tag_delete_all {
		width: 80px;
		margin-top: 10px;
	}
	
	/* 5번째 row - 수업 맛보기 영상 */
	.class_preview {
		width: 837px;
		margin-bottom: 10px;
	}
	
	.btn_preview_list {
		margin-top: 10px;
	}
	
	/* 페이지 하단 버튼 */
	.btn_wrap {
		overflow: hidden;
		text-align: center;
		margin-top: 50px;
	}
	
	.btn_bottom {
		width: 100px;
		height: 40px;
		margin: 0 5px;
		font-size: 14px;
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
				<span>기본정보</span> <i class="fas fa-chevron-right"></i> 
				<span>가격 및 일정/장소</span> <i class="fas fa-chevron-right"></i> 
				<span class="point">수업내용</span>
			</div>
		</div>
		<p class="required">* 는 필수입력 항목입니다.</p>

		<form id="lessonInsertForm" action="/lessonInsertDB.djdn" method="post">
			<fieldset>
				<legend>수업 등록 - 수업내용</legend>

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
				<input type="hidden" name="price" value="${lesson.price }"/>
				<input type="hidden" name="roundHour" value="${lesson.roundHour }"/>
				<input type="hidden" name="round" value="${lesson.round }"/>
				<c:forEach items="${lesson.startDate }" var="startDate"> 
					<input type="hidden" name="startDate" value="${startDate }"/>
				</c:forEach>
				<input type="hidden" name="addressNo" value="${lesson.addressNo }"/>
				<input type="hidden" name="detailAddress" value="${lesson.detailAddress }"/>
				<input type="hidden" name="message" value="${lesson.message }"/>
				
				<div class="row">
					<h3 class="row_tit">
						수업소개 <span class="point">*</span>
					</h3>
					<div class="row_con">
						<div class="explain_box">
							<ul>
								<li>수업소개 : 수업목표 / 수업진행방식 / 예상 결과물 / 수업 후 기대할 수 있는 발전 / 튜터님만의 장점 등</li>
							</ul>
						</div>
						<label> 
						<textarea name="introduction" placeholder="수업소개는 멘티가 제일 많이 확인하는 부분입니다. 정성을 다해 작성해주세요."></textarea>
						</label>
					</div>
				</div>
				<!-- //1번째 row -->

				<!-- 2번째 row -->
				<div class="row">
					<h3 class="row_tit">
						수업대상 <span class="point">*</span>
					</h3>
					<div class="row_con">
						<label> 
						<textarea name="target" placeholder="멘토님의 수업을 수강하기에 적합한 수업대상에 대해 알려주세요."></textarea>
						</label>
					</div>
				</div>
				<!-- //2번째 row -->

				<!-- 3번째 row -->
				<div class="row">
					<h3 class="row_tit">
						커리큘럼 <span class="point">*</span>
					</h3>
					<div class="row_con">
					<c:forEach var="i" begin="1" end="${lesson.round }">
						<h4>
							<span class="round">${i }</span>회차 │ <span class="date"> ${lesson.startDate[i-1] }</span>
						</h4>
						<label> 
						<textarea name="curriculumContent" placeholder="커리큘럼을 입력해주세요."></textarea>
						</label>
						</c:forEach>
					</div>
				</div>
				<!-- //3번째 row -->

				<!-- 4번째 row -->
				<div class="row">
					<h3 class="row_tit">
						수업태그 <span class="point">*</span>
					</h3>
					<div class="row_con">
						<div class="explain_box">
							<ul>
								<li>태그 3개까지 입력가능하며, 띄어쓰기는 반영되지 않습니다. (쉼표구분)</li>
							</ul>
						</div>
						<div>
							<input type="hidden" value="" id="rdTag" /> 
							<input type="text" id="tag" size="7" maxlength="15" class="input_txt_model" placeholder="#다재다능" autocomplete="off" />
							<span class="tag_limit_txt">최대 15글자까지 입력가능합니다.</span>
						</div>
						<div class="tag_list_area">
							<ul id="tagList">

							</ul>
							<button class="btn btn_grey btn_tag_delete_all">
								<i class="fas fa-undo-alt"></i> 모두삭제
							</button>
						</div>
					</div>
				</div>
				<!-- //4번째 row -->

				<!-- 5번째 row -->
				<div class="row">
					<h3 class="row_tit">수업 맛보기 영상</h3>
					<div class="row_con">
						<div class="explain_box">
							<ul>
								<li>일반 웹페이지 주소가 아닌, 유튜브 영상 URL을 입력해주세요.</li>
								<li>입력방법 : 유튜브 영상 상세페이지에서 공유 버튼 클릭 → 팝업창에 나온 URL 복사 → 복사한 URL을 아래 입력창에 붙여넣기</li>
							</ul>
						</div>
						<div class="preview_box">
							<input type="text" name="url" class="input_txt_model class_preview" placeholder="예) https://youtube.be/1sboNBkTMuU" autocomplete="off" />
						</div>
						<button type="button" class="btn btn_green btn_preview_list">+ 추가</button>
					</div>
				</div>
				<!-- //5번째 row -->

				<!-- 페이지 하단 버튼 -->
				<div class="btn_wrap">
					<button class="btn btn_bottom btn_grey">이전으로</button>
					<button type="submit" class="btn btn_bottom btn_green">등록하기</button>
				</div>
				<!-- //페이지 하단 버튼 -->

			</fieldset>
		</form>
	</div>
	<!-- //#wrapper -->
	
	<c:import url="/WEB-INF/template/footer.jsp"></c:import>

	<!-- template -->
	<script type="text/template" id="curriculumTmpl">
        <@ _.each(curriculums,function(curriculum) { @>
        <h4><span class="round">1</span>회차 │ <span class="date"> <@=curriculum.date@></span> </h4>
        <label>
            <textarea name="curriculum" placeholder="커리큘럼을 입력해주세요."></textarea>
        </label>
        <@ }) @>
    </script>

	<script src="/js/underscore-min.js"></script>
	
	<script>
		_.templateSettings = {interpolate : /\<\@\=(.+?)\@\>/gim, evaluate : /\<\@([\s\S]+?)\@\>/gim, escape : /\<\@\-(.+?)\@\>/gim};
		
		const $btnPreviewList = $(".btn_preview_list");

		/* 태그 */
		const tag = [];
		let counter = 0;

		$("#tag").on("keydown", function() {
			if ($(this).val().length >= $(this).attr('maxlength')) {
				$(".tag_limit_txt").css("color", "red");
			} else {
				$(".tag_limit_txt").css("color", "#fff");
			}
		});

		$("#tag").on("keypress",function(e) {
	        if($("#tagList li").length<=2) {
	            if(e.key === "Enter" || e.keyCode == 32) {
	                let tagText = $(this).val();
	                e.preventDefault();
	                $("#tagList").append("<li class='tag_item'><span class='tag_value'>"+"#"+tagText+"</span><span class='btn_tag_delete'>x</span></li>").append($("<input type='hidden' name='tag'>").val(tagText));
	                //console.log($("#tagList li").length); 
	                $(this).val("");
	                $("#tagList li").each(function(){
	                    if($(this).text() == $(this).siblings().text()) {
	                        alert("중복값은 들어갈 수 없습니다.");
	                        $(this).remove();
	                    }//if end
	                });
	            }//if end
	        } else if($("#tagList li").length==3) {
                alert("태그는 최대 3개까지 입력 가능합니다");
                e.preventDefault();
            }//if~else end
	    });

		$(document).on("click", ".btn_tag_delete", function(e) {
			var index = $(this).attr("idx");
			tag[index] = "";
			$(this).parent().remove();
		});

		//모두 삭제
		$(".btn_tag_delete_all").click(function(e) {
			e.preventDefault();
			tag.length = 0;
			$("#tagList").empty();
		});

		/* 맛보기 영상 추가 */
		$btnPreviewList.on("click", function(e) {
			e.preventDefault();
			$(".class_preview").eq(0).clone().val("").appendTo(".preview_box");
			if ($(".class_preview").length == 4) {
				$(this).hide();
			} else {
				$(this).show();
			}
		});
	</script>
</body>
</html>