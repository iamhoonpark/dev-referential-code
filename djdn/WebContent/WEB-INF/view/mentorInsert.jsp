<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>다재다능 | 멘토등록</title>
<c:import url="/WEB-INF/template/link.jsp" />
<style>
    /* setting */
    body, input, button {
        margin: 0;
        font-family: 'Noto Sans KR', sans-serif;
        color: #424242;
    }
    input, select, button {
        outline-color: #008e97;
        border-radius: 3px;
    }

    /* wrapper */
    #wrapper {
        max-width: 1080px;
        margin: 0 auto;
        padding: 100px 0 95px 0;
    }
    .content_tit {
        border-bottom: 1px solid #9E9E9E;
        font-weight: bold;
        font-size: 24px;
        line-height: 90px;
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
        width: 90px;
        height: 30px;
        line-height: 30px;
        font-size: 16px;
        font-weight: 500;
        padding: 32px 31px 32px;
    }
    .row_con {
        position: relative;
        float: right;
        width: 894px;
        padding: 32px 0 32px 30px;
    }
    .point {
        color: red;
    }

    /* 1번째 row - 멘토닉네임 */
    .input_txt_model {
        font-size: 12px;
        width: 254px;
        margin-left: 8px;
        line-height: 27px;
        float: left;
        height: 27px;
        padding-left: 7px;
        vertical-align: top;
        color: #333;
        border: 1px solid #ccc;
        opacity: 1;
    }
    .input_explain {
        font-size: 11px;
        color: #616161;
        line-height: 30px;
        margin-left: 5px;
    }

    /* 2번째 row - 프로필 사진 */
    .profile_photo {
        width: 100px;
        height: 100px;
        margin-left: 20px;
    }
    #profilePhoto {
        width: 100%;
        height: 100%;
        border-radius: 50%;
    }
    .photo_btn_area {
        padding-top: 21px;
        margin-left: 28px;
    }
    .row_con input[type="file"] {
        position: absolute;
        width: 0;
        height: 0;
        padding: 0;
        overflow: hidden;
        border: 0;
    }
    .btn_label {
        display: inline-block;
        width: 66px;
        height: 26px;
        line-height: 26px;
        font-size: 12px;
        text-align: center;
        margin-left: 8px;
        color: #fff;
        border: 1px solid #008e97;
        border-radius: 3px;
        background: #008e97;
        cursor: pointer;
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

    /* 3번째 row - 신분증 */
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
    .upload_name_idcard, .upload_name_school {
        display: inline-block;
        width: 400px;
        height: 26px;
        font-size: 12px;
        padding: 0 10px;
        vertical-align: middle;
        background-color: #fff;
        border: 1px solid #fff;
        color: rgb(127, 127, 127);
    }
    .id_card_photo {
        width: 172px;
        height: 108px;
        margin: 20px 0 5px 8px;
    }
    #idCardPhoto {
        width: 100%;
        height: 100%;
    }

    /* 4번째 row - 학력사항 */
    .con_tit {
        height: 31px;
        line-height: 31px;
        font-size: 14px;
        font-weight: 500;
        float: left;
        margin-left: 8px;
    }
    .school, .major {
        float: left;
        margin-right: 8px;
    }
    select {
        width: 120px;
        height: 30px;
        border: 1px solid #aaa;
        color: #616161;
        border-radius: 3px;
        padding-left: 5px;
        cursor: pointer;
        margin-left: 8px;
        margin-right: 8px;
        font-size: 13px;
        opacity: 1;
    }
    .row_con2 {
        position: relative;
        float: right;
        width: 894px;
        color: #565656;
        padding: 0 0 32px 30px;
    }
    .btn_edu_list {
        position: absolute;
        right: 0;
    }
    .btn_edu_delete {
        right: 72px;
    }
    .btn_add_box {
        display: inline;
    }

    /* 5번째 row - 입금정보 */
    .input_num_model {
        width: 200px;
        line-height: 27px;
        height: 27px;
        vertical-align: top;
        color: #333;
        border: 1px solid #ccc;
        opacity: 1;
        margin-left: 8px;
    }
    input[type="number"]::-webkit-outer-spin-button,
    input[type="number"]::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }
    .form {
        line-height: 30px;
        font-size: 12px;
        margin-left: 5px;
        color: rgb(127, 127, 127);
    }

    /* 페이지 하단 버튼 */
    .btn_wrap {
        overflow: hidden;
        text-align: center;
        margin-top: 80px;
        margin-bottom: 300px;
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
    <!-- wrapper 시작 -->
    <div id="wrapper">
        <h2 class="content_tit">멘토 등록</h2>

        <p class="required">* 는 필수입력 항목입니다.</p>
        <form id="mentorInsertForm" action="/mentorInsert.djdn" method="post">
            <fieldset>
                <legend>멘토등록</legend>
                <!-- 1번째 row 시작 -->
                <div class="row">
                    <h3 class="row_tit">
                        멘토닉네임
                        <span class="point">*</span>
                    </h3>
                    <div class="row_con">
                        <label for="nickname" class="input_explain">최대 8글자까지 가능합니다.</label>
                        <input type="text" name="nickname" id="nickname" class="input_txt_model" maxlength="8" autocomplete="off"
                        	   placeholder="최대 8글자까지 가능합니다."/>
                    </div>
                </div><!-- //1번째 row -->

                <!-- 2번째 row 시작 -->
                <div class="row">
                    <h3 class="row_tit">
                        프로필 사진
                        <span class="point">*</span>
                    </h3>
                    <div class="row_con">
                        <div class="profile_photo">
        					<img id="profilePhoto" src="/img/default.jpg" alt="프로필 사진">
                        </div>
                        <div class="photo_btn_area">
                            <label class="btn_label" for="photoFile">사진변경</label>
                            <input type="file" id="photoFile" accept="image/*"/>
                        </div>
                    </div>
                </div><!-- //2번째 row -->

                <!-- 3번째 row 시작 -->
                <div class="row">
                    <h3 class="row_tit">
                        신분증
                        <span class="point">*</span>
                    </h3>
                    <div class="row_con">
                        <div class="explain_box">
                            <ul>
                                <li>멘티들에게 신뢰를 주기 위해 신분 인증은 필수입니다.</li>
                                <li>파일은 이미지 파일과 pdf 파일만 가능합니다.</li>
                                <li>관리자 확인 후 업로드해주신 파일은 바로 삭제됩니다.</li>
                                <li>신분증 종류 : 주민등록증 / 운전면허증 / 여권 / 등본</li>
                            </ul>
                        </div>
                        <label class="btn_label" for="idCard">업로드</label>
                        <input type="file" id="idCard" accept="image/*,.pdf"/>
                        <input class="upload_name_idcard" value="선택된 파일이 없습니다."/>
                        <div class="id_card_photo">
        					<img id="idCardPhoto" src="/img/idcardphoto.PNG" alt="신분증 사진">
                        </div>
                    </div>
                </div><!-- //3번째 row -->

                <!-- 4번째 row 시작 -->
                <div class="row">
                    <h3 class="row_tit">
                        학력사항
                    </h3>
                    <div class="row_con_box">
                        <div class="row_con_edu">
                            <div class="row_con">
                                <h4 class="con_tit">학교</h4>
                                <label>
                                    <input type="text" name="school" class="input_txt_model school" placeholder="예) 다재다능대학교" autocomplete="off"/>
                                </label>
                                <h4 class="con_tit">전공</h4>
                                <label>
                                    <input type="text" name="major" class="input_txt_model major" placeholder="예) 다재다능학과" autocomplete="off"/>
                                </label>
                                <h4 class="con_tit">졸업여부</h4>
                                <select name="graduation" class="status">
                                    <option value="">선택</option>
                                    <option value="A">재학</option>
                                    <option value="C">수료</option>
                                    <option value="G">졸업</option>
                                </select>
                            </div>
                            <div class="row_con row_con2">
                                <h4 class="con_tit">학생증 / 졸업(재학)증명서</h4>
                                <label class="btn_label">업로드
                                    <input type="file" name="proof" class="school_file" accept="image/*,.pdf"/>
                                </label>
                                <input class="upload_name_school" placeholder="선택된 파일이 없습니다."/>
                                <div class="btn_add_box">
                                    <button class="btn btn_green btn_edu_list btn_edu_add">+ 학력추가</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--<div class="row">
                    <h3 class="row_tit">
                        학력사항
                    </h3>
                    <div class="row_con_edu">
                        <div class="row_con">
                            <h4 class="con_tit">대학교</h4>
                            <label>
                                <input type="text" name="university" class="input_txt_model university" placeholder="예) 다재다능대학교" autocomplete="off"/>
                            </label>
                            <h4 class="con_tit">전공</h4>
                            <label>
                                <input type="text" name="university_major" class="input_txt_model major" placeholder="예) 다재다능학과" autocomplete="off"/>
                            </label>
                            <h4 class="con_tit">졸업여부</h4>
                            <select name="university_graduation" class="status">
                                <option value="">선택</option>
                                <option value="재학">재학</option>
                                <option value="수료">수료</option>
                                <option value="졸업">졸업</option>
                            </select>
                        </div>
                        <div class="row_con row_con2">
                            <h4 class="con_tit">학생증 / 졸업(재학)증명서</h4>
                            <label class="btn_label">업로드
                                <input type="file" name="universityCard" class="university_card" accept="image/*,.pdf"/>
                            </label>
                            <input class="upload_name_university" placeholder="선택된 파일이 없습니다."/>
                        </div>
                    </div>
                    <div class="row_con_edu">
                        <div class="row_con">
                            <h4 class="con_tit">대학원</h4>
                            <label>
                                <input type="text" name="graduate_school" class="input_txt_model university" placeholder="예) 다재다능대학교" autocomplete="off"/>
                            </label>
                            <h4 class="con_tit">전공</h4>
                            <label>
                                <input type="text" name="graduate_school_major" class="input_txt_model major" placeholder="예) 다재다능학과" autocomplete="off"/>
                            </label>
                            <h4 class="con_tit">졸업여부</h4>
                            <select name="graduate_school_graduation">
                                <option value="">선택</option>
                                <option value="재학">재학</option>
                                <option value="수료">수료</option>
                                <option value="졸업">졸업</option>
                            </select>
                        </div>
                        <div class="row_con row_con2">
                            <h4 class="con_tit">학생증 / 졸업(재학)증명서</h4>
                            <label class="btn_label">업로드
                                <input type="file" name="graduateSchoolCard" class="graduate_school_card" accept="image/*,.pdf"/>
                            </label>
                            <input class="upload_name_graduate" placeholder="선택된 파일이 없습니다."/>
                        </div>
                    </div>
                </div>--><!-- //4번째 row -->

                <!-- 5번째 row 시작 -->
                <div class="row">
                    <h3 class="row_tit">
                        입금정보
                        <span class="point">*</span>
                    </h3>
                    <div class="row_con">
                        <label class="con_tit">입금은행
                            <select name="bankNo">
                                <option value="">선택</option>
                                <option value="1">경남은행</option>
                                <option value="2">광주은행</option>
                                <option value="3">국민은행</option>
                                <option value="4">기업은행</option>
                                <option value="5">농협중앙회</option>
                                <option value="6">농협회원조합</option>
                                <option value="7">대구은행</option>
                                <option value="8">도이치은행</option>
                                <option value="9">부산은행</option>
                                <option value="10">산업은행</option>
                                <option value="11">상호저축은행</option>
                                <option value="12">새마을금고</option>
                                <option value="13">수협중앙회</option>
                                <option value="14">신한금융투자</option>
                                <option value="15">신한은행</option>
                                <option value="16">신협중앙회</option>
                                <option value="17">외환은행</option>
                                <option value="18">우리은행</option>
                                <option value="19">우체국</option>
                                <option value="20">전북은행</option>
                                <option value="21">제주은행</option>
                                <option value="22">카카오뱅크</option>
                                <option value="23">케이뱅크</option>
                                <option value="24">하나은행</option>
                                <option value="25">한국씨티은행</option>
                                <option value="26">HSBC은행</option>
                                <option value="27">SC제일은행</option>
                            </select>
                        </label>
                        <h4 class="con_tit">계좌번호</h4>
                        <label>
                            <input type="number" name="account" class="input_num_model" autocomplete="off" maxLength="20" oninput="numMaxlength(this);" pattern='\d*'/>
                        </label>
                        <span class="input_explain"> ('-'없이 입력)</span>
                    </div>
                </div><!-- //5번째 row -->

                <!-- 페이지 하단 버튼 -->
                <div class="btn_wrap">
                    <button class="btn btn_bottom btn_grey">취소</button>
                    <button type="submit" class="btn btn_bottom btn_green">등록</button>
                </div><!-- //페이지 하단 버튼 -->
            </fieldset>
        </form>
    </div><!-- //wrapper -->

    <c:import url="/WEB-INF/template/footer.jsp"></c:import>
    
    <!-- template -->
    <script type="text/template" id="profileImgTmp">
        <img id="profilePhoto" src="/upload/<@=img.fileName@>" alt="프로필 사진">
		<input type="hidden" name="profileImg" value="<@=img.fileName@>" id="profileImg"/>
    </script>

    <script type="text/template" id="idCardImgTmp">
        <img id="idCardPhoto" src="/upload/<@=img.fileName@>" alt="신분증 사진">
		<input type="hidden" name="idCard" value="<@=img.fileName@>" id="idCardImg"/>
    </script>

    <script src="/js/underscore-min.js"></script>

    <script>
    	_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
    	
        const $subMenuTop = $(".sub_menu_top");
        const imgTmp = _.template($("#profileImgTmp").html());
        const IdImgTmp = _.template($("#idCardImgTmp").html());
        const $profilePhoto = $(".profile_photo");
        const $idCardPhoto = $(".id_card_photo");
        const $idCard = $("#idCard");
        const $uploadNameIdcard = $(".upload_name_idcard");
        const $uploadNameSchool = $(".upload_name_school");
        const $schoolFile = $(".school_file");
        const $inputNumModel = $(".input_num_model");
        
        //2020-08-09 임현우
        $("#photoFile").on("change",function(){
        	const file = this.files[0];
        	
        	/* //유효성 검사
        	if(file.size==0) {
        		alert("제대로 된 파일을 선택하세요~");
        		$profile.val("");
        		return false;
        	}//if end
        	
        	if(!file.type.includes("upload/")) {
        		alert("이미지를 선택하세요~");
        		$profile.val("");
        		return false;
        	}//if end */
        	
        	const formData = new FormData();
        	formData.append("uploadImg",file,file.name);
        	
        	$.ajax({
        		url:"/mentorInsertImg.djdn",
        		type:"POST",
        		dataType:"json",
        		contentType:false,
        		processData:false,
        		data:formData,
        		error:function(){
        			alert("서버 점검중")
        		},
        		success:function(json){
        			$("#profilePhoto").attr("src","/upload/"+json.fileName);
        			$profilePhoto.html(imgTmp({img:json}));
        		}//success end
        	});//$.ajax end
        });//photoFile change() end
        
        $("#idCard").on("change",function(){
        	const file = this.files[0];
        	const formData = new FormData();
        	formData.append("uploadImg",file,file.name);
        	$(".upload_name_idcard").val(file.name);
        	
        	$.ajax({
        		url:"/mentorInsertImg.djdn",
        		type:"POST",
        		dataType:"json",
        		contentType:false,
        		processData:false,
        		data:formData,
        		error:function(){
        			alert("서버 점검중");
        		},
        		success:function(json){
        			$("#idCardPhoto").attr("src","/upload/"+json.fileName);
        			$idCardPhoto.html(IdImgTmp({img:json}));
        		}//success end
        	});//$.ajax end
        });//school_file change() end
		
        
        /* 학력증명서 파일명 */
        $("body").on('change',".school_file",function(){
            const file = this.files[0];
            const fileName = file.name;
            $(this).parent().next().val(fileName);
        });

        /* 학력사항 추가 */
        $("body").on("click",".btn_edu_add",function (e) {
            e.preventDefault();
            console.log($(".row_con_edu").length);
            if($(".row_con_edu").length < 3) {
                $(this).parents(".row_con_edu").clone().appendTo($(".row_con_box")).find(".school, .major, .upload_name_school").val("");
                $(".btn_edu_add").remove();
                $(".btn_add_box").eq($(".btn_add_box").length-1).append("<button type='button' class='btn btn_grey btn_edu_list btn_edu_delete'>- 삭제");
                $(".btn_add_box").eq($(".btn_add_box").length-1).append("<button type='button' class='btn btn_green btn_edu_list btn_edu_add'>+ 학력추가");
            } else if($(".row_con_edu").length == 3) {
                $(this).remove();
            }
        });

        $("body").on("click",".btn_edu_delete",function (e) {
            e.preventDefault();
            $(this).parents(".row_con_edu").remove();
            $(".btn_add_box").eq($(".btn_add_box").length-1).append("<button type='button' class='btn btn_green btn_edu_list btn_edu_add'>+ 학력추가");
        });

        /* 계좌번호 e,.,- 입력 막기 */
        $inputNumModel.keydown(function(e){
            if(e.keyCode == 69 || e.keyCode == 107 || e.keyCode == 187 || e.keyCode == 109 || e.keyCode == 189 || e.keyCode == 110 || e.keyCode == 190){
                return false;
            }
        });

        /* 계좌번호 입력 글자 수 제한 */
        function numMaxlength(e) {
            if(e.value.length > e.maxLength) {
                e.value = e.value.slice(0, e.maxLength);
            }
        }

    </script>
</body>
</html>