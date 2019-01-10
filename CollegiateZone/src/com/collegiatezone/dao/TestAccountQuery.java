package com.collegiatezone.dao;

import java.io.IOException; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.collegiatezone.models.Cart;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.http.HttpSession;



public class TestAccountQuery extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		precessRequest(request, response);
	}
	
	protected void precessRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Connection conn = ConnectDDB.getConnection();
		Cart cart = new Cart();
		try{ 
				PreparedStatement ps=(PreparedStatement) conn.prepareStatement("INSERT INTO Accounts VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				ps.setNull(1, java.sql.Types.INTEGER);
				ps.setString(2, request.getParameter("first_name") );
			    ps.setString(3, request.getParameter("middle_initial") );
			    ps.setString(4, request.getParameter("last_name") );
			    ps.setString(5, request.getParameter("date_of_birth"));
			    ps.setString(6, request.getParameter("username") );
			    ps.setString(7, request.getParameter("password") );
			    ps.setString(8, request.getParameter("role") );
			    ps.setString(9, request.getParameter("street") );
			    ps.setString(10, request.getParameter("state") );
			    ps.setString(11, request.getParameter("city") );
			    ps.setString(12, request.getParameter("zip_code") );
			    ps.setString(13, request.getParameter("telephone") );
			    ps.setString(14, request.getParameter("telephone_secondary") );
			    ps.setString(15, request.getParameter("telephone_one_type") );
			    ps.setString(16, request.getParameter("telephone_seond)type") );
			    ps.setString(17, request.getParameter("uiniversity") );
			    
			    HttpSession session = request.getSession();
				session.setAttribute("first_name", request.getParameter("first_name"));
				session.setAttribute("middle_initial", request.getParameter("middle_initial"));
				session.setAttribute("last_name", request.getParameter("last_name"));
				session.setAttribute("date_of_birth", request.getParameter("date_of_birth"));
				session.setAttribute("username", request.getParameter("username"));
				session.setAttribute("role", request.getParameter("role"));
				session.setAttribute("street", request.getParameter("street"));
				session.setAttribute("state", request.getParameter("state"));
				session.setAttribute("city", request.getParameter("city"));
				session.setAttribute("telephone", request.getParameter("telephone"));
				session.setAttribute("zip_code", request.getParameter("zip_code"));
				session.setAttribute("telephone_secondary", request.getParameter("telephone_secondary"));
				session.setAttribute("school", request.getParameter("university"));
				session.setAttribute("telephone_one_type", request.getParameter("telephone_one_type"));
				session.setAttribute("cart", cart);
				
			    System.out.println("Debugger has reached this location");
			    
			    ps.executeUpdate(); 
			    
			    String nextJSP = "/index_main.jsp";
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
