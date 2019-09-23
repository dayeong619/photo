<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="include/header.jsp" %>
<style>    
	section{
		width: 100%;
		padding-top:50px;
	}
	.photoDiv{
		margin-top:30px;
		width: 200px;
		height: 300px;
		float: left;
		padding-left:40px;
		position: relative;
	}
	.photoDiv img{
		width: 200px;
		height: 200px;
	}
	.photoDiv button{
		position: absolute;
		top:0;
		right:0;
	}
	.gogogo{
		z-index:100;
		position:fixed;
		left:0;
		top:0;
		width:100%;
		height: 100%;
		background: rgba(0,0,0,0.9);
		padding:20px 30%;
		display: none;
		color:#D5D5D5;
	}
</style>
<section>

	<c:forEach var="files" items="${list}">
		<div class="photoDiv">
			<span id="spandate">
				<fmt:formatDate value="${files.regdate }" pattern="yyyy.MM.dd"/>
			</span>
			<span>${files.filename}</span>
			<%-- <button data-src="displayFile?filename=${files.filename}">X</button> --%>
			<img src="displayFile?filename=${files.filename}" class="imgClick">
		</div>
		<div class="gogogo">
			<img src="displayFile?filename=${files.filename}">
		</div>
	</c:forEach> 
	
	
	
</section>
</body>
</html>
<script>

	
	

	$(document).on("click", ".photoDiv button", function(){
		var result = confirm("삭제하시겠습니까?");
		
		if(result){
			//yes
			var file = $(this).attr("data-src"); 
			var $button = $(this);
			$.ajax({
				url:"deleteFile",
				type:"post",
				data:{filename:file},
				dataType:"text",
				success:function(res){
					console.log(res);
					if(res == "success"){
						alert("삭제하였습니다.");
						$button.parent().remove();
					}
				}
			})
			
		}else{
			//no
		}
		
		
		
	})

	$(document).on("click", ".photoDiv .imgClick", function(){
		$(this).addClass(".gogogo");
		
		
		
		
		
	})
	
	
	
	
	
</script>






