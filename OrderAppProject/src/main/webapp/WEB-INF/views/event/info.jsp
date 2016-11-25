<%@ page  contentType="application/json;charset=UTF-8"%>

{
	"ename": "${event.ename}",
	"eresid": ${event.eresid},
	"esavedfile": "${event.esavedfile}",
	"einfo" : "${event.einfo}",
	"emlname": "${event.emlname}",
	"eprice" : "${event.eprice}",
	"estart" : "${event.estart}",
	"eend" : "${event.end}"

}
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head> 
	<body>
		
		이벤트 정보
		<hr/>
		<table style="width:570px text-align=center;">
		    <tr>
				<td style="background-color:blue; width:100px">이름</td>
				<td>${event.ename}</td>
			</tr>
			<tr>
				<td style="background-color:blue; width:100px">식당 아이디</td>	
				<td>${event.eresid}</td>
			</tr>
			<tr>
				<td style="background-color:blue; width:100px">이벤트 사진</td>
				<td><img src="showPhoto?esavedfile=${event.esavedfile}" width="500px"/></td>
			</tr>	
			<tr>
				<td style="background-color:blue; width:100px">이벤트 정보</td>
				<td>${event.einfo}</td>
			</tr>
			<tr>
				<td style="background-color:blue; width:100px">이벤트 메뉴 이름</td>
				<td>${event.emlname}</td>
			</tr>
			<tr>
				<td style="background-color:blue; width:100px">이벤트 할인가격</td>
				<td>${event.eprice}</td>
			</tr>
			<tr>
				<td style="background-color:blue; width:100px">이벤트 시작기간</td>
				<td>${event.estart}</td>
			</tr>	
			<tr>
				<td style="background-color:blue; width:100px">이벤트 종료기간</td>
				<td>${event.eend}</td>
			</tr>	
		</table>
		<div>
			<c:if test="${mrank!=2}">
				 <a href="modify?eresid=${event.eresid}&emlname=${event.emlname}">[수정]</a>
				<a href="delete?eresid=${event.eresid}">[삭제]</a>
			</c:if>
			<a href="list">[목록]</a>
		</div>	
	</body>
</html> --%>