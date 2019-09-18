<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="include/header.jsp" %>
<style>
	section{
		width: 100%;
	}
	#fileform{
		background-color: #ccc;
		margin-top:50px;
		margin-left:50px;
	}
	#box{
		width:800px;
		height: 300px;
		border:1px dotted #ccc;
		margin-top: 10px;
		margin-left: 50px;
	}
	#box img{
		width:100px;
		height: 130px;
	}
</style>
<section>
	<form action="photoinsert" method="post" enctype="multipart/form-data">
		<input type="file" name="filename" multiple="multiple" id="fileform">
		<input type="submit" value="등록">
	</form>
	<div id="box">
		
	</div>
	
	<script>
		$("#fileform").change(function(){
			
			$($(this)[0].files).each(function(i,obj){
				var reader = new FileReader();
				console.log(obj)
				reader.onload = function(e){
					var $img = $("<img>").attr("src", e.target.result);
					$("#box").append($img);
				}
				reader.readAsDataURL(obj); //내가 선택한 한개의 파일을 읽어라
			});
			
			// $(this)[0].files ->자바스크립트로 바꾸겠다. 자바스크립트에 files를 쓰겠당
			
		})
		
	</script>
</section>
</body>
</html>