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
	div label{
		display:inline-block;
		width: 150px;
		height: 70px;
	}
	div input{
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
	#divInput{
		position: relative;
	}
	#divInput #idck{
		position:absolute;
		top:0;
		left: 335px;
	}
	#divInput #span1{
		position:absolute;
		top:35px;
		left:335px;
		font-size: 12px;
		color:red;
	}
	#divInput2{
		position: relative;
	}
	#span2{
		position:absolute;
		top:35px;
		left:335px;
		font-size: 12px;
		color:red;
	}
	
</style>
<section>
	
	<div id="container">
	<form action="join" method="post" id="f1">
		<div>
			<label>이름</label>
			<input type="text" name="username">
		</div>
		<div id="divInput">
			<label>아이디</label>
			<input type="text" name="userid" id="userid"> <button type="button" id="idck">중복체크</button><br>
			<span id="span1">4~20자의 영문,숫자만 사용 가능</span>
		</div>
		<div id="divInput2">
			<label>패스워드</label>
			<input type="password" name="userpw" id="userpw">
			<span id="span2">4~20자의 영문,숫자만 사용 가능</span>
		</div>
		<div>
			<label>패스워드 확인</label>
			<input type="password" id="userpwck">
		</div>
		<div>
			<label>이메일</label>
			<input type="text" name="email" placeholder="ex) yohjk079@naver.com">
		</div>
		<div>
			<label>전화번호</label>
			<input type="text" name="tel" placeholder="ex) 010-1234-5678">
		</div>
		<div>
			<input type="submit" value="가입" id="submitbutton">
		</div>
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
			                if (res > 0) {
			                    
			                    alert("존재하는 아이디입니다. 다른 아이디를 입력해주세요.");
			                    //아이디가 존제할 경우 빨깡으로 
			                    $("#userid").focus();
			                } else {
			                    alert("사용가능한 아이디입니다.");
			                   
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
		
	$("#f1").submit(function(){
		if($('input[name=username]').val() == ""){ //이름 공백 확인
			alert("이름을 입력하세요.");
			$('input[name=username]').focus();
			return false;
		}
		var getName= RegExp(/^[가-힣]+$/); // 한글
	      if (!getName.test($('input[name=username]').val())) {
	        alert("이름을 형식에 맞게 입력하세요.");
	        $('input[name=username]').val("");
	        $('input[name=username]').focus();
	        return false;
	      }
		
		
		if($('input[name=userid]').val() == ""){ //아이디 공백확인
			alert("아이디를 입력하세요.");
			$('input[name=userid]').focus();
			return false;
		}
		var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/); //4~20자의 영문,숫자만 사용 가능합니다.
		 if(!getCheck.test($('input[name=userid]').val())){
		        alert("아이디는 영문, 숫자 포함 4자이상 입력하세요.");
		        $('input[name=userid]').val("");
		        $('input[name=userid]').focus();
		        return false;
		      }
		
		if($('input[name=userpw]').val() == ""){ //패스워드 공백확인
			alert("패스워드를 입력하세요.");
			$('input[name=userpw]').focus();
			return false;
		}
	    if(!getCheck.test($('input[name=userpw]').val())) { //4~20자의 영문,숫자만 사용 가능합니다.
		    alert("패스워드를 형식에 맞게 입력하세요.");
		    $('input[name=userpw]').val("");
		    $('input[name=userpw]').focus();
		    return false;
	      }
	    
	    
		if($("#userpwck").val() == ""){ //패스워드확인 공백
			alert("패스워드 확인을 입력하세요.");
			$("#userpwck").focus();
			return false;
		}
		//비밀번호 똑같은지
	      if($('input[name=userpw]').val() != ($("#userpwck").val())){ 
	      alert("패스워드가 틀립니다.");
	      $('input[name=userpw]').val("");
	      $("#userpwck").val("");
	      $('input[name=userpw]').focus();
	      return false;
	     }
		
		if($('input[name=email]').val() == ""){ //이메일 공백확인
			alert("이메일을 입력하세요.");
			$('input[name=email]').focus();
			return false;
		}
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	    if(!getMail.test($('input[name=email]').val())){
	      alert("이메일을 형식에 맞게 입력해주세요")
	      $('input[name=email]').val("");
	      $('input[name=email]').focus();
	      return false;
	    }
		
		if($('input[name=tel]').val() == ""){ //전화번호 공백확인
			alert("전화번호를 입력하세요.");
			$('input[name=tel]').focus();
			return false;
		}
		
		
	})	
		
		
	function checkz() {
      
    
      var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정
 
 
     
      
      
	}
	</script>
	
	
	
	
	
	
	
	
	
</section>
</body>
</html>