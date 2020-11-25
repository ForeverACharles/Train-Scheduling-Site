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
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    if (userid.length() == 0 || pwd.length() == 0)
    {
    	request.setAttribute("errorMessage", "ERROR: Your username and password must each contain at least one character");
       	request.getRequestDispatcher("createAccount.jsp").forward(request, response);
       	return;
    }
    if (userid.length() > 45 || pwd.length() > 45)
    {
    	request.setAttribute("errorMessage", "ERROR: Your username and password cannot exceed the character limit");
       	request.getRequestDispatcher("createAccount.jsp").forward(request, response);
       	return;
    }
    
    String query = "select * from Users where username=?";
    
    
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(
    		"jdbc:mysql://trainschedule36.cs9to86ym4fs.us-east-2.rds.amazonaws.com:3306/trainSchedule", "admin", "cs336group36");
    PreparedStatement stmt = con.prepareStatement(query);
    stmt.setString(1, userid);
    ResultSet rs = stmt.executeQuery();
    
    
    if (!rs.next()) {
    	session.setAttribute("user", userid); // the username will be stored in the session
    	
    	String updateQuery = "insert into Users(username, password) values(?,?)";
    	PreparedStatement stmt2 = con.prepareStatement(updateQuery);
    	stmt2.setString(1, userid);
    	stmt2.setString(2, pwd);
        
     	stmt2.executeUpdate();
     	response.sendRedirect("success.jsp");
    } 
    
    else {
        //out.println("Invalid password <a href='login.jsp'>try again</a>");
        request.setAttribute("errorMessage", "ERROR: This username has already been taken");
       	request.getRequestDispatcher("createAccount.jsp").forward(request, response);
    }
%>
</body>
</html>