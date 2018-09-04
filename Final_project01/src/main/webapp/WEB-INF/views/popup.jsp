<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PopUp</title>
<style>
#close{
   position:absolute; 
   bottom:0;
   width:100%;
   height:10%;
}
</style>
</head>
<body>
<h1 style="background-color:skyblue;">All About Event</h1>
<p>1. 중복 참여 가능하며, 게임 참여 시 마다 10봉포인트씩 차감됩니다.</br>
2. 순위 100위는 매일 변동되며, 마지막 날인 8월 21일 자정까지의 결과에 따라 최종 결정됩니다.</br>
3. 순위결정은 참여자의 개인 최고기록 기준 점수순, 클릭 수 순, 시간(초)순, 참여시간 순으로 선정합니다.</br>
4. 부정참여 등의 행위 적발 시 별도의 고지없이 추첨대상에서 제외 또는 당첨 취소될수 없습니다.
</p>


<div id="close"> 
    <form name="form1">
        <input type="checkbox" name="popup" value=""> 
        <font size="2" face="돋움" style="color:#000;">오늘하루 그만보기</font><a href="javascript:onclick=closeWin()">[닫기]</a>  
    </form>
</div>



<script>


function setCookie(name, value, expiredays) { 
var todayDate = new Date(); 
todayDate.setDate( todayDate.getDate() + expiredays ); 
document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
};

function closeWin() { 
if (document.form1.popup.checked) 
setCookie( "popup", "done" , 1); 
self.close(); 
};



</script>

</body>
</html>