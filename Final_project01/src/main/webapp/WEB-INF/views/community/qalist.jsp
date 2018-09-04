<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/community/qalist.jsp</title>
<%@include file="../css_loading.jsp" %>
<style>
	.page_display a{
		text-decoration: none;
		color: #000;
	}
	.page_display a.active{
		font-weight: bold;
		color: red;
		text-decoration: underline;
	}
	.page_display a.muted{
		color: #cecece;
	}
	body{
		margin-top: 10%;
	}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
	<div class="container">
	<header class="page-header">
		<h1 class="page-title">
			QnA
		</h1>
	
	</header>
		<c:choose>
			<c:when test="${ not empty id }">
				<p><strong>${id }</strong> 님 로그인중...</p>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/users/loginform.do">로그인</a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${ not empty writer }">
				<c:forEach var="tmp" items="${clist }">
					<c:if test="${tmp.id ne sessionScope.id }">
						<a href="javascript:insertConfirm('${sessionScope.id}')">상담사 가입하기</a>
					</c:if>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach var="tmp" items="${clist }">
					<c:if test="${tmp.id eq sessionScope.id }">
						<a href="primaryform.do?id=${tmp.id }">상담사 정보보기</a>
					</c:if>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<h3>우수 상담사 내역 입니다</h3>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>아이디</th>
						<th>상담사</th>
						<th>내공</th>  
					</tr>	
				</thead>
				<tbody>
				<c:forEach var="tmp" items="${clist }">
					<tr>
						<td>${tmp.id }</td>
						<td>${tmp.counselor }</td>	
						<td>${tmp.score}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
	
		<a href="insertform.do">새글 작성</a>
		<h3>고객 문의사항목록</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>등록일</th>
					<th>삭제</th>
					<th>채택</th>
				</tr>	
			</thead>
			<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.num }</td>
					<td>${tmp.writer }</td>
					<td>
					<c:choose>
						<c:when test="${tmp.secret eq 0 }">
							<a href="detail.do?num=${tmp.num }&condition=${condition}&keyword=${keyword}">${tmp.title }</a>
						</c:when>
						<c:otherwise>
							비밀글 입니다.
						</c:otherwise>
					</c:choose>
					</td>
					<td>${tmp.viewCount }</td>
					<td>${tmp.regdate }</td>
					<td>
						<c:if test="${tmp.writer eq id }">
							<a href="javascript:deleteConfirm(${tmp.num })">삭제</a>
						</c:if>
					</td>
					<td>${tmp.choose }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		
		<!-- 페이징 처리 -->
		<ul class="pagination">
			<c:choose>
				<c:when test="${startPageNum ne 1 }">
					<li>
						<a href="qa.do?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${keyword}">&laquo;</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="disabled">
						<a href="javascript:">&laquo;</a>
					</li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${startPageNum }"
				end="${endPageNum }">
				<c:choose>
					<c:when test="${i eq pageNum }">
						<li class="active">
							<a href="qa.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="qa.do?pageNum=${i }&condition=${condition}&keyword=${keyword}">${i }</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${endPageNum lt totalPageCount }">
					<li>
						<a href="qa.do?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${keyword}">&raquo;</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="disabled">
						<a class="muted" href="javascript:">&raquo;</a>
					</li>
				</c:otherwise>
			</c:choose>		
		</ul>
		
		<!-- keyword 검색어 form -->
		<form action="qa.do" method="post">
			<label for="condition"></label>
			<select name="condition" id="condition" style="padding:5px;float:left;">
				<option value="titlecontent" <c:if test="${condition eq 'titlecontent' }">selected</c:if>>제목+내용</option>
				<option value="title" style="padding-bottom:5px;" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
				<option value="writer" style="padding-bottom:5px;" <c:if test="${condition eq 'writer' }">selected</c:if>>작성자</option>
			</select>
			<input value="${keyword }" type="text" name="keyword" style="padding:3px;" placeholder="검색어..." />
			<button type="submit" style="padding:3px;border-radius:5px;"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
		</form>
		<c:choose>
			<c:when test="${not empty keyword }">
				<p><strong>${keyword }</strong> 검색어로 검색된 
				<strong>${totalRow }</strong>개의 글이 있습니다.</p>
			</c:when>
			<c:otherwise>
				<p><strong>${totalRow }</strong>개의 글이 있습니다.</p>
			</c:otherwise>
		</c:choose>	
	</div>
	<script>
		//삭제 확인을 하는 함수 
		function deleteConfirm(num){
			var isDelete=confirm(num+"번 파일을 삭제 하시겠습니까?");
			if(isDelete){
				location.href="delete.do?num="+num;
			}
		}
		//상담사 가입 확인을 하는 함수 
		function insertConfirm(id){
			var isInsert=confirm(id+"로 가입할까요?");
			if(isInsert){
				location.href="insert_counselor.do?id="+id+
						"&url=/community/qa.do";
			}
		}
	</script>
	<%@include file="../footer.jsp" %>
</body>
</html>