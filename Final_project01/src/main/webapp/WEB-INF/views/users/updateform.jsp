<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/updateform.jsp</title>
<%@include file="../css_loading.jsp" %>
<style>
.list{
	width:60%;
	margin-top:10%;
	}
form{
	margin-bottom:20px;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>

<div class="container list">
	<header class="page-header">
	<h1 class="page-title">회원정보 수정</h1>
	</header>
	<form action="update.do" method="post" id="Updateform">
		<input type="hidden" name="id" value="${id }"/>
		
	   <div class="form-group row">
		<label class="col-sm-2 col-form-label text-right" for="id">아이디</label>
		<div class="col-sm-10">
			<input class="form-control" type="text" id="id" value="${id }" 
			disabled="disabled" />
		</div>
	  </div>
	  
	    <div class="form-group row">
		<label class="col-sm-2 col-form-label text-right" for="email">이메일 주소</label>
		<div class="col-sm-10">
			<input class="form-control" type="text" name="email" id="email" 
			value="${dto.email }" />
		</div>
	  </div>
	 
	
	</form>
		<button type="submit" class="btn">수정 확인</button>
		<a href="pw_changeform.do" class="btn btn-info">비밀번호변경</a>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>