<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "com.train.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enter Passengers</title>
</head>
<body>
<% 
	HttpSession sess = request.getSession(false); 

	int pcount= Integer.parseInt(sess.getAttribute("pcount").toString());
	String pname ="";
	int age=0; 
	char pgender =' '; 
	Ticket ticket =(Ticket) sess.getAttribute("Ticket");
	

	
	%>
	
	
<form action="" method="get">	
<input type="hidden" name="action">
	<%for(int i =0 ;i<pcount;i++) {%>
		
			Enter Passenger Name:<input type="text" name="pname<%=i%>"><br>
			Enter Passenger Age:<input type="text" name="age<%=i%>"><br>
			Enter Passenger Gender:<input type="text" name="pgender<%=i%>"><br>
	
		
		
	<%}%>
	<input type="submit" value="Submit">
	</form>
		
	
<%	
if(request.getParameter("action")!=null){
	for(int i=0;i<pcount;i++){
		pname = request.getParameter("pname"+i);
		age = Integer.parseInt(request.getParameter("age" +i));
		pgender = request.getParameter("pgender" +i).charAt(0);
		/* out.println(pname);
		out.println(age);
		out.println(pgender); */
		ticket.addPassenger(pname, age, pgender);
	}
	ticket.generatePNR();
	
	response.sendRedirect("Payment.jsp");
}
	
%>
</body>
</html>


