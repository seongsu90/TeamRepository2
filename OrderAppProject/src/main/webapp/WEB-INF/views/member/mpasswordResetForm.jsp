<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"> 
	</head>
	<body>
		<b>비밀번호 재설정</b>
		<hr/>
		<form method="post">
			<input type="hidden" name="mid" value="${findMid}"/>
			새로운 비밀번호 : <input type="password" name="mpassword"/><br/>
			 비밀번호 확인  : <input type="password" name="mpassword2"/>${error}<br/>
			<input type="submit" value="확인"/>
		</form>
	</body>
</html>