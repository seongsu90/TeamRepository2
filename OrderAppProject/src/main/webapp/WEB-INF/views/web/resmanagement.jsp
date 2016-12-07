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
	$(document).ready(function() {
			console.log("ready 실행");
			
			$("#selCity").change(function () {
				console.log("City Change");
				var selCity = $("#selCity").val();
		        setProvince(selCity, null);
		    });
			
			$("#selProvince").change(function () {
				$("#reslocation").val($("#selCity").val() + " "+ $("#selProvince").val() + " "); 
		    });
			
			$("#infoModal").on('hidden.bs.modal', function() {
				
				$("input[name=closeday]").attr("checked", false); 
				location.reload();
			}); 
			
			
	});
			
		function setCity(selCity) {
			console.log("setCity 실행");
			$.ajax({
				url: "/teamapp/restaurant/getCity",
				data: {"selCity":selCity},
				success: function (data) {
					$("#selCity").html(data);
				}
			});
		}
		
			function setProvince(selCity, selProvince) {
				console.log("setProvince 실행");
				$.ajax({
					url: "/teamapp/restaurant/getProvince",
					data: {"selCity":selCity, "selProvince":selProvince},
					success: function (data) {
						$("#selProvince").html(data);
				}
			});
		}
    </script>
	
	<script type="text/javascript">
		function showInfo(data) {	
			$("#btnModifySuccess").hide();
 			$("#infoModal #resid").val(data.resid);
			$("#infoModal #resname").val(data.resname);
			$("#infoModal #reslocation").val(data.reslocation);
			var location =[];
			location=data.reslocation.split(" ");
			$("#infoModal #restotaltable").val(data.restotaltable);
			$("#infoModal #resinfo").val(data.resinfo);
			$("#infoModal #restel").val(data.restel);
			$("#infoModal #rescloseday").val(data.rescloseday);
			var closeday=[];
			closeday=data.rescloseday.split("/");
		 	for(var i=0; i<closeday.length; i++) {
				console.log(closeday[i]);
		 	 	$("input[name=closeday][value="+closeday[i]+"]").attr("checked", true); 
			} 
			$("#infoModal #resopen").val(data.resopen);
			$("#infoModal #resclose").val(data.resclose); 
			$("#infoModal #photo").attr('src', "/teamapp/restaurant/showPhoto?ressavedfile=" + data.ressavedfile);
			if(!"#ReserveModal"){
				$('input').attr("readonly",true);//input 요소 설정 readonly 위한 것이다.
			}
			$('input').attr("readonly",true);//input 요소 설정 readonly 위한 것이다.
			setCity(location[0]);
			setProvince(location[0], location[1]);
		 	$("#selCity").not(":selected").attr("disabled", "disabled");
			$("#selProvince").not(":selected").attr("disabled", "disabled"); 
			$("#resphoto").hide();
			$("#closeday").hide();
			$("#infoModal").modal("show");
		};
		


		
		function onClickBtnCancel() {
			console.log("onClickBtnCancel() 실행");
			$("#ReserveModal").modal("hide");
			$("#infoModal").show();
		}

		

		
		
/* ############################################################################	 */		
		
		
		


		 function check_only(chk){
		     var obj = document.getElementsByName("closeday");
		     if(chk.value=="휴일없음"){
				for(var i=0; i<obj.length; i++){
				   if(obj[i] != chk){
				  		obj[i].checked = false;
					}
				}
			}
		     else{
				for(var i=0; i<obj.length; i++){
					   if(obj[i].value == "휴일없음"){
					  		obj[i].checked = false;
					  	}
				}
			}

	     }
	     

		 function check_only(chk){
		     var obj = document.getElementsByName("closeday");
		     if(chk.value=="휴일없음"){
				for(var i=0; i<obj.length; i++){
				   if(obj[i] != chk){
				  		obj[i].checked = false;
					}
				}
			}
		     else{
				for(var i=0; i<obj.length; i++){
					   if(obj[i].value == "휴일없음"){
					  		obj[i].checked = false;
					  	}
				}
			}
	     }
		
		
		function onClickBtnModify(){
			$(':checkbox[readonly="readonly"]').click(function() {
				return true;
				});
			$('input').attr("readonly",false);
			$("#selCity").removeAttr("disabled");
			$("#selProvince").removeAttr("disabled");
			$("#btnModify").hide();
			$("#isclose").hide();
			$("#closeday").show();
			$("#btnModifySuccess").show();
			$("#resphoto").show();
			setCity();		
		};
		 
		function resUpdate() {
			var resid = $("#infoModal #resid").val();
			var resname = $("#infoModal #resname").val();
			var reslocation = $("#infoModal #reslocation").val();
			var restotaltable = $("#infoModal #restotaltable").val();
			var resinfo = $("#infoModal #resinfo").val();
			var restel = $("#infoModal #restel").val();
			var closeday =[];
			$("input[name='closeday']:checked").each(function(i) {
				closeday.push($(this).val());
			});
			var resopen = $("#infoModal #resopen").val();
			var resclose = $("#infoModal #resclose").val();
			var resphoto = $("#infoModal #resphoto")[0];
			var data = new FormData();
			data.append("resid", resid);
			data.append("resname", resname);
			data.append("reslocation", reslocation);
			data.append("restotaltable", restotaltable);
			data.append("resinfo", resinfo);
			data.append("restel", restel);
			for(var i=0; i<closeday.length; i++) {
				data.append("closeday", closeday[i]);
			}
			data.append("resopen", resopen);
			data.append("resclose", resclose);
			if(resphoto.files.length != 0) {
				data.append("resphoto", resphoto.files[0]);
			}	
			
			$.ajax({
				url:"../restaurant/modify",
				data: data,
				method: "post",
				cache: false,
				processData: false,
				contentType: false,
				success: function(data) {
					if(data.result == "success") {
						location.reload(true);
						$("#infoModal").modal("hide");
						$("#iframe")[0].contentDocument.location.reload(true);
					} else {
						alert("수정 실패");
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
				<a href="/teamapp/"><h1>
						FOOD<span>House</span>
					</h1></a>
			</div>
		</div>
		<!--/header-->
	</div>

	<iframe id="iframe" name="iframe" style="width:100%; height:700px; border:0px;" scrolling="no" src="/teamapp/restaurant/list"> </iframe>

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
	
	
		


	
	
	
	
	
	<%-- #################################################################################### --%>
	<%-- ## Info Modal ## --%>
	<div id="infoModal" class="modal fade" tabindex="-1" role="dialog" >
		<div class="modal-dialog" role="document" style="width:750px">
			<div class="modal-content">
			<!-- modal-header -->
		     		<div class="modal-header" style="background-color: #34495e; color:white">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">레스토랑 정보</h4>
		      		</div>
		
			<div class="modal-body">

					<form id="info">
								<input id="resid" type='hidden'/>
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px; padding:0px;" class="input-group-addon"><b>식당 이름</b></span>
								<b><input id="resname" type='text' style="width:225px" class="form-control" /></b>
							</div>
						</div>


						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>전체 테이블 수</b></span>
								<b><input id="restotaltable" type='number' style="width:225px" class="form-control" /></b>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>전화번호</b></span>
								<b><input id="restel" type='text' style="width:225px" class="form-control" /></b>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>오픈 타임</b></span>
								<b><input id="resopen" type='time' style="width:225px" class="form-control" /></b>
							</div>
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>클로즈 타임</b></span>
								<b><input id="resclose" type='time' style="width:225px" class="form-control"/></b>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>레스토랑 정보</b></span>
								<b><input id="resinfo" type='text' style="width:555px" class="form-control" /></b>
							</div>
						</div>

					

						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>주소</b></span>
								<select class="form-control" style="width: 120px" id="selCity" name="selCity"></select>
								<select class="form-control" style="width: 105px" id="selProvince" name="selProvince">
									<option value="선택">선택</option>
								</select>	
								<input type="text" class="form-control" style="width: 330px" id="reslocation" name="reslocation"/><br/>
							</div>
						</div>
						
						
						
						<div id="isclose" class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>레스토랑 휴일</b></span>
								<b><input id="rescloseday" type='text' style="width:555px" class="form-control" /></b>
							</div>
						</div>
						
						
						
						
						<div id="closeday" class="form-group">
							<div class="input-group">
								<span style="width: 130px; margin-right: 10px; border-right: 1px solid #ccc;" class="input-group-addon"><b>휴일</b></span>&nbsp;
								<input type="checkbox"  name="closeday"  value="휴일없음" onclick="check_only(this)">휴일 X&nbsp;
			        			<input type="checkbox"  name="closeday"  value="월요일" onclick="check_only(this)">월요일&nbsp;
			        			<input type="checkbox"  name="closeday"  value="화요일" onclick="check_only(this)">화요일&nbsp;
			        			<input type="checkbox"  name="closeday"  value="수요일" onclick="check_only(this)">수요일&nbsp;
			        			<input type="checkbox"  name="closeday"  value="목요일" onclick="check_only(this)">목요일&nbsp;
			        			<input type="checkbox"  name="closeday"  value="금요일" onclick="check_only(this)">금요일&nbsp;
			        			<input type="checkbox"  name="closeday"  value="토요일" onclick="check_only(this)">토요일&nbsp;
			        			<input type="checkbox"  name="closeday"  value="일요일" onclick="check_only(this)">일요일
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>사진</b></span>
								<div id="photoTag">
									<img id="photo" class="form-control" style="width: 225px; height:auto; padding: 10px"/>
								</div>
								
								<b><input id="resphoto" type='file' style="width:225px" class="form-control" multiple/></b>
						
							</div>
						</div>
						
						</form>
					</div>
			<div class="modal-footer" style="background-color:#34495e; color:white">
				
				<c:if test="${mrank==2}">
					<button id="btnModify" type="button" class="btn btn-primary" onclick="onClickBtnModify()" ><b>수정하기</b></button>
					<a href="javascript:resUpdate()" type="button" id="btnModifySuccess" class="btn btn-primary">수정완료</a>								
				</c:if>
			</div>
			</div>
		</div>
	</div>
	

		
	 
</body>
</html>