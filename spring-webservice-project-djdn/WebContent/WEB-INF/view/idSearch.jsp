<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>다재다능 | 아이디찾기</title>
<c:import url="/WEB-INF/template/link.jsp" />
<style>
	/* 아이디 찾기 css */
	#wrapper {
		width: 1080px;
		margin: auto;
		padding-top: 200px;
		padding-bottom: 100px;
	}
	
	.wrapper_search_box {
		width: 400px;
		margin: auto;
		padding-bottom: 20px;
		border: 1px solid rgb(204, 204, 204);
	}
	
	.wrapper_search_box .box_search_tit {
		text-align: center;
		line-height: 110px;
		font-size: 32px;
		font-weight: bold;
	}
	
	.wrapper_search_box fieldset {
		border: none;
	}
	
	.box_name_search {
		height: 100px;
		padding-left: 50px;
		margin-bottom: -10px;
	}
	
	.box_name_search label {
		line-height: 40px;
		display: block;
		font-weight: bold;
	}
	
	.box_name_search #id {
		width: 291px;
		padding-left: 5px;
		border: 1px solid rgb(204, 204, 204);
	}
	
	.box_email_search {
		height: 100px;
		padding-left: 50px;
		margin-bottom: -10px;
		margin-top: 10px;
	}
	
	.box_email_search label {
		line-height: 40px;
		display: block;
		font-weight: bold;
	}
	
	/* input 공통 css */
	.box_email_search #email, .box_email #emailAddress, .box_name_search #id
		{
		height: 38px;
		border-radius: 3px;
		outline-color: #008e97;
	}
	
	.box_email {
		width: 198px;
		line-height: 38px;
		border-radius: 3px;
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
		width: 73px;
		border: none;
		outline: none;
		border-radius: 3px;
		padding-left: 5px;
	}
	
	.box_email #emailAddress:read-only {
		background-color: #eee;
	}
	
	.box_email_search #email {
		outline: none;
		width: 92px;
		padding-left: 5px;
		border: none;
	}
	
	.box_email_search #emailSelect {
		width: 94px;
		height: 43px;
		border: 1px solid rgb(204, 204, 204);
		border-radius: 3px;
	}
	
	.box_btn {
		height: 80px;
		padding-left: 50px;
		padding-top: 40px;
	}
	
	.box_btn .btn {
		width: 300px;
		height: 40px;
		background-color: #008e97;
		color: #ffffff;
		border: none;
		border-radius: 3px;
		cursor: pointer;
		font-size: 16px;
	}
	
	/* 유효성검사 css */
	.box_error {
		width: 300px;
		font-size: 14px;
		color: red;
		margin: auto;
		display: none;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp" />
	<!-- 2020-08-08 박혜민 Spring변환  -->
	<div id="wrapper">
		<div class="wrapper_search_box">
			<h2 class="box_search_tit">아이디 찾기</h2>
			<form action="/idSearch.djdn" method="post" id="loginForm">
				<!--  <input type="hidden" name="email" id="fullEmail"/> -->
				<fieldset>
					<div class="box_name_search">
						<label for="id">이름</label> <input type="text" id="id" name="name" placeholder="이름을 입력해주세요" autocomplete="off" />
					</div>
					<div class="box_error id_error">이름을 입력해주세요.</div>
					<div class="box_email_search">
						<label for="email">이메일</label>
						<div class="box_email">
							<input type="text" id="email" name="email" placeholder="이메일" autocomplete="off" />
							<div class="email_at">@</div>
							<input type="text" id="emailAddress" name="emailAddress" value="naver.com" readonly />
						</div>
						<select id="emailSelect">
							<option value="content">직접입력</option>
							<option selected value="naver.com">naver</option>
							<option value="daum.net">daum</option>
							<option value="gmail.com">gmail</option>
						</select>
					</div>
					<div class="box_error email_error">이메일을 입력해주세요.</div>
					<div class="box_btn">
						<button class="btn">아이디찾기</button>
					</div>
				</fieldset>
			</form>
		</div>
		<!-- //wrapper_search_box -->
	</div>
	<!-- //wrapper -->
	
	<c:import url="/WEB-INF/template/footer.jsp" />
	
	<script>
		const $emailSelect = $("#emailSelect");
		const $emailAddress = $("#emailAddress");
		const $loginForm = $("#loginForm");
		const $name = $("#id");
		const $email = $("#email");
		const $idError = $(".id_error");
		const $emailError = $(".email_error");

		/* $("#loginForm").form(function() {
		const email = $("#email").val();
		const emailAddress = $("#emailAddress").val();
		
		$("#fullEmail").val(email+"@"+emailAddress);
		}); */
		
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

		$loginForm.submit(function() {
			
			const name = $name.val().length;
			const email = $email.val().length;
			const emailAddress = $emailAddress.val().length;
			
			if (name == 0) {
				$idError.show();
				$name.focus();
				return false;
			}//if() end

			if (email == 0 || emailAddress == 0) {
				$emailError.show();
				$email.focus();
				return false;
			}//if() end
		});//$loginForm submit() end
	</script>
</body>
</html>