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
<legend><b>Reservations</b></legend>
<br/>
<form action="Reservations.jsp" method="POST">
       
       Would You Like To Make A Reservation?<br/>
       <p><a href='CreatingReservation.jsp'>If Yes, create one here</a></p>
       <p><a href='CancelledReservationList.jsp'>If you'd like to cancel a reservation, click here</a></p> 
     </form>
     <br/><div style="color:red">${errorMessage}</div>
</fieldset>
<br/>
<br/>
</body>
</html>
