<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>		
	<head>	
		<meta charset="UTF-8">
	</head>
	
	<body>
		Pos 수정
		<hr/>		
		
		<form method="post">			
			메뉴 : <input type="text" name="pmlname" value="${pos.pmlname}"/><br/>			
			수량 : <input type="number" name="pcount" value="${pos.pcount}"/><br/>			
			<input type="submit" value="주문"/><br/>		
		</form>
		
	</body>
</html>
