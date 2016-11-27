<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>		
	<head>	
		<meta name="viewport" content="width=device-width, initial-scale=1">
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
 	
			body { 
				padding-top:20px; 
			}
			
			.panel-body .btn:not(.btn-block) { 
				width:100px;
				margin-bottom:20px; 
				
			}
			
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
	        
			.form-group{
				margin-bottom: 15px;
			}	
			
			.input-group-addon {
				color: #34495e;
			}
			
			.custab{
				border: 1px solid #ccc;
				padding: 5px;
				margin: 5% auto; 
				/*transition: 0.5s;	 */			
			}

			
					
		</style> 
		
		<script type="text/javascript">
		
			function onClickBtnConfirm() {											// 예약 확인 클릭
				console.log("onClickBtnConfirm");
				
				/* var rvmid = $("").val();
				var rvresid = $("").val();
				$.ajax({
					url: "../reservation/delete",
					data: "&rvmid=" + rvmid + "&rvresid=" + rvresid,
					method: "post",
					success: function(data) {
						if(data.result == "success") {
							location.reload();
						}
					}
				}); */
			}
			
			function onClickBtnPenalty() {											// 예약 페널티
				console.log("onClickBtnPenalty");
				/* var rvmid = $("").val();
				$.ajax({
					url: "../pos/index",
					data: "&rvmid=" + rvmid,
					method: "post",
					success: function(data) {
						if(data.result == "success") {
							location.reload();
						}
					}
				}); */
			}
		
			function onClickBtnTable(tableNo) {									// 테이블 번호 클릭
				var presid = $("#orderModal #presid").val();
				var tableno = $("#orderModal #ptableno").val();
				/* var price = $("#orderModal #price").val();
				var totalPrice = $("#orderModal #totalPrice").val();
				var coupon = $("#orderModal #coupon").val();
				var eventPrice = $("#orderModal #eventPrice").val();
				var point = $("orderModal #point").val(); */
				/* $.ajax({
					url: "../pos/info",
					data: {"presid":presid, "ptableno":tableno},
					method: "post",
					success: function(data) {
						$("#orderModal").modal("show");
						$("#orderModal #ptableno").val(tableNo);
					}		
				}); */
				$("#orderModal").modal("show");
				$("#orderModal #ptableno").val(tableNo);
			}
		
			function onClickBtnOrder() {											// 주문 클릭
				var orderMenu = "";
				var arrTr = $(".menu");				
				for(var i=0; i<arrTr.length; i++) {
					var tr = arrTr[i];
					if($("#tempcount", tr).val() != 0) {
						if(i!=0) orderMenu += "&"; 
						orderMenu += "tempmenu=" + $("#tempmenu", tr).val();
						orderMenu += "&tempcount=" + $("#tempcount", tr).val();
					}
				}
				
				var presid = $("#orderModal #presid").val();
				var tableno = $("#orderModal #ptableno").val();
				
				$.ajax({
					url: "../pos/add",
					data: orderMenu + "&ptableno=" + tableno + "&presid=" + presid,
					method: "post",
					success: function(data) {
						if(data.result == "success") {
							$("#orderModal").modal("hide");
							location.reload();
						}
					}
				});
			}
			
			function onClickBtnPay() {											// 결재 클릭
				var presid = $("#orderModal #presid").val();
				var tableno = $("#orderModal #ptableno").val();
				
				$.ajax({
					url: "../pos/delete",
					data: "&presid=" + presid + "&ptableno=" + tableno,
					method: "post",
					success: function(data) {
						if(data.result == "success") {
							$("#orderModal").modal("hide");
							location.reload();
						}
					}
				});
			}
			
		</script>
	</head>
	 
	<body>		
		<div class="container" align="center"><br/>
			<div class="row">
				<div class="col-md-8">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								<span class="glyphicon glyphicon-bookmark"></span> POS System 
							</h3>
						</div> 
		                
						<div class="panel-body">
							<div class="row">							
								<c:forEach var="i" begin="1" end="${totalTable}">
									<div class="col-md-3">
										<button onclick="onClickBtnTable(${i})" style="width:150px; height:150px;">${i} 번 테이블
											<c:forEach  var="posList" items="${posList}">
												<c:if test="${posList.ptableno == i}">	<br/>${posList.pmlname}&nbsp;&nbsp;${posList.pcount}<br/></c:if>
											</c:forEach>									
										</button>
									</div>
								</c:forEach> 
							</div>	               	
						</div>
		            <!-- panel body end -->
					</div>
				</div>
				
				<div class="col-md-4">					<!-- 예약자 확인 -->
					<table id="acrylic" style="width:400px;">
						<tr>
							<th> 예약시간 </th>
							<th> 인원수 </th>
							<th> 예약자 </th>
							<th> 확인 </th>									
						</tr>
						<c:forEach  var="reservList" items="${reservList}">
							<tr>
								<td>${reservList.rvtime}</td>
								<td>${reservList.rvperson}</td>
								<td>${reservList.rvmid}</td>
								<td>
									<%-- <form method="post" action="/teamapp/reservation/delete">
										<input type="hidden" name="rvmid" value="${reservList.rvmid}"/>
										<input type="hidden" name="rvresid" value="${reservList.rvresid}"/>
										<input type="submit" value="확인"/>													
									</form>							
									<a href="index?rvmid=${reservList.rvmid}"><input type="submit" value="페널티"/></a> --%>
									<button onclick="onClickBtnConfirm()" type="button" role="button">확인</button>
									<button onclick="onClickBtnPenalty()" type="button" role="button">페널티</button>  
								</td>							
							</tr>
						</c:forEach>
					</table>
				</div>
				
			</div>
		</div>
		
		
		
		<!-- modal start-->
		<div id="orderModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: 1000px;">
				<div class="modal-content">	
				
					<!-- modal-header-->	
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">주문 입력</h4>
					</div>
					<!-- modal-body-->
					<div class="modal-body" >
						<div class="row" >
							<div class="col-md-6">						
								<table id="acrylic">
									<thead>
										<tr>
											<th> 메뉴 </th>
											<th> 수량 </th>
											<th> 가격 </th>									
										</tr>
									</thead>
									<tbody>
										<c:forEach var="menuList" items="${menuList}">
											<tr class="menu">
												<td>
													<input id="presid" type="hidden" name=presid value="${presid}"/> 							
													<input id="ptableno" type="hidden" name=ptableno value="${ptableno}"/>
													<input id="tempmenu" type="text" style="border: 0;" name=tempmenu value="${menuList.mlname}" readonly/>							
												</td>
												<td>
													<input id="tempcount" type="number" style="border: 0;" min="0" max="99" name=tempcount value="0"/> 							
												</td>
												<td>
													<input id="price" type="text" style="border: 0;" name=price value="${price}" readonly/> 							
												</td>				
											</tr>
										</c:forEach>								
									</tbody>
								</table>	
							</div>
							<div class="col-md-6">
								<table class="table table-striped custab" style="margin-top: 18em;" id="acrylic">
									<tr>
										<th style="width:100px; background-image: linear-gradient(#3C5064, #34495e); color:white;"> 합계 </th>
										<th> ${totalPrice} </th>		
									</tr>
									<tr>
										<th style="width:100px; background-image: linear-gradient(#3C5064, #34495e); color:white;"> 쿠폰 </th>
										<th> ${coupon} </th>			
									</tr>
									<tr>
										<th style="width:100px; background-image: linear-gradient(#3C5064, #34495e); color:white;"> 이벤트 </th>			
										<th> ${eventPrice} </th>
									</tr>
									<tr>
										<th style="width:100px; background-image: linear-gradient(#3C5064, #34495e); color:white;"> 포인트 </th>			
										<th> ${point} </th>
									</tr>
									<tr>
										<th style="width:100px; background-image: linear-gradient(#3C5064, #34495e); color:white;"> 결제 금액 </th>		
										<th> ${result} </th>	
									</tr>
								</table>
							</div>
						</div>
					</div>		
	      			<!-- modal-footer-->
		      		<div class="modal-footer">
						<button onclick="onClickBtnPay()" type="button" style="width: 150px; height: 100px;" class="btn btn-danger" data-dismiss="modal"  role="button">결제</button>
						<button onclick="onClickBtnOrder()" type="button" style="width: 150px; height: 100px;" class="btn btn-primary" role="button">주문</button>  
					</div>
				</div>
			</div>	                    	                    
		</div>	 
		<!-- modal end -->
	</body>
</html>	      		
	      		
	      		
	      		 
					<%-- <div class="modal-body">
						<div class="row">
							<div class="col-md-6">
								<div class="well" style="height: 300px">
									<div class="form-group">
										<table>
											<tr>
												<td style="width:100%;" align="center"><b>주문내역</b></td>															
											</tr>			
             	
											<!-- 주문내역 출력 -->		                                  	
                          																																															
										</table>				                                  
									</div>					                             
								</div>
							</div>
							<div class="col-md-6">
								<form method="post" action="/teamapp/pos/add">	
									<table>
										<tr>
											<td style="width:200px; border: 1" align="center">메뉴</td>			<!-- 매장 메뉴 -->
											<td style="width:100%; border: 1" align="center">수량</td>
										</tr>
										<c:forEach var="menuList" items="${menuList}">
											<tr class="menu">
												<td>
													<input id="presid" type="hidden" name=presid value="${presid}"/> 							
													<input id="ptableno" type="hidden" name=ptableno value="${ptableno}"/>
													<input id="tempmenu" type="text" style="border:1;" name=tempmenu value="${menuList.mlname}" readonly/>							
												</td>
												<td>
													<input id="tempcount" style="width:100%; border:1;" type="number" min="0" max="99" name=tempcount value="0"/> 							
												</td>				
											</tr>					
										</c:forEach>				
									</table>
								</form> 
							</div>
						</div>
					</div> --%>
					          

