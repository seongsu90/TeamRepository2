<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"> 
		<style type="text/css">
			* {
				font-family: 돋움;
				font-size: 12px;
			}
			a {
				text-decoration: none;
				color: black;
			}
			a:HOVER {
				color: blue;
			}
			th {
				border-style: solid;
				border-width: 1px;
				border-bottom-width: 2px;
				text-align: center;
				padding: 5px;
			}
			td {
				border-style: solid;
				border-width: 1px;
				text-align: center;
				padding: 2px 5px;
			}
		</style>
	</head>
	<body>
		<p style="font-size:150%;"><b>회원 목록</b></p>
		<hr/>
		
		<br/>
		<table style="border-collapse: collapse; border-style: solid; border-width: 2px; border-color: black;">
			<tr>
				<th> 아이디 </th>
				<th> 이름 </th>
				<th> 비밀번호 </th>
				<th> 휴대폰 번호 </th>
				<th> 생일 </th>
				<th> 관심지역 </th>
				<th> 회원등급 </th>
				<th> Point </th>
				<th> Res No </th>
				<th> &nbsp; </th>
			</tr>
			<c:forEach var="member" items="${list}">
				<tr>
					<td> ${member.mid} </td>
					<td> ${member.mname} </td>
					<td> ${member.mpassword} </td>
					<td> ${member.mphone} </td>
					<td> ${member.mbirth} </td>
					<td> ${member.mlocation} </td>
					<td> 
						<c:if test="${member.mrank==0}"> 일반 </c:if>
						<c:if test="${member.mrank==1}"> 점장 </c:if>
						<c:if test="${member.mrank==2}"> <b>관리자</b> </c:if>
						<c:if test="${member.mrank==-1}"> <span style="color: red">경고1회 </span></c:if>
						<c:if test="${member.mrank==-2}"> <span style="color: red">경고2회 </span></c:if>
						<c:if test="${member.mrank==-3}"> <b style="color: red">블랙리스트</b> </c:if>
						
					 </td>
					<td> ${member.mpoint} </td>
					<td> ${member.mresid} </td>
					<td> <a href="/teamapp/member/modifyInfo?mid=${member.mid}"><input type="button" value="수정"/></a></td>
				</tr>
			</c:forEach>
		</table>
		<br/>
 		
		<form method="post" action="/teamapp/member/list?pageNo=1">
			검색 <input type="text" name="find" value="${find}"/>
			<input type="submit" value="찾기"/>
		</form><br/>
 		
		<div style="width: 600px">
			<c:if test="${pageNo!=1}">
			<a href="list?pageNo=1&find=${find}">[처음]</a>
			</c:if>
			
			<c:if test="${groupNo>1}">
				<a href="list?pageNo=${startPageNo-1}&find=${find}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
				<a href="list?pageNo=${i}&find=${find}"
					<c:if test="${pageNo==i}">style="color:red" </c:if>
				>${i}</a>
			</c:forEach>
			
			<c:if test="${groupNo<totalGroupNo}">
				<a href="list?pageNo=${endPageNo+1}&find=${find}">[다음]</a>
			</c:if>
			
			<c:if test="${pageNo!=totalPageNo}">
			<a href="list?pageNo=${totalPageNo}&find=${find}">[맨끝]</a>
			</c:if>
		</div>
		
	</body>
</html>