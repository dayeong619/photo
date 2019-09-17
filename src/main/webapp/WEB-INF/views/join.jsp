<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="include/header.jsp" %>
<style>
	#container{
		width:40%;
		margin:0 auto;
	}
	section{
		width: 100%;
		margin-top:50px;
	}
	p label{
		display:inline-block;
		width: 150px;
		height: 60px;
	}
	p input{
		height: 50px;
		border:1px solid #ccc;
	}
	#submitbutton{
		width: 171px;
		height: 50px;
		margin-left:160px;
	}
	button{
		width: 70px;
		height: 30px;
	}
</style>
<section>
	
	<div id="container">
	<form action="join" method="post">
		<p>
			<label>이름</label>
			<input type="text" name="username">
		</p>
		<p>
			<label>아이디</label>
			<input type="text" name="userid" id="userid"> <button id="idck">중복체크</button><br>
		</p>
		<p>
			<label>패스워드</label>
			<input type="password" name="userpw" id="userpw">
		</p>
		<p>
			<label>패스워드 확인</label>
			<input type="password" name="userpwck">
		</p>
		<p>
			<label>이메일</label>
			<input type="text" name="email">
		</p>
		<p>
			<label>전화번호</label>
			<input type="text" name="tel" placeholder="000-0000-0000">
		</p>
		<p>
			<input type="submit" value="가입" id="submitbutton">
		</p>
	</form>
	
	</div>
	<script>
		var idck = 0;
		$(function(){
			$("#idck").click(function(){
				var userid = $("#userid").val();
				
				$.ajax({
					 	type : "post",
			            data : userid,
			            url : "idcheck",
			            dataType : "json",
			            contentType: "application/json; charset=UTF-8",
			            success : function(res) {
			                if (res.cnt > 0) {
			                    
			                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
			                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
			                    $("#divInputId").addClass("has-error")
			                    $("#divInputId").removeClass("has-success")
			                    $("#userid").focus();
			                    
			                
			                } else {
			                    alert("사용가능한 아이디입니다.");
			                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
			                    $("#divInputId").addClass("has-success")
			                    $("#divInputId").removeClass("has-error")
			                    $("#userpwd").focus();
			                    //아이디가 중복하지 않으면  idck = 1 
			                    idck = 1;
			                    
			                }
			            },
			            error : function(error) {
			                
			                alert("error : " + error);
			            }
				})
				
				
				
				
				
				
			})
		})
	</script>
	
	
	
	
	
	
	
	
	
</section>
</body>
</html>