<%@ page  contentType="application/json;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
<c:forEach var="restaurant" items="${list}" varStatus="status">
	{
		"resTitle" : "${restaurant.resname}",
		"resContent" : "${restaurant.resinfo}",
		"resImage" : "${restaurant.ressavedfile}"	
	}
	<c:if test="${!status.last}">,</c:if> <%--마지막줄이 아니면 ,를 붙여라 --%>
</c:forEach>
]