<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
		href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css">
	<link rel="stylesheet"
		href="${pageContext.servletContext.contextPath}/resources/css/style.css" />
	<link
		href='http://fonts.googleapis.com/css?family=Niconne|Playball|Open+Sans:300italic,400italic,600italic,400,300,600,700'
		rel='stylesheet' type='text/css'>
	<link rel="stylesheet"
		href="${pageContext.servletContext.contextPath}/resources/css/common.css" />	
		
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<script type="text/javascript"
		src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript">
			function showInfo(data){
				$("#infoModal").modal("show");			
				$("#infoModal #ename").val(data.ename);	
				$("#infoModal #eresid").val(data.eresid);	
				$("#infoModal #esavedfile").val(data.esavedfile);	
				$("#infoModal #einfo").val(data.einfo);	
				$("#infoModal #emlname").val(data.emlname);	
				$("#infoModal #eprice").val(data.eprice);
				$("#infoModal #estart").val(data.estart);
				$("#infoModal #eend").val(data.eend);
			};
			
			function eUpdate(){
				var ename = $("#infoModal #ename").val();
				var eresid = $("#infoModal #eresid").val();
				var esavedfile = $("#infoModal #esavedfile")[0];
				var einfo = $("#infoModal #einfo").val();
				var emlname = $("#infoModal #emlname").val();
				var eprice = $("#infoModal #eprice").val();
				var estart = $("#infoModal #estart").val();
				var eend = $("#infoModal #eend").val();
			}
			var data = new Formdata();
			data.append("ename", ename);
			data.append("eresid", eresid);
			if(esavedfile.files.length!=0){
				data.append("esavedfile",esavedfile.files[0]);
			}
			
			$.ajax({
				url:"../event/modify",
				data: data,
				method: "post",
				cache: false,
				processData: false,
				contentType: false,
				success: function(data){
					if(data.result == "success"){
						$("#infoModal").modal("hide");
						$("$#iframe")[0].contentDocument.location.reload(true);
					}else{
						alert("수정 실패");
					}
				}
			});
			
			/* function onClickBtnAdd(){
				console.log("onClickBtnAdd");
				$("#eventAddModal").modal("show");
			}
			
			function onClickBtnEventAdd(){
				console.log("onClickBtnEventAdd() 실행");
				
				var ename = $("#ename").val();
				var eresid = $("#eresid").val();
				var esavedfile = $("#esavedfile").val();
				var einfo = $("#einfo").val();
				var emlname = $("#emlname").val();
				var eprice = $("#eprice").val();
				var estart = $("#estart").val();
				var eend = $("eend").val();	
				
				$.ajax({
					url:"/event/add",
					data:{},
					method:"post",
					success: function(data){
						if(data.result == "success"){
						alert("성공");
						$("#eventAddModal").modal("hide");
						location.reload();
					}else if(data.result == "nonono"){
						alert("제대로 입력하시오");	
					}
					}
					
				});
			}
			
			function onClickBtnCancel(){
				console.log("onClickBtnCancel() 실행");
				$("#eventAddModal").modal("hide");
			} */
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
						<li><a href="${pageContext.servletContext.contextPath}/">Home</a></li> 
						<c:if test="${mrank==2}">
						<li><a href="${pageContext.servletContext.contextPath}/web/memberindex">회원관리</a></li>
						<li><a class="active"  href="${pageContext.servletContext.contextPath}/web/resmanagement">가맹점관리</a></li> 
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
				<div class="clearfix"></div>
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
			<div class="clearfix"></div>
		</div>
		<div class="head-bg">
			<div class="logo three">
				<a href="/teamapp/home"><h1>
						FOOD<span>House</span>
					</h1></a>
			</div>
		</div>
		<!--/header-->
	</div>







	<div class="menu-section">
		<div class="container">
			<h2>EVENT</h2>
		
			<iframe name="iframe"
				style="width: 100%; height: 650px; border-width: 0px;"
				src="/teamapp/event/list"> </iframe>
		</div>
	</div>

	<!--/start-footer-->
	<div class="footer">
		<div class="container">
			<div class="col-md-3 footer-grid">
				<div class="logo two">
					<a href="/teamapp/home"><h3>
							FOOD<span>House</span>
						</h3></a>
				</div>
			</div>
			<div class=" col-md-3 footer-grid footer-grid2">
				<div class="bottom-nav">
					<h4>LEARN</h4>
					<ul>
						<li><a class="active" href="/teamapp/home">Home</a></li>
						<li><a href="/teamapp/web/memberindex">회원관리</a></li>
						<li><a href="/teamapp/web/resmanagement">가맹점관리</a></li>
						<li><a href="/teamapp/web/ordermanagement">주문관리</a></li>
						<li><a href="/teamapp/web/restaurantmanege">매장관리</a></li>
						<li><a href="/teamapp/web/menumanagement">메뉴관리</a></li>
						<li><a href="/teamapp/web/contact">오시는길</a></li>
						<div class="clearfix"></div>
					</ul>
				</div>
			</div>
			<div class=" col-md-3 footer-grid">
				<div class="Office Address">
					<h4>ADDRESS</h4>
					<ul class="bottom-icons">
						<li><a class="home" href="#"><span> </span></a>Lorem ipsy
							street,Newyork</li>
						<li><a class="mail" href="mailto:info@example.com"><span>
							</span>123 int@example.com</a></li>
						<li><a class="mbl" href="#"><span> </span></a>+91 000 00 00
							00 0</li>
						<div class="clearfix"></div>
					</ul>
				</div>
			</div>
			<div class="col-md-3 footer-grid">
				<h4>SUPPORT WITH</h4>
				<div class="support">
					<input type="text" class="text" value="Enter email to reset it"
						onfocus="this.value = '';"
						onblur="if (this.value == 'Enter email to reset it') {this.value = 'Enter email to reset it';}">
					<input type="submit" value="SUBMIT" class="botton">
					<p>Lorem ipsum dolor sit amet conse aliqua. Ut enim ad minim
						veniam Lorem ctetur adipisicing .</p>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="copy-right">
		<div class="container">
			<p>
				Copyright &copy; 2015 All Rights Reserved Design by <a
					href="http://w3layouts.com/">W3layouts</a>
			</p>
		</div>


	</div>
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
	<script type="text/javascript">
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
								</script>
	<a href="#home" id="toTop" class="scroll" style="display: block;">
		<span id="toTopHover" style="opacity: 1;"> </span>
	</a>
	
	<%-- ## Info Modal ## --%>
		<div id="infoModal" class="modal fade" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header"  style="background-color: #34495e">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" style="color: #FFFFFF;">이벤트 정보</h4>
		      </div>
		      <div class="modal-body">
				
				<form id="info">
					<input id="eresid" type='hidden'/>
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px; padding:0px;" class="input-group-addon"><b>이벤트 이름</b></span>
								<b><input type="text" class="form-control" name="ename" id="ename"/></b>
							</div>
						</div>


						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>식당 아이디</b></span>
								<input type="text" class="form-control" name="eresid" id="eresid"/>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>이벤트 사진</b></span>
								<input type="file" class="form-control" name="esavedfile" id="esavedfile" multiple/>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>이벤트 정보</b></span>
								<input type="text" class="form-control" name="einfo" id="einfo"/>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>이벤트 메뉴</b></span>
								<input type="text" class="form-control" name="emlname" id="emlname"/>
							</div>
						</div>


						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>할인가격</b></span>
								<input type="number" class="form-control" name="eprice" id="eprice"/>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>시작일</b></span>
								<input type="date" class="form-control" name="estart" id="estart"/>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>종료일</b></span>
								<input type="text" class="form-control" name="eend" id="eend"/>
							</div>
						</div>
				</form>
		      </div>
		      
		     </div>
		     
		     <div class="modal-footer" style="background-color:#34495e; color:white">
		     	<div>
		     		<c:if test="${mrank==1}">
		     			
		     				<a href="modify" type="button" class="btn btn-primary">수정</a>
		     			
		     		</c:if>
		     		<c:if test="${mrank==2}">
		     			<a href="javascript:eUpdate()" type="button" class="btn btn-primary">수정</a>
		     			<a href="delete?eresid=${eresid}" type="button" class="btn btn-primary">삭제</a>
		     		</c:if>
		     	</div>
		     </div>
      	  </div>
      	</div>
</body>
</html>