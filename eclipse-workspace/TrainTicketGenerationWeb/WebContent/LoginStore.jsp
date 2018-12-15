<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import = "java.sql.*" %>

<%    
	String uname = request.getParameter("uname");
	String password = request.getParameter("password");
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost", "hr", "hr");
		Statement stmt = conn.createStatement();
  		int executeUpdate = stmt.executeUpdate("Insert into Login values('"+uname+"', '"+password+"')");
  		
  		if(executeUpdate!=0){
	        out.println("Registration Done Successfully");
	     }
	    else{
	        out.println("Registration failed");
	      }
	}
	catch (SQLException e) { 
		e.printStackTrace();
	}	

%>