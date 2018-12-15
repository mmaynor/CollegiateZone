package com.train;

public class Trains {
	private int trainNo = 0;
	private String trainName;
	private String source;
	private String destination;
	private double ticketPrice = 0;
	
	
	public Trains(int trainNo, String trainName, String source, String destination, double ticketPrice) {
	super();
	this.trainNo = trainNo;
	this.trainName = trainName;
	this.source = source;
	this.destination = destination;
	this.ticketPrice = ticketPrice;
	}

	public Trains() {
		super();
	}

	public int getTrainNo() {
		return trainNo;
	}

	public void setTrainNo(int trainNo) {
		this.trainNo = trainNo;
	}


	public String getTrainName() {
		return trainName;
	}


	public void setTrainName(String trainName) {
		this.trainName = trainName;
	}


	public String getSource() {
		return source;
	}


	public void setSource(String source) {
		this.source = source;
	}


	public String getDestination() {
		return destination;
	}


	public void setDestination(String destination) {
		this.destination = destination;
	}


	public double getTicketPrice() {
		return ticketPrice;
	}


	public void setTicketPrice(double ticketPrice) {
		this.ticketPrice = ticketPrice;
	}
	
}


