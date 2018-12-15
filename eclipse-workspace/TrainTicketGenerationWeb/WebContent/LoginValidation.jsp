<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Validation</title>
</head>
<body>

</body>
</html>

<%@page import = "java.sql.*" %>

<%
	String uname = request.getParameter("uname");
	String password = request.getParameter("password");
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost", "hr", "hr");
		Statement stmt = conn.createStatement();
  		ResultSet rs = stmt.executeQuery("Select uname, pass from Login where uname = '" + uname+"'");
  		
  		while (rs.next()) {
  			
  			
  			
	   		if (uname.equals(rs.getString(1)) && password.equals(rs.getString(2))){
	  		    response.sendRedirect("TrainApplication.html");
	  		 	
	   		}
	   		else
	   			response.sendRedirect("Login.html");

  		}
  		
	}	
	catch (SQLException e) { 
		e.printStackTrace();
	}
	
%>