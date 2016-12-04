<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
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
		</style>
		
		<script type="text/javascript">
		
			$(document).ready(function() {
				$("#addCouponModal").on('shown.bs.modal', function() {
					$("#cname").focus();
				});
				
				$("#sendInfoModal").on('shown.bs.modal', function() {
					$("#cbmid").focus();
				});
			});
			
			function onClickBtnAdd() {
				$("#addCouponModal").modal("show");
			}
			
			function onClickBtnCreate(){								
				var cname = $("#addForm #cname").val();				
				var cdday = $("#addForm #cdday").val();
				var cinfo = $("#addForm #cinfo").val(); 
				var cdiscount = $("#addForm #cdiscount").val();
				
				$.ajax({
					url: "../coupon/add",
					data: {"cname":cname, "cdday":cdday, "cinfo":cinfo, "cdiscount":cdiscount},
					method:"post",
					success: function(data) {
						if(data.result == "success") {							
							$("#addCouponModal").modal("hide"); 
							location.reload();
						}
					}
				});
			}
			
			function onClickBtnCancel(){				
				$("#addCouponModal").modal("hide");
			}
			
			function sendInfo(cnumber) {
				$.ajax({
					url:"../coupon/info",
					data:{"cnumber":cnumber},
					success: function(data) {
						$("#sendInfoModal").modal("show");						
						$("#infoForm #cnumber").val(data.cnumber);
						$("#infoForm #cname").val(data.cname);
						$("#infoForm #cdday").val(data.cdday);
						$("#infoForm #cinfo").val(data.cinfo);
						$("#infoForm #cdiscount").val(data.cdiscount);
					}
				})	
			}
			
			function onClickBtnSend() {
				var cbmid = $("#infoForm #cbmid").val();
				var cbnumber = $("#infoForm #cnumber").val();
								
				$.ajax({
					url: "../coupon/send",
					data: {"cbmid":cbmid, "cbnumber":cbnumber},
					method:"post",
					success: function(data) {
						if(data.result == "success") {							
							$("#sendInfoModal").modal("hide"); 
							location.reload();
						}
					}
				});
			}
			
			function onClickBtnDelete() {				
				var cnumber = $("#infoForm #cnumber").val();
								
				$.ajax({
					url: "../coupon/delete",
					data: {"cnumber":cnumber},
					method:"post",
					success: function(data) {
						if(data.result == "success") {							
							$("#sendInfoModal").modal("hide"); 
							location.reload();
						} 
					}
				});
			}
			
			function onClickBtnClose() {
				$("#sendInfoModal").modal("hide"); 
			}
		</script>
	
	</head>
	
	<body>

	   <div class="container" align="center"><!-- <h2>Coupon</h2> <br/> -->
	   		<div style="text-align: right;">
				<button id="btnAdd" type="button" class="btn btn-warning" onclick="onClickBtnAdd()" style="color: #34495e; margin-right:190px; margin-top:10px;">쿠폰 생성</button>
			</div>
			<table id="acrylic">
				<thead>
					<tr>
						<th> 쿠폰번호 </th>
						<th> 쿠폰이름 </th>
						<th> 유효기간 </th>
						<th> 쿠폰정보 </th>
						<th> 할인금액 </th>						
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="coupon" items="${coupon}">
						<tr>
							<td><a href="javascript:sendInfo(${coupon.cnumber})">${coupon.cnumber}</a></td>								
							<td>${coupon.cname}</td>
							<td>${coupon.cdday}</td>
							<td>${coupon.cinfo}</td>
							<td>${coupon.cdiscount}</td>	
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br/>
			
			<div style="width: 600px">
				<c:if test="${pageNo!=1}">
					<a href="resCouponList?pageNo=1">[처음]</a>
				</c:if>
				
				<c:if test="${groupNo>1}">
					<a href="resCouponList?pageNo=${startPageNo-1}">[이전]</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
					<a href="resCouponList?pageNo=${i}"
						<c:if test="${pageNo==i}">style="color:red" </c:if>
					>${i}</a>
				</c:forEach>
				
				<c:if test="${groupNo<totalGroupNo}">
					<a href="resCouponList?pageNo=${endPageNo+1}">[다음]</a>
				</c:if>
				
				<c:if test="${pageNo!=totalPageNo}">
					<a href="resCouponList?pageNo=${totalPageNo}">[맨끝]</a>
				</c:if>
			</div>
		</div>

		
		
		<!-- 쿠폰 추가 모달 -->		
		<div id="addCouponModal" class="modal fade" tabindex="-1" role="dialog" style="margin: auto">
			<div class="modal-dialog" role="document" style="width:350px;">
		    	<div class="modal-content" style="width:350px; margin: 0">
		    	
		    		<!-- modal-header -->
		     		<div class="modal-header" style="background-color: #34495e; color:white">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">쿠폰 생성</h4>
		      		</div>
		      		
		      		<!-- modal-body -->
		      		<div class="modal-body">
						<form id="addForm">
							
							<div class="form-group">
								<div class="input-group">
									<span style="width: 130px" class="input-group-addon"><b>쿠폰이름</b></span>
									<input type="text" class="form-control" id="cname" name="cname" />
								</div>
							</div>
							
							<div class="form-group">
								<div class="input-group">
									<span style="width: 130px" class="input-group-addon"><b>유효기간</b></span>
									<input type="date" class="form-control" id="cdday" name="cdday" style="width: 183px" />
								</div>
							</div>
							
							<div class="form-group">
								<div class="input-group">
									<span style="width: 130px" class="input-group-addon"><b>쿠폰정보</b></span>
									<input type="text" class="form-control" id="cinfo" name="cinfo" />
								</div>
							</div>
							
							<div class="form-group">
								<div class="input-group">
									<span style="width: 130px" class="input-group-addon"><b>할인금액</b></span>
									<input type="text" class="form-control" id="cdiscount" name="cdiscount"/>
								</div>
							</div>							
						</form>		
		      		</div>
		      	
			      	<!-- modal-footer -->	
					<div class="modal-footer" style="background-color: #34495e; color:white">
				        <button id="btnCreate" type="button" class="btn btn-default" onclick="onClickBtnCreate()" style="color: #34495e"><b>추가</b></button>
				        <button id="btnCancel" type="button" class="btn btn-default" onclick="onClickBtnCancel()" style="color: #34495e"><b>취소</b></button>
				    </div>
					
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		
		<!-- 쿠폰 상세보기 모달 -->		
		<div id="sendInfoModal" class="modal fade" tabindex="-1" role="dialog" style="margin: auto">
			<div class="modal-dialog" role="document" style="width:350px;">
		    	<div class="modal-content" style="width:350px; margin: 0">
		    	
		    		<!-- modal-header -->
		     		<div class="modal-header" style="background-color: #34495e; color:white">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">쿠폰 정보</h4>
		      		</div>
		      		
		      		<!-- modal-body -->
		      		<div class="modal-body">
						<form id="infoForm">
								
							<div class="form-group">
								<div class="input-group">
									<span style="width: 130px" class="input-group-addon" ><b>쿠폰번호</b></span>
									<input type="text" class="form-control" name="cnumber" id="cnumber" readonly/>
								</div>
							</div>
							
							<div class="form-group">
								<div class="input-group">
									<span style="width: 130px" class="input-group-addon"><b>쿠폰이름</b></span>
									<input type="text" class="form-control" name="cname" id="cname" readonly/>
								</div>
							</div>
							
							<div class="form-group">
								<div class="input-group">
									<span style="width: 130px" class="input-group-addon"><b>유효기간</b></span>
									<input type="date" class="form-control" name="cdday" id="cdday" style="width: 183px;" readonly/>
								</div>
							</div>
							
							<div class="form-group">
								<div class="input-group">
									<span style="width: 130px" class="input-group-addon"><b>쿠폰정보</b></span>
									<input type="text" class="form-control" name="cinfo" id="cinfo" readonly/>
								</div>
							</div>
							
							<div class="form-group">
								<div class="input-group">
									<span style="width: 130px" class="input-group-addon"><b>할인금액</b></span>
									<input type="text" class="form-control" name="cdiscount" id="cdiscount" readonly/>
								</div>
							</div>
							
							<div class="form-group">
								<div class="input-group">
									<span style="width: 130px" class="input-group-addon"><b>받는사람</b></span>
									<input type="text" class="form-control" name="cbmid" id="cbmid" />
								</div>
							</div>
							
						</form>		
		      		</div>
		      	
			      	<!-- modal-footer -->	
					<div class="modal-footer" style="background-color: #34495e; color:white">
				        <button id="btnSend" type="button" class="btn btn-default" onclick="onClickBtnSend()" style="color: #34495e"><b>전송</b></button>
				        <button id="btnDelete" type="button" class="btn btn-default" onclick="onClickBtnDelete()" style="color: #34495e"><b>삭제</b></button>
				        <button id="btnClose" type="button" class="btn btn-default" onclick="onClickBtnClose()" style="color: #34495e"><b>닫기</b></button>
					</div>
					
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	 
	
	</body>
</html>