<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  contentType="text/html;charset=UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/style.css" />
	<link href='http://fonts.googleapis.com/css?family=Niconne|Playball|Open+Sans:300italic,400italic,600italic,400,300,600,700' rel='stylesheet' type='text/css'>
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.min.js"></script>
	
	<script>
		$(document).ready(function(){
			$("span.menu").click(function(){
				$(".top-nav ul").slideToggle(200);
			});
		});
	</script>
	
	<!--start-smoth-scrolling-->
	<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
	</script>
	
	<style type="text/css">
		table#acrylic {
            border-collapse: separate;
            background: #fff;
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
            border-radius: 10px;
            margin: 50px auto;
            -moz-box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
            -webkit-box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
            cursor: pointer;
        }
        
        #acrylic thead {
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
            border-radius: 10px;
        }
        
        #acrylic thead th {
            font-family: 'Roboto';
            font-size: 16px;
            font-weight: 400;
            color: #fff;
            text-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5);
            text-align: left;
            padding: 20px;
            background-size: 100%;
            background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #646f7f), color-stop(100%, #4a5564));
            background-image: -moz-linear-gradient(#646f7f, #4a5564);
            background-image: -webkit-linear-gradient(#646f7f, #4a5564);
            background-image: linear-gradient(#646f7f, #4a5564);
            border-top: 1px solid #858d99;
        }
        
        #acrylic thead th:first-child {
            -moz-border-top-right-radius: 10px;
            -webkit-border-top-left-radius: 10px;
            border-top-left-radius: 10px;
        }
        
        #acrylic thead th:last-child {
            -moz-border-top-right-radius: 10px;
            -webkit-border-top-right-radius: 10px;
            border-top-right-radius: 10px;
        }
        
        #acrylic tbody tr td {
            font-family: 'Open Sans', sans-serif;
            font-weight: 400;
            color: #5f6062;
            font-size: 13px;
            padding: 20px 20px 20px 20px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        #acrylic tbody tr:nth-child(2n) {
            background: #f0f3f5;
        }
        
        #acrylic tbody tr:last-child td {
            border-bottom: none;
        }
        
        #acrylic tbody tr:last-child td:first-child {
            -moz-border-bottom-right-radius: 10px;
            -webkit-border-bottom-left-radius: 10px;
            border-bottom-left-radius: 10px;
        }
        
        #acrylic tbody tr:last-child td:last-child {
            -moz-border-bottom-right-radius: 10px;
            -webkit-border-bottom-right-radius: 10px;
            border-bottom-right-radius: 10px;
        }
        
        #acrylic tbody:hover > tr td {
            filter: progid: DXImageTransform.Microsoft.Alpha(Opacity=50);
            opacity: 0.5;
        }
        
        #acrylic tbody:hover > tr:hover td {
            text-shadow: none;
            color: #2d2d2d;
            filter: progid: DXImageTransform.Microsoft.Alpha(enabled=false);
            opacity: 1;
            transition: 0.2s all;
        }
	</style>			
</head>

<body>
	<!-- start-header -->
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
							<li><a class="active"  href="${pageContext.servletContext.contextPath}/web/memberindex">회원관리</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/web/resmanagement">가맹점관리</a></li> 
						</c:if>
						
						<c:if test="${mrank==1}">
							<li><a href="${pageContext.servletContext.contextPath}/web/ordermanagement">주문관리</a></li> 
							<li><a href="${pageContext.servletContext.contextPath}/web/restaurantmanege">매장관리</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/web/menumanagement">메뉴관리</a></li> 
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
			<div class="clearfix"> </div>
		</div>
		
		<div class="head-bg">
			<div class="logo three">
				<a href="/teamapp"><h1>FOOD<span>House</span></h1></a>
			</div>
		</div>
	</div>
	 
	<!-- start-body -->
	<!-- memberboard.jsp -> Member List -->
	<iframe src="memberboard?pageNo=1" style="width:100%; height:680px; border:0px;" scrolling="no"></iframe>

	<!-- start-footer -->
	<div class= "footer">
		<div class="container">                                                   
			<div class="col-md-3 footer-grid">
				<div class="logo two">
					<a href="${pageContext.servletContext.contextPath}"><h3>주문<span>할게요!</span></h3></a>
				</div>
			</div>
			
			<div class=" col-md-3 footer-grid footer-grid2">
				<div class="bottom-nav">
			    	<h4>LEARN</h4>
					<ul>
						<li><a href="${pageContext.servletContext.contextPath}">Home</a></li> 
						
						<c:if test="${mrank==2}">
							<li><a class="active"  href="${pageContext.servletContext.contextPath}/web/memberindex">회원관리</a></li>
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
						<li><a class="glyphicon glyphicon-home" href="#"></a>　서울시 송파구 중대로 135, <br/>　　IT벤처타워 서관 12층<br/>　　한국소프트웨어산업협회</li>
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
						<li>고객지원 등 각종 문의사항은 해당 메일로 연락을 주시면 감사합니다.</li>
					</ul>
				</div>
			</div>
			<div class="clearfix"> </div>	
		</div>
	</div>
	
	<!-- last footer ( go to top ) -->	
	<div class="copy-right">
		<div class="container">
			<p>Copyright &copy; 2015 All Rights Reserved Design by <a href="http://w3layouts.com/">W3layouts</a> </p>
		</div>
	</div>
	<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</body>
</html>