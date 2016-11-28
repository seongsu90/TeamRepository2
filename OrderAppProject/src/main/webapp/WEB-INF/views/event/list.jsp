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
			function showInfo(eresid){
				$.ajax({
					url:"../event/info",
					data: {"eresid":eresid},
					success: function(data){
						parent.showInfo(data);
					}
				});
			
			};
			
			function onClickBtnAdd(){
				console.log("onClickBtnAdd");
				$("#eventAddModal").modal("show");
			}
			
			function onClickBtnEventAdd(){
				console.log("onClickBtnEventAdd() 실행");
				
				var ename = $("#ename").val();
				var eresid = $("#eresid").val();
				var ephoto = $("#ephoto")[0];
				var einfo = $("#einfo").val();
				var emlname = $("#emlname").val(); 
				var eprice = $("#eprice").val();
				var estart = $("#estart").val();
				var eend = $("#eend").val();
				
				var data = new FormData();
				data.append("ename", ename);
				data.append("eresid", eresid);	
				if(ephoto.files.length != 0) {
					data.append("ephoto", ephoto.files[0]);
				}	
				data.append("einfo", einfo);
				data.append("emlname", emlname);
				data.append("eprice", eprice);
				data.append("estart", estart);
				data.append("eend", eend);
				
				$.ajax({
					url:"/teamapp/event/add",
					data: data,
					method:"post",
					contentType: false,
					processData: false,
					cache: false,
					success: function(data){
						if(data.result == "success"){
							alert("추가 성공");
							$("#eventAddModal").modal("hide");
							location.reload();
						} else {
							alert("제대로 입력하시오");	
						}
					}
					
				});
			}
			
			function onClickBtnCancel(){
				console.log("onClickBtnCancel() 실행");
				$("#eventAddModal").modal("hide");
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
		                <th> 이벤트 이름</th>
						<th> 식당아이디 </th>
						<th> 이벤트 사진 </th>
						<th> 이벤트 정보 </th>
						<th> 이벤트 메뉴  </th>
						<th> 할인가격 </th>
						<th> 시작일 </th>
						<th> 종료일 </th>
						<th> 삭제 </th>
	                </tr>
	            </thead>
	            <tbody>
	            <c:forEach var="event" items="${list}">
	                <tr>
	                    <td>${event.ename}</td>
	                    <td>
	                    	<a id="btnInfo" href="javascript:showInfo(${event.eresid})">
	                    		${event.eresid}
	                    	</a>
	                    </td>
	                    <td>
	                    	<img src="showPhoto?esavedfile=${event.esavedfile}" width="50px"/>
	                    </td>
	                    <td>${event.einfo}</td>
	                    <td>${event.emlname}</td>
	                    <td>${event.eprice}</td>
	                    <td>${event.estart}</td>
	                    <td>${event.eend}</td>
	                    <td><a href="delete?eresid=${event.eresid}" type="button" class="btn btn-info">삭제</a></td>
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
      </div>
      
      
      	<%--    Add                  MODAL          --%>
      	 <div id="eventAddModal" class="modal fade" tabindex="-1" role="dialog" style="margin:auto">
      		<div class="modal-dialog" role="document">
      			<div class="modal-content" style="width:500px">
	      		<%--	header       --%>
	      			<div class="modal-header" style="background-color:#34495e; color:white">
	      				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      				<h4 class="modal-title">이벤트 추가</h4>
	      			</div>

 
	      	<%--	modal-modal-body           --%>
	      		<div class="modal-body">
					<form id="addForm">
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px; padding:0px;" class="input-group-addon"><b>이벤트 이름</b></span>
								<b><input type="text" class="form-control" name="ename" id="ename"/></b>
							</div>
						</div>


						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>식당 아이디</b></span>
								<input type="number" class="form-control" name="eresid" id="eresid"/>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>이벤트 사진</b></span>
								<input type="file" class="form-control" name="ephoto" id="ephoto"/>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>이벤트 정보</b></span>
								<input type="text" class="form-control" name="einfo" id="einfo"/>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>이벤트 메뉴</b></span>
								<input type="text" class="form-control" name="emlname" id="emlname"/>
							</div>
						</div>


						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>할인가격</b></span>
								<input type="number" class="form-control" name="eprice" id="eprice"/>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>시작일</b></span>
								<input type="date" class="form-control" name="estart" id="estart"/>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>종료일</b></span>
								<input type="date" class="form-control" name="eend" id="eend"/>
							</div>
						</div>
					  </form>
	      			</div>
	      			
	      			
	      			    <!--      footer -->             
	      			<div class="modal-footer" style="background-color: #34495e; color:white">
	      				<button id="btnEventAdd" type="button" class="btn btn-default" onclick="onClickBtnEventAdd()" style="color:#34495e"><b>추가</b></button>
	      				<button id="btnInit" type="button" class="btn btn-default" onclick="onClickBtnCancel()" style="color:#34495e"><b>취소</b></button>
	      			</div>
      			</div>
      		</div>
      	</div> 
  </body>
   </html> 