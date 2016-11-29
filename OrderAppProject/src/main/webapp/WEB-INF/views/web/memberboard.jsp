<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  contentType="text/html;charset=UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/style.css" />
	<link href='http://fonts.googleapis.com/css?family=Niconne|Playball|Open+Sans:300italic,400italic,600italic,400,300,600,700' rel='stylesheet' type='text/css'>
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.min.js"></script>

	<!-- Website Font style -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
	
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
        
        /* 모달 폼 */
        body, html{
		    height: 100%;
		 	background-repeat: no-repeat;
		 	background-color: white;
		 	font-family: 'Oxygen', sans-serif;
		}
		
		.main{
		 	margin-top: 70px;
		}
		
		h1.title { 
			font-size: 50px;
			font-family: 'Passion One', cursive; 
			font-weight: 400; 
		}
		
		hr{
			width: 10%;
			color: #fff;
		}
		
		.form-group{
			margin-bottom: 15px;
		}
		
		label{
			margin-bottom: 15px;
		}
		
		input,
		input::-webkit-input-placeholder {
		    font-size: 11px;
		    padding-top: 3px;
		}
		
		.main-login{
		 	background-color: #fff;
		    /* shadows and rounded borders */
		    -moz-border-radius: 2px;
		    -webkit-border-radius: 2px;
		    border-radius: 2px;
		    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
		    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
		    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
		}
		
		.main-center{
		 	margin-top: 30px;
		 	margin: 0 auto;
		 	max-width: 330px;
		    padding: 40px 40px;
		}
		
		.login-button{
			margin-top: 5px;
		}
		
		.login-register{
			font-size: 11px;
			text-align: center;
		}
		
		.input-group-addon {
			color: #34495e;
		}
        
	</style>		
	
	<script type="text/javascript">
		$(document).ready(function() {
				console.log("ready 실행");
				
				$("#selCity").change(function () {
					console.log("City Change");
					var selCity = $("#selCity").val();
			        setProvince(selCity, null);
			        $("#mlocation").val(""); 
			    });
				
				$("#selProvince").change(function () {
					console.log("Province Change");
					setMlocation();
			    });
		});
		
		function setCity(selCity) {
			console.log("setCity 실행");
			$.ajax({
				url: "getCity",
				data: {"selCity":selCity},
				success: function (data) {
					$("#selCity").html(data);
				}
			});
		}
		
		function setProvince(selCity, selProvince) {
			console.log("setProvince 실행");
			$.ajax({
				url: "getProvince",
				data: {"selCity":selCity, "selProvince":selProvince},
				success: function (data) {
					$("#selProvince").html(data);
				}
			});
		}
			
		function setMlocation() {
			console.log("setMlocation() 실행");
			$("#mlocation").val($("#selCity").val() + " "+ $("#selProvince").val()); 				
		}	
	
		function showModifyModal(member) {
			$("#modifyForm #mid").val(member.mid);
			$("#modifyForm #mname").val(member.mname);
			$("#modifyForm #mpassword").val(member.mpassword);
			$("#modifyForm #mphone").val(member.mphone);
			$("#modifyForm #mbirth").val(member.mbirth);
			var selCity = member.mlocation.substring(0, member.mlocation.indexOf(" "));
			var selProvince = member.mlocation.substring(member.mlocation.indexOf(" ")+1);			
			$("#modifyForm #mlocation").val(member.mlocation);
			$("#modifyForm #mrank").val(member.mrank);
			$("#modifyForm #mpoint").val(member.mpoint);
			$("#modifyForm #mresid").val(member.mresid);
			setCity(selCity);
			setProvince(selCity, selProvince);
			$("#memberModifyModal").modal("show");
		}
		
		function onClickBtnModify() {
			var mid = $("#modifyForm #mid").val();
			var mname = $("#modifyForm #mname").val();
			var mpassword = $("#modifyForm #mpassword").val();
			var mphone = $("#modifyForm #mphone").val();
			var mbirth = $("#modifyForm #mbirth").val();
			var mlocation = $("#modifyForm #mlocation").val();
			var mrank = $("#modifyForm #mrank").val();
			var mpoint = $("#modifyForm #mpoint").val();
			var mresid = $("#modifyForm #mresid").val();
			
			$.ajax({
				url: "modify",
				data: {"mid":mid, "mname":mname, "mpassword":mpassword, "mphone":mphone, "mbirth":mbirth, "mlocation":mlocation, "mrank":mrank, "mpoint":mpoint, "mresid":mresid},
				method:"post",
				success: function(data) {
					if(data.result == "success") {
						alert("수정 성공");
						$("#memberModifyModal").modal("hide");
						location.reload();
					} else if(data.result == "noRestaurant") {
						alert("레스토랑이 없음");
					} else if(data.result == "wrongData") {
						alert("입력 데이터가 올바르지 않음");
					}
				}
			});
		}
		
		function onClickBtnCancel() {
			$("#memberModifyModal").modal("hide");
		}
	</script>	
</head>

<body>
	<div class="about-section"> 
	   <div class="container" align="center"><h2>Member List</h2> <br/>
	   		
			<table id="acrylic">
				<thead>
					<tr>
						<th> 아이디 </th>
						<th> 이름 </th>
						<th> 비밀번호 </th>
						<th> 휴대폰 번호 </th>
						<th> 생일 </th>
						<th> 관심지역 </th>
						<th> 회원등급 </th>
						<th> Point </th>
						<th> Res No </th>
						<th> &nbsp; </th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="member" items="${list}">
						<tr>
							<td> ${member.mid} </td>
							<td> ${member.mname} </td>
							<td> ${member.mpassword} </td>
							<td> ${member.mphone} </td>
							<td> ${member.mbirth} </td>
							<td> ${member.mlocation} </td>
							<td> 
								<c:if test="${member.mrank==0}"> 일반 </c:if>
								<c:if test="${member.mrank==1}"> 점장 </c:if>
								<c:if test="${member.mrank==2}"> <b>관리자</b> </c:if>
								<c:if test="${member.mrank==-1}"> <span style="color: red">경고1회 </span></c:if>
								<c:if test="${member.mrank==-2}"> <span style="color: red">경고2회 </span></c:if>
								<c:if test="${member.mrank==-3}"> <b style="color: red">블랙리스트</b> </c:if>
								
							 </td>
							<td> ${member.mpoint} </td>
							<td> ${member.mresid} </td>
							<td><input onclick="showModifyModal({
													mid:'${member.mid}',
													mname:'${member.mname}',
													mpassword:'${member.mpassword}',
													mphone:'${member.mphone}',
													mbirth:'${member.mbirth}',
													mlocation:'${member.mlocation}',
													mrank:${member.mrank},
													mpoint:${member.mpoint},
													mresid:${member.mresid}
												})" type="button" value="수정"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br/>
	 		
			<form action="${pageContext.servletContext.contextPath}/member/memberboard">
				<input type="hidden" name="pageNo" value="1"/>
				검색<input type="text" name="find" value="${find}"/>			
				<input type="submit" value="찾기"/>
			</form><br/>
			
			<div style="width: 600px">
				<c:if test="${pageNo!=1}">
					<a href="memberboard?pageNo=1&find=${find}">[처음]</a>
				</c:if>
				
				<c:if test="${groupNo>1}">
					<a href="memberboard?pageNo=${startPageNo-1}&find=${find}">[이전]</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
					<a href="memberboard?pageNo=${i}&find=${find}"
						<c:if test="${pageNo==i}">style="color:red" </c:if>
					>${i}</a>
				</c:forEach>
				
				<c:if test="${groupNo<totalGroupNo}">
					<a href="memberboard?pageNo=${endPageNo+1}&find=${find}">[다음]</a>
				</c:if>
				
				<c:if test="${pageNo!=totalPageNo}">
					<a href="memberboard?pageNo=${totalPageNo}&find=${find}">[맨끝]</a>
				</c:if>
			</div>
		</div>
	</div>
	
	<!-- ########################## 수정 Modal ########################## -->
	
	<div id="memberModifyModal" class="modal fade" tabindex="-1" role="dialog" style="margin: auto">
		<div class="modal-dialog" role="document">
	    	<div class="modal-content" style="width:500px">
	    	
	    		<!-- modal-header -->
	     		<div class="modal-header" style="background-color: #34495e; color:white">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">회원 정보 수정</h4>
	      		</div>
	      		
	      		<!-- modal-body -->
	      		<div class="modal-body">
					<form id="modifyForm">
					
						<input type="hidden" name="mid" value="${member.mid}"/>				
							
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px; padding:0px; background-color: #34495e; color:white" class="input-group-addon"><b>아이디</b></span>
								<b><input type="text" class="form-control" name="mid" id="mid" readonly/></b>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>이름</b></span>
								<input type="text" class="form-control" name="mname" id="mname"/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>비밀번호</b></span>
								<input type="text" class="form-control" name="mpassword" id="mpassword"/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>휴대전화</b></span>
								<input type="text" class="form-control" name="mphone" id="mphone"/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>생일</b></span>
								<input type="text" class="form-control" name="mbirth" id="mbirth"/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>관심지역</b></span>
								<select class="form-control" style="width: 110px" id="selCity" name="selCity"></select>
								<select class="form-control" style="width: 110px" id="selProvince" name="selProvince"></select><br/>
								<input type="hidden" class="form-control" name="mlocation" id="mlocation" value="${member.mlocation}"/>		
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>회원 등급</b></span>
								<input type="number" class="form-control" name="mrank" id="mrank"/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>적립 포인트</b></span>
								<input type="number" class="form-control" name="mpoint" id="mpoint"/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>보유 레스토랑id</b></span>
								<input type="number" class="form-control" name="mresid" id="mresid"/>
							</div>
						</div>
						
					</form>		
	      		</div>
	      	
		      	<!-- modal-footer -->	
				<div class="modal-footer" style="background-color: #34495e; color:white">
			        <button id="btnModify" type="button" class="btn btn-default" onclick="onClickBtnModify()" style="color: #34495e"><b>수정하기</b></button>
			        <button id="btnInit" type="button" class="btn btn-default" onclick="onClickBtnCancel()" style="color: #34495e"><b>취소</b></button>
				</div>
				
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<!-- ########################## 수정 Modal ########################## -->

</body>
</html>