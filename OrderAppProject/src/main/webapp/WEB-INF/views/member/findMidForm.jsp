<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>

		<meta charset="UTF-8">
		
		<script>
			function onClickFindMid()
			{
				var mname = $("#mname").val();
				var mphone = $("#mphone").val();
		
				$.ajax({
					url: "member/findMid",
					data: {"mname":mname, "mphone":mphone},
					method:"post",
					success: function(data){
						if(data.result=="success"){
							alert("아이디는 \"" + data.mid + "\" 입니다");
							$(".login-form").load("/teamapp/member/login");
						}else{
							alert("입력하신 정보와 일치하는 아이디가 없습니다.");
						}
					}
				});
				
			}
		
		</script>
	</head>
	
	<body>
		<div class="login-form">
	   		<!-- modal-header -->
	   		<div class="modal-header" style="background-color: #34495e; color:white">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #FFFFFF;"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">아이디 찾기</h4>
	    	</div>
	    	
	    	<div class="modal-bodyfooter">
	    	
	    		<!-- modal-modal-body -->
		    	<div class="modal-body">
					<form id="modifyForm">	
					
						<div class="form-group">
							<div class="input-group">
								<span style="width: 130px" class="input-group-addon"><b>이름</b></span>
								<input type="text" class="form-control" name="mname" id="mname"/>
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
			        <button id="btnModify" type="button" class="btn btn-default" onclick="onClickFindMid()" style="color: #34495e"><b>확인</b></button>
			        <button id="btnInit" type="button" data-dismiss="modal" class="btn btn-default"  style="color: #34495e"><b>취소</b></button>
			    </div>
			    
			</div>
		</div>
	</body>
</html>