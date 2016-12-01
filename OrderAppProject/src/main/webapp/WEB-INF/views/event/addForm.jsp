<%@ page  contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
	</head> 
	<body>
		<h2>이벤트 생성</h2>
		<hr/>
			<form method="post" enctype="multipart/form-data">
				<ul>
					<li>이름 : <input type="text" name="ename" value="${event.ename}"/><br/></li>
					<li>식당아이디 : <input type="number" name="eresid"  value="${event.eresid}"/><br/></li>
					<li>이벤트 사진 : <input type="file" name="ephoto" value="${event.ephoto}"/><br/></li>
					<li>이벤트 정보 : <input type="text" name="einfo" value="${event.einfo}"/><br/></li>
					<li>이벤트 메뉴 이름 : <input type="text" name="emlname" value="${event.emlname}"/><br/></li>
					<li>이벤트 할인가격 : <input type="number" name="eprice" value="${event.eprice}"/><br/></li>
					<li>이벤트 시작기간 : <input type="date" name="estart" value="${event.estart}"/><br/></li>
					<li>이벤트 종료기간 : <input type="date" name="eend" value="${event.eend}"/><br/></li>
					<li><input type="submit" value="생성"/></li>
				</ul>
			</form>
	</body>
</html>