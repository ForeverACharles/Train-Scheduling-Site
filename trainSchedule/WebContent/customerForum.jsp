<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../CSS/loginStyles.css" type="text/css">
<meta charset="UTF-8">
<title>Forum</title>
</head>
<body bgcolor = "#e6f2ff">
<strong style="font-size:30px">
	GROUP 36 TRAIN SCHEDULING SYSTEM
</strong>
<br/>
<br/>
<br/>
<form action="forumSearch.jsp">
	Search by keyword: <input type="text" name="keyword" size="40" required/> <input type="submit" value="search">
</form>
<form action="customerForum.jsp">
	<input type="submit" value="Show all posts">
</form>
<fieldset>
<legend><b>Discussions</b></legend>
<% Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(
    		"jdbc:mysql://trainschedule36.cs9to86ym4fs.us-east-2.rds.amazonaws.com:3306/trainSchedule", "admin", "cs336group36");
    
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select message_datetime, c_username, message_subject from Message order by message_datetime desc");
    while(rs.next())
    {
    	%><fieldset>
    	<form action="forumStep.jsp" method="post">
    		<input type="hidden" name="c_username" value="<%=rs.getString("c_username")%>"/>
    		<input type="hidden" name="message_datetime" value="<%=rs.getString("message_datetime")%>"/>
    		<a href="#" onclick="this.parentNode.submit();"> <%out.println(rs.getString("message_subject"));%></a>
    	</form>
    	<% 
    		out.println("by " + rs.getString("c_username") + ",");
    		out.println(rs.getString("message_datetime"));
    	%>
    	</fieldset>
    	<%
    }
%>
    		
 
</fieldset>
<p>Make a New Post:</p>
<form action="postQuestion.jsp" method="POST">
		Subject:<br>
      <input type="text" name="subject" size="40" required/><br>
      Body (max 500 characters):<br>
	<textarea name="message" rows="10" cols="100" required></textarea>
	<br>
	<input type="submit" value="submit">
</form>
</body>
</html>