<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update page</title>
<%@include file="../css_loading.jsp" %>
<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
<style>

.list{
	margin-top:10%;
}
.bootstrap-form form {
  max-width: 700px;
  margin: auto;
  padding: 0;
}
.bootstrap-form .form-group input,
.bootstrap-form .form-group label,
.bootstrap-form .form-group textarea {
  margin: 10px 0;
}

</style>
</head>
<body>
<%@include file="../header.jsp" %>

<div class="bootstrap-form list">
  <div class="container">
    <form action="update.do?code=${dto.code }" method="post" enctype="multipart/form-data" id=updateForm>
				
	  <div class="form-group row">
		<label class="col-sm-2 col-form-label text-right" for="code">code</label>
		<div class="col-sm-10">
			<input class="form-control" type="text" id="code" 
		value="${dto.code }" disabled="disabled"/>
		
		<input class="form-control" type="hidden" id="code" 
		value="${dto.code }" name="code"/>
		</div>
	  </div>
	  			
	  <div class="form-group row">
		<label class="col-sm-2 col-form-label text-right" for="writer">writer</label>
		<div class="col-sm-10">
			<input class="form-control" type="text" id="writer" 
		value="${id }" disabled="disabled" />
		<input class="form-control" type="hidden" id="writer" name="writer"
		value="${id}"/>
		</div>
	  </div>
	  
      <div class="form-group row">
        <label class="col-sm-2 col-form-label text-right" for="name">상품명</label>
        <div class="col-sm-10">
        	<input class="form-control" type="text" name="name" id="name" value="${dto.name }"/>
     	</div>
     </div>
     
     <div class="form-group row">
      <label class="col-sm-2 col-form-label text-right" for="price">가격</label>
      <div class="col-sm-10">
         <input class="form-control" type="text" name="price" id="price" value="${dto.price }"/>
      </div>
     </div>
     
     <div class="form-group row">
      <label class="col-sm-2 col-form-label text-right" for="remainCount">수량</label>
      <div class="col-sm-10">
         <input class="form-control" type="text" name="remainCount" id="remainCount" value="${dto.remainCount }"/>
      </div>
     </div>
     
       <div class="form-group row">
        <label class="col-sm-2 col-form-label text-right" for="mainCat">카테고리</label>
        <div class="col-sm-10">
          <input class="form-control" type="text" name="mainCat" id="mainCat" value="${catDto.mainCat }"/>${dto.mainCat }
        </div>
      </div>
       
      <div class="form-group row">
        <label class="col-sm-2 col-form-label text-right" for="file">file</label>
        <div class="col-sm-10">
          <input class="form-control" type="file" name="file" id="file" value="${dto.saveFileName }"/>${dto.orgFileName }
        </div>
      </div>
      
      <div class="form-group row">
        <label class="col-sm-2 col-form-label text-right" for="content">Content</label>
        <div class="col-sm-10">
          <textarea id="content" name="content"> ${dto.content }</textarea>
          <textarea class="form-control" rows="5" name="content" id="content" 
		style="width:766px;height:412px;display:none"></textarea>
        </div>
      </div>
     
      
      <div class="form-group row">
        <div class="col-sm-12 text-right">
          <input class="btn btn-primary" onclick="submitContents(this);" type="button" value="Send"/>
        </div>
      </div>
    </form>
  </div>
</div>
<%@include file="../footer.jsp" %>
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