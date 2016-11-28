<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>		
	<head>	
		<meta charset="UTF-8">
	</head>
	
	<body>
		리뷰 내용
		<hr/>		
		<table style="border-collapse: collapse; border: 1px solid black; width: 600px; ">
			<tr>
				<td style="background-color:orange; width:100px; border: 1px solid black;"> 리뷰 번호 </td>
			 	<td style="border: 1px solid black;">${review.revno}</td>
			</tr>		
		
			<tr>
				<td style="background-color:orange; width:100px; border: 1px solid black;"> 레스토랑 </td>
			 	<td style="border: 1px solid black;">${review.revresid}</td>
			</tr>
			
			<tr>
				<td style="background-color:orange; width:100px; border: 1px solid black;"> 작성자 </td>
			 	<td style="border: 1px solid black;">${review.revmid}</td>
			</tr>
			
			<tr>
				<td style="background-color:orange; width:100px; border: 1px solid black;"> 내용 </td>
			 	<td style="border: 1px solid black;"><pre>${review.revcontent}</pre></td>
			</tr>
			
			<tr>
				<td style="background-color:orange; width:100px; border: 1px solid black;"> 평점 </td>
			 	<td style="border: 1px solid black;">${review.revscore}</td>
			</tr>
			
			<tr>
				<td style="background-color:orange; width:100px; border: 1px solid black;"> 날짜 </td>
			 	<td style="border: 1px solid black;">${review.revdate}</td>
			</tr>
		</table>		
		<div>
			<c:if test="${login == review.revmid}" >
				<a href="delete?revno=${review.revno}">[삭제]</a>				
			</c:if>
			<a href="reviewList?revresid=${review.revresid}">[목록]</a>
		</div>
	</body>
</html>
