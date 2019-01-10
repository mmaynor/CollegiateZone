package com.collegiatezone.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.collegiatezone.models.Account;
import com.collegiatezone.models.Cart;
import com.collegiatezone.models.Product;


public class RemoveFromCart extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		precessRequest(request, response);
	}
	
	protected void precessRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		int selected_product = Integer.parseInt(request.getParameter("index_del").toString());
		
	    HttpSession session = request.getSession();
	    	    
	    Cart cart = (Cart)session.getAttribute("cart");
	    cart.getProducts().remove(selected_product);
	    
	    cart.cart_total = cart.getTotalPrice();
	    cart.setProduct_count(cart.getProducts().size());
	  
	    session.setAttribute("cart", cart);
	    
	    String nextJSP = "/cart.jsp";
	    RequestDispatcher dispatcher = request.getRequestDispatcher(nextJSP);
	    dispatcher.forward(request,response);
		    
	
} 
	
}
