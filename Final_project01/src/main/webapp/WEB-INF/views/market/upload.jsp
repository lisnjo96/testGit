<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>market/upload.jsp</title>
</head>
<body>
<h3>업로드 결과 페이지</h3>
<c:choose>
	<c:when test="${isSuccess }">
		<p>파일을 업로드 했습니다.<a href="../list.do">목록보기</a></p>
	</c:when>
	<c:otherwise>
		<p>파일 업로드 실패<a href="upload_form.do">다시 업로드</a></p>
	</c:otherwise>
</c:choose>
</body>
</html>