<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html> 
	<head> 
		<meta charset="UTF-8">
	</head>
	
	<body> 
		식당 삭제 
		<hr/>
		삭제할 식당의 id를 입력하세요.<br/>
		<form method="post">
			<input type="text" name="resid" value="${restaurant.resid}"/>
			<input type="submit" value="식당 삭제 완료"/><br/>		
		</form>
		
	
	</body>
	
		
</html>