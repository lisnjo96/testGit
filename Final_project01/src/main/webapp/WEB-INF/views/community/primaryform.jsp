<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community/primaryform.jsp</title>
<%@include file="../css_loading.jsp" %>
<style>

body{
		margin-top: 10%;
	}

.list{
	margin-top:10%;
	width:60%;
}
.bootstrap-form .form-group input,
.bootstrap-form .form-group label {
  margin: 10px 0;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<div class="container list">
	<a href="qa.do">돌아가기</a>
	<div class="bootstrap-form">
	    <form method="post">
	      <h3>상담사 정보</h3>
	      <div class="form-group row">
	        <label class="col-sm-2 col-form-label text-right" for="id">Id</label>
	        <div class="col-sm-10">
	          <input class="form-control" type="text" id="id" value="${dto.id }" disabled/>
	        </div>
	      </div>
	      <div class="form-group row">
	        <label class="col-sm-2 col-form-label text-right" for="counselor">Counselor</label>
	        <div class="col-sm-10">
	          <input class="form-control" type="text" id="counselor" value="${dto.counselor }" disabled/>
	        </div>
	      </div>
	      <div class="form-group row">
	        <label class="col-sm-2 col-form-label text-right" for="score">Score</label>
	        <div class="col-sm-10">
	          <input class="form-control" type="text" id="score" value="${dto.score }" disabled/>
	        </div>
		  </div>	
	    </form>
    </div>
</div>

<%@include file="../footer.jsp" %>
</body>
</html>