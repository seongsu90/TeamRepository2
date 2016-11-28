<%@ page contentType="text/html;charset=UTF-8"%>

{
	"resid" : ${restaurant.resid},
	"resname" : "${restaurant.resname}",
	"reslocation" : "${restaurant.reslocation}",
	"restotaltable" : ${restaurant.restotaltable},
	"resinfo" : "${restaurant.resinfo}",
	"restel" : "${restaurant.restel}",
	"rescloseday" : "${restaurant.rescloseday}",
	"resopen" : "${restaurant.resopen}",
	"resclose" : "${restaurant.resclose}"
	
}




<%-- <!DOCTYPE html>
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
 			
			function setCity() {
				console.log("setCity 실행");
				$.ajax({
					url: "getCity.jsp",
					data: {"selCity":null},
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
				$("#reslocation").val($("#selCity").val() + " "+ $("#selProvince").val() + " "+$("#detail").val());  				
 			}
 			
 			
 			
	    </script>
		
		
	</head>
	<body> 
	Restaurant 추가
		<hr/>		
		

		<form method="post" enctype="multipart/form-data">
			식당 이름 : <input type="text" name="resname" value="${restaurant.resname}"/><br/>
			식당 위치 :
			 시　도 | <select style="width: 100px" id="selCity" name="selCity"></select><br/>
	　 　　 　 시군구 | <select style="width: 100px" id="selProvince" name="selProvince"> 
						<option value="선택">선택</option> </select><br/>
			&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 상세 주소 | <input type="text" id="detail" name="detail">
			
			
			<input type="text" name="reslocation" id="reslocation"/>
			<br/>
			식당 테이블 수 : <input type="number" name="restotaltable" value="${restaurant.restotaltable}"/><br/>
			식당 정보 : <input type="text" name="resinfo" value="${restaurant.resinfo}"/><br/>
			식당 전화번호 : <input type="tel" name="restel" value="${restaurant.restel}"/><br/>
			식당 OPEN TIME : <input type="time" name="resopen" value="${restaurant.resopen}"/><br/>
			식당 CLOSE TIME : <input type="time" name="resclose" value="${restaurant.resclose}"/><br/>			
		    식당 사진 :<input type="file" name="resphoto"/><br/>   
					

			식당 휴일:<input type="checkbox" name="closeday" value="월요일" >월요일
			          <input type="checkbox" name="closeday" value="화요일" >화요일
			          <input type="checkbox" name="closeday" value="수요일" >수요일
			          <input type="checkbox" name="closeday" value="목요일" >목요일
			          <input type="checkbox" name="closeday" value="금요일" >금요일
			          <input type="checkbox" name="closeday" value="토요일" >토요일
			          <input type="checkbox" name="closeday" value="일요일" >일요일 
			          <input type="checkbox" name="closeday" value="휴일 없음" >휴일 없음<br/> 
									
		
			<input type="submit" value="식당 추가 완료"/><br/>		
		</form>
	</body>
</html> --%>