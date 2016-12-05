<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  contentType="text/html;charset=UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/style.css" />
	<%-- <link href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.css" rel='stylesheet' type='text/css' /> --%> 
	<link href='http://fonts.googleapis.com/css?family=Niconne|Playball|Open+Sans:300italic,400italic,600italic,400,300,600,700' rel='stylesheet' type='text/css'>
	
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
	<%-- <script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/prefixfree.min.js"></script> --%>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.min.js"></script>
	
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
	
	<script type="text/javascript">

		$(document).ready(function(){
			$("#login-modal").on('hidden.bs.modal', function () {
		    	parent.location.reload();
		    });
			
			$("#login-modal").on('shown.bs.modal', function() {	            
	            $("#login_userid").focus();
	         }); 
			
			$("#findMidModal").on('shown.bs.modal', function() {
				$("#mname").focus();
			});
			
			$("#findMpasswordModal").on('shown.bs.modal', function() {
				$("#fpmid").focus();
			});
			
			$("#mpasswordResetModal").on('shown.bs.modal', function() {
				$("#mpassword").focus();
			});
			
			$("#joinModal").on('shown.bs.modal', function() {
				$("#jmid").focus();
			});
			
			$("#findMidModal").on('hidden.bs.modal', function() {
				$("#mname").val("");
				$("#mphone").val("");
			});
			
			$("#messageModal").on('hidden.bs.modal', function() {
				$("#mname").focus();
				$("#successMessage").html("");
				$("#failMessage").html("");
			});
			
			$("#selCity").change(function () {
				var selCity = $("#selCity").val();
		        setProvince(selCity, null);
		        $("#jmlocation").val(""); 
		    });
			
			$("#selProvince").change(function () {
				setMlocation();
		    });
		}); 
		
		function onClickLogin() {
			var mid =$("#login_userid").val();
			var mpassword=$("#login_password").val();
			
			$.ajax({
				url: "member/login",
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
		
		/* #################################### 아이디 찾기 Modal #################################### */
		function onClickFindId() {
			console.log("onClickFindId");
			$("#findMidModal").modal("show");
		}
		
		function onClickFindMid() {
			var mname = $("#mname").val();
			var mphone = $("#mphone").val();
	
			$.ajax({
				url: "member/findMid",
				data: {"mname":mname, "mphone":mphone},
				method:"post",
				success: function(data){
					if(data.result=="success"){
						$("#successMessage").html("아이디는 \"" + data.mid + "\" 입니다");
						$("#messageIcon").attr('class', "fa fa-check-circle");
						$("#messageModal").modal("show");
						$("#messageModal").on('hidden.bs.modal', function() {
							$("#findMidModal").modal("hide");
							$("#login_userid").val(data.mid);
						});
					}else{
						$("#failMessage").html("입력하신 정보와 일치하는 아이디가 없습니다.");
						$("#messageModal").modal("show");
					}
				}
			});
			
		}
		/* #################################### 아이디 찾기 Modal #################################### */
		
		
		/* #################################### 비밀번호 찾기 Modal #################################### */
		function onClickFindPw() {
			console.log("onClickFindPw");
			$("#findMpasswordModal").modal("show");
		}
		
		function onClickChangepw()	{
			var mid = $("#fpmid").val();
			var mphone = $("#fpmphone").val();
	
			$.ajax({
				url: "member/findMpassword",
				data: {"mid":mid, "mphone":mphone},
				method:"post",
				success: function(data){
					if(data.result=="success"){
						$("#mpasswordResetModal").modal("show");
					}else{
						$("#failMessage").html("입력값이 올바르지 않습니다.");
						$("#messageModal").modal("show");
					}
				}
			});
			
		}
		/* #################################### 비밀번호 찾기 Modal #################################### */
		
		/* #################################### 비밀번호 재설정 Modal #################################### */
		function onClickModifyPw() {
			var mid = $("#fpmid").val();
			var mpassword = $("#mpassword").val();
			var mpassword2 = $("#mpassword2").val();
			
			$.ajax({
				url: "member/mpasswordReset",
				data: {"mid":mid, "mpassword":mpassword, "mpassword2":mpassword2},
				method:"post",
				success: function(data) {
					if(data.result=="success"){						
						$("#successMessage").html("비밀번호 설정 완료");
						$("#messageIcon").attr('class', "fa fa-check-circle");
						$("#messageModal").modal("show");
						$("#messageModal").on('hidden.bs.modal', function() {
							$("#mpasswordResetModal").modal("hide");
							$("#findMpasswordModal").modal("hide");
						});
					}else{
						$("#failMessage").html("비밀번호가 일치하지 않습니다");
						$("#messageModal").modal("show");
					}
				}
			});
		}
		/* #################################### 비밀번호 재설정 Modal #################################### */
		
		/* #################################### 회원가입 Modal #################################### */
		/* Show Join Modal */
		function onClickJoin() {
			setCity(null);
			setProvince(null, null);
			$("#joinModal").modal("show");
		}
		
		/* Id Validation Check */
		function onClickBtnValidationCheck() {
			var mid = $("#jmid").val();
			$.ajax({
				url: "member/validationCheck",
				data: {"mid":mid},
				method:"post",
				success: function(data) {
					if(data.result == "possible") {
						$("#successMessage").html("아이디 사용 가능");
						$("#messageIcon").attr('class', "fa fa-check-circle");
						$("#messageModal").modal("show");
						$("#messageModal").on('hidden.bs.modal', function() {
							$("#idCheck").val("success");
							$("#jmname").focus();
						});
					} else if(data.result == "idOverflow") {
						$("#failMessage").html("20자 이하의 아이디를 입력하세요");
						$("#messageModal").modal("show");
						$("#messageModal").on('hidden.bs.modal', function() {
							$("#jmid").focus();
						});
					} else {
						$("#failMessage").html("이미 사용중인 아이디 입니다");
						$("#messageModal").modal("show");
						$("#messageModal").on('hidden.bs.modal', function() {
							$("#jmid").focus();
						});
					}
				}
			});
		}
		
		/* Join Button */
		function onClickBtnJoin() {
			var mid = $("#jmid").val();
			var mname = $("#jmname").val();
			var mpassword = $("#jmpassword").val();
			var mphone = $("#jmphone").val();
			var mbirth = $("#jmbirth").val();
			var mlocation = $("#jmlocation").val();
			var mrank = 0;
			var mpoint = 0;
			var mresid = 0;
			
			if ( $("#idCheck").val() == "false" ) {
				$("#failMessage").html("중복 체크를 해주세요");
				$("#messageModal").modal("show");
			} else {
				$.ajax({
					url: "member/join",
					data: {"mid":mid, "mname":mname, "mpassword":mpassword, "mphone":mphone, "mbirth":mbirth, "mlocation":mlocation, "mrank":mrank, "mpoint":mpoint, "mresid":mresid},
					method:"post",
					success: function(data) {
						if(data.result == "success") {
							$("#successMessage").html("가입 완료");
							$("#messageIcon").attr('class', "fa fa-check-circle");
							$("#messageModal").modal("show");
							$("#messageModal").on('hidden.bs.modal', function() {
								$("#joinModal").modal("hide");
								$("#login_userid").val(mid);
								$("#login_userid").focus();
							});
						} else if(data.result == "idOverflow") {
							$("#failMessage").html("20자 이하의 아이디를 입력하세요");
							$("#messageModal").modal("show");
						} else if (data.result == "morePassword") {
							$("#failMessage").html("8글자 이상의 비밀번호를<br/>입력하세요");
							$("#messageModal").modal("show");							
						} else if(data.result == "idExist") {
							$("#failMessage").html("아이디가 존재합니다");
							$("#messageModal").modal("show");
						} else {
							$("#failMessage").html("모든 항목을 입력하세요");
							$("#messageModal").modal("show");
						}
					}
				});
			}			
		}
		
		/* Join Cancel Button */
		function onClickBtnJoinCalcel() {
			$("#joinModal").modal("hide");
		}
		
		/* #################################### 회원가입 Modal #################################### */
		
		/* #################################### Location Setting #################################### */
		function setCity(selCity) {
			$.ajax({
				url: "member/getCity",
				data: {"selCity":selCity},
				success: function (data) {
					$("#selCity").html(data);
				}
			});
		}
		
		function setProvince(selCity, selProvince) {
			$.ajax({
				url: "member/getProvince",
				data: {"selCity":selCity, "selProvince":selProvince},
				success: function (data) {
					$("#selProvince").html(data);
				}
			});
		}
			
		function setMlocation() {
			$("#jmlocation").val($("#selCity").val() + " "+ $("#selProvince").val()); 				
		}
		/* #################################### Location Setting #################################### */
		
		/* ################## Message(OK, Error) Modal################## */
		/* Message OK Button */
		function onClickBtnOK() {
			$("#messageModal").modal("hide");
		}
		
	</script>
	
		<!-- script-for-menu -->
	<script>
		$(document).ready(function(){
			$("span.menu").click(function(){
				$(".top-nav ul").slideToggle(200);
			});
		});
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
		
		
		/* $(document).keypress(function(e) {
		    if(e.which == 13) {
		        alert('You pressed enter!');
		    }
		}); */

	</script>

</head>
<body>
    <!--start-header-->
	<div id="home" class="header" >
			<!--logo-->
			<div class="header-top" >
			<div class="container">
		<!--top-nav-->
			<div class="top-nav" >
					<span class="menu" > </span>
					<ul>				
						<li><a class="active" href="${pageContext.servletContext.contextPath}/">Home</a></li> 
						<c:if test="${mrank==2}">
						<li><a href="${pageContext.servletContext.contextPath}/web/memberindex">회원관리</a></li>
						<li><a href="${pageContext.servletContext.contextPath}/web/resmanagement">가맹점관리</a></li> 
						</c:if>
						<c:if test="${mrank==0}">
							<li><a href="${pageContext.servletContext.contextPath}/web/userrestaurant">매장보기</a></li> 
						</c:if>
						
						<c:if test="${mrank==1}">
						<li><a href="${pageContext.servletContext.contextPath}/web/ordermanagement">주문관리</a></li> 
						<li><a href="${pageContext.servletContext.contextPath}/web/restaurantmanege">매장관리</a></li>
						<li><a href="${pageContext.servletContext.contextPath}/web/menumanagement">메뉴관리</a></li> 
						</c:if>
						<li class="lost"><a href="${pageContext.servletContext.contextPath}/web/contact">오시는길</a></li>
						<li class="lost"><a href="${pageContext.servletContext.contextPath}/web/contact2">테스트페이지</a></li>
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
	<!--/header-->
</div>
<!--start-slider-->
	<div class="slider-bg">
				<div class="side wow bounceInRight" data-wow-delay="0.7s">
					 <div  id="top" class="callbacks_container">
							<ul class="rslides" id="slider4" style="width: auto;">
									<li>
										<img src="${pageContext.servletContext.contextPath}/resources/img/bg1.jpg" class="img-responsive" alt="" />
										<div class="caption1">
										<div class="logo">
											<a href="${pageContext.servletContext.contextPath}/"><h1>주문<span>할게요!</span></h1></a>
										</div>
											<h2>BEST RECIPES WITH
											BEST INGREDIENTS</h2>	
											<p>We offer the best Services in our Restarant.<p>
										</div>
									</li>
									<li>
									<img src="${pageContext.servletContext.contextPath}/resources/img/bg4.jpg" class="img-responsive" alt="" />
									  <div class="caption1">
										<div class="logo">
											<a href="/teamapp/"><h1>주문<span>할게요!</span></h1></a>
										</div>
										<h2>BEST RECIPES WITH
											BEST INGREDIENTS</h2>	
											<p>We offer the best Services in our Restarant.<p>
										</div>
									</li>
									<li>
									<img src="${pageContext.servletContext.contextPath}/resources/img/bg5.jpg" class="img-responsive" alt="" />
									<div class="caption1">
									<div class="logo">
										<a href="/teamapp/"><h1>주문<span>할게요!</span></h1></a>
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
				
				<div class="clearfix"> </div>

		<!--start-welcome-->
		<div class="welcome-section">
		   <div class="container">
				 <div class="wel-grid">
				   <div class="col-md-4 welcome-text">
					   <h3>Welcome</h3>
					   <h4>TO RESTAURANT!</h4>
					   <p>[주문할게요!]를 통해 보다 쉽고 빠르게 음식점을 예약해보세요! 많은 할인 혜택과 음식점 정보제공을 하고 있습니다. 값싸고 질높은 음식과 서비스를 이용하실 수 있습니다. 항상 빠르고 편리한 서비스제공을 위해 노력하겠습니다. 많은 애정과 관심을 부탁드립니다.</p>
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
					<div class="col-md-8 about-text" style="height: 452px;">
					   <h3>About</h3>
					   <h4>OUR RESTAURANT!</h4>
					   <!-- <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p> -->
					   <p>[주문할게요!] 를 통해 자신의 관심 지역을 설정하고 해당 지역의 이벤트를 진행하고 있는 식당을 한 눈에 살펴 볼 수 있습니다. 
					   		[주문할게요!] 에 회원가입시 다양한 쿠폰 및 이벤트 알림을 받아 보실 수 있습니다. 앱을 통해 제휴 식당에 예약하고 주문하시면 이벤트 혜택뿐만아니라 포인트 적립도 가능합니다.</p>
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
				   <div class="col-md-4 blog-text" style="height: 343px;">					   
					   <h5>Restaurant Growth Partner</h5>
					   <a href="#"><h4>레스토랑 성장 파트너</h4></a><br/>
					   <p>[주문할게요!]는 동네의 작은 가게로서 흩어져 있을 때 얻지 못했던 시너지를, 주문앱이라는 플랫폼을 통해 만들어낼 수 있습니다. 성실하게 사업하는 음식점들의 성장을 돕는, 신뢰할 수 있는 파트너가 되겠습니다.</p>				   	   
				   </div>
					<div class="col-md-8 welcome-img">
					 <a href="#" class="mask"><img src="${pageContext.servletContext.contextPath}/resources/img/b2.jpg" alt="image" class="img-responsive zoom-img"></a>
					</div>
				   <div class="clearfix"> </div>
			   </div>
			    <div class="blog">
				<div class="col-md-4 blog-text two" style="height: 343px;">
					<h5>Excellent Restaurant</h5>
					<a href="#"><h4>매달 우수음식점 선정</h4></a><br/>
					<p>[주문할게요!] 우수음식점은 예약 건수, 모바일 주문건수 등의 활동지수와 주문한 고객들의 리뷰 평점을 분석하여 공정하게 선정합니다. 매월 1일 선정되신 음식점을 발표하며 해당지역 제일 상단에 노출됩니다.</p>					
				</div>
				<div class="col-md-8 blog-img two">
					 <a href="#" class="mask"><img src="${pageContext.servletContext.contextPath}/resources/img/b3.jpg" alt="image" class="img-responsive zoom-img"></a>
					</div>
				<div class="clearfix"> </div>
			    </div> 
			    <div class="blog">
				   <div class="col-md-4 blog-text" style="height: 343px;">
					   <h5>Benefits of using Our App</h5>
					   <a href="#"><h4>[주문할게요!] 사용 시 장점</h4></a><br/>
					   <p>1. 시간과 상관없이 우리 업소를 홍보할 수 있습니다.<br/>					   		
							2. 전단지, 지역광고 등에 비해 광고비가 저렴합니다.<br/>
							3. 이벤트를 사장님들이 관리하고 적용하실 수 있습니다.<br/>
							4. 메뉴를 편리하고 효과적으로 관리할 수 있습니다.<br/>
							5. 명절, 연휴엔 임시 휴무일을 설정할 수 있습니다.<br/></p>
				   </div>
					<div class="col-md-8 welcome-img">
					 <a href="#" class="mask"><img src="${pageContext.servletContext.contextPath}/resources/img/b1.jpg" alt="image" class="img-responsive zoom-img"></a>
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
		
<!-- END # BOOTSNIP INFO -->

<!-- BEGIN # MODAL LOGIN -->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none; padding-top: 150px" >
    <div class="modal-dialog" style="width: 400px;">
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
							<button style="padding: 0px;" id="login_findId_btn" type="button" class="btn btn-link"  onclick="onClickFindId()"><u>아이디 찾기</u></button>
							<button style="padding: 0px;" id="login_findPw_btn" type="button" class="btn btn-link"  onclick="onClickFindPw()"><u>비밀번호 찾기</u></button>
							<button style="padding: 0px;" id="login_join_btn" type="button" class="btn btn-link"  onclick="onClickJoin()"><u>회원가입</u></button>
							<!--      <button id="login_register_btn" type="button" class="btn btn-link">Register</button> -->
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
</div>
<!-- END # MODAL LOGIN -->

<!-- END # BOOTSNIP INFO -->
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
	
	
	
	<!--  #################################### 아이디 찾기 Modal #################################### --> 
	<div id="findMidModal" class="modal fade" tabindex="-1" role="dialog" style="margin: auto">
		<div class="modal-dialog" role="document" style="width:450px;">
	    	<div class="modal-content" style="width:450px; margin: 0">
		    	<div class="login-form">
			   		<!-- modal-header -->
			   		<div class="modal-header" style="background-color: #34495e; color:white">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #FFFFFF;"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">아이디 찾기</h4>
			    	</div>
			    	
			    	<div class="modal-bodyfooter">
			    	
			    		<!-- modal-modal-body -->
				    	<div class="modal-body">
							<form id="modifyForm">	
							
								<div class="form-group">
									<div class="input-group">
										<span style="width: 130px" class="input-group-addon"><b>이름</b></span>
										<input type="text" class="form-control" name="mname" id="mname" onkeydown="if(event.keyCode==13){javascript:onClickFindMid();}"/>
									</div>
								</div>
								
								<div class="form-group">
									<div class="input-group">
										<span style="width: 130px" class="input-group-addon"><b>휴대폰번호</b></span>
										<input type="text" class="form-control" name="mphone" id="mphone" onkeydown="if(event.keyCode==13){javascript:onClickFindMid();}"/>
									</div>
								</div>
								
							</form>		
				    	</div>
			     	
				      	<!-- modal-modal-modal-footer -->	
						<div class="modal-footer" style="background-color: #34495e; color:white">
					        <button id="btnFindMid" type="button" class="btn btn-default" onclick="onClickFindMid()" style="color: #34495e"><b>확인</b></button>
					        <button id="btnInit" type="button" data-dismiss="modal" class="btn btn-default"  style="color: #34495e"><b>취소</b></button>
					    </div>
					    
					</div>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!--  #################################### 아이디 찾기 Modal #################################### --> 
	
	<!--  #################################### 비밀번호 찾기 Modal #################################### --> 
	<div id="findMpasswordModal" class="modal fade" tabindex="-1" role="dialog" style="margin: auto">
		<div class="modal-dialog" role="document" style="width:450px;">
	    	<div class="modal-content" style="width:450px; margin: 0">
		    	<div class="login-form">
			   		<!-- modal-header -->
			   		<div class="modal-header" style="background-color: #34495e; color:white">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #FFFFFF;"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">비밀번호 찾기</h4>
			    	</div>

		    		<!-- modal-modal-body -->
			    	<div class="modal-body">
						<form id="modifyForm">	
						
							<div class="form-group">
								<div class="input-group">
									<span style="width: 130px" class="input-group-addon"><b>아이디</b></span>
									<input type="text" class="form-control" name="fpmid" id="fpmid" onkeydown="if(event.keyCode==13){javascript:onClickChangepw();}"/>
								</div>
							</div>
							
							<div class="form-group">
								<div class="input-group">
									<span style="width: 130px" class="input-group-addon"><b>휴대폰번호</b></span>
									<input type="text" class="form-control" name="fpmphone" id="fpmphone" onkeydown="if(event.keyCode==13){javascript:onClickChangepw();}"/>
								</div>
							</div>
							
						</form>		
			    	</div>
		     	
			      	<!-- modal-modal-modal-footer -->	
					<div class="modal-footer" style="background-color: #34495e; color:white">
				        <button id="btnModify" type="button" class="btn btn-default" onclick="onClickChangepw()" style="color: #34495e"><b>확인</b></button>
				        <button id="btnfpInit" type="button" data-dismiss="modal" class="btn btn-default"  style="color: #34495e"><b>취소</b></button>
				    </div>

				</div> <!-- /.login-form -->
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!--  #################################### 비밀번호 찾기 Modal #################################### --> 
	
	<!--  #################################### 비밀번호 재설정 Modal #################################### --> 
	<div id="mpasswordResetModal" class="modal fade" tabindex="-1" role="dialog" style="margin: auto">
		<div class="modal-dialog" role="document" style="width:450px;">
	    	<div class="modal-content" style="width:450px; margin: 0">
		    	<div class="login-form">
			   		<!-- modal-header -->
			   		<div class="modal-header" style="background-color: #34495e; color:white">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #FFFFFF;"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">비밀번호 재설정</h4>
			    	</div>
			
			    	<!-- modal-modal-body -->
			    	<div class="modal-body">
						<form id="modifyForm">
						
							<div class="form-group">
								<div class="input-group">
									<span style="width: 130px" class="input-group-addon"><b>새로운 비밀번호</b></span>
									<input type="password" class="form-control" name="mpassword" id="mpassword" onkeydown="if(event.keyCode==13){javascript:onClickModifyPw();}"/>
								</div>
							</div>
							
							<div class="form-group">
								<div class="input-group">
									<span style="width: 130px" class="input-group-addon"><b>비밀번호 확인</b></span>
									<input type="password" class="form-control" name="mpassword2" id="mpassword2" onkeydown="if(event.keyCode==13){javascript:onClickModifyPw();}"/>
								</div>
							</div>
							
						</form>		
			    	</div>
			     	
			      	<!-- modal-modal-modal-footer -->	
					<div class="modal-footer" style="background-color: #34495e; color:white">
				        <button id="btnModifyPw" type="button" class="btn btn-default" onclick="onClickModifyPw()" style="color: #34495e"><b>확인</b></button>
				        <button id="btnInitPw" type="button" data-dismiss="modal" class="btn btn-default"  style="color: #34495e"><b>취소</b></button>
				    </div>
				    
				</div> <!-- /.login-form -->
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!--  #################################### 비밀번호 재설정 Modal #################################### --> 
	
	<!--  #################################### 회원가입 Modal #################################### --> 	
	<div id="joinModal" class="modal fade" tabindex="-1" role="dialog" style="margin: 155px auto">
		<div class="modal-dialog" role="document" style="width:450px;">
	    	<div class="modal-content" style="width:450px; margin: 0">
	    	
	    		<!-- modal-header -->
	     		<div class="modal-header" style="background-color: #34495e; color:white">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">회원 가입</h4>
	      		</div>
	      		
	      		<!-- Validation Check Text -->
	      		<input type="hidden" id="idCheck" value="false"/>
	      		
	      		<!-- modal-body -->
	      		<div class="modal-body">
					<form id="joinForm">
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px;" class="input-group-addon"><b>아이디</b></span>
								<b><input type="text" style="width: 184px;" class="form-control" name="jmid" id="jmid"/></b>
								&nbsp;<span><button id="btnValidationCheck" type="button" class="btn btn-default active" onclick="onClickBtnValidationCheck()" style="color: #34495e"><b>중복 체크</b></button></span>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>이름</b></span>
								<input type="text" class="form-control" name="jmname" id="jmname" placeholder="홍길동"/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>비밀번호</b></span>
								<input type="password" class="form-control" name="jmpassword" id="jmpassword" placeholder="8~20글자 입력하세요"/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>휴대전화</b></span>
								<input type="text" class="form-control" name="jmphone" id="jmphone" placeholder="ex) 010-1234-1234 "/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>생일</b></span>
								<input type="date" class="form-control" name="jmbirth" id="jmbirth"/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>관심지역</b></span>
								<select class="form-control" style="width: auto" id="selCity" name="selCity"></select>
								<select class="form-control" style="width: auto" id="selProvince" name="selProvince"></select><br/>
								<input type="hidden" class="form-control" name="mjlocation" id="jmlocation"/>		
							</div>
						</div>
						
					</form>		
	      		</div>
	      	
		      	<!-- modal-footer -->	
				<div class="modal-footer" style="background-color: #34495e; color:white">
			        <button id="btnJoin" type="button" class="btn btn-default" onclick="onClickBtnJoin()" style="color: #34495e"><b>가입</b></button>
			        <button id="btnJoinCancel" type="button" class="btn btn-default" onclick="onClickBtnJoinCancel()" style="color: #34495e"><b>취소</b></button>
				</div>
				
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!--  #################################### 회원가입 Modal #################################### -->
	
	<!--  #################################### Message Modal #################################### -->	
	<div id="messageModal" class="modal fade" tabindex="-1" role="dialog" style="margin: auto" onkeydown="if(event.keyCode==13){javascript:onClickBtnOK();}">
		<div class="modal-dialog" role="document" style="width:300px;">
	    	<div class="modal-content" style="width:300px; margin: 0">
	    	
	    		<!-- modal-header -->
	     		<div class="modal-header" style="background-color: #34495e; color:white; text-align: left">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<i id="headerIcon" class="fa fa-bell-o" style="font-size: 20px" aria-hidden="true"> 알림</i>
	      		</div>
	      		
	      		<!-- modal-body -->
	      		<div class="modal-body" align="center">
	      			<i id="messageIcon" class="fa fa-exclamation-triangle" style="font-size: 100px; color: #34495e" aria-hidden="true"></i><br/>
					<b style="font-size: 20px; color: #1bbc9b" id="successMessage"></b>
					<b style="font-size: 20px; color: red" id="failMessage"></b>
	      		</div>
	      	
		      	<!-- modal-footer -->	
				<div class="modal-footer" style="background-color: #34495e; color:white">
			        <button id="messageOk" type="button" class="btn btn-default" onclick="onClickBtnOK()" style="color: #34495e"><b>확인</b></button>
				</div>
				
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!--  #################################### Message Modal #################################### -->
	
</body>
</html>
