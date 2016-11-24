<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>		
	<head>	
		<meta charset="UTF-8">
	</head>
	
	<body>
		리뷰 작성
		<hr/>
		
		<form method="post">
			<table>
				<tr>
					<td style="background-color:orange; width:70px; border: 1px solid black;"> 작성자 </td>
				 	<td style="border: 1px solid black;">${login}</td>				 	
				</tr>
				<tr>
					<td style="background-color:orange; width:70px; border: 1px solid black;"> 레스토랑 </td>
				 	<td style="border: 1px solid black;">${revresid}</td>
				</tr>
				<tr>
					<td style="background-color:orange; width:70px; border: 1px solid black;"> 평점 </td>
				 	<td style="border: 1px solid black;">
				 		<input type="number" min="1" max="5" name=revscore value="${review.revscore}"/>
				 	</td>				 		
				</tr>
				<tr>
					<td style="background-color:orange; width:70px; border: 1px solid black;"> 내용 </td>
				 	<td><textarea name="revcontent" style="width:600px; height:200px; border: 1px solid black;">${review.revcontent}</textarea></td>
				</tr>
			</table>
			<input type="submit" value="글쓰기"/>
		</form>
		
	</body>
</html>
