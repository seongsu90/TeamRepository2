<%@ page  contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html> <!-- root 태크, 엘리먼트라고 하기도 한다. -->
	<head> <!-- 헤드엘리먼트 -->
		<meta charset="UTF-8">
	</head>
	<body style="width:600px; margin:auto;"> <!-- 브라우저에 나오는 부분 -->
		
		<h4 style="width:600px; margin:auto;">메뉴 삭제</h4>
		
			<form method="post">
				삭제하시려면 메뉴이름을 한번 더 입력해주세요.<br/><br/>
				 메뉴:<input type="text" name="mlname" value="${menuList.mlname}"><br/><br/><br/>
			
				<input type="submit" value="삭제"/> <br/>
			</form>
		
	</body>
</html>