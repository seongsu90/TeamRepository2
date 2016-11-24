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
 			
 			window.onload = function() {
				console.log("onLoad");
				var selCity = $("#selectedCity").val();
				var selProvince = $("#selectedProv").val();
 				$.ajax({
					url: "getProvince.jsp",
					data: {"selCity":selCity, "selProvince":selProvince},
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
 			
 			function setMlocation() {
 				console.log("setMlocation() 실행");
				$("#mlocation").val($("#selCity").val() + " "+ $("#selProvince").val()); 				
 			}
	    </script>
		<style type="text/css">
			.list {
				text-align: right;
				background-color: #ffccff;
				padding: 5px 5px;
				width: 100px;
			}
			
			.content {
				text-align: left;
				padding-left: 5px;
			}
		</style>
	</head>
	<body>
		<b>회원 정보 수정</b>
		<hr/>
		
		<form method="post">
			
			<table>
				<tr>
					<td class="list">아이디 </td>
					<td class="content">${member.mid}</td>
				</tr>
				
				<tr>
					<td class="list">비밀번호 </td>
					<td class="content"><input type="password" name="mpassword"></td>
				</tr>
				
				<tr>
					<td class="list">새로운 비밀번호 </td>
					<td class="content"><input type="password" name="newmpassword"></td>
				</tr>
				
				<tr>
					<td class="list">이름 </td>
					<td class="content">${member.mname}</td>
				</tr>
				
				<tr>
					<td class="list">휴대전화 </td>
					<td class="content"><input type="tel" name="mphone" value="${member.mphone}"></td>
				</tr>
				
				<tr>
					<td class="list">생일 </td>
					<td class="content">${member.mbirth}</td>
				</tr>
				
				<tr>
					<td class="list"> 관심지역 </td>
					<td class="content">
						시　도 | <select style="width: 110px" id="selCity" name="selCity">
								</select><br/>
						시군구 | <select style="width: 110px" id="selProvince" name="selProvince">
								</select>
								<input type="text" name="mlocation" id="mlocation" value="${member.mlocation}"/>
								<input type="hidden" name="selectedCity" id="selectedCity" value="${slocation[0]}"/>
								<input type="hidden" name="selectedProv" id="selectedProv" value="${slocation[1]}"/>
					</td>
				</tr>
				
				<tr>
					<td class="list">적립 포인트 </td>
					<td class="content">${member.mpoint}</td>
				</tr>
				
				<c:if test="${member.mresid==1}">
					<tr>
						<td class="list">보유 Restaurant </td>
						<td class="content">${member.mresid}</td>
					</tr>
				</c:if>
			</table>
			<br/>
			
			<input type="submit" value="수정하기"/>	&nbsp; <span style="color: red"><b>${error}</b></span> <br/>
		</form>
	</body>
</html>