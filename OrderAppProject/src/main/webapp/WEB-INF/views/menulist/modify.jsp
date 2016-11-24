<%@ page  contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		
		메뉴리스트 수정
		<hr/>
			<form method="post" enctype="multipart/form-data">
			
			<table>
				<tr>
					<td style="background-color:blue; width:120px;">메뉴이름</td>
					<td><input type="text" name="mlprice" value="${menuList.mlname}" style="width:600px"/></td>
				</tr> 
				<tr>
					<td style="background-color:blue; width:120px;">메뉴가격</td>
					<td><input type="number" name="mlprice" value="${menuList.mlprice}" style="width:600px"/></td>
				</tr> 
				<tr>
					<td style="background-color:blue; width:120px;">메뉴 정보</td>
					<td><input type="text" name="mlinfo" value="${menuList.mlinfo}" style="width:600px"/></td>
				</tr>   
				<tr>
					<td style="background-color:blue; width:120px;">기존 메뉴사진</td>
					<td><img src="showPhoto?mlsavedfile=${menuList.mlsavedfile}" width="100px"/></td>
				</tr>
				<tr>
					<td style="background-color:blue; width:120px;">새 메뉴사진</td>
					<td><input type="file" name="mlphoto" value="${menuList.mlsavedfile}"/></td>
				</tr>
				<tr>
					<td style="background-color:blue; width:120px;">초이스</td>
					<td>
						<input type="radio" name="mlishot" value="true"/>핫
						<input type="radio" name="mlishot" value="false"/>일반
					</td>
				</tr>
			</table>
				<input type="submit" value="수정"/>
			</form>
			
	</body>
</html>