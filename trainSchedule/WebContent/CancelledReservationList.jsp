<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<fieldset>
<legend><b>Previous Reservations</b></legend>
<br/>
<form action="CancellingReservation.jsp" method="POST">
       
       Enter Your Reserve Number: <br/>
     <input type="text" name="reservenum" size="40" required/><br/>
     
 
      	
  
       <input type="submit" value="Submit"/>
     </form>
     <br/><div style="color:red">${errorMessage}</div>
</fieldset>
<br/>
<br/>
<p><a href='ReservationList.jsp'>List of Previous/Current Reservations</a></p>
</body>
</html>
