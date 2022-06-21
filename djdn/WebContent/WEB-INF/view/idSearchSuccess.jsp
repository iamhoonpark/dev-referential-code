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
		border: 1px solid rgb(204, 204, 204);
	}
	
	.wrapper_search_box .box_search_tit {
		text-align: center;
		line-height: 110px;
		font-size: 32px;
		font-weight: bold;
	}
	
	.wrapper_search_box .search_success {
		text-align: center;
		font-size: 18px;
	}
	
	.wrapper_search_box .box_search_success {
		width: 298px;
		height: 98px;
		border: 1px solid rgb(204, 204, 204);
		margin: 40px auto;
		margin-bottom: 0;
	}
	
	.box_search_success .box_name_search, .box_search_success .box_date_search {
		height: 49px;
		line-height: 49px;
		text-align: center;
	}
	
	.box_btn {
		height: 80px;
		padding-left: 50px;
		padding-top: 40px;
	}
	
	.box_btn .btn.btn1 {
		margin-left: 0;
	}
	
	.box_btn .btn {
		width: 145px;
		height: 40px;
		line-height: 40px;
		background-color: #008e97;
		color: #ffffff;
		border: none;
		border-radius: 3px;
		font-size: 16px;
		text-align: center;
		margin-left: 10px;
		display: inline-block;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp" />

	<!-- 2020-08-08 박혜민 Spring변환  -->
	<div id="wrapper">
		<div class="wrapper_search_box">
			<h2 class="box_search_tit">아이디 찾기</h2>
			<div class="search_success">아이디 찾기가 완료되었습니다.</div>
			<div class="box_search_success">
				<div class="box_name_search">아이디 : ${memberCheck.id }</div>
				<div class="box_date_search">가입일 : ${memberCheck.signupDate }</div>
			</div>
			<div class="box_btn">
				<a href="/login.djdn" class="btn btn1">로그인</a>
				<!--
            -->
				<a href="/passwordSearch.djdn" class="btn btn2">비밀번호 찾기</a>
			</div>
		</div>
		<!-- //wrapper_search_box -->
	</div>
	<!-- //wrapper -->
	
	<c:import url="/WEB-INF/template/footer.jsp" />
</body>
</html>