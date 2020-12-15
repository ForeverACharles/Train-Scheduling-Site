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
    //request.setAttribute("user", "philFish");
	  String query = "select origin_departure_datetime, transit_line, c_username, total_fare, reserve_num from Reservation where is_cancelled = 1 && c_username = ? && origin_departure_datetime >= (SELECT CURRENT_TIMESTAMP) order by origin_departure_datetime desc";  
		   
  	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(
    		"jdbc:mysql://trainschedule36.cs9to86ym4fs.us-east-2.rds.amazonaws.com:3306/trainSchedule", "admin", "cs336group36");
    PreparedStatement stmt = con.prepareStatement(query);
    stmt.setString(1,session.getAttribute("user").toString());
    ResultSet rs = stmt.executeQuery(); 
%>
		<TABLE BORDER="1">
		<caption>Current Reservations</caption>
            <TR>
                <TH>Departure Time</TH>
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
                <td>
                	<form action="CancellingReservation.jsp">
                		<input type="hidden" name="reservenum" value="<%=rs.getString("reserve_num") %>">
                		<a href="#" onclick="this.parentNode.submit();"> Cancel </a>
                	</form>
                </td>
                
            </TR>
            <% } %>
            
        </TABLE>
        <div style="color:red">${error}</div>
	<%
	  String query2 = "select origin_departure_datetime, transit_line, c_username, total_fare, reserve_num from Reservation where c_username = ? && is_cancelled=1 && origin_departure_datetime < (SELECT CURRENT_TIMESTAMP) order by origin_departure_datetime desc";  
	 PreparedStatement stmt2 = con.prepareStatement(query2);
    stmt2.setString(1,session.getAttribute("user").toString());
    ResultSet rs2 = stmt2.executeQuery();
   
%>
         <p>
        </p>
        <TABLE BORDER="1">
		<caption>Past Reservations</caption>
            <TR>
                <TH>Departure Time</TH>
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
        <%
	  String query3 = "select origin_departure_datetime, transit_line, c_username, total_fare, reserve_num from Reservation where c_username = ? && is_cancelled = 0";  
	 PreparedStatement stmt3 = con.prepareStatement(query3);
    stmt3.setString(1,session.getAttribute("user").toString());
    ResultSet rs3 = stmt3.executeQuery();
   
%>
         <p>
        </p>
        <TABLE BORDER="1">
		<caption>Cancelled Reservations</caption>
            <TR>
                <TH>Departure Time</TH>
                <TH>Transit Line</TH>
                <TH>Customer Username</TH>
                <TH>Fare</TH>
                <TH>Reservation Number</TH>
            </TR>
            <% while(rs3.next()){ %>
            <TR>
                <TD> <%= rs3.getString(1) %></td>
                <TD> <%= rs3.getString(2) %></TD>
                <TD> <%= rs3.getString(3) %></TD>
                <TD> <%= rs3.getString(4) %></TD>
                <TD> <%= rs3.getString(5) %></TD>
            </TR>
            <% } %>
        </TABLE>
<p><a href='customerHome.jsp'>Back to home page.</a></p>
</body>
</html>