<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>다재다능 | 비밀번호찾기</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<style>
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
	
	.box_pwd_txt {
		width: 300px;
		margin: auto;
		margin-bottom: 15px;
		line-height: 25px;
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
	.box_email_search #email, .box_email #emailAddress {
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
		width: 73px;
		border: none;
		outline: none;
		border-radius: 5px;
		padding-left: 5px;
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
		border-radius: 5px;
		outline: none;
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
		border-radius: 5px;
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
	
	/* 모든 비활성 <input> 선택 */
	input:read-only {
		background: rgb(237, 237, 237);
	}
	
	#id {
		width: 293px;
		height: 36px;
		border: 1px solid rgb(204, 204, 204);
		border-radius: 3px;
		padding-left: 5px;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>
	<div id="wrapper">
		<div class="wrapper_search_box">
			<h2 class="box_search_tit">비밀번호 찾기</h2>
			<div class="box_pwd_txt">
				<div class="box_txt">이메일로 임시 비밀번호를 보내드립니다.</div>
				<div class="box_txt">회원가입할 때 등록한 이메일을 입력해주세요.</div>
			</div>
			<!-- //box_pwd_txt -->
			
			<!-- 2020-08-07 박주현 : 비밀번호 찾기 관련 - input hidden 추가하여 email 한번에 보내기 -->
			<form action="" method="post" id="pwdSearchForm">
				<fieldset>
					<input type="hidden" name="email" value="" id="wholeEmail" />
					<div class="box_email_search">
						<label for="id">아이디</label> <input type="text" id="id" name="id" placeholder="아이디" autocomplete="off" />
					</div>
					<!-- //box_email_search -->

					<div class="box_email_search">
						<label for="email">이메일</label>
						<div class="box_email">
							<input type="text" id="email" name="" placeholder="이메일" />
							<div class="email_at">@</div>
							<input type="text" id="emailAddress" name="" value="naver.com" readonly />
						</div>
						<select id="emailSelect">
							<option value="content">직접입력</option>
							<option selected value="naver.com">naver</option>
							<option value="daum.net">daum</option>
							<option value="gmail.com">google</option>
						</select>
					</div>
					<!-- //box_email_search -->
					<div class="box_error">이메일을 입력해주세요.</div>
					<div class="box_btn">
						<button class="btn">비밀번호 찾기</button>
					</div>
					<!-- //box_btn -->
				</fieldset>
			</form>
		</div>
		<!-- //wrapper_search_box -->
	</div>
	<!-- //wrapper -->

	<c:import url="/WEB-INF/template/footer.jsp"></c:import>

	<c:if test="${msg!=null}">
		<script>
			$(".box_error").text("${msg}");
		</script>
	</c:if>

	<script>
		const $emailSelect = $("#emailSelect");
		const $emailAddress = $("#emailAddress");
		const $pwdSearchForm = $("#pwdSearchForm");
		const $emailError = $(".box_error");
		const $email = $("#email");

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
			}//if~else end
		});//$emailSelect change() end

		//form을 넘길때 작동하는 이벤트
		//2020-08-07 박주현 : 비밀번호 찾기 - html에서 email id와 email adreess 합치기
		$pwdSearchForm.submit(function() {
			const email = $email.val();
			const emailAddress = $emailAddress.val();
			if (email.length == 0 || emailAddress.length == 0) {
				$emailError.show();
				$email.focus();
				return false;
			} else {
				$("#wholeEmail").val(email + "@" + emailAddress);
				return true;
			}
			//if() end
		});//$loginForm submit() end
	</script>
</body>
</html>