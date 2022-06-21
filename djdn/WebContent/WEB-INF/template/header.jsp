<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- #header 시작 -->
<header id="header" class="black">
    <div class="header_wrapper">
        <h1 class="logo">
            <a href="/"><img src="/img/logo.png" alt="다재다능"></a>
        </h1>
        <ul class="hd_left">
            <li><a href="/">HOME</a></li>
        </ul>
        
        <c:choose>
	        <c:when test="${loginMember==null }">
	        	<!-- 로그인 전 header -->
		        <ul class="hd_right">
		            <li class="sub_menu_top">
		            	<a href="/login.djdn">로그인</a>
		            </li>
		        </ul>
	        </c:when>
        
	        <c:otherwise>
		        <c:choose>
			        <c:when test="${count==1 }">
				        <!-- 멘토 header -->
				        <ul class="hd_right">
				            <li class="sub_menu_top">
				                <div class="profile">
				                    <img src="/profile/${loginMentor.profileImg }" alt="프로필이미지" class="profile_img"/>
				                    <i class="fas fa-angle-down"></i>
				                </div>
				                <ul class="sub_menu">
				                    <li><a href="/mentorProfile.djdn">내 정보</a></li>
				                    <li><a href="/myActivity.djdn?memberNo=${loginMentor.memberNo }">내 활동관리</a></li>
				                    <li><a href="/logout.djdn">로그아웃</a></li>
				                </ul>
				            </li>
				            <li><a href="/wishList.djdn?memberNo=${loginMentor.memberNo }">위시리스트</a></li>
				            <li><a href="">재능톡</a></li>
				            <li class="sub_menu_top"><span class="mentor_link">멘토 <i class="fas fa-angle-down"></i></span>
				                <ul class="sub_menu">
				                    <li><a href="/myLesson.djdn?memberNo=${loginMentor.memberNo }">내 수업목록</a></li>
				                    <li><a href="/blackList.djdn?memberNo=${loginMentor.memberNo }">블랙리스트</a></li>
				                    <li><a href="/lessonInsert.djdn">수업등록</a></li>
				                </ul>
				            </li>
				        </ul>
			        </c:when>
			        
			        <c:otherwise>
			        <!-- 멘티 header -->
			         <ul class="hd_right">
			            <li class="sub_menu_top">
			                <div class="profile">
			                    <img src="/profile/${loginMember.profileImg }" alt="프로필이미지" class="profile_img" id="headProfileImg"/>
			                    <i class="fas fa-angle-down"></i>
			                </div>
			                <ul class="sub_menu">
			                    <li><a href="/profileUpdate.djdn">내 정보</a></li>
			                    <li><a href="/myActivity.djdn?memberNo=${loginMember.memberNo }">내 활동관리</a></li>
			                    <li><a href="/logout.djdn">로그아웃</a></li>
			                </ul>
			            </li>
			            <li><a href="/wishList.djdn?memberNo=${loginMember.memberNo }">위시리스트</a></li>
			            <li><a href="">재능톡</a></li>
			            <li><a href="/mentorInsert.djdn">멘토등록</a></li>
			        </ul> 
			        </c:otherwise>
		        </c:choose>
	        </c:otherwise>
        </c:choose>
      	<c:if test="${msg!=null }">
	        <script>
	        	alert("${msg}");
	        </script>
        </c:if>
    </div>
</header><!-- //header -->