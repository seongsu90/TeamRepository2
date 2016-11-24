  <%@ page  contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		 <link href="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/css/bootstrap.min.css" rel="stylesheet">

  
    <link href="${pageContext.servletContext.contextPath}/resources/css/justified-nav.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script>
 	<script>
 		$(function(){
 			$("nav li").on("click", function(){
 				$("nav li").removeClass("active");//jquery 이용
 				//this.setAttribute("class","active")//순수 DOM
 				$(this).addClass("active");
 			});
 		});
 	</script>
	</head>	
		<body>
			<form method="post" enctype="multipart/form-data">
			
				메뉴이름 : <input type="text" name="mlname" value="${menuList.mlname}"/><br/>	
				메뉴가격 : <input type="number" name="mlprice" value="${menuList.mlprice}"/><br/>
				식당아이디 : <input type="text" name="mlresid" value="${menuList.mlresid}"/><br/>
				메뉴 정보 : <input type="text" name="mlinfo" value="${menuList.mlinfo}"/><br/>
			     메뉴 사진 : <input type="file" name="mlphoto" value="${menuList.mlsavedfile}"/><br/>
				핫메뉴 선택 : <input type="radio" name="mlishot" value="true"/>핫해하태?
						   <input type="radio" name="mlishot" value="false"/>일반메뉴<br/> 
				
				<input type="submit" value="생성"/>
			</form>
		</body>
</html> 
 <%--
			<form method="post" enctype="multipart/form-data">
			
				메뉴이름 : <input type="text" name="mlname" value="${menuList.mlname}"/><br/>	
				메뉴가격 : <input type="number" name="mlprice" value="${menuList.mlprice}"/><br/>
				식당아이디 : <input type="text" name="mlresid" value="${menuList.mlresid}"/><br/>
				메뉴 정보 : <input type="text" name="mlinfo" value="${menuList.mlinfo}"/><br/>
			     메뉴 사진 : <input type="file" name="mlphoto" value="${menuList.mlsavedfile}"/><br/>
				핫메뉴 선택 : <input type="radio" name="mlishot" value="true"/>핫해하태?
						   <input type="radio" name="mlishot" value="false"/>일반메뉴<br/> 
				
				<input type="submit" value="생성"/>
			</form>
			--%>
 