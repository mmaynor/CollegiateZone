package com.collegiatezone.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AddProductQuery extends HttpServlet {

	Connection conn = ConnectDDB.getConnection();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		precessRequest(request, response);
	}
	
	protected void precessRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int is_book = 0;
		double product_cost = 0.0;
		HttpSession session = request.getSession();
		int account_id = Integer.parseInt(session.getAttribute("account_ID").toString());
		
		//Calculate double value for cost of product since they used separate fields
		double integer_number = Integer.parseInt(request.getParameter("price"));
		double decimal_number = Double.parseDouble(request.getParameter("price_cents"))/100;
		product_cost = integer_number + decimal_number;
		
		if (request.getParameter("category").equalsIgnoreCase("book"))
		{
			is_book = 1;
		}
				if(testConnection()){
					try{
						PreparedStatement ps=(PreparedStatement) conn.prepareStatement("INSERT INTO Products "

								+ "("
								+ "Account_ID"
								+ "Category ,"
								+ " Sub_category,"
								+ " Sub_sub_category,"
								+ " Manufacturer,"
								+ " Price,"
								+ " Product_number,"
								+ " Product_name,"
								+ " Item_model_number,"
								+ " Item_model_name,"
								+ " Is_book,"
								+  "Publisher, "
								+ " Language, "
								+ " ISBN_10,"
								+ " ISBN_13,"
								+ " Page_number,"
								+ " Product_desc) "
								+" VALUES "
								+ " (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
						
						//ps.setNull(1, java.sql.Types.INTEGER);
						ps.setInt		(1, account_id);
						ps.setString	(2, request.getParameter("category"));
						ps.setString	(3, request.getParameter("sub_category") );
						ps.setString	(4, request.getParameter("sub_sub_category") );
						ps.setString	(5, request.getParameter("manufacturer"));
						ps.setDouble(6, product_cost );
						ps.setString	(7, request.getParameter("product_number") );
						ps.setString	(8, request.getParameter("product_name") );
						ps.setString(9, request.getParameter("item_model_number") );
						ps.setString(10, request.getParameter("item_model_name") );
						ps.setInt		(11, is_book );
						ps.setString(12, request.getParameter("publisher") );
						ps.setString(13, request.getParameter("language") );
						ps.setString(14, request.getParameter("ISBN_10") );
						ps.setString(15, request.getParameter("ISBN_13") );
						ps.setString(16, request.getParameter("page_number"));
						ps.setString(17, request.getParameter("product_desc") );
						
						ps.executeUpdate();
						conn.close();
					}
					
					catch(Exception e){
						e.printStackTrace();
					}
			}
	} 
	

	private boolean testConnection(){
		boolean isConnect = false;
		if(conn != null){
			isConnect = true;
		}
		return isConnect;
	}
	
}
