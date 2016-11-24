<%@ page contentType="text/html;charset=UTF-8"%>

<%
String selCity = request.getParameter("selCity");
/* String[] city = {"강원도", "경기도", "경상남도", "경상북도", "광주광역시", "대구광역시", "대전광역시", "부산광역시", "서울특별시", "세종특별자치시", "울산광역시", "인천광역시", "전라남도", "전라북도", "제주특별자치도", "충청남도", "충청북도"}; */
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
