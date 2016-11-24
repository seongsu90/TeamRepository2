<%@ page  contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html> <!-- root 태크, 엘리먼트라고 하기도 한다. -->
	<head> <!-- 헤드엘리먼트 -->
		<meta charset="UTF-8">
	</head>
	<body> <!-- 브라우저에 나오는 부분 -->
		
		
		&nbsp; <font size="6"><b>Delete_Form</b></font></p>
		<hr/> <!-- 시작과 동시에 끝이다라는 의미<br/>// 태그의 의미는 수평선그리기 -->
		<form method="post">
		- 예약 아이디<input type="text" name="rvmid" value="${login}"readonly> <br/>
		- 예약 음식점<input type="text" name="rvresid" value="${rvresid}"readonly>
		<c:if test="${error == 'TIME_LIMIT'}"> *예약취소는 20분전에만 가능합니다.</c:if><br/>
		
		<input type="submit" value="삭제하기"/> <br/>
		</form>
	</body>
</html>