<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html> 
	<head> 
		<meta charset="UTF-8">
		
		<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript">
		
 			$(document).ready(function() {
 				console.log("ready 실행");
 				setCity();
 				
 				$("#selCity").change(function () {
 					console.log("City Change");
 			        setProvince();
 			       $("#reslocation").val(""); 
 			    });
 				
 				$("#selProvince").change(function () {
 					console.log("Province Change");
 					setReslocation();
 			    });
 				
 				$("#detail").change(function () {
 					console.log("dtail Change");
 					setReslocation();
 			    });
			});
 			
 		 	window.onload = function() {
				console.log("onLoad");
				var selCity = $("#selectedCity").val();
				var selProvince = $("#selectedProv").val();
				var detail=$("#detail").val();
 				$.ajax({
					url: "getProvince.jsp",
					data: {"selCity":selCity, "selProvince":selProvince, "detail":detail},
					success: function (data) {
						$("#selProvince").html(data);
					}
				});
 				
			}; 
 			
 			
			function setCity() {
				console.log("setCity 실행");
				var selCity = $("#selectedCity").val();
				$.ajax({
					url: "getCity.jsp",
					data: {"selCity":selCity},
					success: function (data) {
						$("#selCity").html(data);
					}
				});
			}
			
 			function setProvince() {
 				console.log("setProvince 실행");
 				var selCity = $("#selCity").val();
 				$.ajax({
					url: "getProvince.jsp",
					data: {"selCity":selCity, "selProvince":null},
					success: function (data) {
						$("#selProvince").html(data);
					}
				});
			}
 			
 			function setDetail() {
 				console.log("setDetail 실행");
 				var detail = $("#detail").val();
 				$.ajax({
					url: "getDetail.jsp",
					data: {"selCity":selCity, "selProvince":selProvince, "detail":detail},
					success: function (data) {
						$("#detail").html(data);
					}
				});
			}
 			
 			function setReslocation() {
 				console.log("setReslocation() 실행");
				$("#reslocation").val($("#selCity").val() + " "+ $("#selProvince").val()+ " " +$("#detail").val()); 				
 			}
	    </script>
		
		<style type="text/css">
			* {
				font-family: 굴림;
				font-size: 12px;
			}
			table {
  				width:40%;
			}
			table, th, td {
   				border: 2px solid black;
    			border-collapse: collapse;
			}
			th, td {
  				padding: 5px;
    			text-align: left;
			}
			
			th {
  				background-color: black;
    			color: white;
			}
		
		</style>
	</head>
	<body> 
	식당 수정
	<hr/>
	<form method="post"  enctype="multipart/form-data">
		<input type="hidden" name="resid" value="${resid}"> 
		
		<table>
		<tr>
		<td style="background-color:#CCCCFF; width:150px">식당 이름</td>
		<td><input type="text" name="resname" style="width:600px" value="${restaurant.resname}"></td>
		</tr>
		
		<tr>
	
		<td style="background-color:#CCCCFF; width:150px"> 식당 위치 </td>
					<td>
						시　도 | <select style="width: 150px" id="selCity" name="selCity">
								</select><br/>
						시군구 | <select style="width: 150px" id="selProvince" name="selProvince">
								</select>
					    상세 주소 | <input type="text" id="detail" name="detail">
								<input type="text" name="reslocation" id="reslocation" value="${restaurant.reslocation}"/>
								<input type="hidden" name="selectedCity" id="selectedCity" value="${slocation[0]}"/>
								<input type="hidden" name="selectedProv" id="selectedProv" value="${slocation[1]}"/>
								<input type="hidden" name="detail" id="detail" value="${detail}"/>
				
					</td>


		</tr>
		
			<tr>
		<td style="background-color:#CCCCFF; width:150px">식당 전체 테이블 수</td>
		<td><input type="number" name="restotaltable" style="width:600px" value="${restaurant.restotaltable}"></td>
		</tr>
		
		<tr>
		<td style="background-color:#CCCCFF; width:150px">식당 정보</td>
		<td><textarea name="resinfo" style="width:600px; height:100px">${restaurant.resinfo}</textarea></td>
		</tr>
		
		<tr>
		<td style="background-color:#CCCCFF; width:150px">식당 전화번호</td>
		<td><input type="tel" name="restel" style="width:600px" value="${restaurant.restel}"></td>
		</tr>
		
		<tr>
		<td style="background-color:#CCCCFF; width:150px">식당 오픈타임</td>
		<td><input type="time" name="resopen" style="width:600px" value="${restaurant.resopen}"></td>
		</tr>
		
		<tr>
		<td style="background-color:#CCCCFF; width:150px">식당 클로즈타임</td>
		<td><input type="time" name="resclose" style="width:600px" value="${restaurant.resclose}"></td>
		</tr>
		
		<tr>
				<td style="background-color:#FFCC99; width:150px">기존 사진</td>
				<td><img src="showPhoto?ressavedfile=${restaurant.ressavedfile}" width="300px"></td>
			</tr>
		
		<tr>
		<td style="background-color:#CCCCFF; width:150px">식당 변경 사진</td>
		<td><input type="file" name="resphoto" value="${restaurant.ressavedfile}"></td>
		</tr>
		
		<tr>
		<td style="background-color:#CCCCFF; width:150px">식당 휴일</td>
		<td>
			  <input type="checkbox" name="closeday" value="월요일" >월요일
	          <input type="checkbox" name="closeday" value="화요일" >화요일
	          <input type="checkbox" name="closeday" value="수요일" >수요일
	          <input type="checkbox" name="closeday" value="목요일" >목요일
	          <input type="checkbox" name="closeday" value="금요일" >금요일
	          <input type="checkbox" name="closeday" value="토요일" >토요일
	          <input type="checkbox" name="closeday" value="일요일" >일요일 
	          <input type="checkbox" name="closeday" value="휴일 없음" >휴일 없음<br/>
		
		</td>
		</tr>
		
		</table>
		
		<input type="submit" value="수정하기"/>
	</form>
	</body>
</html>