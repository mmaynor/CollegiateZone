package com.train;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;

//class 

public class TicketApplication {
	public static int trainNums (int tNum) {
		return tNum;
	}
	
	public static void main(String[] args) {
		int tNum = 0;
		String tDate;
		int noOfPass = 0;
		String pName = "";
		int pAge = 0;
		char pGender = ' ';
		
		Ticket ticket = new Ticket(); // start point for ticket object
		Passenger passengers=new Passenger();
		TrainDAO tdao=new TrainDAO();
		
		Scanner s = new Scanner(System.in);
		
		Trains train=null;
		while (train==null) {
		System.out.println("Enter train number:");
		tNum = s.nextInt();
		s.nextLine();
		
		
	
		
		if(tdao.findTrain(tNum)!=null) {
			train=tdao.findTrain(tNum);
			
			ticket.setTrain(train);// setting train in ticket object
		}else {
			System.out.println("Train does not exists");
		}
		}
		System.out.println("Enter travel date (Date Format: MM/DD/0000):");
		tDate = s.nextLine();
		
		LocalDate date = LocalDate.now();
		DateTimeFormatter fDate = DateTimeFormatter.ofPattern("MM/dd/yyyy");
		String cDate = date.format(fDate);
		LocalDate localCDate = LocalDate.parse(cDate, fDate);
		
		
		LocalDate localIDate = LocalDate.parse(tDate, fDate);
		
		while(!localCDate.isBefore(localIDate)) {
			System.out.println("Please enter a date after today");
		}
			ticket.setTravelDate(localIDate);
		
		System.out.println("Enter number of passengers:");
		noOfPass = s.nextInt();
		s.nextLine();
	
		
		for (int i = 0; i < noOfPass; i++) {
			System.out.println("Enter passenger name");
			pName = s.nextLine();
			
			System.out.println("Enter passenger age");
			pAge = s.nextInt();
			s.nextLine();
			
			
			System.out.println("Enter passenger gender (M or F) or (m or f)");
			pGender = s.nextLine().charAt(0);
			
			ticket.addPassenger(pName, pAge, pGender);
		} 
			
		
		ticket.generatePNR();
//		ticket.calcPassengerFare(passengers);
		ticket.calculateTotalTicketPrice();
		ticket.generateTicket();

		}

}
