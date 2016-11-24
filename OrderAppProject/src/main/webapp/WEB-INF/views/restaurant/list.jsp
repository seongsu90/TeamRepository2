<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/style.css" />
		<link href='http://fonts.googleapis.com/css?family=Niconne|Playball|Open+Sans:300italic,400italic,600italic,400,300,600,700' rel='stylesheet' type='text/css'>
		<%-- <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/common.css" /> --%>
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
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
	            color: #fff;
	            text-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5);
	            text-align: left;
	            padding: 20px;
	            background-size: 100%;
	            background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #646f7f), color-stop(100%, #4a5564));
	            background-image: -moz-linear-gradient(#646f7f, #4a5564);
	            background-image: -webkit-linear-gradient(#646f7f, #4a5564);
	            background-image: linear-gradient(#646f7f, #4a5564);
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
			function showInfo() {
				$("#infoModal").modal("show");
			};
		</script>
	</head>
	<body>
		<div style="text-align: center;">
			<div style="text-align: right;">
				<button type="button" class="btn btn-warning" style="">추가</button>
			</div>
			<table id="acrylic" style="width:100%">
				<thead>
					<tr>
						<c:if test="${mrank==2}">
							<th> 아이디</th>
						</c:if>
						<th> 사진 </th>
						<th> 이름</th>
						<%-- <th> 위치</th> --%>
						<th> 정보 </th>
						<th> 테이블 </th>
						<th> 전화번호 </th>
						<th> 오픈 </th>
						<th> 클로즈 </th>
						<th> 휴일 </th>
						<th> 삭제 </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="restaurant" items="${list}">
						<tr>
							<c:if test="${mrank==2}">
								<td> ${restaurant.resid}</td>
							</c:if>
							<td><img src="showPhoto?ressavedfile=${restaurant.ressavedfile}" width="50px"/></td>
							
							<td>
								<%-- <a href="info?resid=${restaurant.resid}">${restaurant.resname}</a> --%>
								<a id="btnInfo" href="javascript:showInfo()">${restaurant.resname}</a>
							</td>
						
							<%-- <td> ${restaurant.reslocation} </td> --%>
							<td> ${restaurant.resinfo} </td>
							<td> ${restaurant.restotaltable} </td>
							<td> ${restaurant.restel} </td>
							<td> ${restaurant.resopen} </td>
							<td> ${restaurant.resclose} </td>
							<td> ${restaurant.rescloseday} </td>
							<td> <button>삭제</button> </td>
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
			<br/>			
			<form method="post" action="/teamapp/restaurant/list?pageNo=1">
				식당 이름으로 검색 <input type="text" name="find" value="${find}"/>
				<input type="submit" value="찾기" class="btn btn-success"/>
			</form>
		</div>
		
	<%-- ## Info Modal ## --%>
		<div id="infoModal" class="modal fade" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">Info</h4>
		      </div>
		      <div class="modal-body">
				<table style="width:100%">
					<tr>
					<td style="background-color:pink; width:100px">식당 이름</td>
					<td>${restaurant.resname}</td>
					</tr>
					
					<tr>
					<td style="background-color:pink; width:100px">식당 위치</td>
					<td><pre>${restaurant.reslocation}</pre></td>
					</tr>
					
					<tr>
					<td style="background-color:pink; width:100px">식당 전화번호</td>
					<td><pre>${restaurant.restel}</pre></td>
					</tr>
					
					<tr>
					<td style="background-color:pink; width:100px">식당 전체 테이블 수</td>
					<td><pre>${restaurant.restotaltable}</pre></td>
					</tr>
					
					<tr>
					<td style="background-color:pink; width:100px">식당 정보</td>
					<td><pre>${restaurant.resinfo}</pre></td>
					</tr>
					
					<tr>
					<td style="background-color:pink; width:100px">식당 오픈타임</td>
					<td><pre>${restaurant.resopen}</pre></td>
					</tr>
					
					<tr>
					<td style="background-color:pink; width:100px">식당 클로즈타임</td>
					<td><pre>${restaurant.resclose}</pre></td>
					</tr>
					
					<tr>
					<td style="background-color:pink; width:150px">식당 휴일</td>
					<td><pre>${restaurant.rescloseday}</pre></td>
					</tr>
					
					<tr>
					<td style="background-color:pink; width:150px">식당 사진</td>
					<td><img src="showPhoto?ressavedfile=${restaurant.ressavedfile}" width="120px"/></td>
					</tr>
				</table>
				
				<div>
					<c:if test="${mrank==1}">
						<c:if test="${resid==mresid }">
							<a href="modify?mresid=${mresid}">[수정]</a>
						</c:if>
					</c:if>
					<c:if test="${mrank==2}">
						
							<a href="modify?mresid=${resid}">[수정]</a>
						
					</c:if>
					
					
					
					<c:if test="${mrank==2}">
						<a href="delete?resid=${resid}">[삭제]</a>
					</c:if>
					
				</div>
		      </div>
		      <div class="modal-footer">
				<c:if test="${mrank==0}"> 
					<a href="/teamapp/reservation/add?rvresid=${resid}" class="btn btn-primary">[예약하러 가기]</a>
					<a href="/teamapp/reservation/list?mid=${login}" class="btn btn-primary">[나의 예약 목록]</a>
				</c:if>
				<button type="button" class="btn btn-primary">수정</button>		
		      </div>
		    </div>
		  </div>
		</div>		
	</body>
</html>