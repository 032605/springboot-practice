<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가치코딩 .</title>
<link rel="stylesheet" href="/static/css/style.css">
<script src="/static/js/main.js"></script>
</head>

<body>

<div class="header" data-aos="fade-down" data-aos-delay="300">
	<!-- 로고, 메뉴 -->
	<div class="header-box">
		<h1 class="logo"><a href="<c:url value='/usr/article/list' />"><span>공부 .</span></a></h1>

		<div class="cursor">
		</div>

		<div class="tnb">
			<ul>
				<li><a href="<c:url value='../../member/login' />">로그인</a></li>
				<li><a href="<c:url value='../../member/join' />">회원가입</a></li>
				<li><a href="./member/mypage">마이페이지</a></li>
				<!--
				<li><a href="#none">로그아웃</a></li>
				<li><a href="#none">정보수정</a></li>
				-->
			</ul>
		</div>

		<div class="gnb">
			<ul>
				<li><a href="none">ABOUT</a></li>
				<li><a href="none">가치 코딩</a></li>
			</ul>
		</div>
	</div>
</div>