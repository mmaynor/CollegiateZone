package com.collegiatezone.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class UpdateAccountUsername extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		precessRequest(request, response);
	}
	
	protected void precessRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String nextJSP = "/profile.jsp";
		Connection conn = ConnectDDB.getConnection();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
		if(testConnection()){
			try{ 
				PreparedStatement ps=(PreparedStatement) conn.prepareStatement("UPDATE Accounts "
						+" SET "
						+ " Email_Address = ?, "
						+ " WHERE "
						+ " Account_ID = " + request.getSession().getAttribute("account_ID"));
				
				ps.setString(1, 	request.getParameter("username"));
			
				ps.executeUpdate();
				conn.close();
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP);
			    dispatcher.forward(request,response);
			}
				
			catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	

	private boolean testConnection(){
		boolean isConnect = false;
		if(ConnectDDB.getConnection() != null){
			isConnect = true;
		}
		return isConnect;
	}
}
