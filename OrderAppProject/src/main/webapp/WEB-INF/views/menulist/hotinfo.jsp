<%@ page  contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		핫메뉴리스트 정보
		<hr/>
		<table style="width:570px text-align=center;">
			<tr>
				<td style="background-color:blue; width:100px">메뉴 이름</td>	
				<td>${menuList.mlname}</td>
			 </tr>
			 <tr>
				<td style="background-color:blue; width:100px">메뉴 가격</td>	
				<td>${menuList.mlprice}</td>
			 </tr>
			 <tr>
				<td style="background-color:blue; width:100px">정보</td>
				<td>${menuList.mlinfo}</td>
			 </tr>
			<tr>
				<td style="background-color:blue; width:100px">메뉴 사진</td>
				<td><img src="showPhoto?mlsavedfile=${menuList.mlsavedfile}" width="500px"/></td>
			</tr>
		</table>
		<div>
			<c:if test="${mrank!=0}">
			    <a href="modifyhot?mlresid=${menuList.mlresid}&mlname=${menuList.mlname}&mlishot=1">[수정]</a>
				<a href="delete?mlresid=${menuList.mlresid}&mlname=${menuList.mlname}">[삭제]</a>
			</c:if>
			<a href="hotlist?mlishot=1">[목록]</a>
		</div>
	</body>
</html>