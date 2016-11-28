<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script type="text/javascript">
			function onClickLogin()
			{
				var mid =$("#login_userid").val();
				var mpassword=$("#login_password").val();
				
				$.ajax({
					url: "member/login",
					data: {"mid":mid, "mpassword":mpassword},
					method:"post",
					success: function(data){
						if(data.result=="success"){
							alert("로그인 성공");
							$("#login-modal").modal("hide");
						}else{
							alert("아이디 혹은 비밀번호가 틀렸습니다.");
						}
					}
				});
			}
			
			function onClickFindId()
			{
				console.log("onClickFindId")
				$(".modal-content").load("/teamapp/member/findMid")
			}
			
			function onClickFindPw()
			{
				console.log("onClickFindPw")
				$(".modal-content").load("/teamapp/member/findMpassword")
			}	
		</script>
	</head>
	
	<body>
		<div class="modal-header" align="center">
			<img class="img-angle" id="img_logo" src="${pageContext.servletContext.contextPath}/resources/img/logo_reform2.png">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
			</button>
		</div>
              
		<!-- Begin # DIV Form -->
		<div id="div-forms">
              
			<!-- Begin # Login Form -->
			<form id="login-form">
				<div class="modal-body">
					<div id="div-login-msg">
						<div id="icon-login-msg" class="glyphicon glyphicon-chevron-right"></div>
						<span id="text-login-msg">Type your username and password.</span>
					</div>
					
					<input id="login_userid" class="form-control" type="text" placeholder="ID (type ERROR for error effect)" value="${findMid}" required>
					<input id="login_password" class="form-control" type="password" placeholder="Password" required>
					
					<div class="checkbox">
						<label>	<input type="checkbox"> Remember me	</label>
					</div>
				</div>
				
				<div class="modal-footer">
					<div>
						<button type="button" class="btn btn-primary btn-lg btn-block" style="background-color: #1bbc9b" onclick="onClickLogin()">Login</button>
					</div>
					
					<div>
						<button id="login_findId_btn" type="button" class="btn btn-link"  onclick="onClickFindId()" ><u>아이디 찾기</u></button>
						<button id="login_findPw_btn" type="button" class="btn btn-link"  onclick="onClickFindPw()" ><u>비밀번호 찾기</u></button>
						<!--      <button id="login_register_btn" type="button" class="btn btn-link">Register</button> -->
					</div>
				</div>
			</form>

		</div>
	</body>
</html>