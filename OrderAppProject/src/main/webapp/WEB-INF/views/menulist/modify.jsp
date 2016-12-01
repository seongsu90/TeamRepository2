<%@ page  contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- This file has been downloaded from http://bootsnipp.com/. Enjoy! -->
		<!--author:Aniuska Maita Aparicio-->
		<title>Formulario--bootsnipp</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
		
		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
		
		<!-- Latest compiled and minified JavaScript -->
		
		    <!-- Google fonts -->
		<link href='https://fonts.googleapis.com/css?family=Lobster|Abel' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Questrial' rel='stylesheet' type='text/css'>
		<style>
			/**Contenedor**/
			.container{
			  background: url('http://i1280.photobucket.com/albums/a487/Ani_Mai/15_zps9qpuzjxq.png');
			  background-repeat:no-repeat;
			  background-size:cover;
			 
			}
			
			
			/**Head form**/
			
			h1{
			    text-align: center;
				background: #fff;
				padding: 15px 0 15px 0;
				font-family: 'Lobster', cursive;
				color: #000;
				letter-spacing: 2px;
				text-shadow: 2px 2px #eee;
			
			}
			
			/**body form**/
			.barra{
				background: #fff;
				padding: 15px 0 15px 0;
				font-family: 'Questrial', sans-serif;
			}
			.form-control :focus{
				border-color: #66afe9;
				-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
				-moz-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
				box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
				box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
			}
			.btn {
			    color: #FFFFFF;
			    background-color: #9C27B0;
			    border-color: rgba(0,0,0,.075);
			    background-image: none !import;
			    
			}
			
		</style>
	</head>
	<body>
	    <div class="container col-md-3" style="width:100%;">
			<!--head form-->
			<section>
					<h1>메뉴 수정</h1>
			</section>
			<!--end head form-->
			<!--body form-->
			<section class="col-md-12">
				<form class="form-horizontal" method="post" enctype="multipart/form-data">
				  <div class="form-group barra">
				    <label for="inputEmail3" class="col-sm-4 control-label">메뉴이름</label>
				    <div class="col-sm-8"> 
				      <input style="width:500px;" type="text" name="mlname" value="${menuList.mlname}" class="form-control" id="inputPassword3"/>
				    </div>
				  </div>
				  <div class="form-group barra">
				    <label for="inputPassword3" class="col-sm-4 control-label">메뉴 가격</label>
				    <div class="col-sm-8">
				      <input style="width:500px;" type="number" name="mlprice" value="${menuList.mlprice}" class="form-control" id="inputPassword3" />
				    </div>
				  </div>
				  <div class="form-group barra">
				    <label for="inputPassword3" class="col-sm-4 control-label">메뉴 정보</label>
				    <div class="col-sm-8">
				      <input style="width:500px;" type="text" name="mlinfo" value="${menuList.mlinfo}" class="form-control" id="inputPassword3" />
				    </div>
				  </div>
				  <div class="form-group barra">
				    <label for="inputPassword3" class="col-sm-4 control-label">기존 사진</label>
				    <div class="col-sm-8">
				      <img src="showPhoto?mlsavedfile=${menuList.mlsavedfile}" style="width:500px; height:200px;" class="form-control" id="inputPassword3"/>
				    </div>
				  </div>
				  <div class="form-group barra">
				    <label for="inputPassword3" class="col-sm-4 control-label">새 사진</label>
				    <div class="col-sm-8">
				      <input style="width:500px;" type="file"  name="mlphoto" value="${menuList.mlsavedfile}" class="form-control" id="inputPassword3"/>
				    </div>
				  </div>
				  <div class="form-group barra">
				    <label for="inputPassword3" class="col-sm-4 control-label">선택</label>
				    <div class="col-sm-8">
				    	<input type="radio" name="mlishot" value="true"/>핫
						<input type="radio" name="mlishot" value="false"/>일반
				    </div>
				  </div>
				  <div class="form-group barra">
				  	<input type="submit"  class="btn center-block" value="수정"/>
				  </div>
				</form>
			</section>
			<!--end body form-->
			<!--foot form-->
			<section></section>
			<!--end foot form-->
		</div>
   </body>
</html>



<%--
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
						<input type="radio" name="mlishot" value="true"/>핫
						<input type="radio" name="mlishot" value="false"/>일반
					</td>
				</tr>
			</table> 
			<div style="margin-left:650px;">
				<input type="submit" value="수정"/>
			</div>		
		</form>
--%>