package com.train;

public class Passenger implements Comparable <Passenger> {
	private String name;
	private int age = 0;
	private char gender;
	double fare = 0;
	
	public Passenger(String name, int age, char gender) {
		super();
		this.name = name;
		this.age = age;
		this.gender = gender;

	}
	public Passenger() {
		super();
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}
	@Override
	public int compareTo(Passenger passengers) {
		// TODO Auto-generated method stub
		return 1;
	}
	
	
	public String toString() {
		return this.name+","+this.age+","+this.gender;
		
	}
}
