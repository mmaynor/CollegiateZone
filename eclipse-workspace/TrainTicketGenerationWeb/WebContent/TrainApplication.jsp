<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import = "java.sql.*, com.train.*, java.time.*, java.time.format.DateTimeFormatter" %>



<%

int tnum = Integer.parseInt(request.getParameter("tnum"));
String tdate = request.getParameter("tdate");
int pcount = Integer.parseInt(request.getParameter("pcount"));

Ticket ticket = new Ticket(); // start point for ticket object
TrainDAO tdao=new TrainDAO();
Trains train=null;
if(tdao.findTrain(tnum)!=null) {
	train=tdao.findTrain(tnum);
	ticket.setTrain(train);// setting train in ticket object

	LocalDate date = LocalDate.now();
	DateTimeFormatter fDate = DateTimeFormatter.ofPattern("MM/dd/yyyy");
	String cDate = date.format(fDate);
	LocalDate localCDate = LocalDate.parse(cDate, fDate);
	
	
	LocalDate localIDate = LocalDate.parse(tdate, fDate);
	
	if(!localCDate.isBefore(localIDate)) {
		out.println("Please enter a date after today");
		response.sendRedirect("TrainApplication.html");
	}else{
		ticket.setTravelDate(localIDate); //redirect passenger num to passenger.jsp
		HttpSession sess = request.getSession();
		sess.setAttribute("pcount", pcount);
		sess.setAttribute("Ticket", ticket);
		response.sendRedirect("Passenger.jsp");
	}
		/* out.println(train.getTrainNo());
		out.println(train.getSource());
		out.println(train.getDestination()); */
}else {
	
	response.sendRedirect("TrainApplication.html");
}

	
	
%>