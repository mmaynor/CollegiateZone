package com.collegiatezone.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




public class UpdateAccountDetails extends HttpServlet {
				
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			precessRequest(request, response);
		}
		
		protected void precessRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			String nextJSP = "/profile.jsp";
			Connection conn = ConnectDDB.getConnection();
			
			if(testConnection()){
				try{ 
					PreparedStatement ps=(PreparedStatement) conn.prepareStatement("UPDATE Accounts "
							+" SET "
							+ " First_Name = ?,"
							+ " Middle_Initial = ?, "
							+ " Last_Name = ?, "
							+ " DOB = ?,"
							+ " Res_street_address = ?,"
							+ " state = ?,"
							+ " Res_city = ?,"
							+ " Res_zip = ?, "
							+ " Phone_number = ?, "	
							+ " Phone_number_second = ?,"
							+ " school = ?,"
							+ " Phone_type = ?, "
							+ " Phone_type_second = ?"
							+ "WHERE Account_ID = " + request.getSession().getAttribute("account_ID"));
					
					ps.setString(1, 	request.getParameter("first_name"));
					ps.setString(2, 	request.getParameter("middle_initial"));
					ps.setString(3, 	request.getParameter("last_name"));
					ps.setString(4, 	request.getParameter("date_of_birth"));
					ps.setString(5, 	request.getParameter("street"));
					ps.setString(6, 	request.getParameter("state"));
					ps.setString(7, 	request.getParameter("city"));
					ps.setString(8, 	request.getParameter("zip_code"));
					ps.setString(9, 	request.getParameter("telephone"));
					ps.setString(10, 	request.getParameter("telephone_secondary"));
					ps.setString(11, 	request.getParameter("school"));
					ps.setString(12, 	request.getParameter("telephone_one_type"));
					ps.setString(13, 	request.getParameter("telephone_two_type"));
				
					ps.executeUpdate();
					conn.close();
					
					HttpSession session = request.getSession();
					session.setAttribute("first_name", request.getParameter("first_name"));
					session.setAttribute("middle_initial", request.getParameter("middle_initial"));
					session.setAttribute("last_name", request.getParameter("last_name"));
					session.setAttribute("date_of_birth", request.getParameter("date_of_birth"));
					session.setAttribute("street", request.getParameter("street"));
					session.setAttribute("state", request.getParameter("state"));
					session.setAttribute("city", request.getParameter("city"));
					session.setAttribute("telephone", request.getParameter("Phone_number"));
					session.setAttribute("zip_code", request.getParameter("zip_code"));
					session.setAttribute("telephone_secondary", request.getParameter("telephone_secondary"));
					session.setAttribute("school", request.getParameter("school"));
					session.setAttribute("telephone_one_type", request.getParameter("telephone_one_type"));
					
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
		
		public Date buildDate(String date){
			StringTokenizer full_date = new StringTokenizer("/",date);
			int month =Integer.parseInt(full_date.nextToken());
			int day = Integer.parseInt(full_date.nextToken());
			int year = Integer.parseInt(full_date.nextToken());
			Date new_date = new Date(year,month,day);
			return new_date;
		}
	}
