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
		<p style="font-size:150%;"><b>즐겨찾기 목록</b></p>
		<hr/>
		ID : ${member.mid} &nbsp; 이름 : ${member.mname}
		<br/> <br/>
		<table style="border-collapse: collapse; border-style: solid; border-width: 2px; border-color: black;">
			<tr>
				<th> Restaurant Name </th>
				<th> Restaurant Info </th>
				<th> &nbsp; </th>
			</tr>
			<c:forEach var="resList" items="${resList}">
				<tr>
					<td> <a href="/teamapp/restaurant/info?resid=${resList.resid}">${resList.resname}</a> </td>
					<td> ${resList.resinfo}</td>
					<td> <a href="/teamapp/favorite/delete?fresid=${resList.resid}"><input type="button" value="삭제"/></a></td>
				</tr>
			</c:forEach>
		</table>
		<br/>
 		
	</body>
</html>