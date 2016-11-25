<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>

		<meta charset="UTF-8">
		
		<script>
			function onClickChangepw()
			{
				console.log("onClickChangepw")
				console.log("${findMid}");
				$(".modal-body").load("/teamapp/member/mpasswordReset")
			}
		
		</script>
	</head>
	<body>

		<!-- <b>비밀번호 찾기</b>
		<hr/> -->
   		<!-- modal-header -->
   		
   		<div class="modal-header" style="background-color: #34495e; color:white">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #FFFFFF;"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title">회원 정보 수정</h4>
    	</div>
    		
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

	</body>
</html>