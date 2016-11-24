<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"> 
		<style type="text/css">
			a:HOVER {
				color: blue;
			}
			th {
				border:1px solid red;
				text-align: center;
			}
			td {
				border:1px solid black;
				text-align: center;
			}
		</style>
	</head>
	<body>
		<hr/>
		<p style="font-size:150%;"><b>핫메뉴 리스트 목록</b></p>
		<hr/>
		
		<br/>
		<table style="width: 1000px;">
			<tr>
				<th> 메뉴 이름</th>
				<th> 메뉴 가격</th>
				<th> 식당아이디 </th>
				<th> 메뉴 정보 </th>
				<th> 메뉴 사진  </th>
				<th> 핫해하태 </th>
			</tr>
			<c:forEach var="menuList" items="${menuList}">
				<tr>
					<td>${menuList.mlname}</td>			
					<td>${menuList.mlprice}</td>
					<td><a href="hotinfo?mlresid=${menuList.mlresid}&mlname=${menuList.mlname}&mlishot=1">${menuList.mlresid}</a></td>
					<td>${menuList.mlinfo}</td>
					<td>
						<img src="showPhoto?mlsavedfile=${menuList.mlsavedfile}" width="500px"/>
					</td>
					<td>${menuList.mlishot}</td>
				</tr>
			</c:forEach>
		</table>
		<br/>
 		
		<div style="width: 600px">
			<c:if test="${pageNo!=1}">
			<a href="hotlist?pageNo=1&find=${find}">[처음]</a>
			</c:if>
			
			<c:if test="${groupNo>1}">
				<a href="hotlist?pageNo=${startPageNo-1}&find=${find}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
				<a href="hotlist?pageNo=${i}&find=${find}"
					<c:if test="${pageNo==i}">style="color:red" </c:if>
				>${i}</a>
			</c:forEach>
			
			<c:if test="${groupNo<totalGroupNo}">
				<a href="hotlist?pageNo=${endPageNo+1}&find=${find}">[다음]</a>
			</c:if>
			
			<c:if test="${pageNo!=totalPageNo}">
			<a href="hotlist?pageNo=${totalPageNo}&find=${find}">[맨끝]</a>
			</c:if>
		</div>
		
		
	</body>
</html>