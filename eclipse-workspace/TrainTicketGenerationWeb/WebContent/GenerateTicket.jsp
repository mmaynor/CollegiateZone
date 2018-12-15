<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.train.Ticket,com.train.Trains, java.util.Map.Entry,com.train.Passenger, java.util.TreeMap,java.io.BufferedWriter, java.io.FileWriter,java.io.IOException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	HttpSession sess = request.getSession(false); 

	Ticket ticket=(Ticket)sess.getAttribute("Ticket");
	Trains train=ticket.getTrain();
	
	out.println("PNR:               " + ticket.getPnr()+"<br>");
	out.println("Train no:          " + train.getTrainNo()+"<br>");
	out.println("From:              " + train.getDestination()+"<br>");
	out.println("To:                " + train.getSource()+"<br>");
	out.println("Travel Date:       " + ticket.getTravelDate()+"<br>");
	out.println("<br> ");
	out.println("Passengers:"+"<br>");
	out.println("<br>");
	out.println("Name\t\t\t\t\t\tAge\t\t\t\t\t\tGender\t\t\t\t\t\tFare"+"<br>");
	
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
    out.println("Total Price:\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t"  + ticket.calculateTotalTicketPrice());
 



	BufferedWriter bw = null;
	FileWriter fw = null;
	

	try {
		fw = new FileWriter("C:\\Users\\Mine\\DigiTestFolder\\Train Application.txt");
		bw = new BufferedWriter(fw);
		
		bw.write("PNR:               " + ticket.getPnr());
		bw.newLine();
		bw.write("Train no:          " + train.getTrainNo());
		bw.newLine();
		bw.write("From:              " + train.getDestination());
		bw.newLine();
		bw.write("To:                " + train.getSource());
		bw.newLine();
		bw.newLine();
		bw.write("Travel Date:       " + ticket.getTravelDate());
		bw.newLine();
		bw.write("Passengers");
		bw.newLine();
		bw.newLine();
		bw.write("Name\t\t\t\t\t\tAge\t\t\t\t\t\tGender\t\t\t\t\t\tFare");
		bw.newLine();
		
		for(Entry<Passenger, Integer> entry : ticket.getpHash().entrySet()) {
			  Passenger key = entry.getKey();
			  Integer value = entry.getValue();

			  bw.write(key.getName() + "\t\t\t\t\t\t" + key.getAge() + "\t\t\t\t\t\t" + key.getGender() + "\t\t\t\t\t\t" +value);
			  bw.newLine();
		}
		bw.newLine();
		bw.write("Total Price:\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t"  + ticket.calculateTotalTicketPrice());
		bw.newLine();
		System.out.println("Ticket Printed");
	} catch (IOException e) {

		e.printStackTrace();

	} finally {

		try {

			if (bw != null)
				bw.close();

			if (fw != null)
				fw.close();

		} catch (IOException ex) {

			ex.printStackTrace();

		}

	}
	

%>
</body>
</html>