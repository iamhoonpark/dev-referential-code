<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>다재다능 | 비밀번호 변경</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<style>
	/* wrapper */
	#wrapper {
		max-width: 1080px;
		margin: 0 auto;
		padding: 100px 0 200px 0;
	}
	
	.content_tit {
		border-bottom: 1px solid #9E9E9E;
		font-weight: bold;
		font-size: 24px;
		line-height: 90px;
		color: #424242;
		margin-bottom: 40px;
	}
	
	.box_txt {
		margin-bottom: 50px;
	}
	
	.box_txt ul {
		width: 400px;
		list-style-type: circle;
		border: 1px solid rgb(224, 224, 224);
		padding: 10px 0 10px 40px;
	}
	
	.box_txt li {
		margin-bottom: 5px;
		line-height: 30px;
	}
	
	.box_txt li:nth-child(2) {
		margin-bottom: 0;
	}
	
	.red_txt {
		color: red;
	}
	
	.box_pwd_check {
		margin-bottom: 40px;
	}
	
	.new_pwd {
		width: 300px;
		height: 34px;
		outline-color: #008e97;
		margin-bottom: 10px;
		padding-left: 5px;
	}
	
	.box_pwd_check .pwd_check {
		color: blue;
	}
	
	.pwd_check.error {
		color: red;
	}
	
	.box_auto_guard .auto_guard_txt {
		margin-bottom: 15px;
	}
	
	.box_auto_guard .auto_guard {
		width: 308px;
		height: 80px;
		margin-bottom: 20px;
		border: 1px solid rgb(224, 224, 224);
	}
	
	.auto_guard img {
		width: 308px;
		height: 80px;
	}
	
	.box_btn {
		text-align: center;
		margin-top: 50px;
		margin-bottom: 150px;
	}
	
	/* 버튼 css */
	.btn {
		width: 100px;
		height: 40px;
		background: #008e97;
		outline: none;
		border: none;
		border-radius: 3px;
		color: #fff;
		font-size: 18px;
		font-weight: 400;
		cursor: pointer;
	}
	
	.btn_delete {
		background-color: rgb(127, 127, 127);
		color: #fff;
	}
	
	.btn_success {
		margin-left: 20px;
	}
	
	.btn_success:disabled {
		background-color: rgb(127, 127, 127);
		color: #fff;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>
	<!-- wrapper 시작 -->
	<div id="wrapper">
		<h2 class="content_tit">비밀번호 확인</h2>
		<div class="wrapper_content">
			<div class="box_txt">
				<ul>
					<li><span class="red_txt">다른 아이디/사이트에서 사용한 적 없는 비밀번호</span></li>
					<li><span class="red_txt">이전에 사용한 적 없는 비밀번호</span>가 안전합니다.</li>
				</ul>
			</div>
			<!-- //box_txt -->

			<!-- 2020-08-07 박주현 : form action, input name 수정 -->
			<form method="post" action="/passwordChange.djdn" id="pwdChangeForm">
				<div class="box_pwd_check">
					<div class="box_new_pwd box_pwd">
						<input type="password" id="newPwd" name="pwd" class="new_pwd" placeholder="새 비밀번호" />
					</div>
					<!-- //box_new_pwd -->
					<div class="box_new_check box_pwd">
						<input type="password" id="pwdCheck" class="new_pwd" placeholder="새 비밀번호 확인" disabled />
					</div>
					<!-- //box_new_check -->
					<div class="pwd_check"></div>
				</div>
				<!-- //box_pwd_check -->
				<div class="box_auto_guard">
					<div class="auto_guard_txt">아래 문자를 보이는대로 입력해주세요.</div>
					<div class="auto_guard">
						<img src="/img/capcha.PNG" alt="자동입력방지문자" />
					</div>
					<input type="text" id="autoGuard" name="autoGuard" class="new_pwd" placeholder="자동입력방지문자" 
						   autocomplete="off"/>
				</div>
				<!-- //box_auto_guard -->
				<div class="box_btn">
					<button class="btn btn_delete">취소</button>
					<button class="btn btn_success" disabled>확인</button>
				</div>
				<!-- //box_btn -->
			</form>
		</div>
		<!-- //wrapper_content -->
	</div>
	<!-- //wrapper -->

	<c:import url="/WEB-INF/template/footer.jsp"></c:import>
	<script>
		const $pwdCheck = $("#pwdCheck");
		const $newPwd = $("#newPwd");
		const $pwdTxt = $(".pwd_check");
		const $btnSuccess = $(".btn_success");
		const pwdChangeRegExp = /^[\w|`~!@#$%^&*|\\\'\";:\/?]{8,16}$/;

		$newPwd.keyup(function() {
			if (!pwdChangeRegExp.test($newPwd.val())) {
				$pwdTxt.addClass("error").text("8~16자의 영문 대소문자, 숫자 및 특수문자를 사용해주세요");
				$pwdCheck.prop("disabled", true);
			} else {
				$pwdTxt.removeClass("error").text("안전하게 사용하실 수 있는 비밀번호 입니다.");
				$pwdCheck.prop("disabled", false);
			}//if end
		});

		$pwdCheck.keyup(pwdCheck);
		
		//비밀번호 체크하는 함수
		function pwdCheck() {
			let newPwd = $newPwd.val();
			let pwdCheck = $pwdCheck.val();
			console.log(newPwd);
			if (newPwd == pwdCheck && pwdChangeRegExp.test($newPwd.val())) {
				$pwdTxt.removeClass("error").text("현재 비밀번호가 일치합니다.");
				$btnSuccess.prop("disabled", false);
			} else {
				$pwdTxt.addClass("error").text("현재 비밀번호가 일치하지 않습니다.");
				$btnSuccess.prop("disabled", true);
			}//if~else end
		}//pwdCheck() end
	</script>
</body>
</html>