<%@ page contentType="application/json;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

{
	"ptableno":${ptableno},
	"totalPrice":${totalPrice}, 
	"eventPrice":${eventPrice},
	"point":${point},
	"result":${result},
	"menu": [
		<c:forEach var="menu" items="${menuList}" varStatus="status">
			{
				"mname":"${menu.mlname}", 
				"mcount":
				<c:set var="mcount" value="0"></c:set>
				<c:forEach var="pos" items="${posList}">
					<c:if test="${pos.pmlname == menu.mlname}">
						<c:set var="mcount" value="${pos.pcount}"></c:set>
					</c:if>
				</c:forEach>
				"${mcount}",
				"mprice":${menu.mlprice},
				
				"eprice":
				<c:set var="eprice" value="0"></c:set>
				<c:forEach var="event" items="${eventMenu}">
					<c:if test="${menu.mlname == event.emlname}">
						<c:set var="eprice" value="${event.eprice}"></c:set>
					</c:if>
				</c:forEach>
				"${eprice}"
			}
			<c:if test="${!status.last}">,</c:if>
		</c:forEach>
	]	
}



