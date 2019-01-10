package com.collegiatezone.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteProducts extends HttpServlet{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		precessRequest(request, response);
	}

	protected void precessRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Connection conn = ConnectDDB.getConnection();
		
			try{
				PreparedStatement ps = (PreparedStatement) conn.prepareStatement("DELETE FROM Product4 WHERE Product_ID = ?");
				ps.setInt(1, Integer.parseInt(request.getAttribute("").toString()));
				ps.executeUpdate();
			}
			catch(Exception e){
				e.printStackTrace();
			}
	}
	
}
