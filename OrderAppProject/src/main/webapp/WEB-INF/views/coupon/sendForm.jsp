<%@ page  contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html> <!-- root 태크, 엘리먼트라고 하기도 한다. -->
	<head> <!-- 헤드엘리먼트 -->
		<meta charset="UTF-8">
	</head>
	<body> <!-- 브라우저에 나오는 부분 -->
		
		
		&nbsp; <font size="6"><b>쿠폰 전송</b></font>
		<hr/> <!-- 시작과 동시에 끝이다라는 의미<br/>// 태그의 의미는 수평선그리기 -->
		<form method="post">
		
		- 쿠폰받을 아이디 <input type="text"  name="cbmid" /> <br/>
		- 쿠폰번호 <input type="number"  name="cbnumber"   /> <br/>
		<input type="submit" value="쿠폰 전송"/> <br/>
		</form>
	</body>
</html>