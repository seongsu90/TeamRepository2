<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
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
		
	<!-- Website Font style -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
	
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<script type="text/javascript"
		src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.min.js"></script>
				
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#selCity").change(function () {
				var selCity = $("#selCity").val();
		        setProvince(selCity, null);
		    });
			
			$("#selProvince").change(function () {
				$("#reslocation").val($("#selCity").val() + " "+ $("#selProvince").val() + " "); 
		    });
			
			$("#resInfo").on('hidden.bs.modal', function() {
				$("input[name=closeday]").attr("checked", false); 
				location.reload();
			});
			
			init();
		});
		
		function init() {
			var resid = $("#resid").val();
			$.ajax({

				url: "info",
				data: {"resid":resid},
				success: function(data) {
					infoSetting(data);
				}
			});
		};
				
		function setCity(selCity) {
			$.ajax({
				url: "/teamapp/restaurant/getCity",
				data: {"selCity":selCity},
				success: function (data) {
					$("#selCity").html(data);
				}
			});
		}
		
		function setProvince(selCity, selProvince) {
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
		function infoSetting(data) {
 			$("#resInfo #resid").val(data.resid);
			$("#resInfo #resname").val(data.resname);
		
			$("#resInfo #reslocation").val(data.reslocation);
			var location =[];
			location=data.reslocation.split(" ");
			
			$("#resInfo #restotaltable").val(data.restotaltable);
			$("#resInfo #resinfo").val(data.resinfo);
			$("#resInfo #restel").val(data.restel);
			
			$("#resInfo #rescloseday").val(data.rescloseday);
			var closeday=[];
			closeday=data.rescloseday.split("/");
		 	for(var i=0; i<closeday.length; i++) {
		 	 	$("input[name=closeday][value="+closeday[i]+"]").attr("checked", true); 
			} 
			
			$("#resInfo #resopen").val(data.resopen);
			$("#resInfo #resclose").val(data.resclose); 
			$("#resInfo #photo").attr('src', "/teamapp/restaurant/showPhoto?ressavedfile=" + data.ressavedfile);
	
			$('input').attr("readonly",true);//input 요소 설정 readonly 위한 것이다.
			
			setCity(location[0]);
			setProvince(location[0], location[1]);
			
		 	$("#selCity").not(":selected").attr("disabled", "disabled");
			$("#selProvince").not(":selected").attr("disabled", "disabled");
			
			$("#btnModifySuccess").hide();
			$("#btnCancel").hide();
			$("#resphoto").hide();
			$("#closeday").hide();
		};
		
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
			$("#btnCancel").show();
		};
		
		function resUpdate() {
			var resid = $("#resInfo #resid").val();
			var resname = $("#resInfo #resname").val();
			var reslocation = $("#resInfo #reslocation").val();
			var restotaltable = $("#resInfo #restotaltable").val();
			var resinfo = $("#resInfo #resinfo").val();
			var restel = $("#resInfo #restel").val();
			
			var closeday =[];
			$("input[name='closeday']:checked").each(function(i) {
				closeday.push($(this).val());
			});
			
			var resopen = $("#resInfo #resopen").val();
			var resclose = $("#resInfo #resclose").val();
			var resphoto = $("#resInfo #resphoto")[0];

			
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
				url:"modify",
				data: data,
				method: "post",
				cache: false,
				processData: false,
				contentType: false,
				success: function(data) {
					if(data.result == "success") {
						$("#successMessage").html("삭제 성공");
						$("#messageIcon").attr('class', "fa fa-check-circle");
						$("#messageModal").modal("show");
						$("#messageModal").on('hidden.bs.modal', function() {
							location.reload();
						}); 
					} else {
						$("#failMessage").html("수정 실패");
						$("#messageModal").modal("show");
					}
				}
			});

		}
		
		function onClickBtnCancel() {
			init();
			$("#btnModify").show();
		}
		
		/* ################## Message(OK, Error) Modal################## */
		/* Message OK Button */
		function onClickBtnOK() {
			$("#messageModal").modal("hide");
		}
	</script>
</head>
<body>
	
	<div id="resInfo" align="center">
		<div class="modal-dialog" role="document" style="width:750px">
			<div class="modal-content">
				<input type="hidden" id="resid" value="${restaurant.resid}"/>
	     		<div class="modal-header" style="background-color: #34495e; color:white">
					<h4 class="info-title"><b>${restaurant.resname}</b></h4>
	      		</div>
		
				<!-- body -->
				<div class="modal-body">
					<form id="info">
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
								<input type="checkbox"  name="closeday"  value="휴일없음" >휴일 X&nbsp;
			        			<input type="checkbox"  name="closeday"  value="월요일" >월요일&nbsp;
			        			<input type="checkbox"  name="closeday"  value="화요일" >화요일&nbsp;
			        			<input type="checkbox"  name="closeday"  value="수요일" >수요일&nbsp;
			        			<input type="checkbox"  name="closeday"  value="목요일" >목요일&nbsp;
			        			<input type="checkbox"  name="closeday"  value="금요일" >금요일&nbsp;
			        			<input type="checkbox"  name="closeday"  value="토요일" >토요일&nbsp;
			        			<input type="checkbox"  name="closeday"  value="일요일" >일요일
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
				
				<!-- footer -->
				<div class="modal-footer" style="background-color:#34495e; color:white">
					<button id="btnModify" type="button" class="btn btn-primary" onclick="onClickBtnModify()" ><b>수정하기</b></button>
					<a href="javascript:resUpdate()" type="button" id="btnModifySuccess" class="btn btn-primary">수정완료</a>
					<button id="btnCancel" type="button" class="btn btn-primary" onclick="onClickBtnCancel()" ><b>취소</b></button>
				</div>
				
			</div>
		</div>
	</div>
	
	
	<!-- ########################## Message Modal ########################## -->
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

	<!-- ########################## Message Modal ########################## -->
	
</body>
</html>