<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    


	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top" >
		<div class="container">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/"><b>AllAboutGame</b></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-left">
					<li><a href="${pageContext.request.contextPath}/gallery/list.do">Gallery</a></li>
					<li><a href="${pageContext.request.contextPath}/market/list.do">Market</a></li>
					<li><a href="${pageContext.request.contextPath}/dataroom/list.do">Data</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Community<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/community/qa.do">Q&A</a></li>
							<li class="active"><a href="${pageContext.request.contextPath}/community/board.do">board</a></li>
						</ul>
					</li>
				</ul>
				<ul class="nav navbar-nav pull-right">
				<c:choose>
					<c:when test="${ not empty id }">
						<li><a href="${pageContext.request.contextPath}/users/info.do"><i class="fas fa-user-circle" class="loginicon" style="position:absolute;font-size:4.5rem;right:20px;bottom:5px;top:2px;"></i></a></li> 
						<li><a class="btn" href="${pageContext.request.contextPath}/users/logout.do">LOG OUT</a></li>
						
					</c:when>
					<c:otherwise>
						<li><a class="btn" href="${pageContext.request.contextPath}/users/loginform.do">LOG IN </a></li>
						<li><a class="btn" href="${pageContext.request.contextPath}/users/signup_form.do">SIGN UP</a></li>
					</c:otherwise>
				</c:choose>
			
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div> 
	<!-- /.navbar -->
