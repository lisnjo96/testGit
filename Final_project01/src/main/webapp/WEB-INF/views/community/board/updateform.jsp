<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/community/board/updateform.jsp</title>
<%@include file="../../css_loading.jsp" %>
<!-- SmartEditor 관련 javascript 로딩 -->
<style>

body{
		margin-top: 10%;
	}

.list{
	margin-top:10%;
	width:60%;
}

.bootstrap-form .form-group input,
.bootstrap-form .form-group label,
.bootstrap-form .form-group textarea {
  margin: 10px 0;
}
h3{
	margin-left: 35%;
}
</style>
<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
</head>
<body>
<%@include file="../../header.jsp" %>
<div class="container list">
	<div class="bootstrap-form">
		<h3>카페 글 수정 페이지</h3>
	    <form action="update.do" method="post">
	    	<div class="form-group row">
	        <div class="col-sm-10">
	          <input class="form-control" type="hidden" name="num" value="${dto.num }"/>
	        </div>
	      </div>
	      <div class="form-group row">
	        <label class="col-sm-2 col-form-label text-right" for="writer">Writer</label>
	        <div class="col-sm-10">
	          <input class="form-control" type="text" name="writer" id="writer" value="${dto.writer }" disabled/>
	        </div>
	      </div>
	      <div class="form-group row">
	        <label class="col-sm-2 col-form-label text-right" for="title">title</label>
	        <div class="col-sm-10">
	          <input class="form-control" type="text" name="title" id="title" value="${dto.title }"/>
	        </div>
	      </div>
	      <div class="form-group row">
	        <label class="col-sm-2 col-form-label text-right" for="Content">Content</label>
	        <div class="col-sm-10">
	          <textarea class="form-control" rows="5" id="content" name="content">${dto.content }</textarea>
	        </div>
	       </div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label text-right" ></label>
					<div class="col-sm-10">
					<input class="form-control" type="button" onclick="pasteHTML();" value="본문에 내용 넣기" />
					<input class="form-control" type="button" onclick="showHTML();" value="본문 내용 가져오기" />
					<input class="form-control" type="button" onclick="submitContents(this);" value="수정 확인" />
					<input class="form-control" type="button" onclick="setDefaultFont();" value="기본 폰트 지정하기 (궁서_24)" />
				</div>
			</div>	
	    </form>
    </div>
</div>

<%@include file="../../footer.jsp" %>
<script>
var oEditors = [];
//추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});
function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}
function showHTML() {
	var sHTML = oEditors.getById["content"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}
function setDefaultFont() {
	var sDefaultFont = '궁서';
	var nFontSize = 24;
	oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
</body>
</html>