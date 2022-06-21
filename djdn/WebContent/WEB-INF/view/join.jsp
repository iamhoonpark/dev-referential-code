<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>멘토정보</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<style>
	body, input, button, textarea, select {
		font-family: "Noto Sans KR", sans-serif;
	}
	
	body {
		margin: 0;
	}
	
	ul li {
		list-style: none;
		padding: 0;
	}
	
	input {
		padding-left: 5px;
		border: none;
		outline-color: #008e97;
	}
	
	#wrapper {
		width: 1080px;
		padding-top: 100px;
		padding-bottom: 350px;
		margin: auto;
	}
	
	/* join1 css start  */
	.content {
		border: 1px solid rgb(204, 204, 204);
		width: 400px;
		position: relative;
		margin: 50px auto;
	}
	
	.signup_tit {
		line-height: 110px;
		font-size: 32px;
		text-align: center;
	}
	
	.article {
		cursor: pointer;
		margin-bottom: 25px;
	}
	
	label {
		cursor: pointer;
	}
	
	.signup_list {
		margin: auto;
		width: 320px;
	}
	
	.icon {
		color: lightgray;
		cursor: pointer;
	}
	
	.text_box {
		line-height: 17px;
		padding: 5px 10px;
		font-size: 13px;
		border: 1px solid lightgray;
		margin-top: 15px;
		margin-bottom: 25px;
		color: gray;
		border: none;
	}
	
	.btn {
		width: 320px;
		margin: auto;
		margin-top: 50px;
		margin-bottom: 40px;
		border: none;
	}
	
	.cancel_btn{
            width: 140px;
            height: 40px;
            background-color: rgb(127, 127, 127);
            border: none;
            margin-right: 0px;
            margin-left: 10px;
            cursor: pointer;
            color: #fff;
            border-radius: 3px;
            outline: none;

        }
        .okay_btn{
            width: 140px;
            height: 40px;
            background-color: rgb(127, 127, 127);
            margin-left: 0;
            border: none;
            margin-left: 0px;
            margin-right: 10px;
            cursor: pointer;
            color: #fff;
            border-radius: 3px;
            outline: none;

        }	
	
	.required {
		color: #008e97;
	}

	.optional {
		color: lightgray;
	}
	
	.allAgree {
		color: red;
		text-decoration: underline;
	}
	
	.content input {
		display: none;
	}
	
	/*join1 css end  */
	
	/*join2 css  */
	.content_second {
		border: 1px solid rgb(204, 204, 204);
		width: 780px;
		position: relative;
		margin: 100px auto;
		display: none;
	}
	
	.signup_tit {
		line-height: 110px;
		font-size: 32px;
		text-align: center;
	}
	
	.signup_list_second {
		width: 780px;
	}
	
	.signup_list_second::after {
		content: "";
		display: block;
		clear: both;
	}
	
	.signup_list1 {
		width: 400px;
		float: left;
		margin: auto;
		width: 305px;
		margin-left: 47.5px;
	}
	
	.signup_list2 {
		float: left;
		margin: auto;
		width: 305px;
		margin-left: 75px;
	}
	
	.article_second {
		width: 304px;
		height: 100px;
	}

	.label {
		width: 304px;
		height: 29px;
	}
	
	.signup_input {
		width: 295px;
		height: 38px;
		border-radius: 5px;
		text-decoration: none;
		cursor: pointer;
		border: 1px solid rgb(204, 204, 204);
	}
	
	/*이메일*/
	.box_email_search {
		height: 100px;
		margin-bottom: -10px;
	}
	
	.box_email_search label {
		height: 29px;
		display: block;
	}
	
	/* input 공통 css */
	.box_email_search #email, .box_email #emailAddress, .box_name_search #id {
		height: 38px;
		border-radius: 5px;
	}
	
	.box_email {
		width: 198px;
		line-height: 38px;
		border-radius: 5px;
		border: 1px solid rgb(204, 204, 204);
		display: inline-block;
	}
	
	.box_email .email_at, .box_email #emailAddress {
		font-size: 12px;
		color: rgb(124, 124, 124);
	}
	
	.box_email .email_at {
		display: inline-block;
		line-height: 15px;
	}
	
	.box_email #emailAddress {
		width: 71px;
		border: none;
		outline: none;
		border-radius: 1px;
		padding-left: 5px;
	}
	
	.box_email #emailAddress:read-only {
		background-color: #eee;
	}
	
	.box_email_search #email {
		outline: none;
		width: 94px;
		border: none;
	}
	
	.box_email_search #emailSelect {
		width: 100px;
		height: 43px;
		border: 1px solid rgb(204, 204, 204);
		border-radius: 5px;
	}
	/*//이메일*/
	
	/*성별*/
	.gender_tit {
		display: inline-block;
		margin-right: 20px;
	}
	
	.gender_list {
		height: 45px;
	}
	
	.gender_list label {
		cursor: pointer;
	}
	/*//성별*/
	
	.phonenumber {
		position: relative;
		width: 400px;
	}
	
	.country {
		width: 90px;
		height: 41px;
		border: 1px solid rgb(204, 204, 204);
		border-radius: 5px;
	}
	
	.country_phonenumber {
		display: inline-block;
		width: 208px;
		border: 1px solid rgb(204, 204, 204);
		border-radius: 5px;
	}
	
	#country_number {
		border: none;
		width: 30px;
	}
	
	#phonenumber {
		width: 150px;
		height: 38px;
		border: none;
		outline: none;
	}
	
	.authentication_phonenumber_btn {
		width: 94px;
		height: 38px;
		display: inline-block;
		outline: none;
		cursor: pointer;
		background-color: #008e97;
		color: #fff;
		border: none;
		border-radius: 3px;
		margin-left: 7px;
	}
	
	#authenticationPhonenumber {
		display: inline-block;
		width: 190px;
		height: 38px;
		margin-top: 7px;
		border: 1px solid rgb(204, 204, 204);
		border-radius: 5px;
	}
	
	.signup_btn_box_second {
		margin-top: 30px;
		text-align: center;
	}
	
	.signup_btn {
		background-color: rgb(127, 127, 127);
		color: #fff;
		width: 304.97px;
		height: 40px;
		border: none;
		border-radius: 3px;
		margin-bottom: 40px;
		cursor: pointer;
		outline: none;
	}
	
	.signup_btn.on {
		background-color: #008e97;
		color: #fff;
	}
	
	.error {
		color: red;
	}
	
	.success {
		color: blue;
	}
	
	p {
		font-size: 10px;
		margin-top: 5px;
		margin-left: 3px;
	}
	
	select {
		outline: none;
	}
	
	#country_number {
		outline: none;
	}
	
	.good {
		color: blue;
	}
	/*join2 css end  */
</style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>
	<!--join1 start  -->
	<div id="wrapper">
		<form action="/join.djdn" method="post" id="joinForm">
			<div class="content">
				<h2 class="signup_tit">회원가입</h2>
				<div class="signup_list">
					<div class="article">
						<input id="allAgree" class="Chk" type="checkbox" name="allAgree" value=""/> 
						<label for="allAgree">
							<i class="far fa-check-circle icon all_agree "></i> <span class="allAgree"> 모두 동의</span>
						</label>
					</div>
					<div class="article">
						<input id="serviceAgree" class="Chk son required" type="checkbox" name="service" value="Y"/> 
						<label for="serviceAgree"/>
							<i class="far fa-check-circle icon service_agree"></i> 서비스 이용약관 동의<span class="required">(필수)</span>
						</label>
						<div class="text_box">다재다능 서비스 이용과 관련하여 회사 및 이용자간의 권리,의미 등을 안내해 드립니다.</div>
					</div>
					<div class="article">
						<input id="personalInformation" class="Chk son required" type="checkbox" name="privateLocation" value="Y"/> 
						<label for="personalInformation">
							<i class="far fa-check-circle icon personal_information"></i> 개인정보 수집 및 이용에 대한 안내 <span class="required">(필수)</span>
						</label>
						<div class="text_box">서비스 이용과 관련하여 수집 이용하는 개인정보를 안내해 드립니다.</div>
					</div>
					<div class="article">
						<input id="locationInformation" class="Chk son" type="checkbox" name="location" value="Y"/> 
						<label for="locationInformation">
							<i class="far fa-check-circle icon location_information"> </i>위치정보 이용약관 동의 <span class="optional">(선택)</span>
						</label>
						<div class="text_box">위치정보 이용약관에 동의하시면, 위치를 활용한 정보 수신 등을 포함하는 위치기반 서비스를 이용할 수 있습니다.</div>
					</div>
					<div class="article">
						<input id="emailReception" class="Chk son" name="mail" type="checkbox" value="Y"/> 
						<label for="emailReception">
							<i class="far fa-check-circle icon email_reception"></i> 이벤트 등 프로모션 알림 메일 수신 <span class="optional">(선택)</span>
						</label>
					</div>
				</div>
				<div class="btn">
					<button class="cancel_btn" type="button">취소</button>
					<button class="okay_btn" type="button" disabled>확인</button>
				</div>
			</div>
			<!--join1 end  -->

			<!--join2 start  -->
			<div class="content_second">
				<h2 class="signup_tit">회원가입</h2>
				<div class="signup_list_second">
				
					<div class="signup_list1">
						<div class="article_second">
							<div class="name_label label">
								<label for="name">이름</label>
							</div>
							<input autocomplete="off" class="signup_input" type="text" id="name" name="name" placeholder="이름을 입력해 주세요" value=""/>
							<p class="msg name"></p>
						</div>
						<%-- 아이디는 ajax사용해서 중복검사 해주시면 됩니다. --%>
						<div class="article_second">
							<div class="id_label label">
								<label for="id">아이디</label>
							</div>
							<input autocomplete="off" class="signup_input" type="text" id="id" name="id" placeholder="아이디를 입력해주세요"/>
							<p class="msg id"></p>
						</div>
						<div class="article_second">
							<div class="password_label label">
								<label for="password">비밀번호</label>
							</div>
							<input autocomplete="off" class="signup_input" type="password" id="password" name="pwd" placeholder="비밀번호를 입력해주세요"/>
							<p class="msg password"></p>
						</div>
						<div class="article_second pwd_reconfirm">
							<div class="password_reconfirm_label label">
								<label for="passwordReconfirm">비밀번호 확인</label>
							</div>
							<input autocomplete="off" class="signup_input" type="password" id="passwordReconfirm" name="passwordReconfirm" placeholder="비밀번호를 재입력해주세요"/>
							<p class="msg passwordReconfirm"></p>
						</div>
					</div>
					<!--//signup_list1 end-->
					
					<div class="signup_list2">
						<div class="article_second">
							<%-- 닉네임은 중복검사 할거면 ajax사용해서 해주시면 됩니다. 안해도 상관 없습니다. --%>
							<div class="nickname_label label">
								<label for="nickname">닉네임</label>
							</div>
							<input autocomplete="off" class="signup_input" type="text" id="nickname" name="nickname" placeholder="닉네임을 입력해주세요" value=""/>
							<p class="msg nickname"></p>
						</div>
						<div class="article_second">
							<div class="box_email_search">
								<label for="email">이메일</label>
								<div class="box_email">
									<input autocomplete="off" type="text" id="email" name="email" placeholder="이메일" />
									<div class="email_at">@</div>
									<input autocomplete="off" type="text" id="emailAddress" name="emailAddress" value="naver.com" readonly />
								</div>
								<select id="emailSelect">
									<option value="content">직접입력</option>
									<option selected value="naver.com">naver</option>
									<option value="daum.net">daum</option>
									<option value="google.com">google</option>
								</select>
								<p class="email"></p>
							</div>
						</div>
						<div class="gender_list">
							<h3 class="gender_tit">성별</h3>
							<input class="gender" type="radio" name="gender" value="M" id="male" checked/>
							<label for="male">남자</label> 
							<input class="gender" type="radio" name="gender" value="F" id="female"/>
							<label for="female">여자</label>
						</div>
						<div class="phonenumber">
							<h3 class="label">휴대전화</h3>
							<select class="country" name="country">
								<option value="+82" selected>대한민국</option>
								<option value="+1">미국</option>
								<option value="+86">중국</option>
								<option value="+81">일본</option>
								<option value="+44">영국</option>
							</select>
							<div class="country_phonenumber">
								<input readonly id="country_number" type="text" name="countryNumber" value="+82"/> 
								<input autocomplete="off" id="phonenumber" name="phone" placeholder="전화번호를 입력해주세요"/>
							</div>
							<p class="phonenumber_box"></p>
							<input autocomplete="off" id="authenticationPhonenumber" type="text" name="passwordcode" placeholder="인증번호를 입력해주세요"/>
							<button type="button" class="authentication_phonenumber_btn">인증번호 받기</button>
							<p class="authentication_phonenumber"></p>
						</div>
					</div>
					<!--//signup_list2 end-->
					
				</div>
				<!--//signup_list end-->
				
				<div class="signup_btn_box_second">
					<button class="signup_btn" disabled><i class="fas fa-check"></i>가입하기</button>
				</div>
			</div>
			<!-- //.content_second end -->
		</form>
		<!--//form end-->
	</div>
	<!--join2 end  -->
	
	<c:import url="/WEB-INF/template/footer.jsp"></c:import>
	<script src="/js/underscore-min.js"></script>
	
	<script>
		//언더스코어 템플릿을 % -> @으로 변경
		_.templateSettings = {interpolate : /\<\@\=(.+?)\@\>/gim, evaluate : /\<\@([\s\S]+?)\@\>/gim, escape : /\<\@\-(.+?)\@\>/gim};

		/*join1 jquery start  */
		let $allAgree = $("#allAgree");
		let $okayBtn = $(".okay_btn");
		let $required = $("#serviceAgree") && $("#personalInformation");
		let $serviceAgree = $("#serviceAgree");
		let $personalInformation = $("#personalInformation");
		let $locationInformation = $("#locationInformation");
		let $emailReception = $("#emailReception");
		
		$(".authentication_phonenumber_btn").click(function() {
			$(".authentication_phonenumber").text("인증번호가 발송되었습니다.").addClass("success");
		});

		$allAgree.on("click", function() {
			if (!$(this).hasClass("on")) {
				/* alert("모두 동의 on 넣음");*/
				$(".Chk").prop("checked", true);
				$(".Chk").addClass("on");
				$(".icon").css("color", "red");
				$(".okay_btn").attr("disabled", false).css({"background-color" : "rgb(22, 160, 133)", "color" : "#fff"});
			} else {
				/*alert("모두 동의 on 제거");*/
				$(".Chk").removeClass("on");
				$(".Chk").prop("checked", false);
				$(".icon").css("color", "lightgray");
				$okayBtn.css({"background-color" : "gray", "color" : "rgb(170, 170, 170)"});
			}//if~else end
		});
		
		$serviceAgree.on("click", function() {
			/*alert("확인2");*/
			if (!$(this).hasClass("on")) {
				//$serviceAgree.val('Y');
				/*alert("모두 동의 on 넣음");*/
				$serviceAgree.addClass("on")/*.prop("checked",true)*/
				$(".service_agree").css("color", "red");
				validAgree();
			} else {
				//$serviceAgree.val('N');
				/*alert("모두 동의 on 제거");*/
				$serviceAgree.removeClass("on").prop("checked", false);
				$(".service_agree").css("color", "lightgray");
				$allAgree.removeClass("on").prop("checked", false);
				$(".all_agree").css("color", "lightgray");
				validAgree();
			}//if~else end

			if ($(this).hasClass("on") && $personalInformation.hasClass("on")) {
				$(".okay_btn").attr("disabled", false).css({"background-color" : "rgb(22, 160, 133)", "color" : "#fff"});
			} else {
				$okayBtn.css({"background-color" : "gray", "color" : "rgb(170, 170, 170)"});
			}//if~else end
		});
		
		$personalInformation.on("click", function() {
			// alert("확인3");
			if (!$(this).hasClass("on")) {
				$(this).val('Y');
				/*alert("모두 동의 on 넣음");*/
				$personalInformation.addClass("on").prop("checked", true);
				$(".personal_information").css("color", "red");
				validAgree();
			} else {
				/*alert("모두 동의 on 제거");*/
				$personalInformation.removeClass("on").prop("checked", false);
				$(".personal_information").css("color", "lightgray");
				$allAgree.removeClass("on").prop("checked", false);
				$(".all_agree").css("color", "lightgray");
				validAgree();
			}//if~else end
			
			if ($(this).hasClass("on") && $serviceAgree.hasClass("on")) {
				/*alert("wioefj")*/
				$(".okay_btn").attr("disabled", false).css({"background-color" : "rgb(22, 160, 133)", "color" : "#fff"});
			} else {
				$okayBtn.css({"background-color" : "gray", "color" : "rgb(170, 170, 170)"});
			}//if~else end
		});
		
		$locationInformation.on("click", function() {
			// alert("확인4");
			if (!$(this).hasClass("on")) {
				$(this).val('Y');
				/*alert("모두 동의 on 넣음");*/
				$locationInformation.addClass("on").prop("checked", true);
				$(".location_information").css("color", "red");
				validAgree();
			} else {
				/*alert("모두 동의 on 제거");*/
				$locationInformation.removeClass("on").prop("checked", false);
				$(".location_information").css("color", "lightgray");
				$allAgree.removeClass("on").prop("checked", false);
				$(".all_agree").css("color", "lightgray");
				validAgree();
			}//if~else end
		});

		$emailReception.on("click", function() {
			// alert("확인5");
			if (!$(this).hasClass("on")) {
				$(this).val('Y');
				/*alert("모두 동의 on 넣음");*/
				$emailReception.addClass("on").prop("checked", true);
				$(".email_reception").css("color", "red");
				validAgree();
			} else {
				$(this).val('N');
				/*alert("모두 동의 on 제거");*/
				$emailReception.removeClass("on").prop("checked", false);
				$(".email_reception").css("color", "lightgray");
				$allAgree.removeClass("on").prop("checked", false);
				$(".all_agree").css("color", "lightgray");
				validAgree();
			}
		});

		function validAgree() {
			let $count = $(".on:checked").length;
			if ($count == 4) {
				$allAgree.addClass("on").prop("checked", true);
				$(".all_agree").css("color", "red");
			} else {
				$allAgree.removeClass("on").prop("checked", false);
				$(".all_agree").css("color", "lightgray");
			}//if~else end
		}

		$(".okay_btn").on("click", function() {
			$(".content").hide();
			$(".content_second").show();
		});

		/*if($serviceAgree.is(":checked")&&$personalInformation.is(":checked")&&$locationInformation.is(":checked")&&$emailReception.is(":checked")){
		    $(".okay_btn").attr("disabled",false).css("background-color","rgb(22, 160, 133)")
		}*/

		/*join1 jquery end  */

		/*join2 jquery start  */
		let $nameRegExp = /^[가-힣]{2,10}$/;
		let $nicknameRegExp = /^[a-zA-Z가-힣]{2,8}$/;
		let $idRegExp = /^[a-z0-9]{4,20}$/;
		let $passwordRegExp = /^[a-z0-9]{6,16}$/;
		let $emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]){4,16}$/;
		let $phonenumberRegExp = /^\d{3}-\d{3,4}-\d{4}$/;
		let $authenticationPhonenumberRegExp = /^[0-9]{4}$/;

		let $name = $("#name");
		let $nickname = $("#nickname");
		let $id = $("#id");
		let $password = $("#password");
		let $passwordReconfirm = $("#passwordReconfirm");
		let $email = $("#email");
		let $phonenumber = $("#phonenumber");
		let $authenticationPhonenumber = $("#authenticationPhonenumber");

		let $validArr = [ false, false, false, false, false, false, false, false ];
		let count = 0;

		$name.keyup(function() {
			let $nameVal = $name.val();
			$validArr[0] = $nameRegExp.test($nameVal);
			if ($validArr[0] == false) {
				$(".name").text("유효하지 않은 이름입니다.").addClass("error");
				$name.focus();
				return false;
			} else {
				$(".name").text("").removeClass("error");
			}//if~else end
			testValid();
		});

		$id.keyup(function() {
			let $idVal = $id.val();
			$validArr[2] = $idRegExp.test($idVal);
			if ($validArr[2] == false) {
				$(".id").text("4~12글자로 알파벳,한글,숫자만 사용하실수 있습니다.").removeClass("good").addClass("error");
			} else {
				$.ajax({
					url : "/ajax/idCheck.djdn",
					type : "get",
					dataType : "json",
					data : {id : $idVal},
					error : function() {
						alert("서버 점검중");
					},
					success : function(json) {
						if (json.count == 0) {
							$(".id").text("사용가능한 아이디입니다.").removeClass("error").addClass("good");
						} else {
							$(".id").text("이미 사용중인 아이디입니다.").removeClass("good").addClass("error");
						}//if~else end
					}//success end
				})//ajax() end
			}//if~else end
			testValid();
		});/*id end*/
		
		$password.keyup(function() {
			let $passwordVal = $password.val();
			$validArr[3] = $passwordRegExp.test($passwordVal);
			if ($validArr[3] == false) {
				$(".password").text("8~16자 영문,숫자만 가능합니다").addClass("error");
				$password.focus();
			} else {
				$(".password").text("").removeClass("error");
			}//if~else end
			testValid();
			validConfirmPwd();
		})//password end
		
		$passwordReconfirm.keyup(validConfirmPwd);

		function validConfirmPwd() {
			$validArr[7] = $passwordReconfirm.val() == $password.val();
			if ($validArr[7] == false) {
				$(".passwordReconfirm").text("비밀번호가 일치하지 않습니다.").addClass("error");
			} else {
				$(".passwordReconfirm").text("").removeClass("error");
			}//if~else end
			testValid();
		}

		$nickname.keyup(function() {
			let $nicknameVal = $nickname.val();
			$validArr[1] = $nicknameRegExp.test($nicknameVal);
			if ($validArr[1] == false) {
				$(".nickname").text("2~8글자로 알파벳,한글,숫자만 사용하실수 있습니다. ").addClass("error");
				$nickname.focus();
			} else {
				$.ajax({
					url : "/ajax/nicknameCheck.djdn",
					type : "get",
					dataType : "json",
					data : {nickname : $nicknameVal},
					error : function() {
						alert("서버 점검중");
					},
					success : function(json) {
						if (json.countNickname == 0) {
							$(".nickname").text("사용가능한 닉네임입니다.").removeClass("error").addClass("good");
						} else {
							$(".nickname").text("이미 사용중인 닉네임입니다.").removeClass("good").addClass("error");
						}//if~else end
					}//success end
				});//ajax end
				$(".nickname").text("").removeClass("error");
			}//if~else end
			testValid();
		});/*nickname end*/
		
		$email.keyup(function() {
			let $emailVal = $email.val();
			$validArr[4] = $emailRegExp.test($emailVal);
			if ($validArr[4] == false) {
				$(".email").text("유효하지 않은 이메일 형식입니다.").addClass("error");
				$email.focus();
			} else {
				$(".email").text("").removeClass("error");
			}//if~else end
			testValid();
		});//email end

		$phonenumber.keyup(function() {
			let $phonenumberVal = $phonenumber.val();
			$validArr[5] = $phonenumberRegExp.test($phonenumberVal);
			if ($validArr[5] == false) {
				$(".phonenumber_box").text("예)010-1234-1234").addClass("error");
				$phonenumber.focus();
			} else {
				$(".phonenumber_box").text("").removeClass("error");
			}//if~else end
		});//phonenumber end
				
		$authenticationPhonenumber.keyup(function() {
			let $authenticationPhonenumberVal = $authenticationPhonenumber.val();
			$validArr[6] = $authenticationPhonenumberRegExp.test($authenticationPhonenumberVal);
			if ($validArr[6] == false) {
				$(".authentication_phonenumber").removeClass("success");
				$(".authentication_phonenumber").text("인증번호가 알맞지 않습니다.").addClass("error");
				$authenticationPhonenumber.focus();
			} else {
				$(".authentication_phonenumber").text("").removeClass("error");
			}//if~else end
			testValid();
		});//$authenticationPhonenumber end

		function testValid() {
			let count = 0;
			for (let i = 0; i < 8; i++) {
				if ($validArr[i]) {
					count++
				}
				;//if end
			}
			;//for end

			if (count == 8) {
				$(".signup_btn").prop("disabled", false).addClass("on");
			} else {
				$(".signup_btn").prop("disabled", true).removeClass("on");
			}
			;//if~else end
		};//testValid() end

		/*이메일 형식 자바스크립트*/
		let $emailSelect = $("#emailSelect");
		let $emailAddress = $("#emailAddress");
		$emailSelect.change(function() {
			let email = $emailSelect.val();
			if (email == "content") {
				$emailAddress.prop("readonly", false);
				$emailAddress.prop("placeholder", "직접입력");
				$emailAddress.val("");
				$emailAddress.css("color", "#000");
			} else {
				$emailAddress.prop("readonly", true);
				$emailAddress.val(email);
				$emailAddress.css("color", "rgb(124, 124, 124)");
			}
		});//$emailSelect change() end

		/*나라선택 형식 자바스크립트*/
		let $countryNumber = $("#country_number");
		let $countrySelect = $(".country");

		$countrySelect.change(function() {
			let $countryNumberVal = $countrySelect.val();
			$countryNumber.val($countryNumberVal);
		});

		/* $("form").submit(function (e) {
		    e.preventDefault()
		}) */

		/*$("#joinForm").on("submit",function () {
		    // return check();
		   validName();
		    validNickname();
		    return testValid();
		});*/

		/*function check(){
		    let $name = $("#name").val();
		    let $nickname = $("#nickname").val();
		    let $id = $("#id").val();
		    let $email = $("#email").val();
		    let $password = $("#password").val();
		    let $passwordReconfirm = $("#passwordReconfirm").val();
		    let $gender = $(".gender").val();
		    let $phonenumber = $(".phonenumber").val();
		    let $authenticationPhonenumber = $(".authentication_phonenumber").val();

		    if($name.length ==0){
		        alert("이름을 입력해주세요");
		        $("#name").focus();
		        return false;
		    }
		    else if ($nickname.length==0){
		        alert("닉네임을 입력해주세요");
		        $("#nickname").focus();
		        return false;
		    }
		    else if($id.length==0){
		        alert("아이디를 입력해주세요");
		        $("#id").focus();
		        return false;
		    }
		    else if ($email.length==0){
		        alert("이메일을 입력해주세요");
		        $("#email").focus();
		        return false;
		    }
		    else if ($password.length==0){
		        alert("비밀번호를 입력해주세요");
		        $("#password").focus();
		        return false;
		    }
		    else if ($passwordReconfirm.text()!=$password.text()){
		        alert("비밀번호가 일치하지 않습니다");
		        $("#passwordReconfirm").focus();
		        return false;
		    }
		    else if($gender.checkbox.empty()){
		        $(".gender").focus();
		        return false;
		    }
		    else if ($phonenumber.length ==0){
		        $(".phonenumber").focus();
		        return false;
		    }
		    else if ($authenticationPhonenumber.length==0){
		        $(".authentication_phonenumber").focus();
		        return false;
		    }else {
		        $(".signup_btn").prop("disabled",false);
		    };
		};*/
		/*join2 jquery end  */
	</script>
</body>
</html>