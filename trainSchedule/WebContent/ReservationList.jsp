<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../CSS/loginStyles.css" type="text/css">
<meta charset="UTF-8">
<title>Reservation Lists</title>
</head>
<body bgcolor = "#e6f2ff">
<strong style="font-size:30px">
	GROUP 36 TRAIN SCHEDULING SYSTEM
</strong>
<br/>
<br/>
<br/>
<fieldset>
<legend><b>Reservation Lists</b></legend>
<br/>
<form action="ReservationList.jsp" id ="searchForm" method="GET">
<input type="text" id="pastreservations" name="pastreservations" size="60"/>
      
<%
				 Class.forName("com.mysql.jdbc.Driver");
			       Connection con = DriverManager.getConnection("jdbc:mysql://trainschedule36.cs9to86ym4fs.us-east-2.rds.amazonaws.com:3306/trainSchedule", "admin", "cs336group36");
			       PreparedStatement stmt;
			       ResultSet rs;
			       %>
       <label for="Date"> filter by Dates: </label>
			<select name="Date" id="Date" form="searchForm">
				<option value="none" selected hidden>select date</option>
				
			       <%
		        String dateFormat = "%b %D, %Y";
				String query = "select * from Reservation where reserve_datetime <= (select date_format(reserve_datetime, '" + dateFormat + "') Date from Reservation)";
		        //String query = "select date_format(reserve_datetime, '" + dateFormat + "') Date from Reservation";
		        try
		        {
		        	stmt = con.prepareStatement(query);
		        	rs = stmt.executeQuery(query);
		       
		        	while(rs.next()){
		    			%><option value="<%=rs.getString("Date")%>"><%=rs.getString("Date")%></option><% 
		    		} 
		        }
		        catch(Exception e){
		        }
		        %>
		        
      
<br/>
<br/>  
     </form>
     <div style="color:red">${errorMessage}</div>
</fieldset>

</body>
</html>
