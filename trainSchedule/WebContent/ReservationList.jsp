<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Current and Past reservations</title>
</head>
<body bgcolor = "#e6f2ff">

<strong style="font-size:30px">
GROUP 36 TRAIN SCHEDULING SYSTEM
</strong>

	<%
    //request.setAttribute("user", "tmisirpash");
	  String query = "select reserve_datetime, transit_line, c_username, total_fare, reserve_num from Reservation where is_cancelled = 1 && c_username = ? && reserve_datetime >= (SELECT CURRENT_TIMESTAMP) order by reserve_datetime desc";  
		   
  	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(
    		"jdbc:mysql://trainschedule36.cs9to86ym4fs.us-east-2.rds.amazonaws.com:3306/trainSchedule", "admin", "cs336group36");
    PreparedStatement stmt = con.prepareStatement(query);
    stmt.setString(1,request.getAttribute("user").toString());
    ResultSet rs = stmt.executeQuery(); 
%>
		<TABLE BORDER="1">
		<caption>Current Reservations</caption>
            <TR>
                <TH>Reservation Time</TH>
                <TH>Transit Line</TH>
                <TH>Customer Username</TH>
                <TH>Fare</TH>
                <TH>Reservation Number</TH>
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <TD> <%= rs.getString(1) %></td>
                <TD> <%= rs.getString(2) %></TD>
                <TD> <%= rs.getString(3) %></TD>
                <TD> <%= rs.getString(4) %></TD>
                <TD> <%= rs.getString(5) %></TD>
                
            </TR>
            <% } %>
            
	<%
	  String query2 = "select reserve_datetime, transit_line, c_username, total_fare, reserve_num from Reservation where is_cancelled = 1 && c_username = ? && reserve_datetime < (SELECT CURRENT_TIMESTAMP) order by reserve_datetime desc";  
	 PreparedStatement stmt2 = con.prepareStatement(query2);
    stmt2.setString(1,request.getAttribute("user").toString());
    ResultSet rs2 = stmt2.executeQuery();
   
%>
        </TABLE>
         <p>
        </p>
        <TABLE BORDER="1">
		<caption>Past Reservations</caption>
            <TR>
                <TH>Reservation Time</TH>
                <TH>Transit Line</TH>
                <TH>Customer Username</TH>
                <TH>Fare</TH>
                <TH>Reservation Number</TH>
            </TR>
            <% while(rs2.next()){ %>
            <TR>
                <TD> <%= rs2.getString(1) %></td>
                <TD> <%= rs2.getString(2) %></TD>
                <TD> <%= rs2.getString(3) %></TD>
                <TD> <%= rs2.getString(4) %></TD>
                <TD> <%= rs2.getString(5) %></TD>
                
            </TR>
            <% } %>
        </TABLE>
</body>
</html>