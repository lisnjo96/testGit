<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>market/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/gt_favicon.png">
<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
<%@include file="../css_loading.jsp" %>
<style>
	body{
		margin-top: 93px;
	}
	.list{
		margin-top:10%;
		width:60%;
	}
	.controlBox{
		position: fixed;
		top: 110px;
		left: 30px;
		width: 140px;
		height: 340px;
		border: 1px solid red;
	}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
 <div class="controlBox">
 	<a href="uploadform.do">판매하러 가기</a><br />
 	<a href="detail.do?code=41">확인하러 가기</a><br />
 	<a href="charge.do">충전하러 가기</a>
 </div>
<div class="container list">
	<h3>상품 목록 입니다.</h3>
	<div class="row">
		<c:forEach var="tmp" items="${list }">
			<div class="col-xs-4">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 style="margin-top:15px;">${tmp.name }</h3>
					</div>
					<div class="panel-body">
						<c:if test="${tmp.writer eq id }">
							<a href="updateform.do?code=${tmp.code}" class="pull-right icon"><span class="glyphicon glyphicon-pencil"></a>
							<a href="javascript:deleteConfirm(${tmp.code })" class="pull-right icon"><span class="glyphicon glyphicon-remove"></a><br />
						</c:if>
						<img class="img-responsive img-thumbnail" src="${pageContext.request.contextPath}/upload/${tmp.saveFileName}"/>
						<p>가격 : <strong>${tmp.price }</strong></p>
						<p>남은 수량 : <strong>${tmp.remainCount }</strong></p>
					</div>
					<div class="panel-footer">
						<a class="btn btn-info" href="detail.do?code=${tmp.code }" style="padding:10px 20px;"><span class="glyphicon glyphicon-info-sign"></span></a>
						<a class="btn btn-success" href="buy.do?code=${tmp.code }">구매하기</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<script>
	//삭제 확인을 하는 함수 
	function deleteConfirm(code){
		var isDelete=confirm(code+"번 파일을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="delete.do?code="+code;
		}
	}
</script>
<%@include file="../footer.jsp" %>
</body>
</html>