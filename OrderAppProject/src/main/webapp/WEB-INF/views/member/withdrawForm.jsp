<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"> 
	</head>
	<body>
		<b>회원 탈퇴</b>
		<hr/>
		<form method="post">
			아이디 : ${login}<br/>
			비밀번호  : <input type="password" name="mpassword"/>${error}<br/>
			<input type="submit" value="탈퇴"/>
		</form>
	</body>
</html>