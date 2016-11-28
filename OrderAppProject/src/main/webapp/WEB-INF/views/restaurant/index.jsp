<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
	<head> 
		<meta charset="UTF-8">
	</head>
	<body> 
		Restaurant 메인 화면
		<hr/>		
		
	<c:if test="${mrank==0}">
              ※<a href="/teamapp/restaurant/list">전체 식당 리스트 열람 및 예약하기</a><br/>
              ※<a href="/teamapp/restaurant/list">나의 관심 지역 식당 리스트 열람 및 예약하기</a><br/>      
    </c:if>
    
    <c:if test="${mrank==2}">
              ※<a href="/teamapp/restaurant/list">식당 리스트 열람/수정/삭제</a><br/>
    </c:if>
    
    <c:if test="${mrank==1}">
              ※<a href="/teamapp/restaurant/info?resid=${resid}">나의 식당 정보 열람 및 수정</a><br/>
    </c:if>
    
    <c:if test="${mrank==2}">
   	      ※<a href="/teamapp/restaurant/add">식당 추가하기</a><br/>	
	      ※<a href="/teamapp/restaurant/delete">식당 삭제하기</a><br/> 
    </c:if>
    


	</body>
</html>