<%@ page  contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
		<style>

		</style>
	</head>
	<body>
	    <h4 style="width:400px; margin:auto;">메뉴 수정</h4>
		<form method="post" enctype="multipart/form-data">
		
			<table style="width:700px; margin:auto;">
				<tr>
					<td style="background-color:#1bbc9b; width:120px;">메뉴이름</td>
					<td><input type="text" name="mlname" value="${menuList.mlname}" style="width:600px"/></td>
				</tr> 
				<tr>
					<td style="background-color:#1bbc9b; width:120px;">메뉴가격</td>
					<td><input type="number" name="mlprice" value="${menuList.mlprice}" style="width:600px"/></td>
				</tr> 
				<tr>
					<td style="background-color:#1bbc9b; width:120px;">메뉴 정보</td>
					<td><input type="text" name="mlinfo" value="${menuList.mlinfo}" style="width:600px"/></td>
				</tr>   
				<tr>
					<td style="background-color:#1bbc9b; width:130px;">기존 사진</td>
					<td><img src="showPhoto?mlsavedfile=${menuList.mlsavedfile}" width="100px"/></td>
				</tr>
				<tr>
					<td style="background-color:#1bbc9b; width:120px;">새 메뉴사진</td>
					<td><input type="file" name="mlphoto" value="${menuList.mlsavedfile}"/></td>
				</tr>
				<tr>
					<td style="background-color:#1bbc9b; width:120px;">초이스</td>
					<td>
						<input type="radio" name="mlishot" value="핫"/>핫
						<input type="radio" name="mlishot" value="일반"/>일반
					</td>
				</tr>
			</table>
			<div style="margin-left:605px;">
				<input type="submit" value="수정"/>
			</div>		
		</form> 
   </body>
</html>