<%@ page contentType="text/html;charset=UTF-8"%>

<%
 request.setCharacterEncoding("UTF-8");
 
 String detail = request.getParameter("detail");

%>
{
 "detail" : "<%= detail %>"
}
