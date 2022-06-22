<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<style>
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
		margin: auto;
	}
	
	.withdrawal_tit {
		line-height: 90px;
		border-bottom: 1px solid rgb(184, 184, 184);
		font-size: 24px;
		font-weight: bold;
	}
	
	.required {
		padding: 10px 0;
		text-align: right;
		font-size: 10px;
		color: red;
		border-bottom: 1px solid rgb(204, 204, 204);
		margin-bottom: 20px;
	}
	
	.withdraw_reason {
		border-bottom: 1px solid rgb(204, 204, 204);
	}
	
	.withdraw_reason::after {
		content: "";
		display: block;
		clear: both;
	}
	
	.tab1 {
		width: 140px;
		float: left;
		font-size: 16px;
		height: 140px;
		padding-top: 10px;
		margin-bottom: 30px;
	}
	
	.reason_list {
		width: 840px;
		float: left;
	}
	
	.reason_list div {
		line-height: 30px;
	}
	
	.reason {
		cursor: pointer;
	}
	
	.withdraw_reason_detail {
		padding: 30px 0;
		border-bottom: 1px solid lightgray;
	}
	
	.withdraw_reason_detail::after {
		content: "";
		display: block;
		clear: both;
	}
	
	.tab2 {
		float: left;
		width: 140px;
		height: 150px;
	}
	
	.detail_reason {
		padding-left: 135px;
		float: left;
	}
	
	.detail_reason_txt {
		width: 400px;
		height: 150px;
		margin-left: -130px;
		resize: none;
		outline-color: #008e97;
		padding: 5px 5px;
		border: 1px solid rgb(184, 184, 184);
	}
	
	.after {
		margin-top: 40px;
	}
	
	.after_detail {
		color: red;
		margin-top: 20px;
	}
	
	.after_detail ul li {
		padding-bottom: 5px;
	}
	
	.button {
		width: 214px;
		margin: auto;
		margin-top: 60px;
		padding-bottom: 50px;
	}
	
	.cancel_btn {
		cursor: pointer;
		border-style: none;
		outline: none;
		width: 100px;
		height: 40px;
		border-radius: 2px;
		background-color: rgb(127, 127, 127);
		color: #fff;
	}
	
	.okay_btn {
		cursor: pointer;
		border-style: none;
		outline: none;
		width: 100px;
		height: 40px;
		margin-left: 10px;
		border-radius: 2px;
		background-color: rgb(127, 127, 127);
		color: #fff;
	}
	
	.required_span {
		color: red;
	}
</style>
</head>
<body>
    <c:import url="/WEB-INF/template/header.jsp"></c:import>
	<div id="wrapper">
		<h2 class="withdrawal_tit">회원탈퇴</h2>
		<div class="required">* 는 필수입력 항목입니다.</div>
		<form action="/dropoutInsert.djdn" method="post">
			<div class="withdraw_reason">
					<div class="withdrawal_tab tab1">
						탈퇴 사유 <span class="required_span">*</span>
					</div>
					<div class="reason_list">
						<div>
							<input name="dropoutReasonNo" type="radio" class="reason" id="reason1" value="1">
							<label for="reason1"> 다재다능이 유용하지 않습니다.</label>
						</div>
						<div>
							<input name="dropoutReasonNo" type="radio" class="reason" id="reason2" value="2">
							<label for="reason2"> 광고성 이메일, 초대, 요청이 너무 많습니다.</label>
						</div>
						<div>
							<input name="dropoutReasonNo" type="radio" class="reason" id="reason3" value="3">
							<label for="reason3"> 다재다능 사용법을 모르겠습니다.</label>
						</div>
						<div>
							<input name="dropoutReasonNo" type="radio" class="reason" id="reason4" value="4">
							<label for="reason4"> 개인 정보가 우려됩니다.</label>
						</div>
						<div>
							<input name="dropoutReasonNo" type="radio" class="reason" id="reason5" value="5">
							<label for="reason5"> 기타 내용은 자세히 설명해 주세요.</label>
						</div>
					</div>
					<!-- //reason_list -->
			</div>
			<!-- //withdraw_reason -->
			
			<div class="withdraw_reason_detail">
				<div class="withdrawal_tab tab2">자세한 사유</div>
				<div class="detail_reason">
					<textarea class="detail_reason_txt" name="detailReason" placeholder="내용을 입력해주세요"></textarea>
				</div>
				<!-- //detail_reason -->
			</div>
			<!-- //withdraw_reason_detail -->
			
			<div>
				<div class="after">회원 탈퇴 후!</div>
				<div class="after_detail">
					<ul>
						<li>7일 이내에 재가입을 하실 수 없습니다.</li>
						<li>같은 아이디로 가입할 수 없으며, 아이디와 데이터는 복구할 수 없습니다.</li>
						<li>게시판형 서비스에 남아있는 게시글은 탈퇴 후 삭제할 수 없습니다.</li>
					</ul>
				</div>
				<!-- //after_detail -->
			</div>
			
			<div class="button">
				<button type="button" class="cancel_btn">취소</button>
				<button type="submit" class="okay_btn">회원 탈퇴</button>
			</div>
			<!-- //button -->
		
		</form>
	</div>
	<!-- //wrapper -->

    <c:import url="/WEB-INF/template/footer.jsp"></c:import>
	
	<c:if test="${flag}">
		<script>alert("${msg}")</script>
	</c:if>
	
	<script>
		let $reason = $(".reason");
		let $okayBtn = $(".okay_btn");
		let $otherReason = $("#reason5");
		const $detailReasonTxt = $(".detail_reason_txt");
		
		/* radio 미선택시 회원탈퇴 버튼 비활성화, alert창 -> 선택시 활성화	 */
		$reason.on("click", function () {
			$okayBtn.css({"background-color" : "#008e97", "color" : "#fff" });
		});
		
		$okayBtn.on("click", function (e) {
			let $dropoutReasonNo = $(":input:radio[name=dropoutReasonNo]:checked").val();
			if ($dropoutReasonNo == null) {
				e.preventDefault();
				alert("차단 이유를 선택해주세요.");
			}
		});
		
		/* radio 기타 선택 후 자세한사유 미작성 후 회원탈퇴 버튼 클릭 시 자세한사유 작성 요구 */
		$("form").submit(function() {
			if ($otherReason.is(":checked")) {
				if ($detailReasonTxt.val().length == 0) {
					$detailReasonTxt.focus();
					alert("자세한 사유를 입력해주세요.");
					return false;
				}
				;//if() end
			}
			;//if() end
		});
		
		/* 취소버튼 클릭 시 confirm창  */
		$(".cancel_btn").on("click", function () {
	        let result = confirm("회원탈퇴를 취소하시겠습니까?");
	        if (result) {
	            // confirm 확인 시
	            location.replace('/');
	        } else {
	            // confirm 취소 시
	        }
	    });
	</script>
</body>
</html>