<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>다재다능 | ${lesson.title }</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<style>
	#header {
	    position: static;
	}
	#wrapper {
	    width : 1080px;
	    margin: auto;
	    padding-top : 60px;
	}
	
	/* 수업 상세 박스 css */
	.box_class {
	    position: relative;
	}
	.box_class::after {
	    content : "";
	    display: block;
	    clear: both;
	}
	
	/* 수업 상세 박스(왼쪽) css */
	.box_class .box_class_left {
	    width : 630px;
	    float: left;
	}
	.box_class .box_left {
	    width : 630px;
	}
	
	/* 수업상세(이미지 슬라이드) css */
	.box_left .box_class_img {
	    height : 470px;
	    overflow: hidden;
	    position: relative;
	}
	.box_class_img .box_direction {
	    position: absolute;
	    width : 285px; height : 470px;
	    padding : 0 15px;
	    line-height: 470px;
	    font-size: 50px;
	    cursor: pointer;
	    color : rgba(0,0,0,.4);
	    transition: .1s ease;
	}
	.box_class_img .box_direction:hover {
	    color : #008e97;
	}
	.box_class_img .box_img_prev {
	    top : 0; left : 0;
	    text-align: left;
	}
	.box_class_img .box_img_next {
	    top : 0; right : 0;
	    text-align: right;
	}
	.box_class_img .box_img {
	    height : 470px;
	    position: absolute;
	    transition: .5s ease;
	    top : 0; left : 0;
	}
	.box_img img {
	    width : 630px;
	    height : 470px;
	    float: left;
	}
	
	/* 수업상세(탭) css */
	.box_left .box_class_tab {
	    height : 61px;
	}
	.box_class_tab ul {
	    text-align: center;
	    border-bottom: 1px solid #424242;
	    background-color : #fff;
	    z-index: 100;
	}
	.box_class_tab ul::after {
	    content : "";
	    display: block;
	    clear: both;
	}
	.box_class_tab ul li {
	    width : 210px;
	    height : 60px;
	    line-height: 60px;
	    float: left;
	}
	.box_class_tab ul li:hover {
	    text-decoration: underline;
	}
	.box_class_tab ul li a {
	    display: block;
	    height : 100%;
	    font-size: 20px;
	    font-weight: bold;
	    color : #9E9E9E;
	}
	.box_class_tab ul li a.on {
	    color : #000000;
	}
	
	/* 수업내용박스 공통 css */
	.box_left .box_class_info {
	    padding-top : 90px;
	    padding-bottom : 50px;
	    border-bottom: 1px solid #E0E0E0;
	}
	.box_left .box_class_info:last-child {
	    border : none;
	}
	.box_class_info .box_detail_info {
	    width : 600px;
	    margin : auto;
	}
	.class_info_tit {
	    height: 80px;
	    font-size: 32px;
	    font-weight: bold;
	}
	#mentoInfo {
	    padding-top : 85px;
	}
	.box_left .mento_info {
	    padding-top : 5px;
	}
	.box_detail_info .class_info_txt {
	    text-align: justify;
	    line-height: 25px;
	    white-space: pre-wrap;
	}
	
	/* 수업내용박스 멘토정보 css */
	.box_detail_info .mento_certification {
	    font-size: 18px;
	    margin-bottom : 30px;
	}
	.mento_certification .fa-address-card {
	    font-size: 22px;
	}
	.mento_certification .certification_txt {
	    color : red;
	}
	.mento_certification ul li {
	    line-height: 30px;
	}
	
	/* 수업내용박스 커리큘럼 css */
	.class_curriculum_dl .box_curriculum {
	    margin-bottom : 50px;
	}
	.class_curriculum_dl .box_curriculum:last-child {
	    margin-bottom : 0;
	}
	.box_curriculum .class_curriculum_round {
	    font-size: 25px;
	    font-weight: 900;
	    margin-bottom: 15px;
	    color : #008e97;
	}
	
	/* 수업 상세 박스(오른쪽) css */
	.box_class .box_class_right {
	    width : 420px;
	    float: right;
	}
	
	/* 수업상세박스(수업제목) css */
	.box_class_right .box_right_tit {
	    margin-bottom : 10px;
	}
	.box_right_tit .box_tag {
	    padding : 5px 0;
	}
	.box_tag span {
	    display: inline-block;
	    background-color : #eeeeee;
	    margin-right : 5px;
	    padding : 5px 12px;
	    border-radius: 100px;
	    margin-bottom : 5px;
	}
	.box_right_tit .box_category {
	    line-height: 36px;
	    margin-bottom : 15px;
	}
	.box_right_tit .box_category::after {
	    content : "";
	    display: block;
	    clear: both;
	}
	.box_category .category {
	    float: left;
	    font-size: 18px;
	}
	.box_category .private_open {
	    float: right;
	    text-align: right;
	}
	.box_category .btn_update {
	    text-align: center;
	    width : 80px; height : 34px;
	    border : 1px solid rgb(204,204,204);
	    margin-left : 60px;
	    display: none;
	}
	.slider .open_btn {
	    display: inline-block;
	    width : 65px;
	    height : 36px;
	    line-height: 36px;
	    padding : 0 10px 0 15px;
	    background-color : grey;
	    cursor: pointer;
	    border-radius: 24px;
	    position: relative;
	    transition: .2s ease;
	    font-size: 14px;
	    color : #fff;
	}
	.slider .open_btn::before {
	    content : "";
	    position: absolute;
	    top : 2px; left : 2px;
	    width : 32px;
	    height : 32px;
	    background-color : #fff;
	    border-radius: 32px;
	    transition: .2s ease;
	}
	.slider input {
	    display: none;
	}
	.slider .open_btn.open {
	    background-color : #008e97;
	}
	.slider .open_btn.open::before {
	    transform: translateX(53px);
	}
	.box_right_tit .box_tit {
	    line-height: 24px;
	    font-size: 20px;
	    margin-bottom : 5px;
	    font-weight: 500;
	}
	.box_grade {
	    padding : 5px 0;
	}
	.box_grade::after {
	    content : "";
	    display: block;
	    clear: both;
	}
	.box_grade .class_grade {
	    display: inline-block;
	    float: left;
	    margin : 0;
	}
	.box_grade .class_grade_count {
	    display: inline-block;
	    float: left;
	    height : 18px;
	}
	
	/* 수업상세박스(멘토정보) css */
	.box_class_right .box_mento_info {
	    margin-bottom : 10px;
	}
	.box_class_right .box_mento_info::after {
	    content : "";
	    display: block;
	    clear: both;
	}
	.box_mento_info .mento_profile {
	    float: left;
	    text-align: center;
	}
	.mento_profile .mento_profile_link {
	    display: block;
	}
	.mento_profile .mento_profile_img {
	    width : 80px;
	    height : 80px;
	    border-radius: 50px;
	}
	.mento_profile .mento_name {
	    line-height: 29px;
	}
	.box_mento_info .mento_txt {
	    width : 300px;
	    line-height: 20px;
	    background-color: #008e97;
	    color : #fff;
	    float: right;
	    padding : 10px 10px;
	    position: relative;
	    border-radius: 3px;
	 }
	.box_mento_info .mento_txt::after {
	    content : "";
	    width : 0; height : 0;
	    display: block;
	    border-top : 10px solid transparent;
	    border-left : 10px solid transparent;
	    border-right : 10px solid #008e97;
	    border-bottom : 10px solid transparent;
	    position: absolute;
	    top : 30px; left : -20px;
	}
	
	/* 수업상세박스(장소 및 시간) css */
	.box_info .info_time_round {
	    font-size: 11px;
	}
	.box_info ul::after {
	    content : "";
	    display: block;
	    clear: both;
	}
	.box_info ul li {
	    width : 25%;
	    height : 90px;
	    float: left;
	    text-align: center;
	    padding : 10px 0;
	    font-size: 14px;
	}
	.box_info ul li .icon {
	    font-size: 35px;
	    margin-bottom : 8px;
	}
	.box_info ul li .info_price_total {
	    color : red;
	     font-size: 12px;
	}
	.box_info ul li .info_price_unit {
	    font-size: 11px;
	}
	.box_info ul li .info_first {
	    margin-bottom : 3px;
	}
	
	/* 수업상세박스(버튼) css */
	.box_class_right .box_btn {
	    height : 70px;
	    text-align: center;
	}
	.box_btn .btn {
	    width : 100px; height : 40px;
	    font-size: 16px;
	    border: 1px solid rgb(204, 204, 204);
	    cursor: pointer;
	    outline: none;
	}
	.box_btn .btn_icon {
	    margin-right : 20px;
	}
	.box_btn .btn_icon .fas {
		display : none;
	}
	.box_btn .btn_icon.like .fas {
		color : #008e97;
		display : inline;
	}
	.box_btn .btn_icon .far {
		display : inline;
	}
	.box_btn .btn_icon.like .far {
		display : none;
	}
	
	/* 수업상세박스(신청하기) css */
	.box_class_right .box_apply {
	    position: relative;
	}
	.box_apply .box_apply_tit {
	    height: 30px;
	    text-align: center;
	}
	.box_apply_tit .apply_tit {
	    font-size: 20px;
	    font-weight: bold;
	}
	.box_apply_tit .apply_number {
	    color : #878787;
	}
	.box_apply .apply_choice {
	    width : 306px;
	    margin: auto;
	    margin-bottom : 10px;
	    position: relative;
	}
	.box_apply .apply_choice_nor {
	    width : 274px;
	}
	.apply_choice .apply_click {
	    height : 160px;
	    overflow-y: scroll;
	}
	.apply_choice .apply_list {
	    width : 140px;
	    line-height: 24px;
	    position: absolute;
	    top : 0; right : -150px;
	    padding-left : 10px;
	    color : #666;
	    display: none;
	}
	.apply_choice label {
	    text-align: center;
	    line-height: 38px;
	    font-size: 18px;
	    border-top: 1px solid rgb(204, 204, 204);
	    border-left: 1px solid rgb(204, 204, 204);
	    border-right: 1px solid rgb(204, 204, 204);
	    color : #7d7d7d;
	    display: block;
	    cursor: pointer;
	    padding : 0 5px;
	}
	.box_apply .apply_choice label:last-child {
	    border-bottom: 1px solid rgb(204, 204, 204);
	}
	.box_apply .apply_choice label:hover {
	    color : #000;
	}
	.apply_choice label .apply_choice_check {
	    display: none;
	}
	.apply_choice .apply_click_cur label {
	    cursor: auto;
	    color : #000;
	}
	.box_class_right .box_btn_apply {
	    text-align: center;
	}
	.box_btn_apply .btn_apply {
	    width : 220px;
	    height : 50px;
	    border : none;
	    background-color : #008e97;
	    color : #fff;
	    font-size: 24px;
	    font-weight: bold;
	    cursor: pointer;
	}
	
	/* 수업신청 팝업 css */
	.level_one {
	    display: none;
	}
	.level_two {
	    display: none;
	}
	#wrapper .cover {
	    position: fixed;
	    top : 0; left : 0;
	    width : 100%; height : 100%;
	    background-color : rgba(0,0,0,.7);
	    display: none;
	    z-index: 200;
	}
	.cover .box_cover {
	    position: fixed;
	    top : 50%; left : 50%;
	    transform : translate(-50%, -50%);
	    width : 750px;
	    height : 550px;
	    background-color : #fff;
	}
	.box_cover .box_cover_tit {
	    line-height: 70px;
	    padding-left : 20px;
	    margin-bottom : 30px;
	    background-color : #008e97;
	    font-size: 24px;
	    font-weight: 500;
	    color : #fff;
	    position: relative;
	}
	.box_cover .exit {
	    position : absolute;
	    top : 15px; right : 20px;
	    font-size: 40px;
	    cursor: pointer;
	    color : #fff;
	}
	.box_cover .box_cover_left {
	    width : 375px;
	    float: left;
	}
	.box_cover_left .cover_class_tit {
	    height: 50px;
	    padding : 0 20px;
	    margin-bottom : 60px;
	    font-size: 20px;
	    white-space: normal;
	    line-height: 1.2;
	    text-align: left;
	    overflow: hidden;
	    word-wrap: break-word;
	    display: -webkit-box;
	    -webkit-line-clamp: 2;
	    -webkit-box-orient: vertical;
	}
	.box_cover_left .cover_box_profile {
	    text-align: center;
	    margin-bottom : 40px;
	}
	.cover_box_profile img {
	    width : 110px; height : 110px;
	    border-radius: 110px;
	}
	.box_cover_left .cover_box_txt {
	    width : 300px;
	    margin : auto;
	    padding : 20px 0;
	    line-height: 40px;
	    border-radius: 3px;
	    background-color : #008e97;
	    color : #fff;
	    text-align: center;
	    position: relative;
	}
	.box_cover_left .cover_box_txt::after {
	    content : "";
	    display: block;
	    width : 0; height : 0;
	    position: absolute;
	    top : -20px; left : 50%;
	    transform : translateX(-50%);
	    border-top : 10px solid transparent;
	    border-left : 10px solid transparent;
	    border-right : 10px solid transparent;
	    border-bottom : 10px solid #008e97;
	}
	.cover_box_txt strong {
	    display: block;
	    font-size: 24px;
	    font-weight: bold;
	}
	.box_cover .box_cover_right {
	    width : 375px;
	    height : 404px;
	    float: right;
	    text-align: center;
	}
	.box_cover_right .cover_class_step {
	    margin-bottom : 25px;
	}
	.cover_class_step ul {
	    padding : 0 50px;
	}
	.cover_class_step ul::after {
	    content : "";
	    display: block;
	    clear : both;
	}
	.cover_class_step ul li {
	    float: left;
	    padding : 0 10px;
	    font-size: 20px;
	    border-right : 1px solid rgb(204, 204, 204);
	}
	.cover_class_step ul li.on {
	    color : red;
	    font-weight: bold;
	}
	.cover_class_step ul li:last-child {
	    border : none;
	}
	.cover_form .cover_form_level {
	    width : 360px;
	    margin : auto;
	}
	.cover_form_level .form_level_tit {
	    font-size: 18px;
	    height: 40px;
	}
	.cover_form_level label {
	    width : 110px; height : 40px;
	    line-height: 40px;
	    display: inline-block;
	    margin-bottom : 20px;
	    margin-right : 20px;
	    padding : 0 5px;
	    border : 1px solid rgb(124, 124, 124);
	    border-radius: 3px;
	    color : rgb(124, 124, 124);
	    cursor: pointer;
	}
	.cover_form_level input {
	    display: none;
	}
	.cover_form_level input:checked+label {
	    color : #008e97;
	    border : 1px solid #008e97;
	    font-weight: 500;
	}
	.cover_form .cover_form_request {
	    text-align: left;
	}
	.cover_form_request label {
	    display: block;
	    padding-left : 30px;
	    font-size: 18px;
	    margin-bottom : 10px;
	}
	.cover_form_request #request {
	    width : 260px; height : 100px;
	    padding : 5px;
	    margin-left : 40px;
	    resize: none;
	    outline-color: #008e97;
	    border : 1px solid rgb(154, 154, 154);
	}
	.cover_form .cover_form_btn {
	    padding-right : 10px;
	    margin-top : 10px;
	}
	.cover_form .cover_form_confirm {
	    margin-top : 90px;
	}
	.cover_form_btn .form_btn {
	    width : 100px; height : 40px;
	    border : none;
	    border-radius: 3px;
	    background-color : #008e97;
	    color : #fff;
	    cursor: pointer;
	    margin-right : 10px;
	}
	
	/* 다른 팝업 */
	.cover_form .cover_price {
	    line-height: 50px;
	    text-align: left;
	    margin-bottom : 30px;
	}
	.cover_price .price_tit {
	    display: inline-block;
	    width : 100px;
	    font-size: 18px;
	}
	.cover_price_person .box_price {
	    display: inline-block;
	}
	.cover_price_person i {
	    font-size: 25px;
	    display: inline-block;
	    margin : 0 3px;
	    padding-bottom : 3px;
	    vertical-align: middle;
	    cursor: pointer;
	}
	.cover_price_person #person {
	    width : 40px;
	    text-align: center;
	    font-size: 18px;
	    font-weight: bold;
	    border : none;
	    outline: none;
	    background-color : transparent;
	}
	.cover_price .price_total {
	    font-size: 18px;
	    color : red;
	}
	.cover_price_tax .price_tax {
	    font-size: 14px;
	}
	.cover_price_way input {
	    display: none;
	}
	.cover_price_way input:checked+label {
	    color : #008e97;
	    border : 1px solid #008e97;
	}
	.cover_price_way label {
	    margin-right : 10px;
	    padding : 2px 10px;
	    border : 1px solid rgb(124, 124, 124);
	    color : rgb(124, 124, 124);
	    cursor: pointer;
	    font-weight: 500;
	    border-radius: 3px;
	}
	
	/* 수업 리뷰 박스 css */
	.box_review {
	    min-height : 500px;
	    padding-top : 90px;
	    border-top : 1px solid #E0E0E0;
	}
	.box_review .box_review_wrap {
	    width : 1060px;
	    margin : auto;
	}
	.box_review_wrap .box_review_grade {
	    text-align: center;
	    font-size: 38px;
	}
	.box_review_grade .wrap_review_star {
	    min-height: 40px;
	    margin : 10px 0;
	}
	.box_review_star,
	.review_star_bg,
	.review_star {
	    height : 40px;
	}
	.review_star_bg,
	.review_star {
	    position: absolute;
	    background-image: url("/img/reviewStar.png");
	    background-repeat: no-repeat;
	}
	.wrap_review_star .box_review_star {
	    width : 205px;
	    margin : auto;
	    position: relative;
	}
	.box_review_star .review_star_bg {
	    width : 100%;
	    top : 0; left : 0;
	    background-position: 0 -130px;
	}
	.box_review_star .review_star {
	    width : 50%;
	    top : 0; left : 0;
	    background-position: 0 -170px;
	}
	.box_review_wrap .slider_direction {
	    text-align: right;
	    margin : 5px 0;
	}
	.slider_direction .direction {
	    width : 25px; height : 25px;
	    cursor: pointer;
	    margin-left : 10px;
	    font-size: 24px;
	    text-align: center;
	    color : #9E9E9E;
	}
	.slider_direction .direction:hover {
	    color : #000;
	}
	.box_review_wrap .box_review_slide {
	    height : 150px;
	    overflow: hidden;
	    margin-bottom : 30px;
	    position: relative;
	}
	.box_review_slide .box_review_img {
	    height : 150px;
	    position: absolute;
	    top : 0; left : 0;
	    transition: .5s ease;
	}
	.box_review_img img {
	    width : 200px; height : 150px;
	    float: left;
	    margin-right : 15px;
	}
	.box_review_img img:last-child {
	    margin : 0;
	}
	
	/* 리뷰 리스트 css */
	.box_review_list ul {
	    margin-bottom : 50px;
	}
	.box_review_list ul .review_list{
	    border-bottom: 1px solid rgb(184, 184, 184);
	    margin-bottom : 30px;
	}
	.review_list::after{
	    content: "";
	    display: block;
	    clear: both;
	}
	.review_list .profile_picture_box{
	    width: 120px;
	    float: left;
	    padding-top : 10px;
	    text-align: center;
	}
	.profile_picture_box .profile_picture{
	    width: 80px;
	    height: 80px;
	    border-radius: 50%;
	    margin-bottom : 10px;
	}
	.review_list .box_class_review {
	    width : 940px;
	    float: right;
	}
	.box_class_review .box_review_tit {
	    padding-top : 5px;
	    padding-bottom : 15px;
	}
	.box_class_review .box_review_tit::after {
	    content : "";
	    display: block;
	    clear: both;
	}
	.box_review_tit .review_class_tit {
	    float: left;
	    width : 340px;
	}
	.review_class_tit .review_id {
	    font-size: 18px;
	}
	.wrap_small_star,
	.box_small_star,
	.small_star_bg,
	.small_star {
	    height : 18px;
	}
	.box_small_star .small_star_bg,
	.box_small_star .small_star {
	    background-image: url("/img/reviewStar.png");
	    background-repeat: no-repeat;
	    position: absolute;
	    top : 0; left : 0;
	}
	.wrap_small_star {
	    width : 105px;
	    margin : 8px 0;
	}
	.wrap_small_star .box_small_star {
	    position: relative;
	}
	.box_small_star .small_star_bg {
	    width : 105px;
	    background-position: 0 0;
	}
	.box_small_star .small_star {
	    background-position: 0 -20px;
	}
	.review_class_tit .review_regdate {
	    font-size: 14px;
	    color : #9E9E9E;
	}
	.box_review_tit .review_picture_box {
	    width : 600px;
	    float: right;
	}
	.review_picture_box img {
		width : 100px; height : 100px;
	    margin-right : 15px;
	    float: right;
	}
	.box_class_review .review_txt{
	    text-align: justify;
	    padding-bottom : 30px;
	    line-height: 22px;
	}
	
	/* 버튼 css */
	.btn {
	    border-radius: 3px;
	    cursor: pointer;
	    outline: none;
	}
	
	/* 추가공통클래스 css */
	.box_apply .apply_choice .time {
	    background-color : #008e97;
	    color : #fff;
	}
      
	/* 드래그 방지 */
	.cover_price_person,
	.cover_form_level,
	.cover_price_way,
	.private_open,
	.box_apply {
	    user-select: none;
	}
	.review_empty {
		text-align: center;
		line-height : 147px;
		font-size : 24px;
		font-weight : bold;
		color : rgb(184, 184, 184);
	}
      
	/* 페이징 CSS */
	.paginate {
		font-size:22px;
		text-align:center;
		height:50px;
		line-height:50px;
		font-weight:500;
		margin: 10px;
	}
	.paginate a, 
	.paginate span,
	.paginate strong{
		color:#858585;
		text-decoration:none;
		padding:4px 14px;
		border:1px solid transparent;
		transition:.1s ease;
	}
	.paginate span {
		border-color:#E1E1E1;
		cursor: not-allowed;
	}
	.paginate a:hover {
		background:#14BAB6;
		border-color:#fff;
		font-weight:bold;
		color:#fff;
	}
	.paginate strong {
		background:#10a39e;
		border-color:#10a39e;
		color:#fff;
		cursor: not-allowed;
		font-weight:bold;
		box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}
	
	/* 비활성화 */
	.paginate span.next,
	.paginate span.prev {
		border-color:#E1E1E1;
		color:#E1E1E1;
		cursor:default;
		cursor:not-allowed;
	}
</style>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"></c:import>
<!-- wrapper 시작 -->
<div id="wrapper">
    <div class="box_class">
        <div class="box_class_left">
            <div class="box_left">
                <div class="box_class_img">
                    <div class="box_img">
                    <c:forEach items="${imgs}" var="img">
                        <img src="/upload/${img.name}"/>
                    </c:forEach>
                    </div><!-- //box_img -->
                    <div class="box_img_prev box_direction">
                        <i class="fas fa-chevron-circle-left icon_left"></i>
                    </div>
                    <div class="box_img_next box_direction">
                        <i class="fas fa-chevron-circle-right icon_right"></i>
                    </div>
                </div><!-- //box_class_img -->
                <div class="box_class_tab">
                    <ul>
                        <li><a href="#mentoInfo" class="on mento_info_link">멘토정보</a></li>
                        <li><a href="#classInfo" class="class_info_link">수업소개</a></li>
                        <li><a href="#review" class="review_link">리뷰</a></li>
                    </ul>
                </div><!-- //box_class_tab -->
                <div class="box_class_info mento_info">
                    <div class="box_detail_info">
                        <h2 id="mentoInfo" class="class_info_tit">멘토정보</h2>
                        <div class="mento_certification">
                            <ul>
                            <c:forEach items="${backgrounds}" var="background">
                                <li>
                                    <i class="far fa-address-card"></i>
                                    ${background.school} <c:if test="${background.major!=null}">${background.major}</c:if>
                                </li>
                            </c:forEach>
                            </ul>
                        </div><!-- //mento_certification -->
                        <%-- 멘토 정보 출력하는 공간, white-space속성을 pre로 지정해주시면 됩니다. --%>
                        <div class="class_info_txt"><c:choose><c:when test="${appeals==null}">${appeals}</c:when><c:otherwise>${appeals}</c:otherwise></c:choose></div><!-- //class_info_txt -->
                    </div><!-- //box_detail_info -->
                </div><!-- //mento_info(멘토정보) -->
                <div id="classInfo" class="box_class_info class_info">
                	<%-- 수업소개는 quill에디터 사용한 곳이라서 db에서 받은 그대로 출력하면 됩니다. --%>
                    <div class="box_detail_info">
                        <h2 class="class_info_tit">수업소개</h2>
                        <div class="class_info_txt">${lesson.introduction}</div><!-- //class_info_txt -->
                    </div><!-- //box_detail_info -->
                </div><!-- //class_info(수업소개) -->
                <div class="box_class_info class_target">
                    <%-- 수업 대상 출력하는 공간, white-space속성을 pre로 지정해주시면 됩니다. --%>
                    <div class="box_detail_info">
                        <h2 class="class_info_tit">수업대상</h2>
                        <div class="class_info_txt">${lesson.target}</div><!-- //class_info_txt -->
                    </div><!-- //box_detail_info -->
                </div><!-- //class_target(수업대상) -->
                <%-- 커리 큘럼 출력하는 공간, white-space속성을 pre로 지정해주시면 됩니다. --%>
                <div class="box_class_info class_curriculum">
                    <div class="box_detail_info">
                        <h2 class="class_info_tit">커리큘럼</h2>
                        <div class="class_info_txt">
                            <dl class="class_curriculum_dl"><c:forEach items="${curriculums}" var="curriculum"><div class="box_curriculum"><dt class="class_curriculum_round">${curriculum.round }회차</dt><dd class="class_curriculum_txt">${curriculum.content }</dd></div><!-- //box_curriculum --></c:forEach></dl><!-- //class_curriculum_dl -->
                        </div><!-- //class_info_txt -->
                    </div><!-- //box_detail_info -->
                </div><!-- //class_curriculum(커리큘럼) -->
                <div class="box_class_info class_video">
                    <div class="box_detail_info">
                        <h2 class="class_info_tit">수업 맛보기</h2>
                        <div class="class_info_txt"><%-- 수업 맛보기 영상은 src속성에 영상 링크 넣어주시면 됩니다. --%><c:forEach items="${samples}" var="sample"><iframe width="600" height="335"
	                                src="${sample.url}" frameborder="0"
	                                allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
	                                allowfullscreen></iframe></c:forEach></div><!-- //class_info_txt -->
                    </div><!-- //box_detail_info -->
                </div><!-- //class_video(수업 맛보기) -->
            </div><!-- //box_left -->
        </div><!-- //box_class_left -->
        <div class="box_class_right">
            <div class="box_right_tit">
                <div class="box_category">
                    <div class="category">
                    	${category.upperName}
						<i class="fas fa-chevron-right"></i>
						${category.name }
					</div>
					<c:if test="${loginMember!=null && loginMember.memberNo ==lesson.memberNo }">
                    <a href="/lessonUpdate.jsp" class="btn_update btn">수정</a>
                    <div class="private_open">
                        <label class="slider">
                            <input type="checkbox" id="toggleBtn"/>
                            <a href="/lessonUpdate.djdn?lessonNo=${lesson.lessonNo}&status=${open}" class="open_btn  <c:if test="${!openFlag}">open</c:if>">
                            <c:choose><c:when test="${openFlag}">공개</c:when><c:otherwise>비공개</c:otherwise></c:choose>
                            </a>
                        </label>
                    </div><!-- //private_open -->
                    </c:if>
                </div><!-- //box_category -->
                <div class="box_tit">
	                ${lesson.title }
                </div><!-- //box_tit -->
                <div class="box_grade">
                    <!-- 평점 이미지 들어가야 하는 공간 -->
                    <div class="wrap_small_star class_grade">
                        <div class="box_small_star">
                            <div class="small_star_bg"></div>
                            <div class="small_star" style="width : ${review.scoreAvg}%"></div>
                        </div><!-- //box_small_star -->
                    </div><!-- //wrap_small_star -->
                    <div class="class_grade_count">(${review.count})</div>
                </div><!-- //box_grade -->
                <div class="box_tag">
                <c:forEach items="${tags}" var="tag">
                    <span>#${tag.tag }</span>
                </c:forEach>
                </div><!-- //box_tag -->
            </div><!-- //box_right_tit -->
            <div class="box_mento_info">
                <div class="mento_profile">
                    <a href="/mentorProfile.djdn?mentorNo=${mentor.memberNo}" class="mento_profile_link">
                        <img src="/profile/${mentor.profileImg }" class="mento_profile_img"/>
                        <div class="mento_name">${mentor.nickname }</div>
                    </a>
                </div><!-- //mento_profile -->
                <div class="mento_txt">
                	${lesson.message }
                </div><!-- //mento_txt -->
            </div><!-- //box_mento_info -->
            <div class="box_info">
                <ul>
                    <li>
                        <i class="fas fa-map-marker-alt icon"></i>
                        <div class="info_place_big info_first">${location.addressSido }</div>
                        <div class="info_place_small">${location.address }</div>
                    </li>
                    <li>
                        <i class="far fa-clock icon"></i>
                        <div class="info_time">${lesson.getFormatRoundHour() }<span class="info_time_round">/1회</span></div>
                    </li>
                    <li>
                        <i class="fas fa-user-friends icon"></i>
                        <div class="info_class_form info_first">
                        <c:choose>
                        	<c:when test="${lesson.type eq 'M'.charAt(0)}">다회차수업</c:when>
                        	<c:otherwise>원데이클래스</c:otherwise>
                        </c:choose>
						</div>
                        <div class="info_class_form">
                        <c:choose>
                        	<c:when test="${lesson.personnel eq 'G'.charAt(0)}">그룹</c:when>
                        	<c:otherwise>1대1</c:otherwise>
                        </c:choose>수업
                        </div>
                    </li>
                    <li>
                        <i class="fas fa-dollar-sign icon"></i>
                        <div class="info_price info_first">
                            <span class="info_price_unit">/시간</span>
                        </div>
                        <span class="info_price_total"><span class="price">${lesson.getTotalPrice()}</span>
                            <span class="info_price_unit">/총 <span class="round">${lesson.round}</span>회</span>
                        </span>
                    </li>
                </ul>
            </div><!-- //box_info -->
            <div class="box_btn">
                <button class="btn btn_icon <c:if test="${flag }">like</c:if>">
                	<i class="fas fa-star"></i>
                	<i class="far fa-star"></i> 
                	<span class="like_count">${likeCount }</span>
                </button>
                <button class="btn">대화하기</button>
            </div><!-- //box_btn -->
            <div class="box_apply">
                <div class="box_apply_tit">
                <c:choose>
	                <c:when test="${lesson.type eq 'M'.charAt(0)&&lesson.personnel eq 'G'.charAt(0)}">
	                   	<span class="apply_tit">수업날짜</span>
	                </c:when>
	                <c:otherwise>
						<span class="apply_tit">수업날짜선택</span>
	                    <span class="apply_number">
	                    <span class="apply_count">0</span>/<span class="apply_total">10</span>
	                    </span>
	                </c:otherwise>
                </c:choose>
                </div>
                <c:choose>
	                <c:when test="${lesson.type eq 'M'.charAt(0)&&lesson.personnel eq 'G'.charAt(0)}">
	                <div class="apply_choice">
	                   <div class="apply_click apply_click_cur">
	                   <c:forEach items="${schedules}" var="schedule">
	                        <label data-day="${schedule.mentorScheduleNo}">
	                            <input type="text" class="apply_choice_check"
	                                   name="classDate" form="classForm" value="${schedule.startDate}"/>
	                           <span class="apply_round">${schedule.r}회차</span>
	                           	${schedule.getDate()}
	                           	${schedule.getAmPm()} ${schedule.getFirstTime()} ~ ${schedule.getAmPmCheck()} ${schedule.getLastTime()}
	                        </label>
	                    </c:forEach>
	                    </div>
	                </div>
	                </c:when>
	                <c:otherwise>
	                <div class="apply_choice apply_choice_nor">
	                     <div class="apply_list">
	                         <div class="apply_list_date"></div>
	                         <div class="apply_list_time"></div>
	                     </div>
	                     <div class="apply_click">
	                     <c:forEach items="${schedules}" var="schedule">
	                        <label data-day="${schedule.mentorScheduleNo}">
	                            <input type="checkbox" class="apply_choice_check"
	                                   name="classDate" form="classForm" value="${schedule.startDate}"/>
	                            <span class="date">${schedule.getDate()}</span> <span class="class_time">
	                            ${schedule.getAmPm()} ${schedule.getFirstTime()} ~ ${schedule.getAmPmCheck()} ${schedule.getLastTime()}
	                            </span>
	                        </label>
	                     </c:forEach>
	                     </div><!-- //apply_click -->
	                 </div><!-- //apply_choice -->
					</c:otherwise>
				</c:choose>
            </div><!-- //box_apply -->
            <div class="box_btn_apply">
                <button class="btn_apply btn">수강신청</button>
            </div><!-- //box_btn_apply -->
        </div><!-- //box_class_right -->
    </div><!-- //box_class -->
    <div id="review" class="box_review">
        <div class="box_review_wrap">
            <h2 class="class_info_tit review_tit">리뷰</h2>
            <div class="box_review_grade">
                <div class="review_grade">${review.scoreAvg/20}</div>
                <div class="wrap_review_star">
                    <div class="box_review_star">
                        <div class="review_star_bg"></div>
                        <div class="review_star" style="width : ${review.scoreAvg}%"></div>
                    </div><!-- //box_review_star -->
                </div><!-- //wrap_review_star -->
            </div><!-- //box_review_grade -->
            <c:if test="${!reviewImgs.isEmpty()}">
            <div class="slider_direction">
                <i class="fas fa-chevron-left prev direction"></i>
                <i class="fas fa-chevron-right next direction"></i>
            </div><!-- //slider_direction -->
            <div class="box_review_slide">
           		<div class="box_review_img">
           			<c:forEach items="${reviewImgs}" var="reviewImg">
                    	<img src="/upload/${reviewImg.name}"/>
                    </c:forEach>
                </div><!-- //box_review_img -->
            </div><!-- //box_review_slide -->
            </c:if>
            <div class="box_review_list">
                <ul>
                 	
                 
                </ul>
            </div><!-- //box_review_list -->
        </div><!-- //box_review_wrap -->
    </div><!-- //box_review -->
    <div class="cover">
        <form action="" method="post" id="classForm">
        <input type="hidden" name="lessonNo" value="${lesson.lessonNo }"/>
        <input type="hidden" name="payment" value="${lesson.getTotal()}"/>
        <div class="box_cover level_one">
            <h2 class="box_cover_tit">수강 신청하기</h2>
            <div class="exit">
                <i class="far fa-times-circle"></i>
            </div><!-- //exit -->
            <div class="box_cover_left">
                <h3 class="cover_class_tit">${lesson.title}</h3>
                <div class="cover_box_profile">
                    <img src="/profile/default.png" alt="멘토프로필사진" />
                </div><!-- //cover_box_profile -->
                <div class="cover_box_txt">
                    <strong>본인의 레벨, 요청사항</strong>
                    <span>을 입력해 주세요!</span>
                </div><!-- //cover_box_txt -->
            </div><!-- //box_cover_left -->
            <div class="box_cover_right">
                <div class="cover_class_step">
                    <ul>
                        <li class="on">레벨 및 요청 사항</li>
                        <li>결제</li>
                    </ul>
                </div><!-- //cover_class_step -->
                <div class="cover_form">
                        <div class="cover_form_level">
                            <div class="form_level_tit">본인의 수준은 어느정도라고 생각하시나요?</div>
                            <input type="radio" name="menteeLevel" class="level_check"
                                   id="first" value="D"/>
                            <label for="first">처음해봐요</label>
                            <input type="radio" name="menteeLevel" class="level_check"
                                   id="middle" value="C"/>
                            <label for="middle">한두번 해봤어요</label>
                            <input type="radio" name="menteeLevel" class="level_check"
                                   id="good" value="B"/>
                            <label for="good">어느정도해요</label>
                            <input type="radio" name="menteeLevel" class="level_check"
                                   id="veryGood" value="A"/>
                            <label for="veryGood">잘해요</label>
                        </div><!-- //cover_form_level -->
                        <div class="cover_form_request">
                            <label for="request">요청사항</label>
                            <textarea placeholder="멘토가 수업전에 알아야 할 사항이나 요청사항을 입력해 주세요(100자 이내)."
                                      id="request" name="request" maxlength="100"></textarea>
                        </div><!-- //cover_form_request -->
                        <div class="cover_form_btn">
                            <button type="button" class="btn_next form_btn btn">다음으로</button>
                        </div><!-- //cover_form_btn -->
                </div><!-- //cover_form -->
            </div><!-- //box_cover_right -->
        </div><!-- //box_cover -->
        <div class="box_cover level_two">
            <h2 class="box_cover_tit">수강 신청하기</h2>
            <div class="exit">
                <i class="far fa-times-circle"></i>
            </div>
            <div class="box_cover_left">
                <h3 class="cover_class_tit">${lesson.title}</h3>
                <div class="cover_box_profile">
                    <img src="/profile/default.png" alt="멘토프로필사진" />
                </div><!-- //cover_box_profile -->
                <div class="cover_box_txt">
                    <strong>결제</strong>
                    <span>를 진행해 주세요!</span>
                </div><!-- //cover_box_txt -->
            </div><!-- //box_cover_left -->
            <div class="box_cover_right">
                <div class="cover_class_step">
                    <ul>
                        <li>레벨 및 요청 사항</li>
                        <li class="on">결제</li>
                    </ul>
                </div><!-- //cover_class_step -->
                <div class="cover_form">
                        <div class="cover_price_total cover_price">
                            <span class="price_tit">전체 수업료</span>
                            <span class="price_total price_class_total">${lesson.getTotalPrice()}</span>
                        </div><!-- //cover_price_total -->
                        <div class="cover_price_tax cover_price">
                            <span class="price_tit">결제 금액</span>
                            <span class="price_total price_tax_total">${lesson.getTotalTaxPrice()}</span><span class="price_tax"> (VAT 포함)</span>
                        </div><!-- //cover_price_tax -->
                        <div class="cover_price_way cover_price">
                            <span class="price_tit">결제 수단</span>
                            <input type="radio" id="card" class="price_check"
                                   name="method" value="C"/>
                            <label for="card">카드</label>
                            <input type="radio" id="bank" class="price_check"
                                   name="method" value="B"/>
                            <label for="bank">무통장 입금</label>
                            <input type="radio" id="mobile" class="price_check"
                                   name="method" value="M"/>
                            <label for="mobile">휴대폰</label>
                        </div><!-- //cover_price_way -->
                        <div class="cover_form_btn cover_form_confirm">
                            <button type="button" class="btn_prev form_btn btn">이전으로</button>
                            <button class="btn_sign form_btn btn">신청하기</button>
                        </div><!-- //cover_form_btn -->
                </div><!-- //cover_form -->
            </div><!-- //box_cover_right -->
        </div><!-- //box_cover -->
        </form>
    </div><!-- //cover -->
</div><!-- //wrapper -->

<c:if test="${error!=null}">
	<script>
		alert("${error}");
	</script>
</c:if>

<script type="text/template" id="reviewTmpl">
<@ if(reviewList.length==0) { @>
<li class="review_list">
	<div class="review_empty">아직 리뷰가 없습니다.</div>           
</li><!-- //review_list -->
<@ }else { @>
<@ _.each(reviewList, function(review){ @>
<li class="review_list">
        <div class="profile_picture_box">
            <img class="profile_picture" src="/profile/<@=review.profileImg@>">
        </div><!-- //profile_picture_box -->
        <div class="box_class_review">
            <div class="box_review_tit">
                <div class="review_class_tit">
                    <div class="review_id"><@=review.nickname@></div>
                    <div class="wrap_small_star">
                        <div class="box_small_star">
                            <div class="small_star_bg"></div>
                            <div class="small_star" style="width : <@=review.score*20@>%"></div>
                        </div><!-- //box_small_star -->
                    </div><!-- //wrap_small_star -->
                    <div class="review_regdate"><@=moment(review.regdate).format("YYYY-MM-DD HH:mm")@></div>
                </div><!-- //review_class_tit -->
                <div class="review_picture_box">
					<@ _.each(review.reviewImgs, function(reviewImg){ @>
                    <img class="review_picture" src="/upload/<@=reviewImg.name@>" alt="reviewPicture1" width="100">
					<@ }) @>
                </div><!-- //review_picture_box -->
            </div><!-- //box_review_tit -->
            <div class="review_txt">
               	<@=review.content@>
            </div><!-- //review_txt -->
        </div><!-- //box_class_review -->
</li><!-- //review_list -->
<@ }) @>
<@=paginate@>
<@ } @>
</script>
<c:import url="/WEB-INF/template/footer.jsp"></c:import>
<script src="/js/underscore-min.js"></script>
<script src="/js/moment-with-locales.js"></script>
<script>
	_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
    const $likeBtn = $(".btn_icon");
    const $likeStar = $(".btn_icon .far");
    //선언
    const $openBtn = $(".open_btn");
    const $updateBtn = $(".btn_update");
    //수업 회차 얻어오는 변수
    const $round = $(".round");
    const $applyTotal = $(".apply_total");
    //수업시간 얻어오는 변수
    const $classTimeList = $(".apply_choice_nor input");
    const classTimes = [];
    //선택한 수업 시간을 얻어옴
    const $applyCount = $(".apply_count");
    //BOM window객체를 jquery객체로 변환
    const $window = $(window);
    //BOM document객체를 jquery객체로 변환
    const $document = $(document);
    //오른쪽 박스 변수선언
    const $boxRight = $(".box_class_right");
    const round = $round.text();
    //탭 박스 변수선언
    const $classTab = $(".box_class_tab ul");
    const $classTabItem = $(".box_class_tab ul li a")
    const $classTabMento = $(".box_class_tab ul li .mento_info_link")
    const $classTabClass = $(".box_class_tab ul li .class_info_link")
    const $classTabReview = $(".box_class_tab ul li .review_link")
    //리뷰박스 높에 얻은후 계산
    const boxLeft = $(".box_left").outerHeight();
    const classImg = $(".box_class_img").outerHeight();
    const mentoInfo = $(".mento_info").outerHeight();
    const classVideoTop = $(".class_video").offset().top;
    const boxClassRight = $(".box_class_right").outerHeight();
    const boxReview = $(".box_review").outerHeight();
    const dHeight = $document.height();
    let totalHeight = dHeight - boxReview - boxClassRight - 460;
    //이미지박스 jquery객체로 변환
    const $boxImg = $(".box_img");
    const $boxImgItem = $(".box_img img");
    const $boxImgNext = $(".box_img_next");
    const $boxImgPrev = $(".box_img_prev");
    //리뷰이미지박스 jquery객체로 변환
    const $boxReviewImg = $(".box_review_img");
    const $boxReviewImgItem = $(".box_review_img img");
    const $reviewPrev = $(".slider_direction .prev");
    const $reviewNext = $(".slider_direction .next");
    //수업신청 버튼 jquery객체로 변환
    const $applyBtn = $(".btn_apply");
    const $levelOnePopup = $(".level_one");
    const $levelTwoPopup = $(".level_two");
    const $cover = $(".cover");
    const $nextBtn = $(".btn_next");
    const $prevBtn = $(".btn_prev");
    //수업신청팝업 결제인원수 jquery객체로 변환
    const $person = $("#person");
    //x버튼 jquery객체로 변환
    const $exit = $(".exit");
    //수업신청팝업 수업료 jquery객체로 변환
    const $formLevel = $(".cover_form_level input");
    const $request = $("#request");
    //수업신청팝업 레벨 체크input
    const $levelCheck = $(".level_check");
    //수업신청버튼 form
    const $classForm = $("#classForm");
    const $priceCheck = $(".price_check");
    //수업신청박스
    const $applyClick = $(".apply_click label");
    const $applyList = $(".apply_list");
    
    //리뷰 템플릿을 얻어오는 함수
    const reviewTmpl = _.template($("#reviewTmpl").html());
    const $reviewBox = $(".box_review_list ul");
	let page = 1;
	
	//리뷰리스트를 얻어오는 함수(ajax)
	function getReviewList() {
		$.ajax({
			url : "/ajax/getReviewList.djdn",
			type : "GET",
			dataType : "json",
			data : {
				lessonNo : "${lesson.lessonNo}",
				page : page
			},
			error : function () {
				
			},
			success : function (json) {
				console.log(json.reviewList);
				$reviewBox.html(reviewTmpl(json));
			}
		});//$.ajax() end
	}//getReviewList() end
    
	getReviewList();//리뷰리스트 얻는 함수 호출
	
	$reviewBox.on("click",".paginate a",function(e) {
		e.preventDefault();
		page = this.dataset.page;
		getReviewList();
	});//.paginate a click end

    $applyClick.mouseenter(function () {
        $(".apply_list").show();
        const date = $(this).children(".date").text();
        const time = $(this).children(".class_time").text();
        $(".apply_list_date").text(date);
        $(".apply_list_time").text(time);
    });

	$applyClick.mouseleave(function () {
        $(".apply_list").hide();
    });
	
    //like 버튼 ajax
    $likeBtn.click(function () {
    	<c:choose>
    	<c:when test="${loginMember==null}">
    		alert("로그인이 필요합니다");
    		location.href="/login.djdn";
    	</c:when>
    	<c:otherwise>
    	$.ajax({
    		url : "/ajax/like.djdn",
    		type : "GET",
    		dataType : "json",
    		data : {lessonNo : "${lesson.lessonNo}"},
    		error : function() {
				alert("점검 중");
			},
			success : function(json) {
				if(json.flag) {
					$likeBtn.addClass("like");
				}else {
					$likeBtn.removeClass("like");
				}//if~else end
				$(".like_count").text(json.count);
			}
    	});//$.ajax() end
    	</c:otherwise>
    	</c:choose>
    });

    personDisabled();
    
    function personDisabled() {
        //시작할 때 인원수가 1이면 minus버튼 비활성화
        if($person.val()==1) {
            $minus.css("color","#999");
            $minus.css("pointer-events","none");
        }
    }

    //이미지가 늘어날 때마다 이미지 박스 길이가 넓어짐
    const imgList = $boxImgItem.length;
    const boxImgWidth = 630*imgList;
    $boxImg.css("width",boxImgWidth);

    const reviewImgList = $boxReviewImgItem.length;
    const ReviewBoxImgWidth = 215*reviewImgList;
    $boxReviewImg.css("width",ReviewBoxImgWidth-15);

    //이미지가 없거나 처음 켰을 때 작동
    let left = 0;
    let reviewLeft = 0;
    
    if(left==0) {
        $boxImgPrev.hide();
    }//if() end
    
    if(boxImgWidth==630) {
        $boxImgPrev.hide();
        $boxImgNext.hide();
    }//if() end

    if(reviewLeft==0) {
        $reviewPrev.css("pointer-events","none");
    }//if() end
    
    if(ReviewBoxImgWidth<=1060) {
        $reviewPrev.css("pointer-events","none");
        $reviewNext.css("pointer-events","none");
    }//if() end


    //토글버튼 작동
    $openBtn.click(toggleBtn);
    
    function toggleBtn() {
        $openBtn.toggleClass("open");
        if($openBtn.hasClass("open")) {
            $openBtn.text("공개").css("text-align","left");
            $updateBtn.hide();
        } else {
            $openBtn.text("비공개").css("text-align","right");
            $updateBtn.css("display","inline-block");
        }//if~else end
    }//toggleBtn() end
    
    //수업회차를 얻어오는 함수
    function getClassRound() {
        $applyTotal.text(round);
    }
    
    toggleBtn();
    getClassRound();
    
    //수업날짜 선택 이벤트
    $classTimeList.on("click",function () {
        $(this).parent("label").toggleClass("time");
        let classData = $(this).parent("label").data("day");
        
        if(!$(this).parent("label").hasClass("time")) {
            classTimes.pop(classData);
        } else {
            classTimes.push(classData);
        }//if~else end

        $applyCount.text(classTimes.length);

        if(classTimes.length==round) {
            $classTimeList.parent("label").not(".time").css("pointer-events","none");
        }else {
            $classTimeList.parent("label").not(".time").css("pointer-events","visible");
        }//if~else end
    });//$classTimeList click() end

    //스크롤이벤트
    $window.on("scroll", function () {
        const sTop = $window.scrollTop();
        const windowWidth = $document.innerWidth()/2
        //수업상세내용 박스가 움직이는 것
        if(sTop>101) {
            // alert("150");
            $boxRight.css({
                "position" : "fixed",
                top : 60,
                right : windowWidth-540
            });
        }else {
            $boxRight.css("position","static");
        }//if~else end

        if(sTop>totalHeight) {
            $boxRight.css({
                "position" : "absolute",
                top : totalHeight-90,
                right : 0
            });
        }

        //각 수업 탭 박스가 움직이는 것
        if(sTop>621) {
            $classTab.css({
                "position" : "fixed",
                top : 0,
                left : windowWidth-540
            });
            $classTabItem.removeClass("on");
            $classTabMento.addClass("on");
        }else {
            $classTab.css("position","static");
        }//if~else end

        if(sTop>mentoInfo+classImg+60) {
            $classTabItem.removeClass("on");
            $classTabClass.addClass("on");
        }

        if(sTop>boxLeft+50) {
            $classTabItem.removeClass("on");
            $classTabReview.addClass("on");
        }

    });//$window scroll() end

    //수업이미지 슬라이드
    $boxImgNext.on("click", function () {
        left-=630;
        $boxImg.css("left",left);
        if(-left==boxImgWidth-630) {
            $boxImgNext.hide();
            $boxImgPrev.show();
        } else {
            $boxImgNext.show();
            $boxImgPrev.show();
        }//if~else end
    });//$boxImgNext click() end
    
    $boxImgPrev.on("click",function () {
        left+=630;
        $boxImg.css("left",left);
        if(left==0) {
            $boxImgPrev.hide();
            $boxImgNext.show();
        } else {
            $boxImgPrev.show();
            $boxImgNext.show();
        }//if~else end
    });//$boxImgPrev click() end
    
    //리뷰슬라이드
    $reviewNext.on("click", function () {
        getDirection();
        reviewLeft-=215;
        $boxReviewImg.css("left",reviewLeft);
        if(-reviewLeft==(ReviewBoxImgWidth-15)-1060) {
            $reviewNext.css("pointer-events","none");
        } else {
            getDirection();
        }//if~else end
    });//$boxImgNext click() end
    
    $reviewPrev.on("click", function () {
        getDirection();
        reviewLeft+=215;
        $boxReviewImg.css("left",reviewLeft);
        if(reviewLeft==0) {
            $reviewPrev.css("pointer-events","none");
        } else {
            getDirection();
        }//if~else end
    });//$boxImgNext click() end
    
    //슬라이드 방향 공통함수
    function getDirection() {
        $reviewNext.css("pointer-events","auto");
        $reviewPrev.css("pointer-events","auto");
    }

    //수업 팝업창이 열리는 이벤트
    $applyBtn.click(function () {
	   	<c:choose>
	   	<c:when test="${loginMember!=null}">
	        $cover.show();
	        $levelOnePopup.show();
		</c:when>
		<c:otherwise>
	    	alert("로그인 해주세요.");
	    	location.href = "/login.djdn";
		</c:otherwise>
		</c:choose>
    });//$applyBtn click() end
    
    $nextBtn.click(function () {
        if($levelCheck.is(":checked")) {
            $levelOnePopup.hide();
            $levelTwoPopup.show();
        }else {
            alert("수업레벨을 선택해주세요.");
            return false;
        }
    });//$formBtn click() end
    
    $prevBtn.click(function () {
        $levelOnePopup.show();
        $levelTwoPopup.hide();
    });//$prevBtn click() end

    //팝업창 종료
    $cover.click(exit)//$cover click() end
    $exit.click(exit);
    
    $document.keydown(function (e) {
        if(e.keyCode==27) {
            exit();
        }//if() end
    });
    
    $levelOnePopup.click(function (e) {
        e.stopPropagation();
    });
    
    $levelTwoPopup.click(function (e) {
        e.stopPropagation();
    });


    //수업신청팝업에서 신청버튼을 클릭해서 form을 넘기는 이벤트
    $classForm.submit(function () {
        if(!$priceCheck.is(":checked")) {
            alert("결제수단을 선택해주세요.");
            return false;
        }//if() end
    });//$classForm submit() end

    //팝업창 종료하는 함수
    function exit() {
        if($levelCheck.is(":checked")||$request.val().length>=1) {
            if(!confirm("수업신청을 그만두시겠습니까?")) {
                return false;
            }//if() end
        }//if() end
        
        $cover.hide();
        $levelOnePopup.hide();
        $levelTwoPopup.hide();

        //팝업창 종료할 때 기본값 초기화
        $formLevel.prop("checked",false);
        $request.val("");
        personNumber = 1;
        $person.val(personNumber);
        personDisabled();
    }

    //숫자에 콤마 추가해주는 함수
    function addComma(num) {
        let regexp = /\B(?=(\d{3})+(?!\d))/g;
        return num.toString().replace(regexp, ',');
    }
</script>
</body>
</html>