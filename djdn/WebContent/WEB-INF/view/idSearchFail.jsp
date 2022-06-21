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
	
	.wrapper_search_box .box_search_fail {
		width: 258px;
		height: 80px;
		border: 1px solid rgb(204, 204, 204);
		margin: auto;
		padding: 25px 20px 0 20px;
	}
	
	.box_search_fail .box_fail {
		height: 100px;
		line-height: 25px;
		text-align: center;
	}
	
	.box_btn {
		height: 80px;
		padding-left: 50px;
		padding-top: 40px;
	}
	
	.box_btn .btn {
		width: 140px;
		height: 40px;
		background-color: #008e97;
		color: #ffffff;
		border: none;
		border-radius: 3px;
		cursor: pointer;
		font-size: 16px;
		text-align: center;
		line-height: 40px;
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
			<div class="box_search_fail">
				<div class="box_fail">해당 이메일로 등록된 회원가입 정보가 존재하지 않습니다.</div>
			</div>
			<div class="box_btn">
				<a href="/idSearch.djdn" class="btn">아이디 찾기</a>
				<!--
            -->
				<a href="/join.djdn" class="btn">회원가입</a>
			</div>
		</div>
		<!-- //wrapper_search_box -->
	</div>
	<!-- //wrapper -->
	
	<c:import url="/WEB-INF/template/footer.jsp" />
</body>
</html>