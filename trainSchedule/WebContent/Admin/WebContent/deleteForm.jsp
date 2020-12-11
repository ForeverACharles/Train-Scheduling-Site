<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete form</title>
</head>
<body bgcolor = "#e6f2ff">
<p></p>
<p></p>
<p></p>
<div style="color:red">${errorMessage}</div>
<p>Enter information for customer representative</p>
<form action="deleteEmployee.jsp" method="POST">
        ssn: <input type="text" name="ssn"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
<p>
<a href='admin.jsp'>Return to admin page</a>
</p>
</body>
</html>