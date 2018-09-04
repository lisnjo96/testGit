<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HOME</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/gt_favicon.png">
<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
<%@include file="css_loading.jsp" %>
</head>
<body onLoad="popUp()">

<%@include file="header.jsp" %>

	<!-- Header -->

	
		<div id="carouselFade" class="carousel slide carousel-fade" data-ride="carousel">

	        <!-- Wrapper for slides -->
	        <div class="carousel-inner" role="listbox">
	            <div class="item active">  
	                <div class="carousel-caption">
	                  
	                </div>
	            </div>
	            <div class="item"> 
	                <div class="carousel-caption">
	                
	                </div>
	            </div>
	            <div class="item"> 
	                <div class="carousel-caption">
	               
	                </div>
	            </div>
	        </div>
	        
	        <!-- Indicators -->
		    <ol class="carousel-indicators">
		      <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		      <li data-target="#carousel-example-generic" data-slide-to="1"></li>
		      <li data-target="#carousel-example-generic" data-slide-to="2"></li>
		    </ol>
			
	        <!-- Controls -->
	        <a class="left carousel-control" href="#carouselFade" role="button" data-slide="prev">
	            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	            <span class="sr-only">Previous</span>
	        </a>
	        <a class="right carousel-control" href="#carouselFade" role="button" data-slide="next">
	            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	            <span class="sr-only">Next</span>
	        </a>
    	</div>

	<!-- /Header -->

	<!-- Intro -->
	<div class="container text-center">
		<br> <br>
		<h2 class="thin">The best place to tell people why they are here</h2>
		<p class="text-muted">
			The difference between involvement and commitment is like an eggs-and-ham breakfast:<br> 
			the chicken was involved; the pig was committed.
		</p>
	</div>
	<!-- /Intro-->
		
	<!-- Highlights - jumbotron -->
	<div class="jumbotron top-space">
		<div class="container">
			
			<div class="row">
				<div class="col-md-6 col-sm-6 highlight">
					<div class="h-caption"><h4><i class="fas fa-file-alt"></i>공지사항<span style="font-size:12px;padding-left:10px;"><a href="#">더보기</a></span></h4></div>
					<div class="h-body text-center">
						<p>Lorem ipsum dolor sit amet,</p>
						<p>Lorem ipsum dolor sit amet,</p>
						<p>Lorem ipsum dolor sit amet,</p>
					</div>
				</div>
				<div class="col-md-6 col-sm-6 highlight">
					<div class="h-caption"><h4><i class="fas fa-comment-dots"></i>자유게시판<span style="font-size:12px;padding-left:10px;"><a href="#">더보기</a></span></h4></div>
					<div class="h-body text-center">
						<p>Lorem ipsum dolor sit amet,</p>
						<p>Lorem ipsum dolor sit amet,</p>
						<p>Lorem ipsum dolor sit amet,</p>
				</div>
				
			</div> <!-- /row  -->
		</div>
		</div>
	</div>
	<!-- /Highlights -->

	<!-- container -->
	<div class="container">

		<h2 class="text-center top-space">Frequently Asked Questions</h2>
		<br>

		<div class="row">
			<div class="col-sm-6">
				<h3>Which code editor would you recommend?</h3>
				<p>I'd highly recommend you <a href="http://www.sublimetext.com/">Sublime Text</a> - a free to try text editor which I'm using daily. Awesome tool!</p>
			</div>
			<div class="col-sm-6">
				<h3>Nice header. Where do I find more images like that one?</h3>
				<p>
					Well, there are thousands of stock art galleries, but personally, 
					I prefer to use photos from these sites: <a href="http://unsplash.com">Unsplash.com</a> 
					and <a href="http://www.flickr.com/creativecommons/by-2.0/tags/">Flickr - Creative Commons</a></p>
			</div>
		</div> <!-- /row -->

		<div class="row">
			<div class="col-sm-6">
				<h3>Can I use it to build a site for my client?</h3>
				<p>
					Yes, you can. You may use this template for any purpose, just don't forget about the <a href="http://creativecommons.org/licenses/by/3.0/">license</a>, 
					which says: "You must give appropriate credit", i.e. you must provide the name of the creator and a link to the original template in your work. 
				</p>
			</div>
			<div class="col-sm-6">
				<h3>Can you customize this template for me?</h3>
				<p>Yes, I can. Please drop me a line to sergey-at-pozhilov.com and describe your needs in details. Please note, my services are not cheap.</p>
			</div>
		</div> <!-- /row -->

		<div class="jumbotron top-space">
			<h4>Dicta, nostrum nemo soluta sapiente sit dolor quae voluptas quidem doloribus recusandae facere magni ullam suscipit sunt atque rerum eaque iusto facilis esse nam veniam incidunt officia perspiciatis at voluptatibus. Libero, aliquid illum possimus numquam fuga.</h4>
     		<p class="text-right"><a class="btn btn-primary btn-large">Learn more »</a></p>
  		</div>

</div>	<!-- /container -->
	
	<!-- Social links. @TODO: replace by link/instructions in template -->
	<section id="social">
		<div class="container">
			<div class="wrapper clearfix">
				<!-- AddThis Button BEGIN -->
				<div class="addthis_toolbox addthis_default_style">
				<a class="addthis_button_facebook_like"></a>
				<a class="addthis_button_tweet"></a>
				<a class="addthis_button_linkedin_counter"></a>
				<a class="addthis_button_google_plusone"></a>
				</div>
				<!-- AddThis Button END -->
			</div>
		</div>
	</section>
	<!-- /social links -->		

	
<%@include file="footer.jsp" %>

<script>
$('#carouselFade').carousel();


function setCookie( name, value, expiredays ) { 
	var todayDate = new Date(); 
	todayDate.setDate( todayDate.getDate() + expiredays ); 
	document.cookiｅ = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
} 

function getCookie( name ) { 
	var nameOfCookie = name + "="; 
	var x = 0; 
	while ( x <= document.cookie.length ) { 
	var y = (x+nameOfCookie.length); 
	if ( document.cookie.substring( x, y ) == nameOfCookie ) { 
	if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
	endOfCookie = document.cookie.length; 
	return unescape( document.cookie.substring( y, endOfCookie ) ); 
	} 
	x = document.cookie.indexOf( " ", x ) + 1; 
	if ( x == 0 ) 
	break; 
	} 
		return ""; 
	} 
	if ( getCookie( "popup" ) != "done" ) 
	{ 
	noticeWindow = 
	window.open('popup.do','팝업','width=400, height=500, left=500, top=200'); 
	noticeWindow.opener = self; 
	} 




</script>
</body>
</html>