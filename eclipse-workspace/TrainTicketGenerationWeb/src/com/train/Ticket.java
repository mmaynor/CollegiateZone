package com.train;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Map.Entry;
import java.util.TreeMap;

public class Ticket {
	private int counter = 100;
	private String pnr;
	private LocalDate travelDate;; 
	private TreeMap<Passenger, Integer> pHash = new TreeMap<Passenger,Integer>();
	private Trains train;
	private double total = 0;
	double fare = 0;
	
	
	public Trains getTrain() {
		return train;
	}

	public void setTrain(Trains train) {
		this.train = train;
	}
	

	public int getCounter() {
		return counter;
	}

	public void setCounter(int counter) {
		this.counter = counter;
	}

	public String getPnr() {
		return pnr;
	}

	public void setPnr(String pnr) {
		this.pnr = pnr;
	}

	public LocalDate getTravelDate() {
		return travelDate;
	}
	

	public void setTravelDate(LocalDate travelDate) {
		this.travelDate = travelDate;
	}

	
	public void addPassenger(String pName, int pAge, char pGender) {
		Passenger passengers= new Passenger();
		
		passengers.setName(pName);
		passengers.setAge(pAge);
		passengers.setGender(pGender);
		
		calcPassengerFare(passengers);
		
		pHash.put(passengers, (int) fare);
		
		this.counter++;
		}
	public double calcPassengerFare(Passenger passengers) {
		double ticketPrice = train.getTicketPrice();
		
		if (passengers.getAge() <= 12) {
			fare = (ticketPrice * .5);	
		}
		else if (passengers.getAge() >= 60) {
			fare = (ticketPrice * .6);
		}
		else if (passengers.getGender() == 'f' || (passengers.getGender() == 'F')) {
			fare = (ticketPrice * .25);
			
		}
		else {
			fare = ticketPrice; 
		}
	return fare;
	}
	
	public double calculateTotalTicketPrice() {
		for(Entry<Passenger, Integer> entry : pHash.entrySet()) {
//			  Passenger key = entry.getKey();
			  Integer value = entry.getValue();

			  total = value + total;
			} 
	return total;
	}
	public String generatePNR ( ) {
		char sLetter = train.getSource().charAt(0);
		char dLetter = train.getDestination().charAt(0);
		StringBuilder spnr = new StringBuilder();
		spnr.append(sLetter);
		spnr.append(dLetter);
		spnr.append("-");
		spnr.append(this.travelDate);
		spnr.append("-");
		spnr.append(this.counter);
		pnr = spnr.toString();
	return pnr;
	}
	
	public void generateTicket() {
		System.out.println("PNR:               " + getPnr());
		System.out.println("Train no:          " + train.getTrainNo());
		System.out.println("From:              " + train.getDestination());
		System.out.println("To:                " + train.getSource());
		System.out.println("Travel Date:       " + this.travelDate);
		System.out.println(" ");
		System.out.println("Passengers:");
		System.out.println(" ");
		System.out.println("Name\t\t\t\t\t\tAge\t\t\t\t\t\tGender\t\t\t\t\t\tFare");
		
		for(Entry<Passenger, Integer> entry : pHash.entrySet()) {
			  Passenger key = entry.getKey();
			  Integer value = entry.getValue();

			  System.out.println(key.getName() + "\t\t\t\t\t\t" + key.getAge() + "\t\t\t\t\t\t" + key.getGender() + "\t\t\t\t\t\t" +value);
		} 
		System.out.println(" ");
	    System.out.println("Total Price:\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t"  + total);
		write();
	}
	public void write() {
		BufferedWriter bw = null;
		FileWriter fw = null;
		

		try {
			fw = new FileWriter("C:\\Users\\Mine\\DigiTestFolder\\Train Application.txt");
			bw = new BufferedWriter(fw);
			
			bw.write("PNR:               " + getPnr());
			bw.newLine();
			bw.write("Train no:          " + train.getTrainNo());
			bw.newLine();
			bw.write("From:              " + train.getDestination());
			bw.newLine();
			bw.write("To:                " + train.getSource());
			bw.newLine();
			bw.newLine();
			bw.write("Travel Date:       " + this.travelDate);
			bw.newLine();
			bw.write("Passengers");
			bw.newLine();
			bw.newLine();
			bw.write("Name\t\t\t\t\t\tAge\t\t\t\t\t\tGender\t\t\t\t\t\tFare");
			bw.newLine();
			
			for(Entry<Passenger, Integer> entry : pHash.entrySet()) {
				  Passenger key = entry.getKey();
				  Integer value = entry.getValue();

				  bw.write(key.getName() + "\t\t\t\t\t\t" + key.getAge() + "\t\t\t\t\t\t" + key.getGender() + "\t\t\t\t\t\t" +value);
				  bw.newLine();
			}
			bw.newLine();
			bw.write("Total Price:\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t"  + total);
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
		
	}

	public TreeMap<Passenger, Integer> getpHash() {
		return pHash;
	}
}
	

		
