<%@ page contentType="text/html;charset=UTF-8"%>

<%
String selCity = request.getParameter("selCity");
String[] city = {"강원도", "경기도", "서울특별시"};
%>

<%
if ( selCity == "") {
%>
	<option value="선택">선택</option>
<%	
}

for ( int i = 0 ; i < city.length ; i++ ) {
	if ( selCity.equals(city[i]) ) {
%>
		<option value="<%=city[i]%>" selected><%=city[i]%></option>
<% 
	} else {
%>
		<option value="<%=city[i]%>"><%=city[i]%></option>
<%
	}
}
%>

