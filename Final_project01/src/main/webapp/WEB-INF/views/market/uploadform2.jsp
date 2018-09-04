<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>market/upload_form.jsp</title>
</head>
<body>
<h3>사진 업로드폼</h3>
<form action="upload.do" method="post" enctype="multipart/form-data">
	<label for="caption">설명</label>
	<input type="text" name="caption" id="caption" /><br />
	<label for="image">이미지</label>
	<input type="file" name="image" id="image" /><br />
	<button type="submit">업로드</button>
</form>
</body>
</html>