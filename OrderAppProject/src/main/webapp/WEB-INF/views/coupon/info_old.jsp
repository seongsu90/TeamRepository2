<%@ page  contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html> <!-- root 태크, 엘리먼트라고 하기도 한다. -->
	<head> <!-- 헤드엘리먼트 -->
		<meta charset="UTF-8">
	</head>
	<body> <!-- 브라우저에 나오는 부분 -->
		
		&nbsp; <font size="6"><b>coupon 상세보기</b></font></p>
		<hr/> <!-- 시작과 동시에 끝이다라는 의미<br/>// 태그의 의미는 수평선그리기 -->
		<table style="width:570px">
			<tr>
				<td style="background-color:#9966FF; width:70px">쿠폰 번호</td>
				<td>${coupon.cnumber}</td>
			</tr>
			<tr>
				<td style="background-color:#9966FF; width:70px">쿠폰 이름</td>
				<td>${coupon.cname}</td>
			</tr>
			<tr>
				<td style="background-color:#9966FF; width:70px">쿠폰 유효기간</td>
				<td><pre>${coupon.cdday}</pre></td>
			</tr>
			<tr>
				<td style="background-color:#9966FF; width:70px">쿠폰 정보</td>
				<td>${coupon.cinfo}</td>
			</tr>
			<tr>
				<td style="background-color:#9966FF; width:70px">음식점 ID</td>
				<td>${coupon.cresid}</td>
			</tr>
			<tr>
				<td style="background-color:#9966FF; width:70px">할인 금액</td>
				<td>${coupon.cdiscount}</td>
			</tr>
		</table>
	</body>
</html>