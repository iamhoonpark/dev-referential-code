<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<style>
	body, input, button {
		font-family: "Noto Sans KR", sans-serif;
	}
	
	body {
		margin: 0;
	}
	
	ul li {
		list-style: none;
		padding: 0;
	}
	
	#wrapper {
		width: 1080px;
		padding-top: 100px;
		padding-bottom: 350px;
		margin: auto;
	}
	
	.wrapper {
		border: 1px solid rgb(204, 204, 204);
		width: 400px;
		position: relative;
		margin: -30px auto;
	}
	
	.wrapper {
		border: 1px solid rgb(204, 204, 204);
		width: 400px;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		text-align: center;
	}
	
	.login_tit {
		width: 100%;
		line-height: 110px;
		font-size: 32px;
		font-weight: bold;
	}
	
	#loginChk {
		cursor: pointer;
	}
	
	.log {
		width: 250px;
		height: 35px;
		margin-bottom: 20px;
		outline-color: #008e97;
	}
	
	button {
		background-color: #008e97;
		color: #eeeeee;
		width: 255px;
		height: 40px;
		line-height: 20px;
		outline: none;
		margin-top: 30px;
		border: none;
		border-radius: 3px;
		cursor: pointer;
	}
	
	.hr {
		border-top: 1px solid lightgray;
		width: 260px;
		margin: auto;
	}
	
	.search_id {
		display: inline-block;
	}
	
	.search_pwd {
		display: inline-block;
	}
	
	.signup {
		display: inline-block;
	}
	
	.bottom_search {
		margin: auto;
		margin-bottom: 20px;
		margin-top: 10px;
		font-size: 13px;
		width: 260px;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	.bottom_search_id {
		color: rgb(127, 127, 127);
	}
	
	.bottom_search_pwd {
		color: rgb(127, 127, 127);
	}
	
	.bottom_signup {
		color: rgb(127, 127, 127);
	}
	
	.first_separate {
		color: lightgray;
		border: 1px solid lightgray;
		height: 10px;
		display: inline-block;
	}
	
	.second_separate {
		color: lightgray;
		border: 1px solid lightgray;
		height: 10px;
		display: inline-block;
	}
	
	.login_form {
		border-style: none;
	}
	
	#loginChk {
		width: 100px;
		margin-top: 20px;
		display: none;
		cursor: pointer;
	}
	
	.login_label {
		cursor: pointer;
		font-size: 13px;
		display: block;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	.login_error {
		color: red;
		font-size: 12px;
		display: none;
	}
	
	.icon {
		font-size: 15px;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>
	<!--wrapper loginForm-->
	<div id="wrapper">
		<div class="wrapper">
			<form action="/login.djdn" method="post" id="loginForm">
				<fieldset class="login_form">
					<h2 class="login_tit">로그인</h2>
					<input autocomplete="off" id="loginId" class="log" type="text" name="id" placeholder="아이디"/> 
					<input autocomplete="off" id="loginPwd" class="log" type="password" name="pwd" placeholder="비밀번호"/>
					<p class="login_error"></p>
					<button type="submit">로그인</button>
					<div>
						<input class="login_maintain" type="checkbox" id="loginChk" value="status"/> 
						<label class="login_label" for="loginChk"><i class="far fa-check-circle icon"></i>로그인 상태 유지</label>
					</div>
				</fieldset>
			</form>
			<!--form end-->

			<div class="hr"></div>

			<!--아이디찾기,비밀번호찾기,회원가입-->
			<div class="bottom_search">
				<div class="search_id">
					<a class="bottom_search_id" href="/idSearch.djdn">아이디찾기</a>
				</div>
				<div class="first_separate"></div>
				<div class="search_pwd">
					<a class="bottom_search_pwd" href="/passwordSearch.djdn">비밀번호찾기</a>
				</div>
				<div class="second_separate"></div>
				<div class="signup">
					<a class="bottom_signup" href="/join.djdn">회원가입</a>
				</div>
			</div>
		</div>
	</div>
	<!--wrapper end-->
	
	<c:import url="/WEB-INF/template/footer.jsp"></c:import>
	
	<script>
		$("#loginForm").on("submit", function() {
			let $loginId = $("#loginId").val();
			let $loginPwd = $("#loginPwd").val();
			if ($loginId.length == 0 || $loginPwd.length == 0) {
				$(".login_error").text("아이디 또는 비밀번호를 입력해주세요.").css("color", "red").show();
				return false;
			} else {
				$(".login_error").text("").css("color", "transparent");
			}
		})/*loginForm submit end*/

		/*로그인상태 유지*/
		$logChk = $("#loginChk");

		$logChk.on("click", function() {
			if (!$(this).hasClass("on")) {
				$logChk.addClass("on");
				$(".icon").css("color", "rgb(22, 160, 133)");
			} else {
				$logChk.removeClass("on");
				$(".icon").css("color", "black");
			}
		});/*로그인상태 유지 end*/
	</script>
</body>
</html>