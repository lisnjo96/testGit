<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/loginform.jsp</title>
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

<!-- Article main content -->
<div class="container list">
<article class="col-xs-12 maincontent">
	<header class="page-header">
		<h1 class="page-title">Login</h1>
	</header>
	
	<div class="col-md-7 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<div class="panel panel-default">
			<div class="panel-body">
				<h3 class="thin text-center">Login in to your account</h3>
				<p class="text-center text-muted">아직 가입하지 않으셨나요? <a href="signup_form.do">가입하러 가기</a></p>
				<hr>
				
				<form action="login.do?url=${url }" method="post">
					<div class="top-margin">
						<label for="id">ID <span class="text-danger">*</span></label>
						<input type="text" class="form-control" name="id" id="id">
						<label class="checkbox">
								<input type="checkbox" id="idSaveCheck"> 
								아이디 저장하기
							</label>  
					</div>
					<div class="top-margin">
						<label for="pwd">Password <span class="text-danger">*</span></label>
						<input type="password" class="form-control" name="pwd" id="pwd">
					</div>

					<hr>

					<div class="row">
						<div class="col-lg-6">
							<b><a href="">Forgot password?</a></b>
						</div>
						<div class="col-lg-4 text-right">
							<button class="btn btn-action btn-sm" type="submit">Sign in</button>
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>
	
</article>
</div>
<!-- /Article -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>

<script>

$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputId = getCookie("userInputId");
    $("input[name='id']").val(userInputId); 
     
    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
</script>



<%@include file="../footer.jsp" %>
</body>
</html>