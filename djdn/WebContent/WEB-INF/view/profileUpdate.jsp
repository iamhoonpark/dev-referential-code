	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>다재다능 | 내 정보 수정</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<style>
	/* wrapper */
	#wrapper {
		max-width: 1080px;
		margin: auto;
		margin-bottom: 350px;
		padding-top: 100px;
		padding-bottom: 0;
	}
	
	.content_tit {
		border-bottom: 1px solid rgb(184, 184, 184);
		font-weight: bold;
		font-size: 24px;
		line-height: 90px;
		color: #424242;
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
		border-bottom: 1px solid lightgray;
	}
	
	.row_tit {
		float: left;
		width: 100px;
		height: 30px;
		line-height: 30px;
		font-size: 16px;
		font-weight: 500;
		padding: 32px 26px;
		color: #424242;
	}
	
	.row_con {
		position: relative;
		float: right;
		width: 894px;
		color: #424242;
		padding: 32px 0 32px 30px;
	}
	
	.row_con .user_info {
		line-height: 30px;
		padding-left: 5px;
	}
	
	.box_user_update {
		display: none;
	}
	
	.box_user_nickname .user_nickname, .user_email {
		display: inline-block;
	}
	
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
	
	#profilePhoto {
		width: 100px;
		height: 100px;
		border-radius: 50%;
		margin-left: 20px;
	}
	
	.photo_btn_area {
		margin-left: 8px;
		padding-top: 21px;
	}
	
	.row_con input[type="file"] {
		position: absolute;
		width: 0;
		height: 0;
		padding: 0;
		overflow: hidden;
		border: 0;
	}
	
	.row_con label {
		display: inline-block;
		width: 60px;
		height: 26px;
		font-size: 12px;
		line-height: 26px;
		font-weight: 500;
		text-align: center;
		color: #fff;
		border: 1px solid #008e97;
		vertical-align: middle;
		background: #008e97;
		cursor: pointer;
		border-radius: 3px;
		margin-left: 8px;
	}
	
	.photo_btn_area .btn1 {
		padding: 5px 10px;
		margin-left: 20px;
	}
	
	/* 버튼 css */
	.btn {
		cursor: pointer;
		background: #008e97;
		outline: none;
		border: none;
		border-radius: 3px;
		color: #fff;
		font-size: 12px;
		font-weight: 400;
	}
	
	.btn1 {
		width: 62px;
		height: 30px;
		padding: 0;
		margin-left: 30px;
		display: inline-block;
	}
	
	.btn2 {
		width: 50px;
		height: 35px;
		border: none;
		background-color: #008e97;
		color: #fff;
		cursor: pointer;
		margin-left: 10px;
	}
	
	.row_con .btn_pwd_update {
		line-height: 30px;
		display: inline-block;
		text-align: center;
	}
	
	.btn_pwd_update {
		width: 100px;
		margin: 0;
	}
	
	.btn3 {
		width: 80px;
		height: 35px;
		font-size: 16px;
	}
	
	.btn3.btn_success {
		margin-left: 15px;
	}
	
	.btn_delete {
		background-color: rgb(127, 127, 127);
		color: #fff;
	}
	
	/* 팝업 css(공통) */
	.box_cover {
		width: 100%;
		height: 100%;
		position: fixed;
		left: 0;
		top: 0;
		z-index: 1000;
		background-color: rgba(0, 0, 0, .7);
		display: none;
	}
	
	.box_cover .cover_wrap_email {
		display: none;
	}
	
	.box_cover .cover_wrap_phone {
		display: none;
	}
	
	.box_cover .cover_wrap {
		width: 500px;
		background-color: #fff;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
	}
	
	.cover_wrap_update .cover_wrap_tit {
		background-color: #008e97;
		color: #fff;
		padding-left: 20px;
		border-bottom: 1px solid rgb(204, 204, 204);
		margin-bottom: 30px;
		position: relative;
	}
	
	.cover_wrap_update h2 {
		line-height: 70px;
		font-size: 24px;
		font-weight: 500;
	}
	
	.cover_wrap_update .exit {
		position: absolute;
		top: 15px;
		right: 20px;
		font-size: 40px;
		cursor: pointer;
		color: #fff;
	}
	
	.cover_wrap_update .cover_wrap_form {
		padding: 0 20px;
	}
	
	.box_cover_wrap {
		margin-bottom: 40px;
	}
	
	.box_cover_wrap h3 {
		font-size: 20px;
		margin-bottom: 15px;
	}
	
	.box_cover_wrap.cover_btn {
		text-align: center;
	}
	
	.box_cover_wrap .current_info {
		font-size: 18px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	
	/* email 팝업 css */
	.box_cover_wrap #changeEmail {
		margin-bottom: 12px;
	}
	
	.box_cover_wrap #changeEmail, .box_cover_wrap #numberEmail {
		outline-color: #008e97;
	}
	
	.box_cover_wrap .change_email {
		width: 248px;
		height: 29px;
		padding-left: 5px;
	}
	
	.box_cover_wrap .send_email {
		font-size: 14px;
	}
	
	/* phone 팝업 css */
	.box_cover_wrap .phone_info {
		font-size: 15px;
		font-weight: 300;
		color: #aaa;
		line-height: 20px;
	}
	
	.box_cover_wrap #changePhone {
		margin-bottom: 12px;
	}
	
	.box_cover_wrap #changePhone, .box_cover_wrap #numberPhone {
		outline-color: #008e97;
	}
	
	.box_cover_wrap .change_phone {
		width: 248px;
		height: 29px;
		padding-left: 5px;
	}
	
	/* 유효성검사 css */
	.error {
		color: #008e97;
		font-size: 14px;
		margin-top: 5px;
	}
	
	/* 유효성검사 css */
        .phoneError{
        	color : #008e97;
            font-size: 14px;
			display:none;           
            
        }
	
	input {
		outline-color: #008e97;
	}
	
	/* 회원탈퇴 css */
	.dropout_row {
		text-align: right;
		font-size: 14px;
		color: #424242;
		padding-top: 5px;
		border-bottom: none;
	}
	
	.dropout_row .dropout {
		color: #008e97;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>
	<!-- wrapper 시작 -->
	<div id="wrapper">
		<h2 class="content_tit">내 정보 수정</h2>
		<form action="/updateProfileImg.djdn" method="post" enctype="multipart/form-data">
			<div class="row">
				<h3 class="row_tit">프로필 사진</h3>
				<div class="row_con">
					<div class="profile_photo">
						<img id="profilePhoto" src="/profile/${loginMember.profileImg}" alt="프로필 사진"/>
					</div>
					<div class="photo_btn_area">
						<input type="file" id="file" name="profile"/> 
						<label for="file" class="btn btn1">사진변경</label>
					</div>
				</div>
			</div>
			<!-- //row(프로필사진) -->
		</form>
		<!--프로필 form end  -->

		<div class="row">
			<h3 class="row_tit">사용자 이름</h3>
			<div class="row_con">
				<span class="user_info">${loginMember.name}</span>
			</div>
		</div>
		<!-- //row(사용자이름) -->
		
		<div class="row">
			<h3 class="row_tit">사용자 아이디</h3>
			<div class="row_con">
				<span class="user_info">${loginMember.id}</span>
			</div>
		</div>
		<!-- //row(사용자아이디) -->
		
		<div class="row">
			<h3 class="row_tit">별명</h3>
			<div class="row_con">
				<div class="box_user_nickname">
					<span class="user_info user_nickname">${loginMember.nickname}</span>
					<button class="btn btn1 btn_update">수정</button>
				</div>
				<!-- //box_user_nickname -->
				<div class="box_user_update">
				
					<form action="/updateNickname.djdn" method="post">
						<input type="text" name="nickname" id="nickname" class="input_txt_model input_user_nickname"
							placeholder="${loginMember.nickname}" autocomplete="off">
						<button class="btn btn1 btn_success" id="btnSuccess">완료</button>
					</form>
					
					<div class="error">2자~8자 사이의 영어 대소문자, 한글로 입력해주세요.</div>
				</div>
				<!-- //box_user_update -->
			</div>
			<!-- //row_con -->
		</div>
		<!-- //row(별명) -->
		
		<div class="row">
			<h3 class="row_tit">비밀번호</h3>
			<div class="row_con">
				<a href="/passwordCheck.djdn" class="btn btn1 btn_update btn_pwd_update">비밀번호 변경</a>
			</div>
		</div>
		<!-- //row(비밀번호) -->
		
		<div class="row">
			<h3 class="row_tit">이메일</h3>
			<div class="row_con">
				<span class="user_info user_email">${loginMember.email}</span>
				<button class="btn btn1 btn_update btn_email_update">수정</button>
			</div>
			<!-- //row_con -->
		</div>
		<!-- //row(이메일) -->
		
		<div class="row">
			<h3 class="row_tit">전화번호</h3>
			<div class="row_con">
				<div class="box_user_phone">
					<span class="user_info user_phone">${loginMember.phone}</span>
					<button class="btn btn1 btn_update">수정</button>
				</div>
				<!-- //box_user_nickname -->
			</div>
			<!-- //row_con -->
		</div>
		<!-- //row(전화번호) -->
		
		<div class="row dropout_row">
			계정을 비활성화하셔야 하나요? 
			<a href="/dropout.djdn?memberNo=${loginMember.memberNo }" class="dropout">지금 처리하기</a>
		</div>
		<!-- //row(회원탈퇴) -->
	</div>
	<!-- //wrapper -->
	
	<div class="box_cover">
		<div class="cover_wrap cover_wrap_email">
			<div class="cover_wrap_update">
				<div class="cover_wrap_tit">
					<h2>이메일 수정</h2>
					<div class="exit">
						<i class="far fa-times-circle"></i>
					</div>
				</div>
				<!-- //cover_wrap_tit -->
				<div class="cover_wrap_form">
					<div class="box_cover_wrap">
						<h3>현재 이메일</h3>
						<div class="current_email">
						${loginMember.email }
							<%-- <%=loginMember.getEmail() %> --%>
							이메일
						</div>
					</div>
					<!-- //cover_email -->
					<div class="box_cover_wrap">
						<h3>변경할 이메일</h3>
						<input id="changeEmail" name="changeEmail" class="change_email" placeholder="변경할 이메일 입력" 
							   autocomplete="off"/>
						<button class="btn2 email_btn">인증</button>
						<div class="send_email">입력하신 이메일로 인증번호를 보내드립니다.</div>
					</div>
					<!-- //cover_email -->
					<div class="box_cover_wrap">
						<input id="numberEmail" name="numberEmail" class="change_email" placeholder="인증번호 입력" />
					</div>
					<!-- //cover_email -->
				</div>
				<!-- //cover_wrap_form -->
				<div class="box_cover_wrap cover_btn">
					<button type="button" class="btn btn3 btn_delete">취소</button>
					<!--
                        -->
					<button class="btn btn3 btn_success btn_success_email">완료</button>
				</div>
				<!-- //cover_email -->
			</div>
			<!-- //cover_wrap_update -->
		</div>
		<!-- //cover_wrap_email(이메일팝업) -->
		
		<div class="cover_wrap cover_wrap_phone">
			<div class="cover_wrap_update">
				<div class="cover_wrap_tit">
					<h2>전화번호 수정</h2>
					<div class="exit">
						<i class="far fa-times-circle"></i>
					</div>
				</div>
				<!-- //cover_wrap_tit -->
				<form action="/updatePhone.djdn" method="POST">
					<div class="cover_wrap_form">
						<div class="box_cover_wrap">
							<h3>현재 전화번호</h3>
							<div class="current_info popup_phone">${loginMember.phone}</div>
							<div class="phone_info">아이디, 비밀번호 찾기 등 본인확인이 필요한 경우 또는 유료결제 등 사용할 휴대전화 입니다.</div>
						</div>
						<!-- //cover_email -->
						<div class="box_cover_wrap">
							<h3>변경할 전화번호</h3>
							<input id="changePhone" name="phone" class="change_phone" placeholder="변경할 전화번호 입력" />
							<!--  <button class="btn2 phone_btn">인증</button> -->
		                   <div class="phoneError">예) 010-1239-7846 방식으로 입력해주세요.</div> 
						</div>
						<!-- //cover_email -->
						<!-- <div class="box_cover_wrap">
                        <input id="numberPhone" name="numberPhone" class="change_phone" placeholder="인증번호 입력"/>
                    	</div>//cover_email -->
					</div>
					<!-- //cover_wrap_form -->
					<div class="box_cover_wrap cover_btn">
						<button type="button" class="btn btn3 btn_delete">취소</button>
						<!--
                			-->
						<button class="btn btn3 btn_success btn_success_phone">완료</button>
					</div>
					<!-- //cover_phone -->
				</form>
				<!--전화번호 폼 end  -->
			</div>
			<!-- //cover_wrap_update -->
		</div>
		<!-- //cover_wrap_phone(전화번호팝업) -->
	</div>
	<!-- //box_cover -->

<script type="text/template" id="profileTmpl">
	<img id="profilePhoto" src="/profile/<@=profile.profileImg@>" alt="프로필 사진">
</script>
<script type="text/template" id="nicknameTmpl">
	<input type="text" name="nickname" id="nickname" class="input_txt_model input_user_nickname"
           placeholder="<@=nickname.nickname @>" autocomplete="off">
    <button class="btn btn1 btn_success" id="btnSuccess">완료</button>
    <div class="error">2자~8자 사이의 영어 대소문자, 한글로 입력해주세요.</div>
</script>

    <c:import url="/WEB-INF/template/footer.jsp"></c:import>
<script src="/js/underscore-min.js"></script>
<script>
	_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
    const $fileBtn = $("#file");
    const $profilePhoto = $("#profilePhoto");
    const profileTmpl = _.template($("#profileTmpl").html());
    const nicknameTmpl = _.template($("#nicknameTmpl").html());
    
    $fileBtn.change(function () {
		
    	const file = this.files[0];
    	if(!file.type.includes("image/")) {
			alert("이미지를 선택해주세요");
			$profile.val("");
			return false;
    	}//if() end
    	
    	const formData = new FormData();
    	formData.append("uploadImg", file, file.name);
    	
        $.ajax({
            url : "/ajax/updateProfileImg.djdn",
            type : "POST",
            dataType : "json",
            contentType : false,
            processData : false,
            data : formData, 
            error : function () {
                alert("실패");
            },
            success : function (json) {
                $profilePhoto.attr("src","/upload/"+json.imageName);
                $("#headProfileImg").attr("src","/upload/"+json.imageName);
            }
        });//$ajax() end
    });//$fileBtn change() end
    

    
    const $exit = $(".exit");
    const $emailPhone = $("#changeEmail, #changePhone, #numberEmail, #numberPhone");
    const $changeEmail = $("#changeEmail");
    const $changePhone = $("#changePhone");
    const $numberEmail = $("#numberEmail");
    const $btnSuccessEmail = $(".btn_success_email");
	
    //별명 정규표현식
    const nicknameRegExp = /^[a-zA-Z가-힣]{2,8}$/;
    //전화번호 정규표현식
    const phonenumberRegExp = /^\d{3}-\d{3,4}-\d{4}$/;

    const $nicknameUpdateBtn = $(".box_user_nickname .btn_update");
    const $phoneUpdateBtn = $(".box_user_phone .btn_update");
    const $userNicknameBox = $(".box_user_nickname");
    const $userUpdateBox = $(".box_user_update");
    const $nickname = $("#nickname");
    const $btnSuccess = $("#btnSuccess");
    const $error = $(".error");
    const $phoneError = $(".phoneError");
    const $btnEmailUpdate = $(".btn_email_update");
    const $deleteBtn = $(".btn_delete");
    const $cover = $(".box_cover");
    const $coverEmail = $(".cover_wrap_email");
    const $coverPhone = $(".cover_wrap_phone");
    const $allCover = $(".cover_wrap");
    const $userNickname = $(".user_nickname");
    const $document = $(document);
    const $btnSuccessPhone= $(".btn_success_phone");
    const $numberPhone=$("#numberPhone");
    //별명변경 버튼 클릭 이벤트
    $nicknameUpdateBtn.click(function () {
        $userNicknameBox.hide();
        $userUpdateBox.show();
    });/* 
    
    //별명을 입력하고 보낼 때 이벤트(유효성검사포함)
    $(".box_user_update").on("click","#btnSuccess",function () {
        const nickname = $("#nickname").val();
        if(!nicknameRegExp.test(nickname)) {
        	$(".error").css("color","red");
        	$("#nickname").focus();
            return false;
        }else {
        	$.ajax({
        		url : "/ajax/updateMyInfo.djdn",
        		type : "GET",
        		dataType : "json",
        		data : {nickname : nickname,type:"N"},
        		error : function() {
					alert("점검 중");
				},
				success : function(json) {
					if(json.flag) {
						$userNickname.text(json.nickname);
						getMyInfo();
					}//if() end
				}
        	});//$.ajax() end
			$(".box_user_nickname").show();
	        $(".box_user_update").hide();
        }//if~else end
    });//$nicknameUpdateBtn click() end */
 
    
  //폰번호을 입력하고 보낼 때 이벤트(유효성검사포함)
    $(".btn_success_phone").click(function () {
        const phoneNum = $("#changePhone").val();
        if(!phonenumberRegExp.test(phoneNum)) {
        	 $phoneError.css("color","red").show();
        	$("#changePhone").focus();
            return false;
        }
    });//$phonenumberUpdateBtn click() end */
    
    const $emailBtn = $(".email_btn");
    $emailBtn.click(function() {
    	const email = $changeEmail.val();
    	$.ajax({
    		url : "/ajax/sendEmail.djdn",
    		type : "GET",
    		dataType : "json",
    		data : {email : email},
    		error : function() {
				alert("점검 중");
			},
			success : function(json) {
				console.log(json);
				alert(json.msg);
			}
    	});//$.ajax() end
	});//$emailBtn click() end
    
 	$btnSuccessEmail.click(function() {
    	const email = $changeEmail.val();
		if($numberEmail.val()=="0645"){
			$.ajax({
	    		url : "/ajax/updateEmail.djdn",
	    		type : "GET",
	    		dataType : "json",
	    		data : {email : email},
	    		error : function() {
					alert("점검 중");
				},
				success : function(json) {
						$(".user_email").text(json.email);
				        $cover.hide();
				        $allCover.hide();
				}
	    	});//$.ajax() end
		}else {
			alert("번호가 틀렸습니다.");
			return false;
		}
	}); 
	
	//2020-08-08 이성진 폰번호 업데이트
/* 	$btnSuccessPhone.click(function() {
    	const phone = $changePhone.val();
		if($numberPhone.val()=="1234"){
			$.ajax({
	    		url : "/ajax/updateProfilePhone.djdn",
	    		type : "GET",
	    		dataType : "json",
	    		data : {email : email, type:"P"},
	    		error : function() {
					alert("점검 중");
				},
				success : function(json) {
					if(json.flag) {
						$(".user_phone").text(json.phone);
				        $cover.hide();
				        $allCover.hide();
				        //기본값 초기화
				        $emailPhone.val("");
				        getMyInfo();
					}//if() end
				}
	    	});//$.ajax() end
		}else {
			alert("번호가 틀렸습니다.");
			return false;
		}
	}); */
	
	
	
	//이메일, 닉네임, 프로필사진, 핸드폰 
    //getMyInfo();
	
   /*  function getMyInfo() {
		$.ajax({
			url : "/ajax/getMyInfo.djdn",
			type : "GET",
			dataType : "json",
			error : function() {
				alert("점검중");
			},
			success : function(json) {
				$(".profile_photo").html(profileTmpl({profile:json}));
				$(".user_email").text(json.email);
				$(".current_email").text(json.email);
				$userUpdateBox.html(nicknameTmpl({nickname:json}));
				$userNickname.text(json.nickname);
				$(".user_phone").text(json.phone);
				$(".popup_phone").text(json.phone);
			}
		});//$.ajax() end
	}//getProfileImg() end */
	
	
	
    //이메일수정, 전화번호 수정 버튼 클릭시 팝업이 열림
    $btnEmailUpdate.click(function () {
        $cover.show();
        $allCover.hide();
        $coverEmail.show();
    })
    $phoneUpdateBtn.click(function () {
        $cover.show();
        $allCover.hide();
        $coverPhone.show();
    });
    //팝업이 열렸을 때 닫는 이벤트
    $deleteBtn.click(exit);
    $cover.click(exit);
    $exit.click(exit);
    $document.keydown(function (e) {
        if(e.keyCode==27) {
            exit();
        }//if() end
    });
    //커버박스 이벤트버블링 제어
    $allCover.click(function (e) {
        e.stopPropagation();
    })
    //팝업창이 열렸을 때 닫는 함수
    function exit() {
        if($changeEmail.val().length>=1) {
            if(!confirm("이메일변경을 그만두시겠습니까?")) {
                return false;
            }//if() end
        }//if() end
        if($changePhone.val().length>=1) {
            if(!confirm("전화번호변경을 그만두시겠습니까?")) {
                return false;
            }//if() end
        }//if() end
        $cover.hide();
        $allCover.hide();

        //기본값 초기화
        $emailPhone.val("");
    }

</script>
</body>
</html>