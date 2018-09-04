<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/info.jsp</title>
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



<header class="page-header">
<h1 class="page-title">Info</h1>
</header>
<table class="table">
  	<thead class="thead-dark">
		<tr>
			 <th scope="col">항목</th>
			 <th scope="col">정보</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			 <th scope="row">아이디</th>
			<td>${dto.id }</td>
		</tr>
		<tr>
			 <th scope="row">이메일</th>
			<td>${dto.email }</td>
		</tr>
		<tr>
			 <th scope="row">가입일</th>
			<td>${dto.regdate }</td>
		</tr>
	</tbody>
</table>
<a href="updateform.do" class="btn btn-info btn-sm">회원정보 수정</a>
<a href="javascript:deleteConfirm()" class="btn btn-danger btn-sm">회원 탈퇴</a>
</div>
<%@include file="../footer.jsp" %>

<script>
	function deleteConfirm(){
		var isDelete=confirm("회원 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="delete.do";
		}
	}
</script>
</body>
</html>