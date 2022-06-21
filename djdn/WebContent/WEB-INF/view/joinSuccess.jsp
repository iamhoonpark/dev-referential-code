<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>다재다능 | 회원가입</title>
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
	}
	
	.wrapper_search_box .box_tit_check {
		text-align: center;
		font-size: 65px;
		color: #008e97;
	}
	
	.wrapper_search_box .box_search_tit {
		text-align: center;
		line-height: 80px;
		font-size: 32px;
		font-weight: bold;
	}
	
	.box_pwd_txt {
		width: 300px;
		margin: auto;
		margin-bottom: 15px;
		line-height: 25px;
		text-align: center;
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
		text-align: center;
		line-height: 40px;
		display: inline-block;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>
	<div id="wrapper">
		<div class="wrapper_search_box">
			<h2 class="box_tit_check">
				<i class="far fa-check-circle"></i>
			</h2>
			<h2 class="box_search_tit">회원가입이 완료 되었습니다.</h2>
			<div class="box_pwd_txt">${userName}님,회원가입을 축하드립니다.</div>
			<div class="box_btn">
				<a href="/login.djdn" class="btn">로그인</a>
			</div>
			<!-- //box_btn -->
		</div>
		<!-- //wrapper_search_box -->
	</div>
	<!-- //wrapper -->
	
	<c:import url="/WEB-INF/template/footer.jsp"></c:import>
</body>
</html>