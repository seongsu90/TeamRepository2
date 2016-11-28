<%@ page  contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html> <!-- root 태크, 엘리먼트라고 하기도 한다. -->
	<head> <!-- 헤드엘리먼트 -->
		<meta charset="UTF-8">
	</head>
	<body> <!-- 브라우저에 나오는 부분 -->
		
		&nbsp; <font size="6"><b>reservation list</b></font></p>
		<hr/> <!-- 시작과 동시에 끝이다라는 의미<br/>// 태그의 의미는 수평선그리기 -->
			<table style="width:570px">
			<tr>
				<td style="background-color:#9966FF; width:70px">예약시간</td>
				<td style="background-color:#9966FF; width:70px">예약인원</td>
				<td style="background-color:#9966FF; width:70px">예약한 ID</td>
				<td style="background-color:#9966FF; width:70px">예약 음식점</td>
				<td style="background-color:#9966FF; width:70px">예약 취소</td>
			</tr>
			
				
			<c:forEach var="reservation"   items="${list}">
			<tr>
				<td>${reservation.rvtime}</td>
				<td>${reservation.rvperson}</td>
				<td>${reservation.rvmid}</td>
				<td >${reservation.rvresname}</td>
				<td ><a href="/teamapp/reservation/delete?rvresid=${reservation.rvresid}">예약 취소</a></td>
			</tr>
			</c:forEach>
		
			
			
			</table>
	</body>
</html>