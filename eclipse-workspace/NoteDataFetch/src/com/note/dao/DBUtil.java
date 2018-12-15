package com.note.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	
	public static final String driver = "oracle.jdbc.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@localhost";
	public static final String userID = "hr";
	public static final String pass = "hr";

	public static Connection getConnection(){
		Connection c1= null;
		try {
			Class.forName(driver);
			c1 = DriverManager.getConnection(URL, userID, pass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c1;
	}
}