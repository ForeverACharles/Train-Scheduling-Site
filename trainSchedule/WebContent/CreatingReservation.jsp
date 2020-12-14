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
<legend><b>Creating Reservation</b></legend>
<br/>
<form action="Reservations.jsp" method="POST">
       
       Would You Like To Reserve A Round Trip or One-way Trip?<br/>
  <input type="radio" id="trip_type" name="triptype" value=1>
  <label for="trip_type">Round Trip</label><br>
  
  <input type="radio" id="trip_type" name="triptype" value=0>
  <label for="trip_type">One-way Trip</label><br>

<!-- Child, senior or disabled? (have a check box for if disabled and in code if box is checked off, then add disable discount -->
      	Are you a...<br/>
      	<input type="radio" id="user" name="userage" value="Child">
  Child</label><br>
  <input type="radio" id="user" name="userage" value="Senior">
  Senior</label><br>
  	<input type="radio" id="user" name="userage" value="Adult">
  Adult</label><br>
  
   <input type="checkbox" id="disabled" name="disabled" value="1">
  <label for="disabled">Disabled</label><br>
  
       <input type="submit" value="Submit"/>
     </form>
     <br/><div style="color:red">${errorMessage}</div>
</fieldset>
<br/>
<br/>
</body>
</html>
