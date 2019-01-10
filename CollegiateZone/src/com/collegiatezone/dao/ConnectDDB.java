package com.collegiatezone.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class ConnectDDB {
    
	public static Connection conn;
	public static Connection getConnection(){
    	
    	try {
    		Class.forName("oracle.jdbc.driver.OracleDriver"); 
	    	String dBUserName = "hr";
	        String dBPassword = "hr";
	        String url = "jdbc:oracle:thin:@localhost";
	        
	        Properties connectionProps = new Properties();
	        connectionProps.put("user", dBUserName);
	        connectionProps.put("password", dBPassword);
	        
				conn = DriverManager.getConnection(
				               url,
				               connectionProps);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		System.out.println("Connected to database");
		
        return conn;
    }
    
}
