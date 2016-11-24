<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"> 
	</head>
	<body>
		<b>아이디 찾기</b>
		<hr/>
		<form method="post">
			이름 : <input type="text" name="mname"/><br/>
			번호 : <input type="tel" name="mphone"/>${error}<br/>
			<input type="submit" value="찾기"/>
		</form>
	</body>
</html>