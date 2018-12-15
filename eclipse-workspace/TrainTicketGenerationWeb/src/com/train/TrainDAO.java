package com.train;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TrainDAO {
	private String USERNAME = "hr";
	private String PASSWORD = "hr";

	// 
	public Trains findTrain(int trainNo) {
		try {
			Trains train=null;
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost", USERNAME, PASSWORD);
			Statement state = conn.createStatement();
			
			ResultSet result = null;           
	        result = state.executeQuery("select * from TRAINS where TRAIN_NO ="+trainNo);
	        
	        while(result.next()) {
	        	train=new Trains();
	        	train.setTrainNo(result.getInt(1));
	        	train.setTrainName(result.getString(2));
	        	train.setSource(result.getString(3));
	        	train.setDestination(result.getString(4));
	        	train.setTicketPrice(result.getDouble(5));
	      	   
	        
	        }
		        if(train!=null) {
		        	return train;
		        }
			 conn.close();  
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		return null;

	}
}
