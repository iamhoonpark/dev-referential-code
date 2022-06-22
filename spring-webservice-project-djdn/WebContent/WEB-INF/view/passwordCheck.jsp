<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>다재다능 | 비밀번호 확인</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<style>
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
	
	.box_pwd_check #check {
		width: 350px;
		height: 34px;
		margin-left: 20px;
		margin-bottom: 10px;
		padding-left: 5px;
		outline-color: #008e97;
	}
	
	.box_btn {
		text-align: center;
		margin: 50px 0;
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
					<li>본인확인을 위해 비밀번호를 한 번 더 입력해 주세요.</li>
					<li>비밀번호는 타인에게 노출되지 않도록 주의해 주세요.</li>
				</ul>
			</div>
			<!-- //box_txt -->
			<form action="/passwordCheck.djdn" method="post" id="pwdCheckForm">
				<div class="box_pwd_check">
					<label for="check">비밀번호</label> 
					<input type="password" id="check" name="check" placeholder="비밀번호 입력" />
				</div>
				<div class="box_btn">
					<button class="btn">확인</button>
				</div>
				<!-- //box_btn -->
			</form>
		</div>
		<!-- //wrapper_content -->
	</div>
	<!-- //wrapper -->
	
	<c:import url="/WEB-INF/template/footer.jsp"></c:import>
	<script>
	/* 2020-08-07 박주현 : 비밀번호 확인(서비스에서 하고있기 때문에 주석) */
		<%-- 비밀번호 확인은 ajax이용해주세요(세션까지 이용해서 alert창 뜨게) --%>
	<%-- 	 <% 
		 	Object passwordMsg = session.getAttribute("msg");
		 	session.removeAttribute("msg");
		 	if(passwordMsg!=null) { 
		 %>
		 <script>
		 	alert("<%=passwordMsg%>");
		 </script>
		 <% } %> --%>
</script>
</body>
</html>