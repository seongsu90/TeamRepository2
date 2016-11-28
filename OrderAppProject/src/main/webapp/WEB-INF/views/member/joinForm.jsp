<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
 			       $("#mlocation").val(""); 
 			    });
 				
 				$("#selProvince").change(function () {
 					console.log("Province Change");
 					setMlocation();
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
 			
 			function setMlocation() {
 				console.log("setMlocation() 실행");
				$("#mlocation").val($("#selCity").val() + " "+ $("#selProvince").val()); 				
 			}
 			
 			function requestcnum() {
 				console.log("getcnum() 실행");
 				$.ajax({
 					url: "requestCnum.jsp",
 					success: function() {
 						$("#cnumposition").html(data);
 					} 					
 				});
 			}
 			
			function checkcnum() {
 				console.log("checkcnum() 실행");
 				
 			}
 			
 			
	    </script>
	</head>
	<body>
		<b>회원 가입</b>
		<hr/>
		<form method="post">
			아이디 : <input type="text" name="mid" value="${member.mid}"/> &nbsp; <span style="color: red"><b>${error}</b></span>
			<br/>
			
			이름 : <input type="text" name="mname" value="${member.mname}"/>
			<br/>
			
			패스워드 : <input type="password" name="mpassword"/>
			<br/>
			
			휴대전화 : <input type="tel" name="mphone" value="${member.mphone}"/> <button id="requestcnum" onclick="requestcnum()">인증번호요청</button>
			<br/>
			
			<div id="cnumposition"></div>
			<br/>
			
			생일 : <input type="date" name="mbirth" value="${member.mbirth}"/>
			<br/>
			
			관심지역 :
			시　도 | <select style="width: 100px" id="selCity" name="selCity"></select><br/>
	　 　　 　 시군구 | <select style="width: 100px" id="selProvince" name="selProvince">
						<option value="선택">선택</option>
					</select>			
			<input type="text" name="mlocation" id="mlocation"/>
			<br/>

			<input type="submit" value="가입"/> &nbsp; <span style="color: red"><b>${error2}</b></span><br/>
		</form>
			
	</body>
</html>