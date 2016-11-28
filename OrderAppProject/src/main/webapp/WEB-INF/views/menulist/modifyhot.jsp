<%@ page  contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		
		핫메뉴 수정
		<hr/>
			<form method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td style="background-color:purple; width:120px;">메뉴이름</td>
					<td><input type="text" name="mlname" value="${menuList.mlname}" style="width:600px"/></td>
				</tr>
				<tr>
					<td style="background-color:purple; width:120px;">메뉴가격</td>
					<td><input type="number" name="mlprice" value="${menuList.mlprice}" style="width:600px"/></td>
				</tr>
				<tr>
					<td style="background-color:purple; width:120px;">메뉴정보</td>
					<td><input type="text" name="mlinfo" value="${menuList.mlinfo}" style="width:600px"/></td>
				</tr>
				<tr>
					<td style="background-color:purple; width:120px;">기존 메뉴사진</td>
					<td><img src="showphoto?mlsavedfile=${menuList.mlsavedfile}" width="300px;"/></td>
				</tr>
				<tr>
					<td style="background-color:purple; width:120px;">새 메뉴사진</td>
					<td><input type="file" name="mlphoto" value="${menuList.mlsavedfile}" style="width:600px"/></td>
				</tr>
				<tr>
					<td style="background-color:purple; width:120px;">핫 초이스</td>
					<td>
						<input type="radio" name="mlishot" value="true"/>핫메뉴 유지
						<input type="radio" name="mlishot" value="true"/>일반메뉴로 췐지
					</td>
				</tr>
		
			</table>
				<input type="submit" value="수정"/>
				
			</form>
	</body>
</html>