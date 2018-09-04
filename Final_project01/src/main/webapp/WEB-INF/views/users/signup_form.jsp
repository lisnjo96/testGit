<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/signup_form.jsp</title>
<%@include file="../css_loading.jsp" %>
<style>
.list{
	margin-top:10%;
	width:60%;
}
button{
	margin-right:50px;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>

<div class="container list">
<!-- Article main content -->
<article class="col-xs-12 maincontent">
	<header class="page-header">
		<h1 class="page-title">Signup</h1>
	</header>
	
	<div class="col-md-7 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<div class="panel panel-default">
			<div class="panel-body">
				<h3 class="thin text-center">Register a new account</h3>
				<p class="text-center text-muted">이미 가입한 회원이세요? <a href="loginform.do">로그인하러 가기</a>  </p>
				<hr>

				<form action="signup.do" method="post" id="signupForm">

					<div class="top-margin">
						<label for="id">ID</label>
						<input type="text" class="form-control" name="id" id="id">
						<p id="checkResult" style="font-weight:bold;padding-top:10px;"></p>
					</div>
					<div class="top-margin">
						<label for="email">Email<span class="text-danger">*</span></label>
						<input type="email" class="form-control" name="email" id="email">
					</div>

					<div class="top-margin">
						<label for="pwd">Password <span class="text-danger">*</span></label>
						<input type="password" class="form-control" name="pwd" id="pwd">
					</div>
					
					<div class="top-margin">
						<label for="pwd2">Confirm Password <span class="text-danger">*</span></label>
						<input type="password" class="form-control" name="pwd2" id="pwd2">
					</div>
			

					<hr>

					<div class="row">
						<div class="col-lg-6">
							<label class="checkbox">
								<input type="checkbox"> 
								I've read the <a href="page_terms.html">Terms and Conditions</a>
							</label>                        
						</div>
						<div class="col-lg-4 text-right">
							<button class="btn btn-action btn-sm" type="submit">Register</button>
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>
	
</article>
</div>
<!-- /Article -->

<%@include file="../footer.jsp" %>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>	
<script>
	//폼의 유효성 여부
	var formValid=false;
	
	$("#signupForm").submit(function(){
		//만일 폼의 유효성 여부가 false 이면 
		if(formValid==false){
			return false;//폼 전송 막기
		}
	});
	
	//아이디 입력란에 입력했을때 실행할 함수 등록 
	$("#id").on("input", function(){
		//입력한 아이디를 읽어와서
		var inputId=$(this).val();
		//ajax 요청을 이용해서 서버에 보낸다.
		$.ajax({
			url:"checkid.do",
			method:"post",
			data:{"inputId":inputId},
			success:function(responseData){
				//뭐가 응답되는지 콘솔에 출력해 보기 
				console.log(responseData);
				// responseData 는 object 이다.
				// {canUse:true} 또는 {canUse:false}
				if(responseData.canUse){
					formValid=true;
					$("#checkResult")
					.text("사용가능한 아이디입니다!")
					.css("color","skyblue");
				}else{
					formValid=false;
					$("#checkResult")
					.text("사용 불가능한 아이디입니다!")
					.css("color","#ff0000");
				}
			}
		});
	});
</script>
</body>
</html>