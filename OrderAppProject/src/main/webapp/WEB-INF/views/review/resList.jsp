<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>		
	<head>	
		<meta charset="UTF-8">
	</head>
	
	<body>
		매장 리스트
		<hr/>
		
		<table style="border-collapse: collapse; border: 1px solid black; width: 600px; "> 				
			<tr style="background-color: #ffcc00">				
				<td style="border: 1px solid black;">레스토랑</td> 
				<td style="border: 1px solid black;">레스토랑명</td>
				<td style="border: 1px solid black;">위치</td>
				<td style="border: 1px solid black;">총 테이블수</td>
				<td style="border: 1px solid black;">레스토랑 정보</td>			
				<td style="border: 1px solid black;">전화번호</td>
				<td style="border: 1px solid black;">쉬는날</td>
				<td style="border: 1px solid black;">오픈</td>
				<td style="border: 1px solid black;">클로즈</td>
				<!-- <td style="border: 1px solid black;">이미지</td> -->
				<td style="border: 1px solid black;">파일</td>
				<td style="border: 1px solid black;">파일형식</td>			
			</tr>			
			<c:forEach var="resList" items="${resList}"> 		
				<tr>															
					<td style="border: 1px solid black;">
						<a href= "reviewList?revresid=${resList.resid}">${resList.resid}</a>
					</td>	
					<td style="border: 1px solid black;">${resList.resname}</td>
					<td style="border: 1px solid black;">${resList.reslocation}</td>
					<td style="border: 1px solid black;">${resList.restotaltable}</td>
					<td style="border: 1px solid black;">${resList.resinfo}</td>
					<td style="border: 1px solid black;">${resList.restel}</td>
					<td style="border: 1px solid black;">${resList.rescloseday}</td>
					<td style="border: 1px solid black;">${resList.resopen}</td>
					<td style="border: 1px solid black;">${resList.resclose}</td>	
					<%-- <td style="border: 1px solid black;">${resList.resphoto}</td> --%>
					<td style="border: 1px solid black;">${resList.ressavedfile}</td>	
					<td style="border: 1px solid black;">${resList.resmime}</td>									
				</tr>
			</c:forEach>
		</table>
		
		<div style="width:600px">
			<a href="list?pageNo=1">[처음]</a>
			<c:if test="${groupNo>1}">
				<a href="list?pageNo=${startPageNo-1}">[이전]</a>		
			</c:if>     
			
			<c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">	
				<a href="list?pageNo=${i}" 
					<c:if test="${pageNo==i}">style="color:red"</c:if>
				>${i}</a>				
			</c:forEach>
			
			<c:if test="${groupNo < totalGroupNo}">
				<a href="list?pageNo=${endPageNo+1}">[다음]</a>
			</c:if>
			<a href="list?pageNo=${totalPageNo}">[맨끝]</a>			
		</div>
	</body>
</html>
