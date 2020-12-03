<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
    
    String query = "select reserve_datetime, transit_line, c_username, origin_station_id, destination_station_id, total_fare from Reservation where is_cancelled=1 order by reserve_datetime desc";  
    
  	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(
    		"jdbc:mysql://trainschedule36.cs9to86ym4fs.us-east-2.rds.amazonaws.com:3306/trainSchedule", "admin", "cs336group36");
    PreparedStatement stmt = con.prepareStatement(query);
    ResultSet rs = stmt.executeQuery();
    
   
%>
<p>Top 5 transit lines</p>
		<TABLE BORDER="1">
            <TR>
                <TH>Date</TH>
                <TH>Transit Line</TH>
                <TH>Customer username</TH>
                <TH>Origin Station ID</TH>
                <TH>Destination Station ID</TH>
                <TH>Total Fare</TH>
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <TD> <%= rs.getString(1) %></td>
                <TD> <%= rs.getString(2) %></TD>
                <TD> <%= rs.getString(3) %></TD>
                <TD> <%= rs.getString(4) %></TD>
                <TD> <%= rs.getString(5) %></TD>
                <TD> <%= rs.getString(6) %></TD>
                
            </TR>
            <% } %>
        </TABLE>
</body>
</html>