<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"> 
	</head>
	<body>
		<b>즐겨찾기 추가</b>
		<hr/>
		<form method="post">
			레스토랑 id : <input type="number" name="fresid"/> ${error}
			<br/>
			<input type="submit" value="추가"/> <br/>
		</form>
	</body>
</html>