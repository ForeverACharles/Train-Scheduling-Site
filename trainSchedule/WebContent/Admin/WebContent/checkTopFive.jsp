<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Top 5 Transit Lines</title>
</head>
<body bgcolor = "#e6f2ff">
	<%
    
    String query = "select transit_line, count(*) as num from Reservation where is_cancelled=1 group by transit_line order by num desc limit 5";  
    
  	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(
    		"jdbc:mysql://trainschedule36.cs9to86ym4fs.us-east-2.rds.amazonaws.com:3306/trainSchedule", "admin", "cs336group36");
    PreparedStatement stmt = con.prepareStatement(query);
    ResultSet rs = stmt.executeQuery();
    
    
%>
<p>Top 5 transit lines</p>
<TABLE BORDER="1">
			<TR>
                <TH>Transit Line</TH>
                <TH>Number of Reservations</TH>
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <TD> <%= rs.getString(1) %></TD>
                <TD> <%= rs.getString(2) %></TD>
            </TR>
            <% } %>
        </TABLE>
         <p>
        </p>
<a href='admin.jsp'>Return to admin page</a>
</body>
</html>