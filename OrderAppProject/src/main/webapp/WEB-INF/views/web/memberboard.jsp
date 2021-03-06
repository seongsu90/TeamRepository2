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

	<!-- Website Font style -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/earlyaccess/nanumpenscript.css'>
	
	<style type="text/css">
		table#acrylic {
            border-collapse: separate;
            background: #fff;
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
            border-radius: 10px;
            margin: 10px auto;
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
            color: white;
            text-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5);
            text-align: left;
            padding: 20px;
            background-size: 100%;
            background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #3C5064), color-stop(100%, #34495e));
            background-image: -moz-linear-gradient(#3C5064, #34495e);
            background-image: -webkit-linear-gradient(#3C5064, #34495e);
            background-image: linear-gradient(#3C5064, #34495e);
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
        
        /* 모달 폼 */
        body, html{
		    height: 100%;
		 	background-repeat: no-repeat;
		 	background-color: white;
		 	font-family: 'Oxygen', sans-serif;
		}
		
		h1.title { 
			font-size: 50px;
			font-family: 'Passion One', cursive; 
			font-weight: 400; 
		}
		
		hr{
			width: 10%;
			color: #fff;
		}
		
		.form-group{
			margin-bottom: 15px;
		}
		
		label{
			margin-bottom: 15px;
		}
		
		input,
		input::-webkit-input-placeholder {
		    font-size: 11px;
		    padding-top: 3px;
		}

		.input-group-addon {
			color: #34495e;
		}
		
		.about-section {
			background-image: url("/teamapp/resources/img/bg5.png");
		}
        
	</style>		
	
	<script type="text/javascript">
		$(document).ready(function() {
				$("#selCity").change(function () {
					var selCity = $("#selCity").val();
			        setProvince(selCity, null);
			        $("#mlocation").val(""); 
			    });
				
				$("#selProvince").change(function () {
					setMlocation();
			    });
				
				$("#memberModifyModal").on('shown.bs.modal', function() {
					$("#mname").focus();
				});
				
				$("#memberDeleteModal").on('shown.bs.modal', function() {
					$("#inputmid").focus();
				});
				
				$("#memberDeleteModal").on('hidden.bs.modal', function() {
					$("#inputmid").val("");
					location.reload();
				}); 
				
				$("#messageModal").on('hidden.bs.modal', function() {
					$("#inputmid").focus();
					$("#successMessage").html("");
					$("#failMessage").html("");
				});
		});
		
		function setCity(selCity) {
			$.ajax({
				url: "getCity",
				data: {"selCity":selCity},
				success: function (data) {
					$("#selCity").html(data);
				}
			});
		}
		
		function setProvince(selCity, selProvince) {
			$.ajax({
				url: "getProvince",
				data: {"selCity":selCity, "selProvince":selProvince},
				success: function (data) {
					$("#selProvince").html(data);
				}
			});
		}
			
		function setMlocation() {
			$("#mlocation").val($("#selCity").val() + " "+ $("#selProvince").val()); 				
		}	

		/* ################## Modify Modal################## */  
		/* Show Modify Modal */
		function showModifyModal(member) {
			$("#modifyForm #mid").val(member.mid);
			$("#modifyForm #mname").val(member.mname);
			$("#modifyForm #mpassword").val(member.mpassword);
			$("#modifyForm #mphone").val(member.mphone);
			$("#modifyForm #mbirth").val(member.mbirth);
			var selCity = member.mlocation.substring(0, member.mlocation.indexOf(" "));
			var selProvince = member.mlocation.substring(member.mlocation.indexOf(" ")+1);			
			$("#modifyForm #mlocation").val(member.mlocation);
			$("#modifyForm #mrank").val(member.mrank);
			$("#modifyForm #mpoint").val(member.mpoint);
			$("#modifyForm #mresid").val(member.mresid);
			setCity(selCity);
			setProvince(selCity, selProvince);
			$("#memberModifyModal").modal("show");
		}
		
		/* Modify Button */
		function onClickBtnModify() {
			var mid = $("#modifyForm #mid").val();
			var mname = $("#modifyForm #mname").val();
			var mpassword = $("#modifyForm #mpassword").val();
			var mphone = $("#modifyForm #mphone").val();
			var mbirth = $("#modifyForm #mbirth").val();
			var mlocation = $("#modifyForm #mlocation").val();
			var mrank = $("#modifyForm #mrank").val();
			var mpoint = $("#modifyForm #mpoint").val();
			var mresid = $("#modifyForm #mresid").val();
			
			$.ajax({
				url: "modify",
				data: {"mid":mid, "mname":mname, "mpassword":mpassword, "mphone":mphone, "mbirth":mbirth, "mlocation":mlocation, "mrank":mrank, "mpoint":mpoint, "mresid":mresid},
				method:"post",
				success: function(data) {
					if(data.result == "success") {
						$("#successMessage").html("수정 성공");
						$("#messageIcon").attr('class', "fa fa-check-circle");
						$("#messageModal").modal("show");
						$("#messageModal").on('hidden.bs.modal', function() {
							$("#memberModifyModal").modal("hide"); 
							location.reload();
						});
					} else if(data.result == "noRestaurant") {
						$("#failMessage").html("No Restaurant");
						$("#messageModal").modal("show");
					} else if(data.result == "wrongData") {
						$("#failMessage").html("잘못된 입력입니다");
						$("#messageModal").modal("show");
					}
				}
			});
		}
		
		/* Modify Cancel Button */
		function onClickBtnModifyCancel() {
			$("#memberModifyModal").modal("hide");
		}
		
		/* ################## Delete Modal################## */
		/* Show Delete Modal */
		function showDeleteModal(mid) {
			$("#deleteForm #deletemid").val(mid);
			$("#memberDeleteModal").modal("show");
		}
		
		/* Delete Button */
		function onClickBtnDelete() {
			var deletemid = $("#deletemid").val();
			var inputmid = $("#inputmid").val();
			
			$.ajax({
				url: "delete",
				data: {"deletemid":deletemid, "inputmid":inputmid},
				method: "post",
				success: function(data) {
					if ( data.result == "success" ) {
						$("#successMessage").html("삭제 성공");
						$("#messageIcon").attr('class', "fa fa-check-circle");
						$("#messageModal").modal("show");
						$("#messageModal").on('hidden.bs.modal', function() {
							$("#memberDeleteModal").modal("hide");
						}); 
					} else {
						$("#failMessage").html("잘못된 입력입니다");
						$("#messageModal").modal("show");
					}
				}
			});
		}
		
		/* Delete Cancel Button */
		function onClickBtnDeleteCancel() {
			$("#memberDeleteModal").modal("hide");
		}
		
		/* ################## Message(OK, Error) Modal################## */
		/* Message OK Button */
		function onClickBtnOK() {
			$("#messageModal").modal("hide");
		}
	</script>	
</head>

<body>
	<div class="about-section"> 
	   <div class="container" align="center"><h2>Member List</h2> <br/>
	   		
	   		<!-- 회원 정보 목록 -->
			<table id="acrylic">
				<thead>
					<tr>
						<th> 아이디 </th>
						<th> 이름 </th>
						<th> 비밀번호 </th>
						<th> 휴대폰 번호 </th>
						<th> 생일 </th>
						<th> 관심지역 </th>
						<th> 회원등급 </th>
						<th> Point </th>
						<th> Res No </th>
						<th> &nbsp; </th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="member" items="${list}">
						<tr>
							<td> ${member.mid} </td>
							<td> ${member.mname} </td>
							<td> ${member.mpassword} </td>
							<td> ${member.mphone} </td>
							<td> ${member.mbirth} </td>
							<td> ${member.mlocation} </td>
							<td> 
								<c:if test="${member.mrank==0}"> 일반 </c:if>
								<c:if test="${member.mrank==1}"> 점장 </c:if>
								<c:if test="${member.mrank==2}"> <b>관리자</b> </c:if>
								<c:if test="${member.mrank==-1}"> <span style="color: red">경고1회 </span></c:if>
								<c:if test="${member.mrank==-2}"> <span style="color: red">경고2회 </span></c:if>
								<c:if test="${member.mrank==-3}"> <b style="color: red">블랙리스트</b> </c:if>
								
							</td>
							<td> ${member.mpoint} </td>
							<td> ${member.mresid} </td>
							<td>
								<input onclick="showModifyModal({
													mid:'${member.mid}',
													mname:'${member.mname}',
													mpassword:'${member.mpassword}',
													mphone:'${member.mphone}',
													mbirth:'${member.mbirth}',
													mlocation:'${member.mlocation}',
													mrank:${member.mrank},
													mpoint:${member.mpoint},
													mresid:${member.mresid}
												})" type="button" value="수정"/> &nbsp;
								<button type="button" onclick="showDeleteModal('${member.mid}')">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<!-- 페이지 이동 -->
			<div style="width: 600px; margin: 15px;">
				<c:if test="${pageNo!=1}">
					<a href="memberboard?pageNo=1&find=${find}">[처음]</a>
				</c:if>
				
				<c:if test="${groupNo>1}">
					<a href="memberboard?pageNo=${startPageNo-1}&find=${find}">[이전]</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
					<a href="memberboard?pageNo=${i}&find=${find}"
						<c:if test="${pageNo==i}">style="color:red" </c:if>
					>${i}</a>
				</c:forEach>
				
				<c:if test="${groupNo<totalGroupNo}">
					<a href="memberboard?pageNo=${endPageNo+1}&find=${find}">[다음]</a>
				</c:if>
				
				<c:if test="${pageNo!=totalPageNo}">
					<a href="memberboard?pageNo=${totalPageNo}&find=${find}">[맨끝]</a>
				</c:if>
			</div>
	 		
	 		<!-- 아이디, 이름으로 검색 -->
			<form action="${pageContext.servletContext.contextPath}/member/memberboard">
				<input type="hidden" name="pageNo" value="1"/>
				<i class="fa fa-search" aria-hidden="true" style="font-size: 20px"></i> &nbsp;
				<input type="text" placeholder="아이디 or 이름 입력" name="find" value="${find}"/>			
				<input type="submit" value="검색"/>
			</form>
			
		</div> <!-- container-end -->
	</div>
	
	<!-- ########################## 수정 Modal ########################## -->
	
	<div id="memberModifyModal" class="modal fade" tabindex="-1" role="dialog" style="margin: auto">
		<div class="modal-dialog" role="document" style="width:450px;">
	    	<div class="modal-content" style="width:450px; margin: 0">
	    	
	    		<!-- modal-header -->
	     		<div class="modal-header" style="background-color: #34495e; color:white">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">회원 정보 수정</h4>
	      		</div>
	      		
	      		<!-- modal-body -->
	      		<div class="modal-body">
					<form id="modifyForm">
					
						<input type="hidden" name="mid" value="${member.mid}"/>				
							
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px; padding:0px; background-color: #34495e; color:white" class="input-group-addon"><b>아이디</b></span>
								<b><input style="width: 200px" type="text" class="form-control" name="mid" id="mid" readonly/></b>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>이름</b></span>
								<input style="width: 200px" type="text" class="form-control" name="mname" id="mname"/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>비밀번호</b></span>
								<input style="width: 200px" type="password" class="form-control" name="mpassword" id="mpassword" placeholder="8~20글자 입력하세요"/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>휴대전화</b></span>
								<input style="width: 200px" type="text" class="form-control" name="mphone" id="mphone"/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>생일</b></span>
								<input style="width: 200px" type="date" class="form-control" name="mbirth" id="mbirth"/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>관심지역</b></span>
								<select class="form-control" style="width: auto" id="selCity" name="selCity"></select>
								<select class="form-control" style="width: auto" id="selProvince" name="selProvince"></select><br/>
								<input type="hidden" class="form-control" name="mlocation" id="mlocation" value="${member.mlocation}"/>		
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>회원 등급</b></span>
								<input style="width: 200px" type="number" class="form-control" name="mrank" id="mrank"/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>적립 포인트</b></span>
								<input style="width: 200px" type="number" class="form-control" name="mpoint" id="mpoint"/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>보유 레스토랑id</b></span>
								<input style="width: 200px" type="number" class="form-control" name="mresid" id="mresid"/>
							</div>
						</div>
						
					</form>		
	      		</div>
	      	
		      	<!-- modal-footer -->	
				<div class="modal-footer" style="background-color: #34495e; color:white">
			        <button id="btnModify" type="button" class="btn btn-default" onclick="onClickBtnModify()" style="color: #34495e"><b>수정하기</b></button>
			        <button id="btnModifyCancel" type="button" class="btn btn-default" onclick="onClickBtnModifyCancel()" style="color: #34495e"><b>취소</b></button>
				</div>
				
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<!-- ########################## 수정 Modal ########################## -->
	
	<!-- ########################## 삭제 Modal ########################## -->
	
	<div id="memberDeleteModal" class="modal fade" tabindex="-1" role="dialog" style="position: fixed">
		<div class="modal-dialog" role="document" style="width: 450px;">
	    	<div class="modal-content" style="width:450px; margin: 0">
	    	
	    		<!-- modal-header -->
	     		<div class="modal-header" style="background-color: #34495e; color:white">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">회원 삭제</h4>
	      		</div>
	      		
	      		<!-- modal-body -->
	      		<div class="modal-body">
					<form id="deleteForm">
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px; padding:0px; background-color: #34495e; color:white" class="input-group-addon"><b>아이디</b></span>
								<b><input type="text" class="form-control" name="deletemid" id="deletemid" readonly/></b>
							</div>
						</div>
						
						<b style="color: #34495e"> 삭제할 아이디를 한 번 더 입력해 주세요</b><br/><br/>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>아이디 입력</b></span>
								<input type="text" class="form-control" name="inputmid" id="inputmid" onkeydown="if(event.keyCode==13){javascript:onClickBtnDelete();}"/>
							</div>
						</div>
						
					</form>		
	      		</div>
	      	
		      	<!-- modal-footer -->	
				<div class="modal-footer" style="background-color: #34495e; color:white">
			        <button id="btnDelete" type="button" class="btn btn-default" onclick="onClickBtnDelete()" style="color: #34495e"><b>삭제</b></button>
			        <button id="btnDeleteCancel" type="button" class="btn btn-default" onclick="onClickBtnDeleteCancel()" style="color: #34495e"><b>취소</b></button>
				</div>
				
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<!-- ########################## 삭제 Modal ########################## -->
	
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