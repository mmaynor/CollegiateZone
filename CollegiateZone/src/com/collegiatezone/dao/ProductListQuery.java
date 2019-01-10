package com.collegiatezone.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collegiatezone.models.Product;


public class ProductListQuery extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		precessRequest(request, response);
	}
	
	protected void precessRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Connection conn = ConnectDDB.getConnection();
		try{ 
				String nextJSP = "/product_list.jsp";
				ArrayList<Product> product_list = new  ArrayList<Product>();
				PreparedStatement ps=(PreparedStatement) conn.prepareStatement("SELECT * FROM Product4 WHERE Account_ID = ? ");
				ps.setInt(1, Integer.parseInt(request.getSession().getAttribute("account_ID").toString()));
				ResultSet result = ps.executeQuery();
				
				while(result.next())
				{
					//The book attribute in object is a boolean but must be saved in database as an integer.
					//Zero represents false and any other number represents true
					boolean book = false;
					if(result.getInt("is_book") != 0){
						book = true;	
					}
					
					Product product = new Product();
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
					product_list.add						(product);
				}
			
				
				request.setAttribute("products", product_list);
				
				if (!result.next())
			    {
			    	request.setAttribute("empty_list", "You have no products listed Yet!! Would you like to add a product? <br />");
			    }
				
				
				
			    RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP);
			    dispatcher.forward(request,response);
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
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
