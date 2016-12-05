<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>

		<meta charset="UTF-8">
		
		<script>
			function onClickChangepw()
			{
				var mid = $("#mid").val();
				var mphone = $("#mphone").val();
		
				$.ajax({
					url: "member/findMpassword",
					data: {"mid":mid, "mphone":mphone},
					method:"post",
					success: function(data){
						if(data.result=="success"){
							$(".modal-bodyfooter").load("/teamapp/member/mpasswordReset?mid=" + mid);
						}else{
							alert("입력값이 올바르지 않습니다.");
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
   		<!-- modal-header -->
   		<div class="modal-header" style="background-color: #34495e; color:white">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #FFFFFF;"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title">비밀번호 찾기</h4>
    	</div>
    	
    	<div class="modal-bodyfooter">
    	
    		<!-- modal-modal-body -->
	    	<div class="modal-body">
				<form id="modifyForm">	
				
					<div class="form-group">
						<div class="input-group">
							<span style="width: 130px" class="input-group-addon"><b>아이디</b></span>
							<input type="text" class="form-control" name="mid" id="mid"/>
						</div>
					</div>
					
					<div class="form-group">
						<div class="input-group">
							<span style="width: 130px" class="input-group-addon"><b>휴대폰번호</b></span>
							<input type="text" class="form-control" name="mphone" id="mphone"/>
						</div>
					</div>
					
				</form>		
	    	</div>
     	
	      	<!-- modal-modal-modal-footer -->	
			<div class="modal-footer" style="background-color: #34495e; color:white">
		        <button id="btnModify" type="button" class="btn btn-default" onclick="onClickChangepw()" style="color: #34495e"><b>확인</b></button>
		        <button id="btnInit" type="button" data-dismiss="modal" class="btn btn-default"  style="color: #34495e"><b>취소</b></button>
		    </div>
		    
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