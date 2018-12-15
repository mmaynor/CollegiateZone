<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.train.Ticket,com.train.Trains, java.util.Map.Entry,com.train.Passenger, java.util.TreeMap,java.io.BufferedWriter, java.io.FileWriter,java.io.IOException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment</title>
</head>
<body>
	<form action = "GenerateTicket.jsp" name = "pay">
		<input type="hidden" name="action">
		Enter Credit Card Number:<input type ="text" name = "card">
		Enter Expiration Date:<input type = "text" name = "exp">
		Enter CSC Code:<input type = "text" name = "csc">
		<input type ="submit" value="Click">
	</form>
</body>
</html>

<%

if(request.getParameter("action")!=null){
	int card = Integer.parseInt(request.getParameter("card"));

if (card < 16) {
	response.sendRedirect("pay");
}
}

HttpSession sess = request.getSession(false);
Ticket ticket = (Ticket) sess.getAttribute("Ticket");
for(Entry<Passenger, Integer> entry : ticket.getpHash().entrySet()) {
	Passenger key = entry.getKey();
	Integer value = entry.getValue();

	out.println("<html><table border=1><tr>");
	out.println("<tr><th>Passenger Name</th>");
	out.println("<th>Passenger Age</th>");
	out.println("<th>Passenger Gender</th>");
	out.println("<th>Ticket Price</th><tr>");
	out.println("<td>"+key.getName()+"</td>");
	out.println("<td>"+key.getAge()+"</td>"); 
	out.println("<td>"+key.getAge()+"</td>"); 
	out.println("<td>"+value+"</td>");
	out.println("</tr></table></html>");

} 
out.println("<br>");
out.println("Total Price:\t"  + ticket.calculateTotalTicketPrice());

//ticket.generateTicket(); 
//sess.setAttribute("Ticket",ticket);
%>


		
		
		
		