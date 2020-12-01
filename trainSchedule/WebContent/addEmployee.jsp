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
    String userid = request.getParameter("e_username");   
    String pwd = request.getParameter("e_password");  
    int ssn = Integer.parseInt(request.getParameter("ssn"));
    String first_name = request.getParameter("e_first_name");   
    String last_name = request.getParameter("e_last_name"); 
    if (userid.length() == 0 || pwd.length() == 0)
    {
    	request.setAttribute("errorMessage", "ERROR: Your username and password must each contain at least one character");
       	request.getRequestDispatcher("addForm.jsp").forward(request, response);
    }
    if (userid.length() > 45 || pwd.length() > 45)
    {
    	request.setAttribute("errorMessage", "ERROR: Your username and password cannot exceed the character limit of 45");
       	request.getRequestDispatcher("addForm.jsp").forward(request, response);
    }
    if (first_name.length() == 0 || last_name.length() == 0)
    {
    	request.setAttribute("errorMessage", "ERROR: Your fisrt and last name must each contain at least one character");
       	request.getRequestDispatcher("addForm.jsp").forward(request, response);
    }
    if (first_name.length() > 30 || last_name.length() > 30)
    {
    	request.setAttribute("errorMessage", "ERROR: Your first and last name cannot exceed the character limit of 30");
       	request.getRequestDispatcher("addForm.jsp").forward(request, response);
    }
    
    String query = "select * from Employee where ssn=?";
    
    
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(
    		"jdbc:mysql://trainschedule36.cs9to86ym4fs.us-east-2.rds.amazonaws.com:3306/trainSchedule", "admin", "cs336group36");
    PreparedStatement stmt = con.prepareStatement(query);
    stmt.setString(1, userid);
    ResultSet rs = stmt.executeQuery();
    
    
    if (!rs.next()) {
    	//session.setAttribute("user", userid); // the username will be stored in the session
    	
    	String updateQuery = "insert into Employee(ssn, e_last_name, e_first_name, e_username, e_password, e_type) values(?,?,?,?,?,?)";
    	PreparedStatement stmt2 = con.prepareStatement(updateQuery);
    	stmt2.setInt(1, ssn);
    	stmt2.setString(2, last_name);
    	stmt2.setString(3, first_name);
    	stmt2.setString(4, userid);
    	stmt2.setString(5, pwd);
        stmt2.setInt(6, 0);
     	stmt2.executeUpdate();
     	response.sendRedirect("admin.jsp");
    } 
    
    else {
        //out.println("Invalid password <a href='login.jsp'>try again</a>");
        request.setAttribute("errorMessage", "ERROR: This customer representative already exists");
       	request.getRequestDispatcher("addForm.jsp").forward(request, response);
    }
%>
</body>
</html>