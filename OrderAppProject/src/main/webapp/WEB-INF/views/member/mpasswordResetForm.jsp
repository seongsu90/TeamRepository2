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
	</body>
</html>