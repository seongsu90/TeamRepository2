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
		- 쿠폰번호 &nbsp;&nbsp;<input type="text"  name="cnumber"  />
		<c:if test="${error == 'DELETE_FAIL'}"> *쿠폰번호가 존재하지 않음</c:if> <br/>

		<input type="submit" value="쿠폰 삭제"/> <br/>
		</form>
	</body>
</html>