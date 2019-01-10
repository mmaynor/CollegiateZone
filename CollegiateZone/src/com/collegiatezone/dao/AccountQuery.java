package com.collegiatezone.dao;

import com.collegiatezone.models.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class AccountQuery extends ConnectDDB{

	Connection conn = getConnection();
	
	public int register(Account acct){
		
		int status=0; 
		try{ 
			if(testConnection()){
				PreparedStatement ps=(PreparedStatement) conn.prepareStatement("INSERT INTO Accounts VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"); 
				ps.setString(1, acct.getFirst_name() );
			    ps.setString(2, acct.getMiddle_initial() );
			    ps.setString(3, acct.getLast_name() );
			    ps.setString(4, acct.getDate_of_birth() );
			    ps.setString(5, acct.getUsername() );
			    ps.setString(6, acct.getPassword() );
			    ps.setString(7, acct.getStreet() );
			    ps.setString(8,acct.getState() );
			    ps.setString(9, acct.getCity() );
			    ps.setString(10, acct.getZip_code() );
			    ps.setString(11, acct.getTelephone() );
			    ps.setString(12, acct.getTelephone_secondary() );
			    ps.setString(13, acct.getUniversity() );
			    ps.setString(14, acct.getTelephone_one_type() );
			    ps.setString(15, acct.getTelephone_second_type() );
			    
			    System.out.println("Debugger has reached this location");
			    
			    status=ps.executeUpdate(); 
		    }
		}catch(Exception e){
			e.printStackTrace();
		} 

		return status; 
		} 

	private boolean testConnection(){
		boolean isConnect = false;
		if(getConnection() != null){
			isConnect = true;
		}
		return isConnect;
	}
	
}
