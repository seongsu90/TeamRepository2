<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"> 
		<link href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css" rel="stylesheet">
	    <%-- <link href="${pageContext.servletContext.contextPath}/resources/css/justified-nav.css" rel="stylesheet">
		<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
	 	<script>
	 		$(function(){
	 			$("nav li").on("click", function(){
	 				$("nav li").removeClass("active");//jquery 이용
	 				//this.setAttribute("class","active")//순수 DOM
	 				$(this).addClass("active");
	 			});
	 		});
	 	</script> --%>
		
		<style>
			table#acrylic {
	            border-collapse: separate;
	            background: #fff;
	            -moz-border-radius: 5px;
	            -webkit-border-radius: 5px;
	            border-radius: 5px;
	            margin: 50px auto;
	            -moz-box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
	            -webkit-box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
	            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
	            cursor: pointer;
	        }
	        
	        #acrylic thead {
	            -moz-border-radius: 5px;
	            -webkit-border-radius: 5px;
	            border-radius: 5px;
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
	            background:#34495e;
	        }
	        
	        #acrylic thead th:first-child {
	            -moz-border-top-right-radius: 5px;
	            -webkit-border-top-left-radius: 5px;
	            border-top-left-radius: 5px;
	        }
	        
	        #acrylic thead th:last-child {
	            -moz-border-top-right-radius: 5px;
	            -webkit-border-top-right-radius: 5px;
	            border-top-right-radius: 5px;
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
	            -moz-border-bottom-right-radius: 5px;
	            -webkit-border-bottom-left-radius: 5px;
	            border-bottom-left-radius: 5px;
	        }
	        
	        #acrylic tbody tr:last-child td:last-child {
	            -moz-border-bottom-right-radius: 5px;
	            -webkit-border-bottom-right-radius: 5px;
	            border-bottom-right-radius: 5px;
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
	        
	        @media screen and (max-width: 767px) {
	            #acrylic thead {
	                display: none;
	            }
	            #acrylic tr {
	                margin-bottom: 10px;
	                display: block;
	            }
	            #acrylic td {
	                display: block;
	                text-align: right;
	                font-size: 13px;
	                border-bottom: 1px dotted #ccc;
	            }
	            #acrylic td:last-child {
	                border-bottom: 0;
	            }
	            #acrylic td:before {
	                content: attr(data-label);
	                float: left;
	                text-transform: uppercase;
	                font-weight: bold;
	            }
	            table#acrylic {
	                width: 100%;
	            }
	        }
	        tbody tr td {
	        	text-align:center;
	        }
	   </style>    
		
	</head>
	</body>
		<div class="wrapper">
	        <table id="acrylic">
	            <thead>
	                <tr>
		                <th> 메뉴 이름</th>
						<th> 메뉴 가격</th>
						<th> 식당아이디 </th>
						<th> 메뉴 정보 </th>
						<th> 메뉴 사진  </th>
	                </tr>
	            </thead>
	            <tbody>
	            <c:forEach var="menuList" items="${menuList}">
	                <tr>
	                    <td data-label="Name">${menuList.mlname}</td>
	                    <td data-label="Age">${menuList.mlprice}</td>
	                    <td data-label="Weight">
	                    	<a href="info?mlresid=${menuList.mlresid}&mlname=${menuList.mlname}">
	                    		${menuList.mlresid}
	                    	</a>
	                    </td>
	                    <td data-label="Profession">${menuList.mlinfo}</td>
	                    <td>
	                    	<img src="showPhoto?mlsavedfile=${menuList.mlsavedfile}" style="width:50px;"/>
	                    </td>
	                </tr>
	                
	               </c:forEach> 
	            </tbody>
	        </table>
	      
	        <%-- <form action="${pageContext.servletContext.contextPath}/menulist/list">
				<input type="hidden" name="pageNo" value="1"/>
			</form><br/>
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
			</div> --%>
	    </div>		
   </body>
	
		<%-- <hr/>
		<p style="font-size:150%;"><b>핫메뉴 리스트 목록</b></p>
		<hr/>
		
		<br/>
		<table style="width: 1000px;">
			<tr>
				<th> 메뉴 이름</th>
				<th> 메뉴 가격</th>
				<th> 식당아이디 </th>
				<th> 메뉴 정보 </th>
				<th> 메뉴 사진  </th>
				<th> 핫해하태 </th>
			</tr>
			<c:forEach var="menuList" items="${menuList}">
				<tr>
					<td>${menuList.mlname}</td>			
					<td>${menuList.mlprice}</td>
					<td><a href="hotinfo?mlresid=${menuList.mlresid}&mlname=${menuList.mlname}&mlishot=1">${menuList.mlresid}</a></td>
					<td>${menuList.mlinfo}</td>
					<td>
						<img src="showPhoto?mlsavedfile=${menuList.mlsavedfile}" width="500px"/>
					</td>
					<td>${menuList.mlishot}</td>
				</tr>
			</c:forEach>
		</table>
		<br/>
 		
		<div style="width: 600px">
			<c:if test="${pageNo!=1}">
			<a href="hotlist?pageNo=1&find=${find}">[처음]</a>
			</c:if>
			
			<c:if test="${groupNo>1}">
				<a href="hotlist?pageNo=${startPageNo-1}&find=${find}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
				<a href="hotlist?pageNo=${i}&find=${find}"
					<c:if test="${pageNo==i}">style="color:red" </c:if>
				>${i}</a>
			</c:forEach>
			
			<c:if test="${groupNo<totalGroupNo}">
				<a href="hotlist?pageNo=${endPageNo+1}&find=${find}">[다음]</a>
			</c:if>
			
			<c:if test="${pageNo!=totalPageNo}">
			<a href="hotlist?pageNo=${totalPageNo}&find=${find}">[맨끝]</a>
			</c:if>
		</div> --%>
</html>