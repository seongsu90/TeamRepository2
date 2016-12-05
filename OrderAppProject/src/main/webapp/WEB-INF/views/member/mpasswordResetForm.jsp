<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"> 
		<script type="text/javascript">
			function onClickModifyPw()
			{
				var mid = $("#mid").val();
				var mpassword = $("#mpassword").val();
				var mpassword2 = $("#mpassword2").val();
				
				$.ajax({
					url: "member/mpasswordReset",
					data: {"mid":mid, "mpassword":mpassword, "mpassword2":mpassword2},
					method:"post",
					success: function(data) {
						if(data.result=="success"){
							alert("비밀번호 설정 완료");
							$("#login-modal").modal("hide");
							location.reload();
						}else{
							alert("비밀번호가 일치하지 않습니다");
						}
					}
				});
			}
			
			/* ################## Message(OK, Error) Modal################## */
			/* Message OK Button */
			function onClickBtnOK() {
				$("#messageModal").modal("hide");
			}
		</script>
	</head>
	
	<body>
    	<!-- modal-modal-body -->
    	<div class="modal-body">
			<form id="modifyForm">	
				<input type="hidden" name="mid"  id="mid" value="${mid}"/>
			
				<div class="form-group">
					<div class="input-group">
						<span style="width: 130px" class="input-group-addon"><b>새로운 비밀번호</b></span>
						<input type="password" class="form-control" name="mpassword" id="mpassword"/>
					</div>
				</div>
				
				<div class="form-group">
					<div class="input-group">
						<span style="width: 130px" class="input-group-addon"><b>비밀번호 확인</b></span>
						<input type="password" class="form-control" name="mpassword2" id="mpassword2"/>
					</div>
				</div>
				
			</form>		
    	</div>
     	
      	<!-- modal-modal-modal-footer -->	
		<div class="modal-footer" style="background-color: #34495e; color:white">
	        <button id="btnModify" type="button" class="btn btn-default" onclick="onClickModifyPw()" style="color: #34495e"><b>확인</b></button>
	        <button id="btnInit" type="button" data-dismiss="modal" class="btn btn-default"  style="color: #34495e"><b>취소</b></button>
	    </div>
	    
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