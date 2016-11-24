<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style type="text/css">
			.list {
				text-align: right;
				background-color: #ffccff;
				padding: 5px 10px;
			}
			
			.content {
				text-align: left;
				padding-left: 10px;
			}
		</style>
	</head>
	<body>
		<b>회원 정보</b>
		<hr/>
			<table>
				<tr>
					<td class="list">아이디 </td>
					<td class="content">${member.mid}</td>
				</tr>
				
				<tr>
					<td class="list">이름 </td>
					<td class="content">${member.mname}</td>
				</tr>
				
				<tr>
					<td class="list">휴대전화 </td>
					<td class="content">${member.mphone}</td>
				</tr>
				
				<tr>
					<td class="list">생일 </td>
					<td class="content">${member.mbirth}</td>
				</tr>
				
				<tr>
					<td class="list">관심지역 </td>
					<td class="content">${member.mlocation}</td>
				</tr>
				
				<tr>
					<td class="list">적립 포인트 </td>
					<td class="content">${member.mpoint}</td>
				</tr>
				
				<c:if test="${member.mresid!=0}">
					<tr>
						<td class="list">보유 Restaurant </td>
						<td class="content">${member.mresid}</td>
					</tr>
				</c:if>
			</table>
			<br/>
			
			<a href="${pageContext.servletContext.contextPath}/member/modifyInfo?mid=${login}"><input type="button" value="수정"/></a>
			<a href="${pageContext.servletContext.contextPath}/member/withdraw"><input type="button" value="탈퇴"/><br/></a>
			
			<a href="${pageContext.servletContext.contextPath}/favorite/add"><input type="button" value="즐겨찾기 추가"/></a>
			<a href="${pageContext.servletContext.contextPath}/favorite/list"><input type="button" value="즐겨찾기 목록"/></a>
	</body>
</html>