<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int reservenum = request.getParamter("reservenum");
	
	if (reservenum == 0){
		request.setAttribute("errorMessage", "ERROR: Please enter reservation you are cancelling");
   		request.getRequestDispatcher("CancellingReservation.jsp").forward(request, response);
   		return;
   	}


	//String reseverationquery = "select transit_line, c_username, reserve_datetime, total_fare, reserve_num, trip_type, origin_departure_datetime, destination_arrival_datetime, origin_station_id, destination_station_id from Reservation where is_cancelled = 1 order by transit_line";
    String reseverationquery = "select transit_line, c_username, reserve_datetime, total_fare, reserve_num, trip_type, origin_departure_datetime, destination_arrival_datetime, origin_station_id, destination_station_id, is_cancelled from Reservation where is_cancelled = 1 order by c_username";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(
    		"jdbc:mysql://trainschedule36.cs9to86ym4fs.us-east-2.rds.amazonaws.com:3306/trainSchedule", "admin", "cs336group36");
    PreparedStatement stmt = con.prepareStatement(reseverationquery);
    ResultSet rs = stmt.executeQuery();
	String reserve_num = "select reserve_num from Reservation where is_cancelled = 1 order by c_username";
	PreparedStatement stmt2 = con.prepareStatement(reserve_num);
    ResultSet rs2 = stmt2.executeQuery();
	
    if (rs.next()) {
    //1) ask user if they would like to cancel or make a new reservation
	// is_cancelled = 0 to cancel reservation

	//2) ask user where they are (origin) and where they are heading to (destination)
	// that is the origin_departure_datetime, destination_arrival_datetime, origin_station_id, destination_station_id
	if(reservenum == reserve_num){
		String updateQuery = "update into Reservation(is_cancelled) values(0) ";
		PreparedStatement stmt3 = con.prepareStatement(updateQuery);
		stmt3.executeUpdate();
	}
	
    }
	
   
%>

</body>
</html>
