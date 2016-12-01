<%@ page  contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html> <!-- root 태크, 엘리먼트라고 하기도 한다. -->
	<head> <!-- 헤드엘리먼트 -->
		<meta charset="UTF-8">
	</head>
	<body> <!-- 브라우저에 나오는 부분 -->
		
		<p>&nbsp; <font size="6"><b>coupon 메인모습</b></font></p>
		<hr/> <!-- 시작과 동시에 끝이다라는 의미<br/>// 태그의 의미는 수평선그리기 -->
	
			1. <a href="/teamapp/coupon/add">쿠폰 생성</a> <br/>
			2. <a href="/teamapp/coupon/send">쿠폰 전송</a> <br/>
			3. <a href="/teamapp/coupon/delete">쿠폰 삭제</a> <br/>
			4.<a href="/teamapp/coupon/info?cnumber=2115507"> 쿠폰 상세보기</a> <br/>

			<%-- 회원전용메뉴 --%>
			※<a href="/teamapp/coupon/list?mid=${login}">내 쿠폰함</a>
	</body>
</html>