package com.collegiatezone.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.collegiatezone.models.Product;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException; 
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.http.HttpSession;


public class UpdateProducts extends HttpServlet{
		
		Connection conn = ConnectDDB.getConnection();
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			precessRequest(request, response);
		}
		
		protected void precessRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			String nextJSP = "/update-products.jsp";
			int is_book = 0;
			double product_cost = 0.0;
			HttpSession session = request.getSession();
			int account_id = Integer.parseInt(session.getAttribute("account_ID").toString());
			
			Product product =(Product) request.getAttribute("product");
			
			/*if (request.getParameter("category").equalsIgnoreCase("book"))
			{
				is_book = 1;
			}*/
					
			try{
				PreparedStatement ps=(PreparedStatement) conn.prepareStatement("UPDATE Product4 "

						+ "("
						+ " Category = ?,"
						+ " Sub_category = ?,"
						+ " Sub_sub_category = ?,"
						+ " Manufacturer = ?,"
						+ " Price = ?,"
						+ " Product_number = ?,"
						+ " Product_name = ?,"
						+ " Item_model_number = ?,"
						+ " Item_model_name = ?,"
						+ " Is_book = ?,"
						+ " Publisher = ?, "
						+ " Language = ?, "
						+ " ISBN_10 = ?,"
						+ " ISBN_13 = ?,"
						+ " Page_number = ?,"
						+ " Product_desc= ? "
						+ "WHERE Product_ID =  " +  product.getProduct_ID() );
				
				//ps.setNull(1, java.sql.Types.INTEGER);
				//ps.setInt		(1, account_id);
				ps.setString		(1, request.getParameter("category"));
				ps.setString		(2, request.getParameter("sub_category") );
				ps.setString		(3, request.getParameter("sub_sub_category") );
				ps.setString		(4, request.getParameter("manufacturer"));
				ps.setDouble	(5, product_cost );
				ps.setString		(6, request.getParameter("product_number") );
				ps.setString		(7, request.getParameter("product_name") );
				ps.setString		(8, request.getParameter("item_model_number") );
				ps.setString		(9, request.getParameter("item_model_name") );
				ps.setInt			(10, is_book );
				ps.setString		(11, request.getParameter("publisher") );
				ps.setString		(12, request.getParameter("language") );
				ps.setString		(13, request.getParameter("ISBN_10") );
				ps.setString		(14, request.getParameter("ISBN_13") );
				ps.setString		(15, request.getParameter("page_number"));
				ps.setString		(16, request.getParameter("product_desc") );
				
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
