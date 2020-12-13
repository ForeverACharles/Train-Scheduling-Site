<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Best customer</title>
</head>
<body bgcolor = "#e6f2ff">
	
<p></p>
<p></p>
<p></p>
<%
    if ((session.getAttribute("best") == null)) {
%>
no customers<br/>
<%} else {
%>
The best customer is <%=session.getAttribute("best")%> with <%=session.getAttribute("bestNum")%> reservations!
<p></p>
<p></p>
<p></p>
<p><a href='admin.jsp'>return to admin</a></p>
<%
    }
%>
</body>
</html>