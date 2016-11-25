<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		<b>비밀번호 찾기</b>
		<hr/><%-- 
		<form method="post">
			아 이 디 : <input type="text" name="mid"/><br/>
			휴대폰번호 : <input type="text" name="mphone"/>${error}<br/>
			<input type="submit" value="확인"/>
		</form> --%>
		
		

   		<!-- modal-header -->
   		<div class="modal-header" style="background-color: #34495e; color:white">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title">회원 정보 수정</h4>
    	</div>
    		
    	<!-- modal-modal-body -->
    	<div class="modal-body">
			<form id="modifyForm">	
					
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
				
			</form>		
    	</div>
     	
      	<!-- modal-modal-modal-footer -->	
		<div class="modal-footer" style="background-color: #34495e; color:white">
	        <button id="btnModify" type="button" class="btn btn-default" onclick="onClickBtnModify()" style="color: #34495e"><b>수정하기</b></button>
	        <button id="btnInit" type="button" class="btn btn-default" onclick="onClickBtnCancel()" style="color: #34495e"><b>취소</b></button>
		</div>
		
		
		
		
		
	</body>
</html>