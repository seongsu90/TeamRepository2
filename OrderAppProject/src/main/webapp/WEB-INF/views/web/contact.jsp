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
			
			$("#login-modal").on('shown.bs.modal', function() {	            
	            $("#login_userid").focus();
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
						$("#login-modal").modal("hide");						
					}else{										
						$("#loginInCorrect-modal").modal("show");
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
	
	<script>
		// 이전 모달 포커스
		//모달 목록 (Modal List)
		var recentModalList = [];		 
		$(document).ready(function () {
		    //Modal on Modal : jquery-1.9.1.js:3257 Uncaught RangeError: Maximum call stack size exceeded.
		    $.fn.modal.Constructor.prototype.enforceFocus = function () { };
		 
		    //모달이 뜰 때 객체를 리스트에 추가 (Add modal to list)
		    $('.modal').on('shown.bs.modal', function (e) {
		        recentModalList.push(e.target);
		    });
		 
		    //모달이 닫힐 때 객체를 리스트에서 삭제. (Remove modal from list)
		    $('.modal').on('hide.bs.modal', function (e) {
		        customModalClosed(e);
		        /* console.log(recentModalList.length); */
		    });
		});
		 
		var customModalClosed = function (e) {
		    //나를 지운다.(Remove me in list)
		    for (var i = recentModalList.length - 1; i >= 0; i--) {
		        if (recentModalList[i] == e.target) {
		            recentModalList.splice(i, 1);
		        }
		    }		 
		    //이전 모달이 있으면 포커싱.(Focus to before modal)
		    if (recentModalList.length > 0) {
		        recentModalList[recentModalList.length - 1].focus();		         
		    }
		};
	</script>
	
	<style type="text/css">
		.page_t_txt p{
		    font-weight: bold;
		    margin-bottom: 5px;		     
		    color: #1276ae;
		}
		 
		.page_t_txt li { 
			font-size: 14px;
		}
	</style>
	
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
							<a href="/teamapp/"><h1>FOOD<span>House</span></h1></a>
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
		
		<br><br>
		
		<div class="contact-info">
			<div class="container">
				<div class="page_t_txt">
					<p>도로명</p>
					<ul>						
						<li> (05717) 서울시 송파구 중대로 135, IT벤처타워 서관 12층 한국소프트웨어산업협회</li><br/>
					</ul>
				</div>
				<div class="page_t_txt">
					<p>대표전화</p>
					<ul>
						<li> 010-9558-1893 </li><br/>
					</ul>
				</div>		
				<div class="page_t_txt">
					<p>대중교통안내</p>					
					<div class="col-sm-6">                            
                        <h5 style="margin: 19px 0;"><img src="http://saraminhr.co.kr/imgs/hr/loca_stlt01.gif" /></h5>
                        <ul>
                            <li> 3호선 경찰병원역 1번출구방향 50m</li>
                            <li> 8호선 가락시장역 4분출구 도보 5분(400m)</li>	                            
                        </ul>
                    </div>
                	<div class="col-sm-6">
                        <h5 style="margin: 19px 0;"><img src="http://saraminhr.co.kr/imgs/hr/loca_stlt02.gif" alt="버스" /></h5>
                        <ul>
                            <li> 간선 302, 303, 320, 350, 352, 360 가락시장 앞 하차 후 도보 10분 </li>
                            <li> 지선 3217, 3317, 3413, 3422 가락시장 앞 하차 후 도보 10분 </li>
							<li> 간선 301, 401, 지선 3319, 3416 경찰병원앞 하차 </li>
                        </ul>
                    </div>					
				</div>
			</div>
		</div>
		
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

	<div class="modal fade" id="loginInCorrect-modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true" style="padding-top: 150px">
		<div class="modal-dialog" style="width: 300px;">
			<div class="modal-content">				
				<div class="modal-header">					
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title" id="modalLabel">로그인 실패</h4>										
				</div>				
				<div class="modal-body" >
					<h5>아이디 혹은 비밀번호가 틀렸습니다.</h5>
				</div>
				<div class="modal-footer">
				  	<button type="button" class="btn btn-default" data-dismiss="modal" role="button" >확인</button>				  	
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>