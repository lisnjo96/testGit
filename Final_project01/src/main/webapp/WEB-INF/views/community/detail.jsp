<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/community/detail.jsp</title>
<%@include file="../css_loading.jsp" %>
<style>
   *{
      list-style:none;
   }
   .list{
      width: 60%;
      margin-top:15%;
   }
   table th{
      width:20%;
   }
   div textarea{

   width:100%;
   height:20%;
   margin-bottom:30px;
   }
   div .left{
      width:50%;
      float:left;
   }
   div .left input{
   
      padding:5px;
      width:40%;

   }
   div .right{
      float:right;
   }
   .btn{
      margin-bottom:30px;
      margin-left:10px;
   }
   .content{
   width:100%;
   height:150px;
   border:1px solid #ddd;
   
   }

   .box img{
      width:7%;
   
   }
   .comment form{
      display:none;
   }
   .padding{
      padding:10px;
   }

</style>
</head>
<body>
<%@include file="../header.jsp" %>
<div class="container list">
	<c:if test="${not empty keyword }">
		<p> 검색어 : <strong>${keyword }</strong> 에 대한 자세히 보기</p>
	</c:if>
	<a href="qa.do" class="btn btn-info">글 전체 목록보기</a>
	<h3>글 자세히 보기 페이지</h3>
	<c:if test="${sessionScope.id eq dto.writer }">
		<a href="updateform.do?num=${dto.num }&noNum=1" class="btn btn-primary btn-round-sm btn-sm pull-right">수정</a>
		<a href="javascript:deleteConfirm()" class="btn btn-danger btn-round-sm btn-sm pull-right">삭제</a>
		<script>
			function deleteConfirm(){
				var isDelete=confirm("글을 삭제 하시겠습니까?");
				if(isDelete){
					location.href="delete.do?num=${dto.num}&condition=${condition}&keyword=${keyword}";
				}
			}
		</script>
	</c:if>
	<div>
		<c:if test="${dto.prevNum ne 0}">
			<a href="detail.do?num=${dto.prevNum }&condition=${condition}&keyword=${keyword}" class="btn pull-left"><i class="fas fa-angle-left padding"></i>이전글</a> 
		</c:if>
		<c:if test="${dto.nextNum ne 0}">
			<a href="detail.do?num=${dto.nextNum }&condition=${condition}&keyword=${keyword}" class="btn pull-right">다음글<i class="fas fa-angle-right padding"></i></a>
		</c:if>
	</div>
	<table class="table table-bordered">
		<tr>
			<th>글번호</th>
			<td>${dto.num }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.writer }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
		</tr>
	</table>
	<div class="content">${dto.content }</div>

	<!-- 댓글에 관련된 UI -->
	<div class="comments">
		<h3>댓글 <i class="fas fa-angle-up drop-down-toggle"></i></h3> 
		<div class="box drop-down">
		<ul>
			<c:forEach var="tmp" items="${commentList }">
				<li class="comment" <c:if test="${tmp.num ne tmp.comment_group }">style="padding-left:50px;"</c:if> >
					<c:if test="${tmp.num ne tmp.comment_group }">
						<img class="reply_icon" src="${pageContext.request.contextPath }/resources/images/re.gif"/>
					</c:if>	
				
					<dl>
						<dt>
							<img src="${pageContext.request.contextPath }/resources/images/user_image.gif"/>
							<span>${tmp.writer }</span>
							<span>${tmp.regdate }</span>
							<a href="javascript:" class="reply_link">답글</a> |
							<a href="">신고</a> |
							<c:if test="${sessionScope.id eq tmp.writer}">
								<a href="javascript:deleteConfirmComment(${tmp.num})">삭제</a> 
							</c:if>
							<c:if test="${sessionScope.id eq dto.writer and dto.choose ne true }">
								| <a href="javascript:successConfirm('${tmp.writer }')">채택</a>
							</c:if>
						</dt>
						<dd>
							<c:if test="${tmp.num ne tmp.comment_group }">
								<i class="muted">${tmp.target_id }</i>
								<br/>
							</c:if>
							<pre>${tmp.content }</pre>
						</dd>
					</dl>
					<form action="comment_insert.do?num=${dto.num}&condition=${condition}&keyword=${keyword}&noNum=1" method="post">
						<!-- 덧글 작성자 -->
						<input type="hidden" name="writer" value="${id }"/>
						<!-- 덧글 그룹 -->
						<input type="hidden" name="ref_group" value="${dto.num }" />
						<!-- 덧글 대상 -->
						<input type="hidden" name="target_id" value="${tmp.writer }" />
						<input type="hidden" name="comment_group" value="${tmp.comment_group }" />
						<textarea name="content" cols="30" rows="5" placeholder="댓글을 입력해 주세요"
						></textarea>
						<p class="left">
						<input type="text" placeholder="이름">
			            <input type="text" placeholder="비밀번호">
			            </p>
			            <p class="right">
			            <input type="checkbox"> 
			            <label for="">비밀글</label>
						<button type="submit">등록</button>
					</form>		
				</li>
			</c:forEach>
		</ul>
		</div>
	
		
		<!-- 원글에 댓글을 작성할수 있는 폼 -->
		<div class="comment_form">
			<form action="comment_insert.do?num=${dto.num}&condition=${condition}&keyword=${keyword}&noNum=1" method="post">
				<input type="hidden" name="writer" 
					value="${id }" />
				<input type="hidden" name="ref_group" 
					value="${dto.num }"/>
				<input type="hidden" name="target_id" 
					value="${dto.writer }"/>
				<textarea name="content" cols="30" rows="10" placeholder="댓글을 입력해 주세요"
				></textarea>
				 <p class="left">
		         <input type="text" placeholder="이름">
		         <input type="text" placeholder="비밀번호">
		         </p>
		         <p class="right">
		         <input type="checkbox"> 
		         <label for="">비밀글</label>
				<button type="submit">등록</button>
			</form>
		</div>
	</div>					
</div>

<%@include file="../footer.jsp" %>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script>
	//로그인 했는지 여부
	var isLogin=${isLogin};
	
	//댓글 전송 이벤트가 일어 났을때 실행할 함수 등록
	$(".comment_form > form, .comment form").submit(function(){
		if(!isLogin){//로그인 하지 않았으면
			var isGoLogin=confirm("로그인이 필요 합니다.");
			if(isGoLogin){
				//로그인 페이지로 이동하기
				location.href="${pageContext.request.contextPath}"+
					"/users/loginform.do"+
					"?url=${pageContext.request.contextPath}"+
					"/community/detail.do?num=${dto.num}"+
					"&condition=${condition}&keyword=${keyword}";
			}
			return false;//폼 전송 막기 
		}
	});
	
	// 답글 링크를 눌렀을때 실행할 함수 등록 
	$(".comment .reply_link").click(function(){
		if($(this).text()=="답글"){
			$(this).text("취소");
		}else{
			$(this).text("답글");
		}
		
		$(this)
		.parent().parent().parent()
		.find("form")
		.slideToggle(200);
	});
	
	//삭제 확인을 하는 함수 
	function deleteConfirmComment(num){
		var isDelete=confirm(num+"번 댓글을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="comment_delete.do?num="+num+"&num2=${dto.num}&condition=${condition}&keyword=${keyword}&noNum=1";
		}
	}
	
	//채택 함수
	function successConfirm(writer){
		var isSuccess=confirm(writer+"님의 답변을 채택하시겠습니까?");
		if(isSuccess){
			location.href="comment_adopt.do?id="+writer+"&num=${dto.num}&condition=${condition}&keyword=${keyword}&noNum=1"
					alert(writer+"님의 답변을 채택하였습니다.");
		}
	}
	
	$(".drop-down-toggle").on("click",function(){
	      $(".drop-down").toggle();
	   })
</script>
</body>
</html>