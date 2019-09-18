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
		width: 200px;
		height: 200px;
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
</style>
<section>

	<c:forEach var="files" items="${list}">
		<div class="photoDiv">
			<span id="spandate">
				<fmt:formatDate value="${files.regdate }" pattern="yyyy.MM.dd"/>
			</span>
			<button data-src="displayFile?filename=${files.filename}">X</button>
			<img src="displayFile?filename=${files.filename}" class="imgClick">
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
		$(this).css("width","500px").css("height","500px").css("z-index","100");
	})
	
	
	
	
	
</script>






