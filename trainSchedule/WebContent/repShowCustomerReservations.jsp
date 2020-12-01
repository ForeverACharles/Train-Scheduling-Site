<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../CSS/loginStyles.css" type="text/css">
<meta charset="UTF-8">
<title>Login Form</title>
</head>
<body bgcolor = "#e6f2ff">
<strong style="font-size:30px">
	GROUP 36 TRAIN SCHEDULING SYSTEM
</strong>
<br/>
<br/>

<br/>
<%
		String query = "select c_username, transit_line, origin_departure_datetime from Reservation";  
    
  		Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverManager.getConnection(
    		"jdbc:mysql://trainschedule36.cs9to86ym4fs.us-east-2.rds.amazonaws.com:3306/trainSchedule", "admin", "cs336group36");
    	PreparedStatement stmt = con.prepareStatement(query);
    	ResultSet rs = stmt.executeQuery();
    	
    	%>
		<TABLE BORDER="1">
            <TR>
                <TH>Customer Username</TH>
                <TH>Transit Line</TH>
                <th>Departure Date</th>
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <TD> <%= rs.getString("c_username") %></td>
                <TD> <%= rs.getString("transit_line") %></TD>
                <TD> <%= rs.getString("origin_departure_datetime") %></TD>
                
            </TR>
            <% } %>
        </TABLE>
</body>
</html>