package com.collegiatezone.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collegiatezone.models.Account;
import com.collegiatezone.models.Product;

public class ProductDetails extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		precessRequest(request, response);
	}
	
	protected void precessRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Connection conn = ConnectDDB.getConnection();
		String nextJSP = "/product.jsp";
				
		int product_id = Integer.parseInt(request.getParameter("chosen_product").toString());
				
		try {
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement("SELECT * FROM Product4 WHERE Product_ID = ?");
			PreparedStatement ps2 = (PreparedStatement) conn.prepareStatement("SELECT * FROM Accounts WHERE Account_ID= ?");
			ps.setInt(1, product_id);
			ps2.setInt(1, Integer.parseInt(request.getSession().getAttribute("account_ID").toString()));
			
			ResultSet result = ps.executeQuery();
			ResultSet result2 = ps2.executeQuery();
			
			Account product_owner = new Account();
			Product product = new Product();
			
			while(result.next() && result2.next()){
				
				boolean book = false;
				if(result.getInt("is_book") != 0){
					book = true;	
				}
			
				
				product.setBook						(book);
				product.setOwner_ID				(Integer.parseInt(request.getSession().getAttribute("account_ID").toString()));
				product.setBrand						(result.getString("Manufacturer"));
				product.setCategory				(result.getString("Category"));
				product.setSub_category			(result.getString("Sub_category"));
				product.setISBN_10					(result.getString("ISBN_10"));
				product.setISBN_13					(result.getString("ISBN_13"));
				product.setPrice						(result.getFloat("Price"));
				product.setProduct_description(result.getString("Product_desc"));
				product.setPublisher				(result.getString("Publisher"));
				product.setPage_numbers		(result.getString("Page_number"));
				product.setProduct_ID				(result.getInt("Product_ID"));
				product.setProduct_name		(result.getString("Product_Name"));
				product.setProduct_num			(result.getString("Product_number"));
				product.setItem_model_name	(result.getString("item_model_name"));
				product.setItem_model_num	(result.getString("Item_model_number"));
				product.setLanguage				(result.getString("Language"));
				
				product_owner.setFirst_name(result2.getString("first_name"));
				product_owner.setLast_name(result2.getString("last_name"));
				product_owner.setCity(result2.getString("Res_city"));
				product_owner.setState(result2.getString("state"));
				product_owner.setUniversity(result2.getString("school"));
			}
			
			request.setAttribute("product_owner", product_owner);
			request.setAttribute("product", product);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
				
	    RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP);
	    dispatcher.forward(request,response);
		} 
}
