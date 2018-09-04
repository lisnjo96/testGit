<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/signup.jsp</title>
<%@include file="../css_loading.jsp" %>
<style>
.list{
	margin-top:10%;
	width:60%;
}

</style>
</head>
<body>
<%@include file="../header.jsp" %>

<div class="container list">
	<div class="jumbotron">
		<p>환영합니다!</p>
		<p>${msg }</p>
		<h3 class="text-center"><script> /*<strong>${id }</strong> 님,*/</script> 회원가입이 완료되었습니다.</h3>
		<a href="loginform.do">로그인 하러 가기</a>
	</div>
</div>

<%@include file="../footer.jsp" %>
</body>
</html>