<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>다재다능 수업등록 - 기본정보</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<style>
	/* setting */
	body, input, button, textarea {
		margin: 0;
		font-family: 'Noto Sans KR', sans-serif;
		color: #424242;
	}
	
	legend {
		position: absolute;
		width: 1px;
		height: 1px;
		margin: -1px;
		overflow: hidden;
	}
	
	label {
		cursor: pointer;
	}
	
	input, button, textarea {
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
		min-height: 30px;
		padding: 32px 0 32px 30px;
		font-size: 14px;
	}
	
	.row:nth-child(3), .row:nth-child(4) {
		line-height: 30px;
	}
	
	/* 1번째 row - 수업카테고리 */
	h4 {
		line-height: 31px;
		font-size: 15px;
		font-weight: 500;
		margin: 4px 0;
	}
	
	h4:nth-child(1) {
		margin-top: 0;
	}
	
	.category_box {
		width: 900px;
		display: flex;
		justify-content: flex-start;
		align-content: center;
		flex-wrap: wrap;
	}
	
	.category_box:nth-child(2) {
		margin-bottom: 20px;
	}
	
	.radio_category {
		display: none;
	}
	
	.label_category {
		border: 1px solid #616161;
		border-radius: 3px;
		cursor: pointer;
		color: #616161;
		padding: 6px 10px;
		margin: 5px;
	}
	
	.radio_category:checked+label {
		border: 1px solid #008e97;
		background-color: #008e97;
		color: #fff;
	}
	
	.sub_category_box {
		display: none;
	}
	
	/* 2번째 row - 수업형태 */
	input[type="radio"] {
		cursor: pointer;
	}
	
	#multiple {
		margin-left: 14px;
	}
	
	/* 3번째 row - 수업참여인원 */
	#group {
		margin-left: 46px;
	}
	
	.group_personnel_box {
		display: none;
		margin-top: 15px;
	}
	
	.group_personnel_txt {
		margin-right: 5px;
	}
	
	.radio_personnel {
		display: none;
	}
	
	.label_personnel {
		border: 1px solid #ccc;
		padding: 2px 15px;
		margin: 0 -2px;
	}
	
	.min_personnel.on, .max_personnel.on {
		border: 1px solid #008e97;
		background-color: #008e97;
		color: #fff;
	}
	
	.min_personnel:hover, .max_personnel:hover {
		border: 2px solid #008e97;
	}
	
	.radio_personnel:disabled+label {
		background-color: #E0E0E0;
	}
	
	.min_people_box_msg {
		display: none;
		color: red;
		font-size: 12px;
		margin-left: 10px;
	}
	
	/* 4번째 row - 수업제목 */
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
	
	.input_txt_model {
		font-size: 12px;
		width: 65%;
		line-height: 27px;
		float: left;
		height: 27px;
		padding-left: 7px;
		vertical-align: top;
		color: #333;
		border: 1px solid #ccc;
		opacity: 1;
	}
	
	.txt_count_all {
		font-size: 12px;
		line-height: 27px;
		margin-left: 10px;
	}
	
	/* 5번째 row - 커버이미지 */
	.img_box_info {
		margin-top: 30px;
		margin-bottom: -5px;
		font-size: 13px;
	}
	
	.thumbnail {
		width: 300px;
		height: 200px;
		border: 1px solid lightgray;
	}
	
	.thumbnail img {
		width: 100%;
		height: 100%;
		display: block;
	}
	
	.img_box {
		overflow: hidden;
	}
	
	#lessonImg {
		display: none;
	}
	
	.img_item {
		position: relative;
		width: 100px;
		height: 100px;
		border: 1px solid #424242;
		display: block;
		font-size: 24px;
		line-height: 100px;
		float: left;
		text-align: center;
		margin: 15px 10px 15px 0;
		list-style: none;
	}
	
	.lesson_img {
		width: 100%;
		height: 100%;
	}
	
	.img_cover {
		width: 100px;
		height: 100px;
		position: absolute;
		background-color: rgba(0, 0, 0, 0.5);
		top: 0;
		left: 0;
		display: none;
	}
	
	.btn_delete {
		border: 0;
		background-color: transparent;
		border-radius: 0;
		outline: none;
		position: absolute;
		right: 0;
		top: 0;
		word-spacing: 2px;
	}
	
	/* 페이지 하단 버튼 */
	.btn {
		width: 68px;
		height: 28px;
		font-size: 12px;
		font-weight: 400;
		border-radius: 2px;
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
		outline: 0;
	}
	
	#btnAdd {
		display : none;
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
            <span class="point">기본정보</span> <i class="fas fa-chevron-right"></i>
            <span>가격 및 일정/장소</span> <i class="fas fa-chevron-right"></i>
            <span>수업내용</span>
        </div>
    </div>
    <p class="required">* 는 필수입력 항목입니다.</p>

    <form id="lessonInsertForm" action="/lessonInsert2.djdn" method="post" enctype="multipart/form-data">
        <fieldset>
            <legend>수업 등록</legend>
            <!-- 1번째 row -->
            <div class="row">
                <h3 class="row_tit">
                    수업카테고리
                    <span class="point">*</span>
                </h3>
                <div class="row_con">
                    <h4>큰 카테고리</h4>
                    <div class="category_box">
                    
                    <!-- varStatus - for돌리면 숫자가 계속 1씩 추가 되는거 -->
                    <c:forEach items="${upper }" var="upper" varStatus="status">
                        <input type="radio" name="upperCategory" id="upperCategory${status.index}" class="radio_category upper_category" value="${upper.categoryNo }"/>
                        <label for="upperCategory${status.index}" class="label_category">${upper.name }</label>
                    </c:forEach>
                    </div>
                    <div class="sub_category_box">
                        <h4>작은 카테고리</h4>
                        <div class="category_box sub_box">
                            
               
                        </div>
                    </div>
                </div>
            </div><!-- //1번째 row -->

            <!-- 2번째 row -->
            <div class="row">
                <h3 class="row_tit">
                    수업형태
                    <span class="point">*</span>
                </h3>
                <div class="row_con">
                    <input type="radio" name="type" id="oneDay" value="O"/>
                    <label for="oneDay">원데이클래스</label>
                    <input type="radio" name="type" id="multiple" value="M"/>
                    <label for="multiple">다회차 수업</label>
                </div>
            </div><!-- //2번째 row -->

            <!-- 3번째 row -->
            <div class="row">
                <h3 class="row_tit">
                    수업참여인원
                    <span class="point">*</span>
                </h3>
                <div class="row_con">
                    <input type="radio" name="personnel" id="oneToOne" value="P"/>
                    <label for="oneToOne">1:1 수업</label>
                    <input type="radio" name="personnel" id="group" value="G"/>
                    <label for="group">그룹 수업</label>
                    <div class="group_personnel_box">
                        <div class="min_people_box">
                            <span class="group_personnel_txt">최소 인원</span>
                            <input type="radio" name="minPersonnel" id="minTwo" value="2" class="radio_personnel"/>
                            <label for="minTwo" class="label_personnel min_personnel">2</label>
                            <input type="radio" name="minPersonnel" id="minThree" value="3" class="radio_personnel"/>
                            <label for="minThree" class="label_personnel min_personnel">3</label>
                            <input type="radio" name="minPersonnel" id="minFour" value="4" class="radio_personnel"/>
                            <label for="minFour" class="label_personnel min_personnel">4</label>
                            <input type="radio" name="minPersonnel" id="minFive" value="5" class="radio_personnel"/>
                            <label for="minFive" class="label_personnel min_personnel">5</label>
                            <input type="radio" name="minPersonnel" id="minSix" value="6" class="radio_personnel"/>
                            <label for="minSix" class="label_personnel min_personnel">6</label>
                            <span class="min_people_box_msg">최소 인원 먼저 선택해주세요.</span>
                        </div>
                        <div class="max_people_box">
                            <span class="group_personnel_txt">최대 인원</span>
                            <input type="radio" name="maxPersonnel" id="maxTwo" value="2" class="radio_personnel" disabled/>
                            <label for="maxTwo" class="label_personnel max_personnel">2</label>
                            <input type="radio" name="maxPersonnel" id="maxThree" value="3" class="radio_personnel" disabled/>
                            <label for="maxThree" class="label_personnel max_personnel">3</label>
                            <input type="radio" name="maxPersonnel" id="maxFour" value="4" class="radio_personnel" disabled/>
                            <label for="maxFour" class="label_personnel max_personnel">4</label>
                            <input type="radio" name="maxPersonnel" id="maxFive" value="5" class="radio_personnel" disabled/>
                            <label for="maxFive" class="label_personnel max_personnel">5</label>
                            <input type="radio" name="maxPersonnel" id="maxSix" value="6" class="radio_personnel" disabled/>
                            <label for="maxSix" class="label_personnel max_personnel">6</label>
                        </div>
                    </div>
                </div>
            </div><!-- //3번째 row -->

            <!-- 4번째 row -->
            <div class="row">
                <h3 class="row_tit">
                    수업제목
                    <span class="point">*</span>
                </h3>
                <div class="row_con">
                    <div class="explain_box">
                        <ul>
                            <li>공백포함 최소 20자 ~ 최대 50자</li>
                        </ul>
                    </div>
                    <label for="classTit"></label>
                    <input type="text" name="title" id="classTit" class="input_txt_model" placeholder="수업 제목을 작성해주세요." maxlength="49" autocomplete="off"/>
                    <span class="txt_count_all"><span class="txt_count">0</span>/50</span>
                </div>
            </div><!-- //4번째 row -->

            <!-- 5번째 row -->
            <div class="row">
                <h3 class="row_tit">
                    커버이미지
                    <span class="point">*</span>
                </h3>
                <div class="row_con">
                    <div class="explain_box">
                        <ul>
                            <li>최소 1장 이상 등록</li>
                            <li>저작권에 위배되는 사진은 사용 불가</li>
                        </ul>
                    </div>
                    <h4>썸네일</h4>
                    <div class="thumbnail">
                        <img src="img/default.png" alt="썸네일"/>
                        <input type="hidden" id="thumnail_input" name="thumnail" value=""/>
                    </div>
                    <p class="img_box_info">※ 이미지는 최대 13개 까지 넣을 수 있습니다. <span class="point"> (첫번째 올린 이미지는 썸네일이 됩니다.)</span></p>
                    <div class="img_box">
                        <ul class="img_list">

                        </ul>
                        <label class="img_item">
                            <i class="fas fa-plus"></i>
                            <input id="btnAdd" type="file" title="추가"/>
                        </label>
                    </div>
                </div>
            </div><!-- //5번째 row-->

            <!-- 페이지 하단 버튼 -->
            <div class="btn_wrap">
                <button class="btn btn_bottom btn_grey btn_cancel">취소</button>
                <button type="submit" class="btn btn_bottom btn_green">다음으로</button>
            </div><!-- //페이지 하단 버튼 -->

        </fieldset>
    </form>
</div>
<!-- //#wrapper -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>

<!-- template -->
<script type="text/template" id="subCateTempl">
	<@ _.each(subs,function(sub) { @>
		<input type="radio" name="categoryNo" id="<@=sub.categoryNo@>" class="radio_category" value="<@=sub.categoryNo@>"/>
    	<label for="<@=sub.categoryNo@>" class="label_category"><@=sub.name@></label>
	<@ }) @>
</script>
	
<script type="text/template" id="adImgTempl">
    <li class="img_item">
        <div class="img_cover">
            <button type="button" class="btn_delete">X</button>
        </div>
        <img class="lesson_img" src="/upload/<@=img.imageName@>"/>
        <input type="hidden" name="lessonImg" value="<@=img.imageName@>"/>
    </li>
</script>

<script src="/js/underscore-min.js"></script>

<script>
	_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

    const $inputTxtModel = $(".input_txt_model");
    const $txtCount = $(".txt_count");
    const $upperCategory = $(".upper_category");
    const $subCategoryBox = $(".sub_category_box");
    const $group = $("#group");
    const $oneToOne = $("#oneToOne");
    const $groupPersonnelBox = $(".group_personnel_box");
    const $minPersonnel = $(".min_personnel");
    const $maxPersonnel = $(".max_personnel");
    const $minPeopleBoxMsg = $(".min_people_box_msg");
    const $category_box = $(".sub_box");
    
    const subCateTempl = _.template($("#subCateTempl").html());

    /* 수업 제목 글자수 count */
    $inputTxtModel.on("keyup",function(){
        $txtCount.text($(this).val().length);
    });

    /* 카테고리 선택 */
    $upperCategory.click(function () {
    	let categoryNo = $(this).val();
    	$.ajax({
    		url:"/ajax/subCategory.djdn",
    		type:"GET",
    		data : {
    			categoryNo : categoryNo
    		},
    		error : function() {
    			alert("서브카테고리 로딩 실패!");
    		},
    		success : function(json) {
    			$category_box.html(subCateTempl({subs:json}));
    		}
    	});
        $subCategoryBox.show();
    });

    /* 1:1수업 선택 */
    $oneToOne.click(function () {
        $groupPersonnelBox.hide();
        $minPersonnel.removeClass("on");
        $maxPersonnel.removeClass("on");
        $maxPersonnel.siblings("input").prop("disabled",true);
    });

    /* 그룹수업 선택 */
    $group.click(function () {
        $groupPersonnelBox.show();
    });

    /* 최소인원 선택 */
    $minPersonnel.click(function () {
        let minNum = $(this).text();
        $minPersonnel.removeClass("on");
        $(this).addClass("on");
        $maxPersonnel.siblings("input").prop("disabled",false);

        $maxPersonnel.each(function () {
            if(minNum > $(this).text()) {
                $(this).prev().prop("disabled",true);
                $(this).removeClass("on");
                $minPeopleBoxMsg.hide();
            } else {
                $(this).prev().prop("disabled",false);
            }//if~else end
        });
    });

    /* 최대인원 선택 */
    $maxPersonnel.click(function () {
        if($(this).prev().prop("disabled")==false) {
            $maxPersonnel.removeClass("on");
            $(this).addClass("on");
            $minPeopleBoxMsg.hide();
        } else {
            $minPeopleBoxMsg.show();
            if($minPersonnel.hasClass("on")) {
                $minPeopleBoxMsg.text("최소 인원보다 큰 인원수를 선택해주세요.");
            }//if end
        }//if~else end
    });

    /* 그룹 인원 mouseenter */
    $maxPersonnel.mouseenter(function () {
        if($(this).prev().prop("disabled")==false) {
            $(this).addClass("hover");
        }
    });
    
    /* 그룹 인원 mouseleave */
    $maxPersonnel.mouseleave(function () {
        if($(this).prev().prop("disabled")==false) {
            $(this).removeClass("hover");
        }
    });

    /* 커버이미지 */
    const adImgTemp = _.template($("#adImgTempl").html());
    const $imgBox = $(".img_list");
    const $btnAdd = $("#btnAdd");
    const $imgList = $(".img_list");
    const $imgItem = $(".img_item");
    const $btnDelete = $(".btn_delete");
    const $lessonImg = $("#lessonImg");

    $btnAdd.on("change",function() {
    	const file = this.files[0];
       	console.log("선택한 파일 접근 : " + file);
       	const formData = new FormData();
       	formData.append("fileImg", file, file.name);
       	console.log(formData);
    	
    	$.ajax({
	        url:"/ajax/adImgList.djdn",
	        type : "POST",
	        dataType:"json",
			contentType:false,//multipart/form-data니까
			processData:false,//multipart/form-data니까
			data:formData,//multipart/form-data니까
	        error:function(){
	            alert("이미지 업로드 실패");
	        },
	        success:function(json){
	        	if($(".img_list li").length < 13) {
	        		//이미지 박스에 붙이기
	           		$imgBox.append(adImgTemp({img:json}));
	                
	                //썸네일 이미지로 등록
	                let firstImg = $(".img_item img").eq(0).attr("src");
	                $(".thumbnail img").attr("src",firstImg);
	                $("#thumnail_input").val($(".img_item input").eq(0).val());
	            } else {
	                $("#btnAdd").hide();
	                $imgBox.append(adImgTemp({img:json}));
	            }//if~else() end
	        }
        });//$ajax end
    });

    $(document).on("click", ".btn_delete", function (e) {
        /*var index = $(this).attr("idx");
        tag[index] = "";*/
        $(this).parents('.img_item').remove();
        
        if($(".img_list li").length==0) {
            $(".thumbnail img").attr("src","img/default.png");
        }//if end
        
        let firstImg = $(".img_item img").eq(0).attr("src");
        $(".thumbnail img").attr("src",firstImg);
        
        if($(".img_list li").length < 14) {
            $("#btnAdd").show();
        }//if end
    });

    $(".img_list").on("mouseenter","li",function () {
        $(this).children(".img_cover").show();
    });
    
    $(".img_list").on("mouseleave","li",function () {
        $(this).children(".img_cover").hide();
    });

    $(".btn_cancel").on('click',function () {
        confirm("수업 등록을 취소하시겠습니까?");
    });
    
</script>
</body>
</html>