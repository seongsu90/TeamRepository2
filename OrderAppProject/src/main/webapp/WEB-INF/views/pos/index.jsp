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
 					
		/* 	.center {
			    margin-top:50px;   
			} */
	
			body { 
				padding-top:20px; 
			}
			
			.panel-body .btn:not(.btn-block) { 
				width:100px;
				margin-bottom:20px; 
				
			}
						
		</style>
		<script type="text/javascript">
			function onClickBtnTable(tableNo) {
				var presid = $("#orderModal #presid").val();
				var tableno = $("#orderModal #ptableno").val();
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
		
			function onClickBtnOrder() {
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
						}
					}
				});
			}
		</script>
	</head>
	
	<body>		
		<div class="container" align="center"><h2>POS System</h2> <br/>
			<div class="row">
				<div class="col-md-8">
				<div class="panel panel-primary">
		                <!-- <div class="panel-heading">
		                    <h3 class="panel-title">
		                        <span class="glyphicon glyphicon-bookmark"></span> POS System 
		                    </h3>
		                </div> -->
		                
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
			</div>
		</div>
		
		<!-- modal start-->
		<div id="orderModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">		
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">주문 입력</h4>
					</div>  
					<div class="modal-body">
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
					</div>
					          
					<div class="modal-footer">  
						<button type="button" class="btn btn-default" data-dismiss="modal"  role="button">결제</button>
						<button onclick="onClickBtnOrder()" type="button" class="btn btn-default" role="button">주문</button>  
					</div>
				</div>
			</div>	                    	                    
		</div>	 
		<!-- modal end -->
		
		
	
	</body>
</html>
