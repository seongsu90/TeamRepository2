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
	
				<!--start-smoth-scrolling-->
			<script type="text/javascript">
				jQuery(document).ready(function($) {
					$(".scroll").click(function(event){		
						event.preventDefault();
						$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
					});
				});
			</script>
	
	<script type="text/javascript">

		$(document).ready(function(){
			$("#login-modal").on('hidden.bs.modal', function () {
		    	parent.location.reload();
		    });
		}); 
	
		function onClickLogin()
		{
			var mid =$("#login_userid").val();
			var mpassword=$("#login_password").val();
			
			$.ajax({
				url: "../member/login",
				data: {"mid":mid, "mpassword":mpassword},
				method:"post",
				success: function(data){
					if(data.result=="success"){
						alert("로그인 성공");
						$("#login-modal").modal("hide");
					}else{
						alert("아이디 혹은 비밀번호가 틀렸습니다.");
					}
				}
			});
		}
		
		function onClickFindId()
		{
			console.log("onClickFindId")
			$(".modal-content").load("/teamapp/member/findMid")
		}
		
		function onClickFindPw()
		{
			console.log("onClickFindPw")
			$(".modal-content").load("/teamapp/member/findMpassword")
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
						<li><a href="${pageContext.servletContext.contextPath}/">Home</a></li> 
						<c:if test="${mrank==2}">
						<li><a href="${pageContext.servletContext.contextPath}/web/memberindex">회원관리</a></li>
						<li><a href="${pageContext.servletContext.contextPath}/web/resmanagement">가맹점관리</a></li> 
						</c:if>
						<c:if test="${mrank==1}">
						<li><a href="${pageContext.servletContext.contextPath}/web/ordermanagement">주문관리</a></li> 
						<li><a href="${pageContext.servletContext.contextPath}/web/restaurantmanege">매장관리</a></li>
						<li><a href="${pageContext.servletContext.contextPath}/web/menumanagement">메뉴관리</a></li> 
						</c:if>
						<li><a class="active"  href="${pageContext.servletContext.contextPath}/web/contact">오시는길</a></li>
						<c:if test="${login==null}">
							<li ><p class="text-center"><a href="#" class="btn btn-primary btn-lg" role="button" data-toggle="modal" data-target="#login-modal">로그인</a></p></li>
						</c:if>
						<c:if test="${login!=null}">
						<li ><a href="${pageContext.servletContext.contextPath}/member/logout">로그아웃</a></li>
						</c:if>
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
		<div class="head-bg">
					<div class="logo three">
							<a href="/teamapp/home"><h1>FOOD<span>House</span></h1></a>
					</div>
		</div>
		<!--/header-->
	</div>	
	<!--/contact-->
	<div class="contact-section">
		<div class="contact-head">
			<div class="container">
				<h3>Contact Info</h3>
				<p>Donec vel ornare orci. Donec gravida, felis eu venenatis ultricies, neque libero auctor tortor, nec aliquet dolor massa quis est. Ut ut molestie turpis. Curabitur semper purus tortor, vel mollis nunc vestibulum gravida. Proin vehicula magna non dui aliquet rhoncus. In massa nisl; sollicitudin et nulla ac, feugiat auctor nisl. Nulla sed nisl nisi. Phasellus et arcu augue? Praesent sit amet vestibulum est. Maecenas ut ultrices, nunc sed auctor eleifend, tellus enim placerat velit, id porttitor ante est non nisl. Duis molestie lacus varius suscipit ullamcorper. Nullam at auctor ante. Praesent laoreet elit varius odio porta tincidunt. Morbi in nisl id eros volutpat ornare a et diam. Phasellus tempus non arcu at eleifend.</p>
			</div>
		</div>
		<iframe src="https://www.google.com/maps/embed/v1/place?q=%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD%20%EC%86%A1%ED%8C%8C%EA%B5%AC%20%ED%95%9C%EA%B5%AD%EC%86%8C%ED%94%84%ED%8A%B8%EC%9B%A8%EC%96%B4%EC%82%B0%EC%97%85%ED%98%91%ED%9A%8C&key=AIzaSyA-E4erY82nScLLGd9UVaHlvgX2goBhIMI" frameborder="0" style="border:0"></iframe>

		<div class="contact-inner">
		  <div class="container">
			<h4>FeedBack</h4>
			<form class="con"> 
			    <input type="text" class="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}">
						 <input type="text" class="text" value="Email Address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email Address';}">
						<input type="text" class="text" value="Subject" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Subject';}">
						<textarea value="Message" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message';}">Message</textarea>
						<div class="clearfix"> </div>
						<div class="sub-button">
							<input name="submit" type="submit" value="Send ">
						</div>
					</form>
			</div>
		</div>
	</div>
<!--/start-footer-->
	<div class= "footer">
		 <div class="container">                                                   
			<div class="col-md-3 footer-grid">
					<div class="logo two">
						<a href="/teamapp/home"><h3>FOOD<span>House</span></h3></a>
					</div>
				</div>
				<div class=" col-md-3 footer-grid footer-grid2">
					<div class="bottom-nav">
					       <h4>LEARN</h4>
							<ul>
							<li><a href="${pageContext.servletContext.contextPath}/">Home</a></li> 
							<c:if test="${mrank==2}">
							<li><a href="${pageContext.servletContext.contextPath}/web/memberindex">회원관리</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/web/resmanagement">가맹점관리</a></li> 
							</c:if>
							<c:if test="${mrank==1}">
							<li><a href="${pageContext.servletContext.contextPath}/web/ordermanagement">주문관리</a></li> 
							<li><a href="${pageContext.servletContext.contextPath}/web/restaurantmanege">매장관리</a></li>
							<li><a href="${pageContext.servletContext.contextPath}/web/menumanagement">메뉴관리</a></li> 
							</c:if>
							<li><a class="active"  href="${pageContext.servletContext.contextPath}/web/contact">오시는길</a></li>
							<div class="clearfix"> </div>
						</ul>
					 </div>
				</div>
				<div class="col-md-3 footer-grid">
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
			<div class="copy-right">
			  <div class="container">
				 	 <p>Copyright &copy; 2015 All Rights Reserved Design by <a href="http://w3layouts.com/">W3layouts</a> </p>
			   </div>		

			</div>		
			
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
								<span id="text-login-msg">아이디와 비밀번호를 입력해 주세요.</span>
							</div>	
							
							<input id="login_userid" class="form-control" type="text" placeholder="ID (type ERROR for login_userid)" onkeydown="if(event.keyCode==13){javascript:onClickLogin();}" required>
							<input id="login_password" class="form-control" type="password" placeholder="Password" onkeydown="if(event.keyCode==13){javascript:onClickLogin();}" required>
							
							<!-- <div class="checkbox">
								<label>	<input type="checkbox"> Remember me	</label>
							</div> -->
						</div>
						
						<div class="modal-footer">
							<div>
								<button type="button" class="btn btn-primary btn-lg btn-block" style="background-color: #1bbc9b" onclick="onClickLogin()" >Login</button>
							</div>
							
							<div>
								<button id="login_findId_btn" type="button" class="btn btn-link"  onclick="onClickFindId()" ><u>아이디 찾기</u></button>
								<button id="login_findPw_btn" type="button" class="btn btn-link"  onclick="onClickFind w()" ><u>비밀번호 찾기</u></button>
								<!--      <button id="login_register_btn" type="button" class="btn btn-link">Register</button> -->
							</div>
						</div>
					</form>
	
				</div>
			</div>
		</div>
	</div>
	<!-- END # MODAL LOGIN -->



		<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</body>
</html>