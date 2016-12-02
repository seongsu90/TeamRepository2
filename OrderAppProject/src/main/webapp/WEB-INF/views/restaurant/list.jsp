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
		$(document).ready(function() {
				console.log("ready 실행");
				
				$("#selCity").change(function () {
					console.log("City Change");
					var selCity = $("#selCity").val();
			        setProvince(selCity, null);
			      
			    });
				
				$("#selProvince").change(function () {
					$("#reslocation").val($("#selCity").val() + " "+ $("#selProvince").val() + " "); 
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
	    </script>
		
		
		
	<!-- ################################################################################################################## -->
		

		<script type="text/javascript">

			function showInfo(resid) {
				$.ajax({

					url: "../restaurant/info",
					data: {"resid":resid},

					success: function(data) {
						location.reload(true);
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
				var resname = $("#resname").val();
				var restotaltable = $("#restotaltable").val();
				var resinfo = $("#resinfo").val();
				var restel = $("#restel").val();
				var reslocation = $("#reslocation").val();			
				var resopen = $("#resopen").val();
				var resclose = $("#resclose").val();
				
				console.log(resname);
				console.log(restotaltable);
				console.log(resinfo);
				console.log(restel);
				console.log(reslocation);
				console.log(resopen);
				console.log(resclose);
				
				 
				var closeday =[];
				$("input[name='closeday']:checked").each(function(i) {
					closeday.push($(this).val());
				});				
				
				var resphoto = $("#resphoto")[0];
				
				var data=new FormData();
				data.append("resname", resname);
				data.append("reslocation", reslocation);
				data.append("restotaltable", restotaltable);
				data.append("resinfo", resinfo);
				data.append("restel", restel);
				
				for(var i=0; i<closeday.length; i++) {
					data.append("closeday", closeday[i]);
				}
				
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
							//$("#iframe")[0].contentDocument.location.reload(true);
							location.reload(true);
						} else{
							alert("추가 실패");
						}
					}					
				});	
		 	}
			
			/* ################## Delete Modal################## */
			/* Show Delete Modal */
			function showDeleteModal(resid) {
				$("#deleteForm #deleteresid").val(resid);
				$("#restaurantDeleteModal").modal("show");
			}
			
			/* Delete Button */
			function onClickBtnDelete() {
				var deleteresid = $("#deleteresid").val();
				var inputresid = $("#inputresid").val();
				
				$.ajax({
					url: "delete",
					data: {"deleteresid":deleteresid, "inputresid":inputresid},
					method: "post",
					success: function(data) {
						if ( data.result == 0 ) {
							$("#successMessage").html("삭제 성공");
							location.reload(true);
							$("#messageIcon").attr('class', "fa fa-check-circle");
							$("#messageModal").modal("show");
							$("#restaurantDeleteModal").modal("hide");
							location.reload(true);
							
						} else {
							$("#failMessage").html("잘못된 입력입니다");
							$("#messageModal").modal("show");
						}
					}
				});
			}
			
			/* Delete Cancel Button */
			function onClickBtnDeleteCancel() {
				$("#restaurantDeleteModal").modal("hide");
			}
			
			/* ################## Message(OK, Error) Modal################## */
			/* Message OK Button */
			function onClickBtnOK() {
				$("#messageModal").modal("hide");
			}
			
			function onClickBtnCancel() {
				console.log("onClickBtnCancel() 실행");
				$("#restaurantAddModal").modal("hide");
			}



		</script>
	</head>
	<body>
	<div class="about-section"> 
	   <div class="container" align="center"><h2>Restaurant List</h2> <br/>
	
	
		<div style="text-align: center;">
		<c:if test="${mrank==2}">
			<div style="text-align: right; width:1100px; display: inline-block; margin-top: 0px;">
				<button id="btnAdd" type="button" class="btn btn-warning" onclick="onClickBtnAdd()" style="color: #34495e">레스토랑 등록</button>
			</div>
		</c:if>
	
			<table id="acrylic" style="width:1100px;">
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
						<c:if test="${mrank==2}">
						<th> 삭제 </th>
						</c:if>
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
			<br/>
			
			

			
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
		<%-- 	 #################################################################################### 

		 <%-- ## Add Modal ## --%>

	<div id="restaurantAddModal" class="modal fade" tabindex="-1" role="dialog" style="margin: auto">
		<div class="modal-dialog" role="document" style="width:750px">
   			<div class="modal-content">
   			<!-- modal-header -->
     		<div class="modal-header" style="background-color: #34495e; color:white">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">레스토랑 등록</h4>
      		</div>

     		<!-- modal-modal-body -->
     		<div class="modal-body">
     		
			<form id="addForm">
				<div class="form-group">
					<div class="input-group">
						<span style="width: 130px; padding:0px;" class="input-group-addon"><b>식당 이름</b></span>
						<b><input type="text" style="width:225px" class="form-control" name="resname" id="resname" value="은지네식당"/></b>
					</div>
				</div>
				
				<div class="form-group">
					<div class="input-group">
						<span style="width: 130px" class="input-group-addon"><b>전체 테이블 수</b></span>
						<input type="number"  style="width:225px" class="form-control" name="restotaltable" id="restotaltable" value="10"/>
					</div>
				</div>				
				
				<div class="form-group">
					<div class="input-group">
						<span style="width: 130px" class="input-group-addon"><b>전화번호</b></span>
						<input type="tel"  style="width:225px" class="form-control" name="restel" id="restel" value="010-4711-1129"/>
					</div>
				</div>	

				
				<div class="form-group">
					<div class="input-group">
						<span style="width: 130px" class="input-group-addon"><b>오픈 타임</b></span>
						<input type="time" style="width:225px" class="form-control" name="resopen" id="resopen" value="13:00"/>
					</div>
					<div class="input-group">
						<span style="width: 130px" class="input-group-addon"><b>클로즈 타임</b></span>
						<input type="time" style="width:225px" class="form-control" name="resclose" id="resclose" value="23:00"/>
					</div>
				</div>

				<div class="form-group">
					<div class="input-group">
						<span style="width: 130px" class="input-group-addon"><b>레스토랑 정보</b></span>
						<input type="text"  style="width:555px" class="form-control" name="resinfo" id="resinfo" value="맛있어요"/>
					</div>
				</div>				

				<div class="form-group">
					<div class="input-group">
						<span style="width: 130px" class="input-group-addon"><b>주소</b></span>
						<select class="form-control" style="width: 120px" id="selCity" name="selCity"></select>
						<select class="form-control" style="width: 105px" id="selProvince" name="selProvince">
							<option value="선택">선택</option>
						</select>	
						<input type="text" class="form-control" style="width: 330px" id="reslocation" name="reslocation" value="가락동"/><br/>
					</div>
				</div>

				<div class="form-group">
					<div class="input-group">
						<span style="width: 130px; margin-right: 10px; border-right: 1px solid #ccc;" class="input-group-addon"><b>휴일</b></span>&nbsp;
						<input type="checkbox" name="closeday"  value="휴일없음">휴일 X&nbsp;
	        			<input type="checkbox" name="closeday"  value="월요일" checked>월요일&nbsp;
	        			<input type="checkbox" name="closeday"  value="화요일">화요일&nbsp;
	        			<input type="checkbox" name="closeday"  value="수요일">수요일&nbsp;
	        			<input type="checkbox" name="closeday"  value="목요일">목요일&nbsp;
	        			<input type="checkbox" name="closeday"  value="금요일" checked>금요일&nbsp;
	        			<input type="checkbox" name="closeday"  value="토요일">토요일&nbsp;
	        			<input type="checkbox" name="closeday"  value="일요일">일요일
					</div>
				</div>

						
				<div class="form-group">
					<div class="input-group">
						<span style="width: 130px" class="input-group-addon"><b>사진</b></span>
						<input type="file" style="width:225px" class="form-control" name="resphoto " id="resphoto"/>
					</div>
				</div>
				

			</form>
     		</div>

      	<!-- modal-modal-modal-footer -->
		<div class="modal-footer" style="background-color: #34495e; color:white">
	        <button id="btnResAdd" type="button" class="btn btn-default" onclick="onClickBtnResAdd()" style="color: #34495e"><b>등록</b></button>
	        <button id="btnInit" type="button" class="btn btn-default" onclick="onClickBtnCancel()" style="color: #34495e"><b>취소</b></button>
		</div>
	</div><!-- /.modal-content -->
</div><!-- /.modal-dialog --> 
</div><!-- /.modal -->


	<!-- ########################## 삭제 Modal ########################## -->
	
	<div id="restaurantDeleteModal" class="modal fade" tabindex="-1" role="dialog" style="position: fixed">
		<div class="modal-dialog" role="document" style="width: 450px;">
	    	<div class="modal-content" style="width:450px; margin: 0">
	    	
	    		<!-- modal-header -->
	     		<div class="modal-header" style="background-color: #34495e; color:white">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">Restaurant 삭제</h4>
	      		</div>
	      		
	      		<!-- modal-body -->
	      		<div class="modal-body">
					<form id="deleteForm">
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px; padding:0px; background-color: #34495e; color:white" class="input-group-addon"><b>Restaurant</b></span>
								<b><input type="text" class="form-control" name="deleteresid" id="deleteresid" readonly/></b>
							</div>
						</div>
						
						<b style="color: #34495e"> 삭제할 Restaurant아이디를 한 번 더 입력해 주세요</b><br/><br/>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>아이디 입력</b></span>
								<input type="text" class="form-control" name="inputresid" id="inputresid" onkeydown="if(event.keyCode==13){javascript:onClickBtnDelete();}"/>
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
