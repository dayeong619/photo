<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Google Photos</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	*{margin:0; padding:0;}
	header{
		width: 100%;
		height: 70px;
		position: relative;		
		border-bottom: 1px solid #ccc;
	}
	header #logo{
		width:150px;
		height:50px;
		position:absolute;
		top:20px;
		left:30px;
	}
	header h2{
		position: absolute;
		top:20px;
		left:180px;
	}
	header #icon{
		width: 400px;
		height: 50px;
		position: absolute;
		top:20px;
		right: 0;
	}
	header #icon img{
		width: 30px;
		height: 30px;
		
	}
	header #icon #loginimg{
		width: 30px !important;
		height: 30px !important;	
		border: 1px solid black;
	}
</style>
</head>
<body>
<header>
	<div id="logo"><img src="${pageContext.request.contextPath}/resources/images/logo.png"></div>
	<h2>Photos</h2>
	<div id="icon">
		<a href="${pageContext.request.contextPath}/photoinsert"><img src="${pageContext.request.contextPath}/resources/images/plus.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;
		<img src="${pageContext.request.contextPath}/resources/images/share.png">&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/photolist"><img src="${pageContext.request.contextPath}/resources/images/jum.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/login"><img src="${pageContext.request.contextPath}/resources/images/ring.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/join"><img src="${pageContext.request.contextPath}/resources/images/login.png" id="loginimg"></a>
	</div>
</header>
