<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create A Reservation</title>
</head>
<body>

<%
    int triptype = document.getElementById("trip_type").value;
	int triptype_value;

	if (document.getElementById("trip_type").checked){ //checks whether the element (in the radio button question) is selected
		triptype_value = document.getElementById("trip_type").value;
    }
	
// 	if (triptype_value != 0 || triptype_value != 1 ){
// 		request.setAttribute("errorMessage", "ERROR: Please type in 1 if it is a round trip or 0 if not");
//        	request.getRequestDispatcher("CreatingReservation.jsp").forward(request, response);
//        	return;
// 	}
	
	String childorsenior = document.getElementById("user").value;
	String childorsenior_value;
	if (document.getElementById("user").checked){ //checks whether the element (in the radio button question) is selected
		childorsenior_value = document.getElementById("user").value;
    }
// 	if (csd.length() > 8 || csd.length() == 0){
// 		request.setAttribute("errorMessage", "ERROR: Are you a child, senior, or disabled?");
//        	request.getRequestDispatcher("CreatingReservation.jsp").forward(request, response);
//        	return;
// 	}
	String[] checkbox = request.getParametervalues("disabled");
	
	
    String reseverationquery = "select transit_line, c_username, reserve_datetime, total_fare, reserve_num, trip_type, origin_departure_datetime, destination_arrival_datetime, origin_station_id, destination_station_id from Reservation where is_cancelled = 1 order by c_username";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(
    		"jdbc:mysql://trainschedule36.cs9to86ym4fs.us-east-2.rds.amazonaws.com:3306/trainSchedule", "admin", "cs336group36");
    PreparedStatement stmt = con.prepareStatement(reseverationquery);
    stmt.setInt(6, triptype_value);
    ResultSet rs = stmt.executeQuery();
	double totalfare = Double.parseDouble(request.getParameter("total_fare"));
    
	
    if (rs.next()) {
    //1) ask user if they would like to cancel or make a new reservation
	// is_cancelled = 1 to make reservation so we creating it now

	//2) ask user where they are (origin) and where they are heading to (destination)
	//that is the origin_departure_datetime, destination_arrival_datetime, origin_station_id, destination_station_id

	//3) ask user if the trip is round or one-way (1=round; 0=one-way)
  		if (triptype_value == 1){ //Round trip tickets have double fare
  			//total_fare = total_fare * 2;
  			String updateQuery = "insert into Reservation(total_fare) values (total_fare * 2)";
  		}
		
		//4) ask user if they are kids, senior, or disabled
		if (childorsenior_value.equals("Child")){// kids have 25% discount
			totalfare = totalfare - (totalfare * 0.25); 
  			String updateQuery = "insert into Reservation(total_fare) values (total_fare - (total_fare * 0.25))";
		}
		else if (childorsenior_value.equals("Senior")){// seniors have 35% discount
			totalfare = totalfare - (totalfare * 0.35); 
  			String updateQuery = "insert into Reservation(total_fare) values (total_fare - (total_fare * 0.35))";
		}
// 		else if (childorsenior_value.equals("Adult")){//comment out as this wouldn't really make a differnce 
// 			totalfare = totalfare; 
//   			String updateQuery = "insert into Reservation(total_fare) values (total_fare)";
// 		}
		else if (checkbox != null){// if box was checked, its disabled (or if the checkbox.length != empty as it would have something in array if disabled was checked on) //disabled have 50% discount
			totalfare = totalfare - (totalfare * 0.50);
			String updateQuery = "insert into Reservation(total_fare) values (total_fare - (total_fare * 0.50))";
		
		}
			
		//5) caluculate total fare according to info from user and print it out (make user even put card details if you want)
		System.out.println("Your total fare: " + totalfare);
		
    }
	
   
    
    
%>
</body>
</html>
