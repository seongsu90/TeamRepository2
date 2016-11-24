<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>		
	<head>	
		<meta charset="UTF-8">
	</head>
	
	<body>
		리뷰 리스트
		<hr/>
		
		<table style="border-collapse: collapse; border: 1px solid black; width: 600px; "> 				
			<tr style="background-color: #ffcc00">				
				<td style="border: 1px solid black;">리뷰 번호</td> 
				<td style="border: 1px solid black;">레스토랑</td>
				<td style="border: 1px solid black;">작성자</td>
				<td style="border: 1px solid black;">내용</td>
				<td style="border: 1px solid black;">평점</td>			
				<td style="border: 1px solid black;">날짜</td>			
			</tr>			
			<c:forEach var="review" items="${reviewList}"> 		
				<tr>															
					<td style="border: 1px solid black;">${review.revno}</td>		
					<td style="border: 1px solid black;">
						<a href= "info?revno=${review.revno}&revresid=${review.revresid}">${review.revresid}</a>
					</td>
					<td style="border: 1px solid black;">${review.revmid}</td>
					<td style="border: 1px solid black;">${review.revcontent}</td>
					<td style="border: 1px solid black;">${review.revscore}</td>
					<td style="border: 1px solid black;">${review.revdate}</td>
				</tr>
			</c:forEach>
		</table>
		
		<div style="width:600px">
			<a href="reviewList?pageNo=1&revresid=${revresid}">[처음]</a>
			<c:if test="${groupNo>1}">
				<a href="reviewList?pageNo=${startPageNo-1}&revresid=${revresid}">[이전]</a>		
			</c:if>     
			
			<c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">	
				<a href="reviewList?pageNo=${i}&revresid=${revresid}" 
					<c:if test="${pageNo==i}">style="color:red"</c:if>
				>${i}</a>				
			</c:forEach>
			
			<c:if test="${groupNo < totalGroupNo}">
				<a href="reviewList?pageNo=${endPageNo+1}&revresid=${revresid}">[다음]</a>
			</c:if>
			<a href="reviewList?pageNo=${totalPageNo}&revresid=${revresid}">[맨끝]</a>
			<a href="list">[목록]</a>	
			<%-- <c:if test="${} != ${revresid}"> --%>
				<a href="write?revresid=${revresid}">[글쓰기]</a>
			<%-- </c:if> --%>
					
		</div>
	</body>
</html>
