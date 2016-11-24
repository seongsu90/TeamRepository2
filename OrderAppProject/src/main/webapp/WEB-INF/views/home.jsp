<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  contentType="text/html;charset=UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/style.css" />
	<%-- <link href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.css" rel='stylesheet' type='text/css' /> --%> 
	<link href='http://fonts.googleapis.com/css?family=Niconne|Playball|Open+Sans:300italic,400italic,600italic,400,300,600,700' rel='stylesheet' type='text/css'>
	
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
	<%-- <script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/prefixfree.min.js"></script> --%>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.min.js"></script>
	
	<script type="text/javascript">
		function onClickLogin()
		{
			var mid =$("#login_username").val();
			var mpassword=$("#login_password").val();
			console.log("왔는감");
			
			$.ajax({
				url: "member/login",
				data: {"mid":mid, "mpassword":mpassword},
				method:"post",
				success: function(data){
					if(data.result=="0"){
						alert("로그인 성공");
						$("#login-modal").modal("hide");
						location.reload();
					}else{
							alert("아이디 혹은 비밀번호가 틀렸습니다.");
					}
				}
			});
		}
		
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
					<span class="menu"> </span>
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
				
		<!-- script-for-menu -->
				<script>
					$(document).ready(function(){
						$("span.menu").click(function(){
							$(".top-nav ul").slideToggle(200);
						});
					});
				</script>
		</div>
	<!--End-top-nav-script-->
		<div class="clearfix"> </div>
	</div>
	<!--/header-->
</div>
<!--start-slider-->
	<div class="slider-bg">
				<div class="side wow bounceInRight" data-wow-delay="0.7s">
					 <div  id="top" class="callbacks_container">
							<ul class="rslides" id="slider4">
									<li>
										<img src="${pageContext.servletContext.contextPath}/resources/img/bg2.jpg" class="img-responsive" alt="" />
										<div class="caption1">
										<div class="logo">
											<a href="${pageContext.servletContext.contextPath}/home"><h1>주문<span>할게요!</span></h1></a>
										</div>
											<h2>BEST RECIPES WITH
											BEST INGREDIENTS</h2>	
											<p>We offer the best Services in our Restarant.<p>
										</div>
									</li>
									<li>
									<img src="${pageContext.servletContext.contextPath}/resources/img/bg.jpg" class="img-responsive" alt="" />
									  <div class="caption1">
										<div class="logo">
											<a href="/teamapp/home"><h1>주문<span>할게요!</span></h1></a>
										</div>
										<h2>BEST RECIPES WITH
											BEST INGREDIENTS</h2>	
											<p>We offer the best Services in our Restarant.<p>
										</div>
									</li>
									<li>
									<img src="${pageContext.servletContext.contextPath}/resources/img/bg3.jpg" class="img-responsive" alt="" />
									<div class="caption1">
									<div class="logo">
										<a href="/teamapp/home"><h1>주문<span>할게요!</span></h1></a>
									</div>
										<h2>BEST RECIPES WITH
											BEST INGREDIENTS</h2>
										<p>We offer the best Services in our Restarant.<p>	
									</div>										
									</li>
								 </ul>
							</div>
						</div>
					</div>	
				<!--- banner Slider starts Here --->
	  			<script src="${pageContext.servletContext.contextPath}/resources/js/responsiveslides.min.js"></script>
			 <script>
			    // You can also use "$(window).load(function() {"
			    $(function () {
			      // Slideshow 4
			      $("#slider4").responsiveSlides({
			        auto: true,
			        pager: true,
			        nav: true,
			        speed: 500,
			        namespace: "callbacks",
			        before: function () {
			          $('.events').append("<li>before event fired.</li>");
			        },
			        after: function () {
			          $('.events').append("<li>after event fired.</li>");
			        }
			      });
			
			    });
			  </script>
			<!----//End-slider-script---->
				<div class="clearfix"> </div>

		<!--start-welcome-->
		<div class="welcome-section">
		   <div class="container">
				 <div class="wel-grid">
				   <div class="col-md-4 welcome-text">
					   <h3>Welcome</h3>
					   <h4>TO RESTAURANT!</h4>
					   <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
				   </div>
					<div class="col-md-8 welcome-img">
					   <img src="${pageContext.servletContext.contextPath}/resources/img/img_03.jpg" class="img-responsive" alt="" />
					</div>
				   <div class="clearfix"> </div>
			   </div>
			    <div class="about-grid">
				   <div class="col-md-4 about-img">
					   <img src="${pageContext.servletContext.contextPath}/resources/img/img_02.jpg" class="img-responsive" alt="" />
					</div>
					<div class="col-md-8 about-text">
					   <h3>About</h3>
					   <h4>OUR RESTAURANT!</h4>
					   <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
				   </div>
				   <div class="clearfix"> </div>
			   </div>
		    </div>
		</div>
		<!--start-team-->
		   <div class="team-section"> 
		   <div class="container">
				<div class="team">
				    <div class="col-md-4 team-left">
					    <h3>OUR TEAM</h3>
					</div>
					 <div class="col-md-8 team-right">
						<ul class="ch-grid">
							<li>
								<div class="ch-item ch-img-1">
									<div class="ch-info">
										<h3>노현빈</h3>
										<p>DBA, Coder <a href="#">View on Dribbble</a></p>
									</div>
								</div>
								<h4>Sleepy 노현빈</h4>
							 <p>DBA 수면중..</p>
							 <a class="more" href="#">More Info </a>
							</li>
							<li>
								<div class="ch-item ch-img-2">
									<div class="ch-info">
										<h3>Analog형 최인섭</h3>
										<p>Coder, 집권자<a href="#">View on Dribbble</a></p>
									</div>
								</div>
								<h4>Analog형 최인섭</h4>
									 <p>Analog계의 Coder</p>
									 <a class="more" href="#">More Info </a>
							</li>
							<li>
								<div class="ch-item ch-img-3">
									<div class="ch-info">
										<h3>현따이띠 막내 박현태</h3>
										<p>막내 Coder <a href="#">View on Dribbble</a></p>
									</div>
								</div>
								<h4>현따이띠 막내 박현태</h4>
									 <p>메뉴선정 임무를 가진 Coder</p>
									 <a class="more" href="#">More Info </a>
							</li>
							<li>
								<div class="ch-item ch-img-4">
									<div class="ch-info">
										<h3>오류메이커 유은지</h3>
										<p>오류메이커 Coder<a href="#">View on Dribbble</a></p>
									</div>
								</div>
								<h4>오류메이커 유은지</h4>
									 <p>오류메이커 Coder</p>
									 <a class="more" href="#">More Info </a>
							</li>
							<li>
								<div class="ch-item ch-img-5">
									<div class="ch-info">
										<h3>박성수</h3>
										<p>의미없는 Coder <a href="#">View on Dribbble</a></p>
									</div>
								</div>
								<h4>박성수</h4>
									 <p>의미없는 Coder</p>
									 <a class="more" href="#">More Info </a>
							</li>
							
						<div class="clearfix"> </div>
						</ul>
					 </div>
					 <div class="clearfix"> </div>
				</div>
			</div>
		   </div>

		<!--start-blog-->
		<div class="blog-section">
		   <div class="container">
		         <h3>Blog</h3>
				 <div class="blog">
				   <div class="col-md-4 blog-text">
					   <h5>THU 14 May, 2015</h5>
					   <a href="single.html"><h4>EXCEPTEUR SINT OCCAECAT CUPIDATAT NON</h4></a>
					   <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
				   </div>
					<div class="col-md-8 welcome-img">
					 <a href="single.html" class="mask"><img src="${pageContext.servletContext.contextPath}/resources/img/b2.jpg" alt="image" class="img-responsive zoom-img"></a>
					</div>
				   <div class="clearfix"> </div>
			   </div>
			    <div class="blog">
				 <div class="col-md-4 blog-text two">
					   <h5>THU 14 May, 2015</h5>
					  <a href="single.html"><h4>LOREM IPSUM DOLOR SIT AMET CONSE</h4></a>
					   <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
				   </div>
					<div class="col-md-8 blog-img two">
					 <a href="single.html" class="mask"><img src="${pageContext.servletContext.contextPath}/resources/img/b3.jpg" alt="image" class="img-responsive zoom-img"></a>
					</div>
				   <div class="clearfix"> </div>
			   </div> 
			    <div class="blog">
				   <div class="col-md-4 blog-text">
					   <h5>THU 14 May, 2015</h5>
					   <a href="single.html"><h4>EXCEPTEUR SINT OCCAECAT CUPIDATAT NON</h4></a>
					   <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
				   </div>
					<div class="col-md-8 welcome-img">
					 <a href="single.html" class="mask"><img src="${pageContext.servletContext.contextPath}/resources/img/b1.jpg" alt="image" class="img-responsive zoom-img"></a>
					</div>
				   <div class="clearfix"> </div>
			   </div>
		</div>
	</div>
<!--gallery-->
	<div class="gallery">
		<div class="container">
				<h3>Gallery</h3>
			<div class="portfolio-bottom">
				<div class="gallery-one">
					<div class="col-md-3 gallery-left">
						<a href="${pageContext.servletContext.contextPath}/resources/img/g1.jpg" class=" mask b-link-stripe b-animate-go   swipebox"  title="Image Title">
								<img src="${pageContext.servletContext.contextPath}/resources/img/g1.jpg" alt="" class="img-responsive zoom-img"/>
						</a>
					</div>
					<div class="col-md-3 gallery-left">
						<a href="${pageContext.servletContext.contextPath}/resources/img/g2.jpg" class=" mask b-link-stripe b-animate-go   swipebox"  title="Image Title">
								<img src="${pageContext.servletContext.contextPath}/resources/img/g2.jpg" alt="" class="img-responsive zoom-img"/>
						</a>
					</div>
					<div class="col-md-3 gallery-left">
						<a href="${pageContext.servletContext.contextPath}/resources/img/g4.jpg" class=" mask b-link-stripe b-animate-go   swipebox"  title="Image Title">
								<img src="${pageContext.servletContext.contextPath}/resources/img/g4.jpg" alt="" class="img-responsive zoom-img"/>
						</a>
					</div>
					<div class="col-md-3 gallery-left">
						<a href="${pageContext.servletContext.contextPath}/resources/img/g3.jpg" class=" mask b-link-stripe b-animate-go   swipebox"  title="Image Title">
								<img src="${pageContext.servletContext.contextPath}/resources/img/g3.jpg" alt="" class="img-responsive zoom-img"/>
						</a>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
	</div>
	
<!--/start-footer-->
	<div class= "footer">
		 <div class="container">                                                   
			<div class="col-md-3 footer-grid">
					<div class="logo two">
						<a href="${pageContext.servletContext.contextPath}/home"><h3>FOOD<span>House</span></h3></a>
					</div>
				</div>
				<div class=" col-md-3 footer-grid footer-grid2">
					<div class="bottom-nav">
					       <h4>LEARN</h4>
							<ul>
							<li><a class="active" href="${pageContext.servletContext.contextPath}/">Home</a></li> 
							<li><a href="${pageContext.servletContext.contextPath}/web/memberindex">회원관리</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/web/resmanagement">가맹점관리</a></li> 
							<li><a href="${pageContext.servletContext.contextPath}/web/ordermanagement">주문관리</a></li> 
							<li><a href="${pageContext.servletContext.contextPath}/web/restaurantmanege">매장관리</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/web/menumanagement">메뉴관리</a></li> 
							<li><a href="${pageContext.servletContext.contextPath}/web/contact">오시는길</a></li>
							<div class="clearfix"> </div>
						</ul>
					 </div>
				</div>
				<div class=" col-md-3 footer-grid">
					<div class="Office Address">
				        <h4>ADDRESS</h4>
				       <ul class="bottom-icons">
							<li><a class="home" href="#"><span> </span></a>Lorem ipsy street,Newyork</li>
							<li><a class="mail" href="mailto:info@example.com"><span> </span>123 int@example.com</a></li>
							<li><a class="mbl" href="#"><span> </span></a>+91 000 00 00 00 0</li>	
							<div class="clearfix"> </div>	
						</ul>
					 </div>
				</div>
				<div class="col-md-3 footer-grid">
					<h4>SUPPORT WITH</h4>
						<div class="support">
						   <input type="text" class="text" value="Enter email to reset it" onfocus="this.value = '';" onblur="if (this.value == 'Enter email to reset it') {this.value = 'Enter email to reset it';}">
						<input type="submit" value="SUBMIT" class="botton">
						     						     <p>Lorem ipsum dolor sit amet conse aliqua. Ut enim ad minim veniam Lorem ctetur adipisicing .</p>
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
			
			
			
<!-- END # BOOTSNIP INFO -->

<!-- BEGIN # MODAL LOGIN -->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none; padding-top: 150px" >
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
					<img class="img-angle" id="img_logo" src="${pageContext.servletContext.contextPath}/resources/img/logo_reform2.png">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
				</div>
                
                <!-- Begin # DIV Form -->
                <div id="div-forms">
                
                    <!-- Begin # Login Form -->
                    <form id="login-form">
		                <div class="modal-body">
				    		<div id="div-login-msg">
                                <div id="icon-login-msg" class="glyphicon glyphicon-chevron-right"></div>
                                <span id="text-login-msg">Type your username and password.</span>
                            </div>
				    		<input id="login_username" class="form-control" type="text" placeholder="Username (type ERROR for error effect)" required>
				    		<input id="login_password" class="form-control" type="password" placeholder="Password" required>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"> Remember me
                                </label>
                            </div>
        		    	</div>
				        <div class="modal-footer">
                            <div>
                                <button type="button" class="btn btn-primary btn-lg btn-block" onclick="onClickLogin()">Login</button>
                            </div>
				    	    <div>
                                <button id="login_lost_btn" type="button" class="btn btn-link" >Lost Password?</button>
                           <!--      <button id="login_register_btn" type="button" class="btn btn-link">Register</button> -->
                            </div>
				        </div>
                    </form>
                    <!-- End # Login Form -->
                    
                    <!-- Begin | Lost Password Form -->
                    <form id="lost-form" style="display:none;">
    	    		    <div class="modal-body">
		    				<div id="div-lost-msg">
                                <div id="icon-lost-msg" class="glyphicon glyphicon-chevron-right"></div>
                                <span id="text-lost-msg">Type your e-mail.</span>
                            </div>
		    				<input id="lost_email" class="form-control" type="text" placeholder="E-Mail (type ERROR for error effect)" required>
            			</div>
		    		    <div class="modal-footer">
                            <div>
                                <button type="submit" class="btn btn-primary btn-lg btn-block">Send</button>
                            </div>
                            <div>
                                <button id="lost_login_btn" type="button" class="btn btn-link">Log In</button>
                                <button id="lost_register_btn" type="button" class="btn btn-link">Register</button>
                            </div>
		    		    </div>
                    </form>
                    <!-- End | Lost Password Form -->
                    
                    <!-- Begin | Register Form -->
                    <form id="register-form" style="display:none;">
            		    <div class="modal-body">
		    				<div id="div-register-msg">
                                <div id="icon-register-msg" class="glyphicon glyphicon-chevron-right"></div>
                                <span id="text-register-msg">Register an account.</span>
                            </div>
		    				<input id="register_username" class="form-control" type="text" placeholder="Username (type ERROR for error effect)" required>
                            <input id="register_email" class="form-control" type="text" placeholder="E-Mail" required>
                            <input id="register_password" class="form-control" type="password" placeholder="Password" required>
            			</div>
		    		    <div class="modal-footer">
                            <div>
                                <button type="submit" class="btn btn-primary btn-lg btn-block">Register</button>
                            </div>
                            <div>
                                <button id="register_login_btn" type="button" class="btn btn-link">Log In</button>
                                <button id="register_lost_btn" type="button" class="btn btn-link">Lost Password?</button>
                            </div>
		    		    </div>
                    </form>
                    <!-- End | Register Form -->
                    
                </div>
                <!-- End # DIV Form -->
                
			</div>
		</div>
	</div>
    <!-- END # MODAL LOGIN -->

<!-- END # BOOTSNIP INFO -->

<!--swipebox -->	
			
				<script src="/teamapp/resources/js/jquery.swipebox.min.js"></script> 
				<script type="text/javascript">
					jQuery(function($) {
						$(".swipebox").swipebox();
					});
				</script>
			<!--//swipebox Ends -->


			<!--start-smoth-scrolling-->
			<script type="text/javascript">
								jQuery(document).ready(function($) {
									$(".scroll").click(function(event){		
										event.preventDefault();
										$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
									});
								});
								</script>
							<!--start-smooth-scrolling-->
				<%--		<script type="text/javascript">
									$(document).ready(function() {
										/*
										var defaults = {
								  			containerID: 'toTop', // fading element id
											containerHoverID: 'toTopHover', // fading element hover id
											scrollSpeed: 1200,
											easingType: 'linear' 
								 		};
										*/
										
										$().UItoTop({ easingType: 'easeOutQuart' });
										
									});
								</script> --%>
		<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
    
</body>
</html>