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
		$(document).ready(function() {
				console.log("ready 실행");
				
				$("#selCity").change(function () {
					console.log("City Change");
					var selCity = $("#selCity").val();
			        setProvince(selCity, null);
			      
			    });
				
				$("#selProvince").change(function () {
					console.log("Province Change");
			    });
				
				$("#detail").change(function () {
 					console.log("detail Change");
 					setReslocation();
 			    });
				
				
		});
 			
			function setCity() {
				console.log("setCity 실행");
				$.ajax({
					url: "getCity",
					data: {"selCity":null},
					success: function (data) {
						$("#selCity").html(data);
					}
				});
			}
			
 			function setProvince(selCity, selProvice) {
 				console.log("setProvince 실행");
 				$.ajax({
					url: "getProvince",
					data: {"selCity":selCity, "selProvince":null},
					success: function (data) {
						$("#selProvince").html(data);
					}
				});
			}
 			
 			function setDetail() {
 				console.log("setDetail 실행");
 	
 				$.ajax({
					url: "getDetail",
					data: {"selCity":selCity, "selProvince":selProvince},
					success: function (data) {
						$("#detail").html(data);
					}
				});
			}
 			
 			
 			function setReslocation() {
 				console.log("setReslocation() 실행");
				$("#reslocation").val($("#selCity").val() + " "+ $("#selProvince").val() + " "+$("#detail").val());  				
 			}
 			
 			
 			
	    </script>
		
		
		
	<!-- ################################################################################################################## -->
		
		
		<script type="text/javascript">
			function showInfo(resid) {
				$.ajax({
					url: "/teamapp/restaurant/info",
					data:resid,
					success: function(data) {
						parent.showInfo(data);
					}
				});
			};

				
			function onClickBtnAdd() {
				console.log("onClickBtnAdd");
				$("#restaurantAddModal").modal("show");
				setCity();		
			}
		
			
		 	function onClickBtnResAdd() {
				console.log("onClickBtnResAdd() 실행");
				var resname = $("#resname").val();
				var restotaltable = $("#restotaltable").val();
				var resinfo = $("#resinfo").val();
				var restel = $("#restel").val();
				var reslocation = $("#reslocation").val();
/* 				var closeday =[];
				$("input[name='closeday']:checked").each(function(i)){
					closeday.push($(this).val());
				} */
			
				var resopen = $("#resopen").val();
				var resclose = $("#resclose").val();
				var resphoto = $("#resphoto").val();
				
				
				var data=new FormData();
				data.append("resname", resname);
				data.append("reslocation", reslocation);
				data.append("restotaltable", restotaltable);
				data.append("resinfo", resinfo);
				data.append("restel", restel);
				data.append("closeday[]", closeday);
				data.append("resopen", resopen);
				data.append("resclose", resclose);
				if(resphoto.files.length != 0) {
					data.append("resphoto", resphoto.files[0]);
				}			
				
				$.ajax({
					url:"/teamapp/restaurant/add",
					data:data,
					method:"post",
					cache: false,
					processData: false,
					contentType: false,
					success: function(data) {
						
						if(data.result == "success") {
						
							alert("추가 성공");
							$("#restaurantAddModal").modal("hide");
							$("#iframe")[0].contentDocument.location.reload(true);
							
						} else{
							alert("추가 실패");
						}
					}					
					
				});				
		 	}

			
			function onClickBtnCancel() {
				console.log("onClickBtnCancel() 실행");
				$("#restaurantAddModal").modal("hide");
			}



		</script>
	</head>
	<body>
		<div style="text-align: center;">
			<div style="text-align: right;">
				<button id="btnAdd" type="button" class="btn btn-warning" onclick="onClickBtnAdd()" style="color: #34495e">추가</button>
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
								<a id="btnInfo" href="javascript:showInfo(${restaurant.resid})">${restaurant.resname}</a>
							</td>

							<%-- <td> ${restaurant.reslocation} </td> --%>
							<td> ${restaurant.resinfo} </td>
							<td> ${restaurant.restotaltable} </td>
							<td> ${restaurant.restel} </td>
							<td> ${restaurant.resopen} </td>
							<td> ${restaurant.resclose} </td>
							<td> ${restaurant.rescloseday} </td>
							<td> <a href="delete?resid=${restaurant.resid}" type="button" class="btn btn-info">삭제</a> </td>
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

		<%-- 	 #################################################################################### 

		 <%-- ## Add Modal ## --%>

	<div id="restaurantAddModal" class="modal fade" tabindex="-1" role="dialog" style="margin: auto">
		<div class="modal-dialog" role="document">
   			<div class="modal-content" style="width:500px">
   			<!-- modal-header -->
     		<div class="modal-header" style="background-color: #34495e; color:white">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">레스토랑 추가</h4>
      		</div>

     		<!-- modal-modal-body -->
     		<div class="modal-body">
     		
			<form id="addForm">
				<div class="form-group">
					<div class="input-group">
						<span style="width: 130px; padding:0px;" class="input-group-addon"><b>식당 이름</b></span>
						<b><input type="text" class="form-control" name="resname" id="resname"/></b>
					</div>
				</div>


				<div class="form-group">
					<div class="input-group">
						<span style="width: 130px" class="input-group-addon"><b>전체 테이블 수</b></span>
						<input type="number" class="form-control" name="restotaltable" id="restotaltable"/>
					</div>
				</div>

				<div class="form-group">
					<div class="input-group">
						<span style="width: 130px" class="input-group-addon"><b>레스토랑 정보</b></span>
						<input type="text" class="form-control" name="resinfo" id="resinfo"/>
					</div>
				</div>

				<div class="form-group">
					<div class="input-group">
						<span style="width: 130px" class="input-group-addon"><b>전화번호</b></span>
						<input type="tel" class="form-control" name="restel" id="restel"/>
					</div>
				</div>

				<div class="form-group">
					<div class="input-group">
						<span style="width: 130px" class="input-group-addon"><b>주소</b></span>
						<select class="form-control" style="width: 110px" id="selCity" name="selCity"></select>
						<select class="form-control" style="width: 110px" id="selProvince" name="selProvince">
							<option value="선택">선택</option>
						</select>	
						<input type="text" style="width: 320px" id="detail" name="detail"/><br/>
					</div>
				</div>

				<div class="form-group">
					<div class="input-group">
					<span style="width: 130px ; padding:20px;" class="input-group-addon"><b>휴일</b></span>
				
						휴일 X<input type="checkbox" name="closeday"  value="휴일 없음">
	        			월요일<input type="checkbox" name="closeday"  value="월요일">
	        			화요일<input type="checkbox" name="closeday"  value="화요일">
	        			수요일<input type="checkbox" name="closeday"  value="수요일"><br/>
	        			목요일<input type="checkbox" name="closeday"  value="목요일">
	        			금요일<input type="checkbox" name="closeday"  value="금요일">
	        			토요일<input type="checkbox" name="closeday"  value="토요일">
	        			일요일<input type="checkbox" name="closeday"  value="일요일">
        	

					
					</div>
				</div>


				<div class="form-group">
					<div class="input-group">
						<span style="width: 130px" class="input-group-addon"><b>오픈 타임</b></span>
						<input type="time" class="form-control" name="resopen" id="resopen"/>
					</div>
				</div>

				<div class="form-group">
					<div class="input-group">
						<span style="width: 130px" class="input-group-addon"><b>클로즈 타임</b></span>
						<input type="time" class="form-control" name="resclose" id="resclose"/>
					</div>
				</div>

						
				<div class="form-group">
					<div class="input-group">
						<span style="width: 130px" class="input-group-addon"><b>사진</b></span>
						<input type="file" class="form-control" name="resphoto " id="resphoto"/>
					</div>
				</div>
				

			</form>
     		</div>

      	<!-- modal-modal-modal-footer -->
		<div class="modal-footer" style="background-color: #34495e; color:white">
	        <button id="btnResAdd" type="button" class="btn btn-default" onclick="onClickBtnResAdd()" style="color: #34495e"><b>추가</b></button>
	        <button id="btnInit" type="button" class="btn btn-default" onclick="onClickBtnCancel()" style="color: #34495e"><b>취소</b></button>
		</div>
	</div><!-- /.modal-content -->
</div><!-- /.modal-dialog --> --%>
</div><!-- /.modal -->

	</body>
</html>
