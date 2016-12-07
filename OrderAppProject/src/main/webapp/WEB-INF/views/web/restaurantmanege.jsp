<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8"%>

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
	
	<style type="text/css">
		.about-section {
			background-image: url("/teamapp/resources/img/bg5.png");
		}
	</style>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#infoModal #ephoto").change(function(){
				$("#photoTag").html("");
			});
		});
		
		function showInfo(data) {
			$("#infoModal").modal("show");
			$("#infoModal #ename").val(data.ename);
			$("#infoModal #eresid").val(data.eresid);
			$("#infoModal #einfo").val(data.einfo);
			$("#infoModal #emlname").val(data.emlname);
			$("#infoModal #eprice").val(data.eprice);
			$("#infoModal #estart").val(data.estart);
			$("#infoModal #eend").val(data.eend);
			$("#infoModal #photoEx").attr('src', "/teamapp/event/showPhoto?esavedfile=" + data.esavedfile);
		};
		
		function eventUpdate() {
	
			var ename = $("#infoModal #ename").val();
			var eresid = $("#infoModal #eresid").val();
			var ephoto = $("#infoModal #ephoto")[0]; 
			var einfo = $("#infoModal #einfo").val();
			var emlname = $("#infoModal #emlname").val();
			var eprice = $("#infoModal #eprice").val();
			var estart = $("#infoModal #estart").val();
			var eend = $("#infoModal #eend").val();
			
			var data = new FormData();
			data.append("ename", ename);
			data.append("eresid", eresid);
			if(ephoto.files.length != 0) {
				data.append("ephoto", ephoto.files[0]);
			}
			data.append("einfo", einfo);
			data.append("emlname", emlname);
			data.append("eprice", eprice);
			data.append("estart", estart);
			data.append("eend", eend);
			
			$.ajax({
				url:"../event/modify",
				data: data,
				method: "post",
				cache: false,
				processData: false,
				contentType: false,
				success: function(data) {
					if(data.result == "success") {
						$("#infoModal").modal("hide");
						location.reload(true);
					} else {
						
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
					<span class="menu two"> </span>
					<ul>
						<li><a href="${pageContext.servletContext.contextPath}/">Home</a></li> 
						<c:if test="${mrank==2}">
						<li><a href="${pageContext.servletContext.contextPath}/web/memberindex">회원관리</a></li>
						<li><a href="${pageContext.servletContext.contextPath}/web/resmanagement">가맹점관리</a></li> 
						</c:if>
						<c:if test="${mrank==1}">
						<li><a href="${pageContext.servletContext.contextPath}/web/ordermanagement">주문관리</a></li> 
						<li><a class="active" href="${pageContext.servletContext.contextPath}/web/restaurantmanege">매장관리</a></li>
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
				<a href="/teamapp/"><h1>FOOD<span>House</span></h1></a>
			</div>
		</div>		
	</div>
	
	<!-- 내용 -->
	<div class="about-section"> 
	   <div class="container" align="center"><h2>Restaurant Management</h2> <br/>
	
		<section class="content">
			<nav style="width:1000px">
	          <ul class="nav nav-justified">
	            <li style="background:#1bbc9b;"><a target="iframe" href="/teamapp/restaurant/myres"><b style="color:black;">나의 Restaurant</b></a></li>
	            <li style="background:#1bbc9b;"><a target="iframe" href="/teamapp/event/list?pageNo=1"><b style="color:black;">이벤트</b></a></li>
	          </ul>
  			</nav>
			<iframe name="iframe" style="width:100%; height:840px; border-width:0;" src="/teamapp/restaurant/myres"></iframe>
			
		</section>
		
		</div>
	</div>

	<!--/start-footer-->
	<div class="footer">
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
			<div class="clearfix"></div>
		</div>
	</div>
	
	<!-- last footer ( go to top ) -->
	<div class="copy-right">
		<div class="container">
			<p>Copyright &copy; 2015 All Rights Reserved Design by <a href="http://w3layouts.com/">W3layouts</a> </p>
		</div>
	</div>
	<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	
 <%-- ## Info Modal ## --%>
	 <div id="infoModal" class="modal fade" tabindex="-1" role="dialog" >
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			<!-- modal-header -->
		     		<div class="modal-header" style="background-color: #34495e; color:white">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">이벤트 정보 및 수정</h4>
		      		</div>
		
			<div class="modal-body">
					<form id="info">
						<input id="eresid" type="hidden"/>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px; padding:0px;" class="input-group-addon"><b>이벤트 이름</b></span>
								<b><input id="ename" type="text" class="form-control" /></b>
							</div>
						</div>

						 <div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>이벤트 사진</b></span>
								
								<div id="photoTag">
									<img id="photoEx" class="form-control" style="width: 302px; height:auto; padding: 10px"/>
								</div>
								<b><input id="ephoto" type="file" class="form-control" multiple /></b>
							</div>
						</div> 

						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>이벤트 정보</b></span>
								<b><input id="einfo" type="text" class="form-control" style="width:280px;" /></b>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>메뉴이름</b></span>
							<b><input id="emlname" type="text" class="form-control" /></b>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>이벤트 가격</b></span>	
								<b><input id="eprice" type="number" class="form-control" /></b>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>시작일</b></span>
								<b><input id="estart" type="date" class="form-control" /></b>
							</div>
						</div>


						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>종료일</b></span>
								<b><input id="eend" type="date" class="form-control" /></b>
							</div>
						</div>
						
						</form>
					</div>
					<div class="modal-footer" style="background-color:#34495e; color:white">
						 <a href="javascript:eventUpdate()" type="button"  class="btn btn-primary">수정</a>
					</div>
			</div>
		</div>
	</div> 		
	
	
			<%-- 	 #################################################################################### 

		 <%-- ## Reserve Modal ## --%>

	<div id="ReserveModal" class="modal fade" tabindex="-1" role="dialog" style="margin: auto">
		<div class="modal-dialog" role="document" style="width:750px">
   			<div class="modal-content">
   			<!-- modal-header -->
     		<div class="modal-header" style="background-color: #34495e; color:white">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Restaurant 예약</h4>
      		</div>

     		<!-- modal-modal-body -->
     		<div class="modal-body">
     		
			<form id="addForm">
			
				※ 당일 예약만 가능합니다. <br/>
		- 예약 시간 <input type="time"  name="rvtime"  /> 
		<c:if test="${error1 == 'TIME_OUT'}"> *올바른 시간이 아닙니다.</c:if>
		<c:if test="${error1 == 'DAY_OUT'}"> *오늘은 쉬는날 입니다.</c:if><br/>
		- 인원 수(테이블당 최대 4명) <input type="number" name="rvperson" min="1" max="8"><br/>
		- 예약 아이디<input type="text" name="rvmid" value="${login}"readonly> <br/>
		- 예약하는 식당 <input type="text"  name="rvresid" value="${rvresid}" readonly/><c:if test="${error1 == 'ALREADY'}"> *이미 예약한 식당입니다.</c:if><br/> <br/>
		
		<input type="submit" value="예약하기"/> <br/>
			
			
			
			

			</form>
     		</div>

      	<!-- modal-modal-modal-footer -->
		<div class="modal-footer" style="background-color: #34495e; color:white">
	        <button id="btnResAdd" type="button" class="btn btn-default" onclick="onClickBtnResAdd()" style="color: #34495e"><b>등록</b></button>
	        <button id="btnInit" type="button" class="btn btn-default" onclick="onClickBtnCancel()" style="color: #34495e"><b>취소</b></button>
		</div>
	</div><!-- /.modal-content -->
</div><!-- /.modal-dialog --> 
</div><!-- /.modal -->
	
</body>
</html>