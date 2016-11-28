<%@ page  contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html> <!-- root 태크, 엘리먼트라고 하기도 한다. -->
	<head> <!-- 헤드엘리먼트 -->
		<meta charset="UTF-8">
	</head>
	<body> <!-- 브라우저에 나오는 부분 -->
		
		
		&nbsp; <font size="6"><b>add</b></font></p>
		<hr/> <!-- 시작과 동시에 끝이다라는 의미<br/>// 태그의 의미는 수평선그리기 -->
		<form method="post">
		※ 당일 예약만 가능합니다. <br/>
		- 예약 시간 <input type="time"  name="rvtime"  /> 
		<c:if test="${error1 == 'TIME_OUT'}"> *올바른 시간이 아닙니다.</c:if>
		<c:if test="${error1 == 'DAY_OUT'}"> *오늘은 쉬는날 입니다.</c:if><br/>
		- 인원 수(테이블당 최대 4명) <input type="number" name="rvperson" min="1" max="8"><br/>
		- 예약 아이디<input type="text" name="rvmid" value="${login}"readonly> <br/>
		- 예약하는 식당 <input type="text"  name="rvresid" value="${rvresid}" readonly/><c:if test="${error1 == 'ALREADY'}"> *이미 예약한 식당입니다.</c:if><br/> <br/>
		
		<input type="submit" value="예약하기"/> <br/>
		</form>
	</body>
</html>