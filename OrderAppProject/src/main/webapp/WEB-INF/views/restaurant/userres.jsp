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
									<a id="btnInfo" href="javascript:showInfo(${restaurant.resid})">${restaurant.resname}</a>
								</td>
	
								<%-- <td> ${restaurant.reslocation} </td> --%>
								<td> ${restaurant.resinfo} </td>
								<td> ${restaurant.restotaltable} </td>
								<td> ${restaurant.restel} </td>
								<td> ${restaurant.resopen} </td>
								<td> ${restaurant.resclose} </td>
								<td> ${restaurant.rescloseday} </td>
								<c:if test="${mrank==2}">
	 							<td> <button type="button" class="btn btn-warning" style="color: #34495e" onclick="showDeleteModal('${restaurant.resid}')">삭제</button> </td>
								</c:if>
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

	</body>
</html>
