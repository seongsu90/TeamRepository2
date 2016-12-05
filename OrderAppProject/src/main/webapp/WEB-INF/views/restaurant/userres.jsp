<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	            padding: 10px 10px 10px 10px;
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
			function resinfo(resid) {
				$.ajax({
					url: "../restaurant/info",
					data: {"resid":resid},
					success: function(data) {
						$("#resinfoModal").modal("show");						
						$("#infoForm #resname").val(data.resname);
						$("#infoForm #restotaltable").val(data.restotaltable);
						$("#infoForm #restel").val(data.restel);
						$("#infoForm #resopen").val(data.resopen);
						$("#infoForm #resclose").val(data.resclose);							
						$("#infoForm #resinfo").val(data.resinfo);
						$("#infoForm #reslocation").val(data.reslocation);
						$("#infoForm #rescloseday").val(data.rescloseday);
						$("#mlname").html(data.mlname);
						$("#mlprice").html(data.mlprice); 
						
						for(var i=0; i<data.menu.length; i++) {
							var menu = data.menu[i];	
							if(i==0) {
								$("#menuTbody").empty();			// 메뉴리스트 중복 출력 제거
							}
							$("#menuTbody").append(
								'<tr class="menu">' +									
									'<td>' +
										'<input class="mlname" type="text" style="border: 0;" name="mlname" value="' + menu.mlname + '" readonly/>' +							
									'</td>' +									
									'<td>' +
										'<input class="mlprice" type="text" style="border: 0;" name="mlprice" value="' + menu.mlprice + '" readonly/>' +							
									'</td>' +		
								'</tr>'
							);
						}
					}
				});
			};
		</script>
	
	</head>
	<body>
	
	<div class="about-section"> 
		<div class="container" align="center"><h2>Restaurant List</h2>
			<div style="text-align: center;">
				<table id="acrylic" style="width:1100px;">
					<thead>
						<tr> 
							<th> 사진 </th>
							<th> 이름</th>
							<%-- <th> 위치</th> --%>
							<th> 정보 </th>
							<th> 테이블 </th>
							<th> 전화번호 </th>
							<th> 오픈 </th>
							<th> 클로즈 </th>
							<th> 휴일 </th>							
						</tr>
					</thead>
					<tbody>
						<c:forEach var="restaurant" items="${list}">
							<tr>
								<td><img src="showPhoto?ressavedfile=${restaurant.ressavedfile}" width="50px"/></td>
								<td>									
									<a id="btnInfo" href="javascript:resinfo(${restaurant.resid})">${restaurant.resname}</a>
								</td>							
								<td> ${restaurant.resinfo} </td>
								<td> ${restaurant.restotaltable} </td>
								<td> ${restaurant.restel} </td>
								<td> ${restaurant.resopen} </td>
								<td> ${restaurant.resclose} </td>
								<td> ${restaurant.rescloseday} </td>								
							</tr>
						</c:forEach>
					</tbody>
				</table>
		
				<div style="text-align:center;">
					<c:if test="${pageNo!=1}">
					<a href="list?pageNo=1&find=${find}">[처음]</a>
					</c:if>
	
					<c:if test="${groupNo>1}">
						<a href="list?pageNo=${startPageNo-1}&find=${find}">[이전]</a>
					</c:if>
	
					<c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
						<a href="list?pageNo=${i}&find=${find}"
							<c:if test="${pageNo==i}">style="color:red" </c:if>
						>${i}</a>
					</c:forEach>
	
					<c:if test="${groupNo<totalGroupNo}">
						<a href="list?pageNo=${endPageNo+1}&find=${find}">[다음]</a>
					</c:if>
	
					<c:if test="${pageNo!=totalPageNo}">
					<a href="list?pageNo=${totalPageNo}&find=${find}">[맨끝]</a>
					</c:if>
				</div>
				
				<div class="container">    
				    <div id="quick-access">
				      <form class="form-inline quick-search-form"  method="post" role="form" action="/teamapp/restaurant/list?pageNo=1">
				        <div class="form-group">
				        		<input type="text" style="width:250px" name="find" value="${find}" class="form-control" placeholder="Restaurant name search">
				        </div>
				        <button type="submit" id="quick-search" class="btn btn-custom"><span class="glyphicon glyphicon-search custom-glyph-color"></span></button>
				      </form>
				    </div>
				</div>
			</div>				
		</div>
	</div>
	
	<!-- resinfoModal start -->	
	<div id="resinfoModal" class="modal fade" tabindex="-1" role="dialog" >
		<div class="modal-dialog" role="document" style="width:820px">
			<div class="modal-content">
			<!-- modal-header -->
		     	<div class="modal-header" style="background-color: #34495e; color:white">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">레스토랑 정보</h4>
		      	</div>
		
				<div class="modal-body">
					<form id="infoForm">
						<div class="row" >
							<div class="col-md-6" style="margin-left: 20px;">
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
										<b><input id="resinfo" type='text' style="width:225px" class="form-control" /></b>
									</div>
								</div>
		
								<div class="form-group">
									<div class="input-group">
										<span style="width: 130px" class="input-group-addon"><b>주소</b></span>
										<b><input id="reslocation" type='text' style="width:225px" class="form-control" /></b>
									</div>
								</div>
								
								<div id="isclose" class="form-group">
									<div class="input-group">
										<span style="width: 130px" class="input-group-addon"><b>레스토랑 휴일</b></span>
										<b><input id="rescloseday" type='text' style="width:225px" class="form-control" /></b>
									</div>
								</div>
							</div>
							
							<div class="col-md-4">								
								<table id="acrylic">
									<thead>
										<tr>
											<th> 메뉴 </th>
											<th> 가격 </th>																							
										</tr>
									</thead>									
									<tbody id="menuTbody">							
									</tbody>
								</table>	
							</div>
						</div>
					</form>
				</div>
				
				<div class="modal-footer" style="background-color:#34495e; color:white">
					<button id="btnReservation" type="button" class="btn btn-primary" onclick="onClickBtnReservation()" ><b>예약하기</b></button>					
				</div>
			</div>
		</div>		
		<!-- resinfoModal end -->
	</div>
	</body>
</html>
