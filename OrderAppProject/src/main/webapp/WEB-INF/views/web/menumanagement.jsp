<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
<title>Food House a Hotels and Restaurants Category Flat Bootstarp responsive Website Template | Home :: w3layouts</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/style.css" />
	<link href='http://fonts.googleapis.com/css?family=Niconne|Playball|Open+Sans:300italic,400italic,600italic,400,300,600,700' rel='stylesheet' type='text/css'>
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.min.js"></script>
	
	<script>
		$(document).ready(function () {
			$("span.menu").click(function(){
				$(".top-nav ul").slideToggle(200);
			});
	
			$('.star').on('click', function () {
				$(this).toggleClass('star-checked');
			});
		
		    $('.ckbox label').on('click', function () {
		      $(this).parents('tr').toggleClass('selected');
		    });
		
			$('.btn-filter').on('click', function () {
				var $target = $(this).data('target');
				if ($target != 'all') {
					$('.table tr').css('display', 'none');
					$('.table tr[data-status="' + $target + '"]').fadeIn('slow');
				} else {
					$('.table tr').css('display', 'none').fadeIn('slow');
				}
			});
		
		 });
		
		$(function(){
			$("nav li").on("click", function(){
				$("nav li").removeClass("active");//jquery 이용
				//this.setAttribute("class","active")//순수 DOM
				$(this).addClass("active");
			});
		});
	</script>
	 
</head>
<body>
	<!--start-header-->
	<div id="home" class="header">
			<!--logo-->
			<div class="header-top">
			<div class="container">
		<!--top-nav-->
			<div class="top-nav">
				<span class="menu two"> </span>
					<ul>					
						<li><a href="${pageContext.servletContext.contextPath}">Home</a></li> 
						<c:if test="${mrank==2}">
						<li><a href="${pageContext.servletContext.contextPath}/web/memberindex">회원관리</a></li>
						<li><a href="${pageContext.servletContext.contextPath}/web/resmanagement">가맹점관리</a></li> 
						</c:if>
						<c:if test="${mrank==1}">
						<li><a href="${pageContext.servletContext.contextPath}/web/ordermanagement">주문관리</a></li> 
						<li><a href="${pageContext.servletContext.contextPath}/web/restaurantmanege">매장관리</a></li>
						<li><a class="active"  href="${pageContext.servletContext.contextPath}/web/menumanagement">메뉴관리</a></li> 
						</c:if>
						<li class="lost"><a href="${pageContext.servletContext.contextPath}/web/contact">오시는길</a></li>
						<c:if test="${login==null}">
						<li ><p class="text-center"><a href="#" class="btn btn-primary btn-lg" role="button" data-toggle="modal" data-target="#login-modal">로그인</a></p></li>
						</c:if>
						<c:if test="${login!=null}">
						<li ><a href="${pageContext.servletContext.contextPath}/member/logout">로그아웃</a></li>
						</c:if>
						<div class="clearfix"> </div>
					</ul>
				</div>
				<div class="clearfix"> </div>
		</div>
	<!--End-top-nav-script-->
				<div class="clearfix"> </div>
		</div>
		<div class="head-bg">
					<div class="logo three">
							<a href="index.html"><h1>FOOD<span>House</span></h1></a>
					</div>
		</div>
		<!--/header-->
	</div>
<!--gallery-->
	<div class="gallery services" style="height:10px;">
		<div class="container">
				<h3 style="padding: 0;">MenuList</h3>
			<div class="portfolio-bottom">
				<div class="gallery-one two">
					<div class="col-md-3 gallery-left two">
						<a href="/teamapp/resources/img/g1.jpg" class=" mask b-link-stripe b-animate-go   swipebox"  title="Image Title">
						  </a>
						   <div class="container">
							<div class="row">
						
								<section class="content">
									<nav>
							          <ul class="nav nav-justified" style="width:1200px;">
							            <li class="active" style="background:#1bbc9b;"><a target="iframe" href="/teamapp/menulist/add">생성</a></li>
							            <li style="background:#1bbc9b;"><a target="iframe" href="/teamapp/menulist/selectlist?pageNo=1">메뉴</a></li>
							            <li style="background:#1bbc9b;"><a target="iframe" href="/teamapp/menulist/selecthotlist?mlishot=1&pageNo=1">핫메뉴</a></li>
							          </ul>
						  			</nav>
									<iframe name="iframe" style="width:100%; height:840px; border-width:0;" src="/teamapp/menulist/selectlist?pageNo=1"></iframe>
								</section>					
							</div>
						</div>
	
					</div>
					
				</div>
			</div>
		</div>
	</div>
	

	<!--/start-reservations-->
          	<div class= "reservation">
				<div class="container"> 
				     <div class="re-main">
					    <h3>Reservation</h3>
						 <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960.</p>
						 <h4>800 900 7009</h4>
					 </div>
				</div>
			</div>		 
	<!--/end-reservations-->	
	<!--/start-footer-->
	<div class= "footer">
		 <div class="container">                                                   
			<div class="col-md-3 footer-grid">
					<div class="logo two">
						<a href="${pageContext.servletContext.contextPath}/"><h3>주문<span>할게요!</span></h3></a>
					</div>
				</div>
				<div class=" col-md-3 footer-grid footer-grid2">
					<div class="bottom-nav">
						<h4>LEARN</h4>
						<ul>
							<li><a class="active" href="${pageContext.servletContext.contextPath}/">Home</a></li> 
							<c:if test="${mrank==2}">
							<li><a href="${pageContext.servletContext.contextPath}/web/memberindex">회원관리</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/web/resmanagement">가맹점관리</a></li> 
							</c:if>
							<c:if test="${mrank==1}">
							<li><a href="${pageContext.servletContext.contextPath}/web/ordermanagement">주문관리</a></li> 
							<li><a href="${pageContext.servletContext.contextPath}/web/restaurantmanege">매장관리</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/web/menumanagement">메뉴관리</a></li> 
							</c:if>
							<li class="lost"><a href="${pageContext.servletContext.contextPath}/web/contact">오시는길</a></li>
							<div class="clearfix"> </div>
						</ul>
					</div>
				</div>
				<div class=" col-md-3 footer-grid">
					<div class="Office Address">
				    	<h4>ADDRESS</h4>
				    	<ul class="bottom-icons">
							<li><a class="glyphicon glyphicon-home" href="#"></a>　서울시 송파구 중대로 135, IT벤처타워 서관 12층 한국소프트웨어산업협회</li>
							<li><a class="glyphicon glyphicon-envelope" href="#"></a>　gusqls0810@naver.com</li>
							<li><a class="glyphicon glyphicon-phone" href="#"></a>　 010-9558-1893</li>	
							<div class="clearfix"> </div>	
						</ul>
					 </div>
				</div>
				<div class="col-md-3 footer-grid">
					<h4>SUPPORT WITH</h4>
						<div class="Office Address">
						<ul class="bottom-icons">
						<li><a class="glyphicon glyphicon-envelope" href="#"></a>　gusqls0810@naver.com</li>
						   <!-- <input type="text" class="text" value="Enter email to reset it" onfocus="this.value = '';" onblur="if (this.value == 'Enter email to reset it') {this.value = 'Enter email to reset it';}"> -->
						<!-- <input type="submit" value="SUBMIT" class="botton"> -->
						     						     <p>고객지원 등 각종 문의사항은 해당 메일로 연락을 주시면 감사합니다.</p>
						</ul>
						</div>
				    </div>
			    	<div class="clearfix"> </div>	
				</div>
			</div>
			<div class="copy-right">
				<div class="container">
				 	 <p>Copyright &copy; 2015 All Rights Reserved Design by <a href="http://w3layouts.com/">W3layouts</a> </p>
				</div>		

			</div>
			
			<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</body>
</html>