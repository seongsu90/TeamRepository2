<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"> 
	</head>
	<body>
		<b>로그인</b>
		<hr/>
		<form method="post">
			아이디 : <input type="text" name="mid" value="${findMid}"/>
			<c:if test="${error == 'LOGIN_FAIL_MID'}"> *아이디가 존재하지 않음</c:if>
			<br/>
			패스워드 : <input type="password" name="mpassword"/>
			<c:if test="${error == 'LOGIN_FAIL_MPASSWORD'}"> *패스워드가 틀림</c:if>
			<br/>
			<input type="submit" value="로그인"/> <br/>
		</form>
	</body>
</html>