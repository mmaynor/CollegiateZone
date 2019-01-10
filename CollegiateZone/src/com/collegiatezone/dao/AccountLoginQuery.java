package com.collegiatezone.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;

import com.collegiatezone.models.Cart;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class AccountLoginQuery extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		precessRequest(request, response);
	}
	
	protected void precessRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Connection conn = ConnectDDB.getConnection();
		Cart cart = new Cart();
		try{
				String nextJSP = "/index_main.jsp";
				PreparedStatement ps=(PreparedStatement) conn.prepareStatement("SELECT "
							+ " Account_ID, "
						    + " First_Name,"
							+ " Middle_Initial, "
							+ " Last_Name, "
							+ " DATE_FORMAT(DOB, '%m-%d-%Y') DOB, "
							+ " Email_Address, "
							+ " Role, "
							+ " Res_street_address, "
							+ " state, "
							+ " Res_city, "
							+ " Res_zip, "
							+ " Phone_number, "	
							+ " Phone_number_second, "
							+ " school,"
							+ " Phone_type, "
							+ " Phone_type_second "
							+ " FROM Accounts WHERE Email_Address = ? AND  Password = ?");
				
			    ps.setString(1, request.getParameter("login"));
			    ps.setString(2, request.getParameter("password"));
				
				ResultSet result = ps.executeQuery();
			    
				if (!result.next())
			    {
			    	request.setAttribute("errorMessage", "The combination of username and password is not correct please try again!");
			    	nextJSP = "./login.jsp";
			    }
			
				
				HttpSession session = request.getSession();
				if(!session.isNew()){
					session.setAttribute("account_ID", new Integer(result.getInt("Account_ID")));
					session.setAttribute("first_name", result.getString("first_name"));
					session.setAttribute("middle_initial", result.getString("middle_initial"));
					session.setAttribute("last_name", result.getString("last_name"));
					session.setAttribute("date_of_birth", result.getString("DOB"));
					session.setAttribute("username", result.getString("Email_Address"));
					session.setAttribute("role", result.getString("Role"));
					session.setAttribute("street", result.getString("Res_street_address"));
					session.setAttribute("state", result.getString("state"));
					session.setAttribute("city", result.getString("Res_city"));
					session.setAttribute("telephone", result.getString("Phone_number"));
					session.setAttribute("zip_code", result.getString("Res_zip"));
					session.setAttribute("telephone_secondary", result.getString("Phone_number_second"));
					session.setAttribute("school", result.getString("school"));
					session.setAttribute("telephone_one_type", result.getString("Phone_type"));
					session.setAttribute("cart", cart);
				}
			
				
			    RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP);
			    dispatcher.forward(request,response);
		    
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
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
