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
	            font-size: 14px;
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
			
			.hide-bullets {
			    list-style:none;
			    margin-left: -40px;
			    margin-top:20px;
			}
			
			.thumbnail {
			    padding: 0;
			}
			
			.carousel-inner>.item>img, .carousel-inner>.item>a>img {
			    width: 100%;
			}

		</style> 
		
		<script type="text/javascript">
		
			$(document).ready(function() {
				$("#orderModal").on('hide.bs.modal', function() {					
					var result = $("#result").html();
					var tableNo = $("#ptableno").val();
					
					if(result != 0) {
						$("#carousel-selector-"+ tableNo +" #tableImg").attr('src', "http://placehold.it/250/34495e/ffffff?text=" + tableNo);
					} else {
						$("#carousel-selector-"+ tableNo +" #tableImg").attr('src', "http://placehold.it/250/ffffff/34495e?text=" + tableNo);
					}					
				}); 
				
				$("#orderModal").on('shown.bs.modal', function() {
					$(".mcount").change(function () {
						var arrTr = $(".menu");
						var totalPrice = 0;						
						for(var i=0; i<arrTr.length; i++) {
							var tr = arrTr[i];
							if($(".mcount", tr).val() != 0) {								
								totalPrice +=	$(".mprice", tr).val() * $(".mcount", tr).val();								
							}
						}
						$("#totalPrice").html(totalPrice);						
						$("#result").html(totalPrice);						
				    });	
				});
			
				init();				
			});
			
			function init() {				
				var presid = $("#orderModal #presid").val();
				var totalTables = $("#totalTables").val(); 
				
				for ( var i=1; i<=totalTables; i++) {
					var ptableno = $("#carousel-selector-"+ i + " #tbNo").val();
					
					$.ajax({
						url: "../pos/info",
						data: {"presid":presid, "ptableno":ptableno},
						method: "post",
						success: function(data) {
							
							if(data.result != 0) {								
								$("#carousel-selector-"+ data.ptableno +" #tableImg").attr('src', "http://placehold.it/250/34495e/ffffff?text=" + data.ptableno);
							} else {
								$("#carousel-selector-"+ data.ptableno +" #tableImg").attr('src', "http://placehold.it/250/ffffff/34495e?text=" + data.ptableno);
							}
						}
					}); 
				} 
			}
		
		
			function onClickBtnConfirm(reservation) {		// 예약 확인 클릭
				console.log("onClickBtnConfirm");			
				var rvmid = reservation.rvmid;
				var rvresid = reservation.rvresid;		
				
				$.ajax({
					url: "../reservation/delete",
					data: {"rvmid":rvmid, "rvresid":rvresid},
					method: "post",
					success: function(data) {
						/* if(data.result == "success") { */							
							location.reload();
						/* } */
					}
				}); 
			}
			
			function onClickBtnPenalty(reservation) {		// 예약 취소
				console.log("onClickBtnPenalty");
				var rvmid = reservation.rvmid;		
				
				$.ajax({
					url: "../pos/index",
					data: {"rvmid":rvmid},
					method: "post",
					success: function(data) {													
						/* if(data.result == "success") { */							
						location.reload();
						/* } */						
					}
				}); 
			}
		
			function onClickBtnTable(tableNo) {		// 테이블 번호 클릭				
				var presid = $("#orderModal #presid").val();

				$.ajax({
					url: "../pos/info",
					data: {"presid":presid, "ptableno":tableNo},
					method: "post",
					success: function(data) {
						$("#orderModal").modal("show");
						for(var i=0; i<data.menu.length; i++) {
							var menu = data.menu[i];
							if(i==0) {
								$("#menuTbody").empty();			// 메뉴리스트 중복 출력 제거
							}
							$("#menuTbody").append(
								'<tr class="menu">' +
									'<td>' +
										'<input class="mname" type="text" style="border: 0;" name="menuName" value="' + menu.mname + '" readonly/>' +							
									'</td>' +
									'<td>' +
										'<input class="mcount" type="number" style="border: 0;" min="0" max="99" name="mcount" value="' + (menu.mcount.trim())  + '"/>' + 							
									'</td>' +
									'<td>' +
										'<input class="mprice" type="text" style="border: 0;" name="mprice" value="' + menu.mprice + '" readonly/>' +							
									'</td>' +			
								'</tr>'
							);
						}
						$("#ptableno").val(tableNo);
						$("#myModalLabel").html(tableNo + " 번 테이블");
						$("#totalPrice").html(data.totalPrice);
						$("#coupon").html(data.coupon);
						$("#eventPrice").html(data.eventPrice);
						$("#point").html(data.point);
						$("#result").html(data.result);
					}		
				});
			}
		
			function onClickBtnOrder() {			// 주문 클릭
				var orderMenu = "";
				var arrTr = $(".menu");				
				for(var i=0; i<arrTr.length; i++) {
					var tr = arrTr[i];
					if($(".mcount", tr).val() != 0) {
						if(i != 0) orderMenu += "&"; 
						orderMenu += "tempmenu=" + $(".mname", tr).val();
						orderMenu += "&tempcount=" + $(".mcount", tr).val();
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
			
			function onClickBtnPay() {		// 결재 클릭
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
		
/* 		
			jQuery(document).ready(function($) {			
		        $('#myCarousel').carousel({
		                interval: 10000
		        });
		 		
		        var id_selector = 0;		        
		        $('[id^=carousel-selector-]').click(function () {
			        id_selector = $(this).attr("id");
			        try {
			            var id = /-(\d+)$/.exec(id_selector)[1];
			     
			            jQuery('#myCarousel').carousel(parseInt(id)-1);
			        } catch (e) {
			            console.log('Regex failed!', e);
			        }
				});
		        
		        $('#myCarousel').on('slid.bs.carousel', function (e) {
					var id = $('.item.active').data('slide-number');					
					$('#carousel-text').html($('#slide-content-'+id).html());
		        });
			}); */
			
			
			
		</script>
	</head>
	 
	<body>
		 
		 <div class="container" style="width: 75%;">
		    <div id="main_area">
		        <div class="row">
		            <div class="col-sm-5" id="slider-thumbs">
		                	<input type="hidden" id="totalTables" value="${totalTables}"/>
		                <ul class="hide-bullets">
		                    <c:forEach var="i" begin="1" end="${totalTables}">		                    	
			                    <li class="col-sm-3">		                     	   <a class="thumbnail" id="carousel-selector-${i}" data-toggle="modal" data-target="#orderModal" onclick="onClickBtnTable(${i})"><input type="hidden" id="tbNo" value="${i}"/>
		                     	   
		                     	   <img id="tableImg" src="http://placehold.it/250/ffffff/34495e?text=${i}"></a>			                        
			                    </li>
							</c:forEach>
		                </ul>
		            </div>
		            
		           <%--  <div class="col-sm-6">
		                <div class="col-xs-12" id="slider">		                    
		                    <div class="row">
		                        <div class="col-sm-12" id="carousel-bounding-box">
		                            <div class="carousel slide" id="myCarousel">	                          
		                                <div class="carousel-inner">		                                
		                                	<c:forEach var="i" begin="1" end="${totalTables}">
		                                		<c:if test="${i == 1}">
		                                    		<div class="item active" data-slide-number="${i}">
		                                    			<a class="trigger" data-toggle="modal" data-target="#orderModal" onclick="onClickBtnTable(${i})"><img src="http://placehold.it/470x480&text=${i}"></a>
		                                    		</div>
												</c:if>
												<c:if test="${i != 1}"> 
		                                    		<div class="item" data-slide-number="${i}">
		                                    			<a class="trigger" data-toggle="modal" data-target="#orderModal" onclick="onClickBtnTable(${i})"><img src="http://placehold.it/470x480&text=${i}"></a>
		                                    		</div>
												</c:if>													
											</c:forEach>			
		                                </div>
		                                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		                                    <span class="glyphicon glyphicon-chevron-left"></span>
		                                </a>
		                                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		                                    <span class="glyphicon glyphicon-chevron-right"></span>
		                                </a>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div> --%>
		            
		           <div class="col-md-6">					<!-- 예약자 확인 -->
						<table id="acrylic" style="width: 450px;">
							<thead>
								<tr>
									<th> 예약시간 </th>
									<th> 인원수 </th>
									<th> 예약자 </th>	
									<th></th>															
								</tr>
							</thead>
							<tbody>
								<c:forEach  var="reservarion" items="${reservList}">														
									<tr>
										<td>${reservarion.rvtime}</td>
										<td>${reservarion.rvperson}</td>
										<td>${reservarion.rvmname}(${reservarion.rvmid})</td>
										<td><input onclick="onClickBtnConfirm({rvmid:'${reservarion.rvmid}', rvresid:${reservarion.rvresid}})" type="button" value="확인"/>
												<input onclick="onClickBtnPenalty({rvmid:'${reservarion.rvmid}',})" type="button" value="취소"/></td>
									</tr>		
								</c:forEach>
							</tbody>
						</table>							
					</div>          
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
						<h2 class="modal-title" id="myModalLabel"></h2>
					</div>
					<!-- modal-body-->
					<div class="modal-body" >
						<input id="presid" type="hidden" name="presid" value="${presid}"/> 							
						<input id="ptableno" type="hidden" name="ptableno"/>
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
									<tbody id="menuTbody">							
									</tbody>
								</table>	
							</div>
							<div class="col-md-6">
								<table class="table table-striped custab" id="acrylic" style="width: 400px;">
									<tr>
										<th style="width:100px; background-image: linear-gradient(#3C5064, #34495e); color:white;"> 합계 </th>
										<th id="totalPrice"></th>		
									</tr>
									<tr>
										<th style="width:100px; background-image: linear-gradient(#3C5064, #34495e); color:white;"> 쿠폰 </th>
										<th id="coupon"></th>			
									</tr>
									<tr>
										<th style="width:100px; background-image: linear-gradient(#3C5064, #34495e); color:white;"> 이벤트 </th>			
										<th id="eventPrice"></th>
									</tr>
									<tr>
										<th style="width:100px; background-image: linear-gradient(#3C5064, #34495e); color:white;"> 포인트 </th>			
										<th id="point"></th>
									</tr>
									<tr>
										<th style="width:100px; background-image: linear-gradient(#3C5064, #34495e); color:white;"> 결제 금액 </th>		
										<th id="result"></th>	
									</tr>
								</table>
							</div>
						</div>
					</div>		
	      			<!-- modal-footer-->
		      		<div class="modal-footer">
						<button onclick="onClickBtnPay()" type="button" style="width: 100px; height: 50px;" class="btn btn-default" role="button">결제</button>
						<button onclick="onClickBtnOrder()" type="button" style="width: 100px; height: 50px;" class="btn btn-default" role="button">주문</button>  
					</div>
				</div>
			</div>	                    	                    
		</div>	  
		<!-- modal end -->
		
	</body>
</html>	      		
	      		