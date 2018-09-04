<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HOME</title>

<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
<%@include file="../css_loadingForGallery.jsp" %>

<style>
    .row{
			width: 80%;
			margin: 0 auto;
			padding-top: 50px;
		}
	.item #regdateSpan{
		font-size: 0.8em;
		float: left;
	}
	.item a{
		float: left;
		font-size: 0.8em;
	}
	.navbar{
		opacity: 0.9;
	}
	.navbar .container{
		height: 50px;
	}
	.floatright{

		font-size:30px;
		float:right;
	}
	.icon{
		font-size:20px;
		background-color:skyblue;
		width:45px;
		height:45px;
		border-radius:25px;
		text-align:center;
		color:#fff;
		margin-right:10px;
	}
	.icon i{
		padding-top:13px;
	}
	.page-header{
		margin-top: 20px;
	}
</style>
</head>

<body>
	<%@include file="../header.jsp" %>
	<div id="fh5co-main">
		<div class="container">
			<div class="row">
				<header class="page-header">
					<h1 class="page-title">
						갤러리
						<a href="upload_form.do" class="floatright"><i class="fas fa-plus-circle"></i></a>
					</h1>
				</header>
        		<div id="fh5co-board" data-columns>
        		<%
        			System.out.println("board는 정상적임"); 		
        		%>
					<c:forEach var="tmp" items="${list }">
						<div class="item">
			        		<div class="animate-box">
				        		<a href="${pageContext.request.contextPath}/upload/${tmp.saveFileName}" class="image-popup fh5co-board-img" title="${tmp.title }">
				        			<img src="${pageContext.request.contextPath}/upload/${tmp.saveFileName}" alt="Free HTML5 Bootstrap template">
				        		</a>
				        		<div class="fh5co-desc">
					        		<div>${tmp.content }</div>
					        		<span id="regdateSpan">${tmp.regdate }</span>
					        		<br/>
					        		<c:if test="${tmp.writer eq id }">
						        		<a href="updateform.do?num=${tmp.num }">수정&nbsp;&nbsp;</a>
										<a href="javascript:deleteConfirm(${tmp.num })">삭제</a>
									</c:if>
				        		</div>
			        		</div>
			        	</div>
					</c:forEach>
        		</div>
        	</div>
       	</div>
	</div>

<%@include file="../footer.jsp" %>
<%@include file="../js_loading.jsp" %>
<script>
	//삭제 확인을 하는 함수 
	function deleteConfirm(num){
		var isDelete=confirm(num+"번 파일을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="delete.do?num="+num;
		}
	}
</script>
</body>
</html>