<%@ page contentType="application/json;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

{
	"resid" : ${restaurant.resid},
	"resname" : "${restaurant.resname}",
	"reslocation" : "${restaurant.reslocation}",
	"restotaltable" : ${restaurant.restotaltable},
	"resinfo" : "${restaurant.resinfo}",
	"restel" : "${restaurant.restel}",
	"rescloseday" : "${restaurant.rescloseday}",
	"resopen" : "${restaurant.resopen}",
	"resclose" : "${restaurant.resclose}",
	"ressavedfile" : "${restaurant.ressavedfile}",
	
	"menu": [
		<c:forEach var="menu" items="${menuList}" varStatus="status">
			{
				"mlname":"${menu.mlname}",
				"mlprice":${menu.mlprice}			
			}		
			<c:if test="${!status.last}">,</c:if>
		</c:forEach>		
	]
}
