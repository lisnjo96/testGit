<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail.jsp</title>
<style type="text/css">
   .detailPageDiv{
      padding-top: 70px;
      margin: 0 auto;
       width:60%;
       height:800px;
    }
    .goodImg{
       width: 40%;
       float: left;
       height: 300px;
    }
    .details{
       padding-left: 100px;
       float: right;
       width: 60%;
    }
    .goodImg img{
       max-width: 100%;
       max-height: 300px;
       
       
    }
    .glyphicon-star{
      color: #CB2E2E;
   }
   .glyphicon-star-empty{
      color: #CB2E2E;
   }
   .movieRating{
      font-weight: bold;
      font-style: Sans-serif;
   }
   .floatright{

      font-size:30px;
      float:left;
   }
   .icon{
      font-size:20px;
      background-color:skyblue;
      width:45px;
      height:45px;
      border-radius:25px;
      text-align:center;
      color:#fff;
      margin-right:10px;
   }
   .icon i{
      padding-top:13px;
   }
   .col-form-label{
      max-width: 93px;
   }
   .amount input{
      width: 80px;
      height: 50px;
      border: 1px solid gray;
      float: left;
      text-align: center;
      font-size: 2.4em;
   }
   .btnBox{
      width: 50px;
      height: 50px;
      float: left;
      overflow: visible;
   }
   .amountBtn{
      vertical-align: middle;
      display: table-cell;
      padding: 0px;
      width: 30px;
      height: 25px;
      float: left;
      background-color: white;
      
   }
   .arrow{
      opacity: 0.5;
   }
   .amountBtn:focus{
      border-color: gray;
      outline-color: gray;
   }
   .purchaseBtn{
      margin-top: 5px;
      float: rigkt;
      width: 80px;
      height: 40px;
      background-color: #169BF9;
      color: white;
      outline-color: white;
      border-color: white;
   }
</style>



<%@include file="../css_loading.jsp" %>
</head>
<body>
   <%@include file="../header.jsp" %>
   <div class="detailPageDiv">
      <header class="page-header">
         <h1 class="page-title">상품 상세 페이지</h1>
      </header>
        <div class="name">
            <h2>${dto.name }</h2>
        </div>
        <br/>
        <div class="goodImg">
            <img src="${pageContext.request.contextPath}/upload/${dto.saveFileName}">
        </div>
        <br/>
        <div class="details">
     
           <div class="form-group row">
            <label class="col-sm-3 col-form-label text-left" for="price">상품 가격</label>
            <div class="col-sm-9">
               ${dto.price }원
            </div>
           </div>
           
           <div class="form-group row">
            <label class="col-sm-3 col-form-label text-left" for="remainCount">상품 수량</label>
            <div class="col-sm-9">
               ${dto.remainCount }개
            </div>
           </div>
           
           <div class="form-group row">
            <label class="col-sm-3 col-form-label text-left" for="grade">상품 평점</label>
            <div class="col-sm-9">
               <span class="star">
                  <i id="star1" class="star glyphicon glyphicon-star-empty"></i>
                  <i id="star2" class="star glyphicon glyphicon-star-empty"></i>
                  <i id="star3" class="star glyphicon glyphicon-star-empty"></i>
                  <i id="star4" class="star glyphicon glyphicon-star-empty"></i>
                  <i id="star5" class="stat glyphicon glyphicon-star-empty"> </i>   
                  <span class="movieRating">&nbsp;&nbsp;${dto.grade }</span>            
               </span>
            </div>
           </div>
           
           <div class="form-group row">
            <label class="col-sm-3 col-form-label text-left" for="content">상품설명</label>
            <div class="col-sm-9">
               ${dto.content }
            </div>
           </div>
           <div class="amount form-group row">
              <label class="col-sm-3 col-form-label text-left" for=amount">수량</label>
              <div class="col-sm-9">
                 <form action="">
                    <c:choose>
                       <c:when test="${dto.remainCount gt 0 }">
                          <input type="text" id="amount" value="1" name="amount"/>
                          <div class="btnBox">
                             <button type="button" class="amountBtn" id="upBtn"><i class="arrow glyphicon glyphicon-arrow-up"></i></button>
                             <button type="button" class="amountBtn" id="downBtn"><i class="arrow glyphicon glyphicon-arrow-down"></i></button>
                          </div>
                          <button type="submit" class="purchaseBtn">구매하기</button>
                       </c:when>
                       <c:otherwise>
                          <input type="text" id="amount" value="0" name="amount"/>
                          <div class="btnBox">
                             <button type="button" class="amountBtn" id="upBtn"><i class="arrow glyphicon glyphicon-arrow-up"></i></button>
                             <button type="button" class="amountBtn" id="downBtn"><i class="arrow glyphicon glyphicon-arrow-down"></i></button>
                          </div>
                          <button type="button" class="purchaseBtn">구매하기</button>
                       </c:otherwise>
                    </c:choose>
                    
                 </form>
            </div>
           </div>
      </div>

   <div class="comment">
            
        </div>
    </div>
<%@include file="../footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript">

   
   $(".star").ready(function(){
      for(var i = 1; i <= parseInt('${(grade + 1)/2}'); i++){
         console.log("i : " + i);
         console.log("클래스가 바뀔꺼임")
         $("#star"+i)
         .removeClass("glyphicon-star-empty")
         .addClass("glyphicon-star");
         console.log("#star" +i);
      }
   });   
   
   //up 버튼 처리
   $("#upBtn").on("click", function(){
      var count = $(".amount input").val();
      console.log(count);
      if(count == 0){
         alert("죄송합니다. 본 상품은 품절되었습니다.");            
      }else{
         count++;
         var remainCount = parseInt('${dto.remainCount}');
         var isCountOver = count > remainCount;
         if(isCountOver) {
            count--;
            alert("최대 수량입니다");
         }
         $(".amount input").val(count);
      }
   });
   
   //down 버튼 처리
   $("#downBtn").on("click", function(){
      var count = $(".amount input").val();
      console.log(count);
      if(count == 0){
         alert("죄송합니다. 본 상품은 품절되었습니다.");            
      }else{
         count--;
         if(count == 0) count++;
         $(".amount input").val(count);
      }
   });
   
   
</script>
</body>
</html>