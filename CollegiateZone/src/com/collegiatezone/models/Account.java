package com.collegiatezone.models;

public class Account implements java.io.Serializable{
 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String first_name;
	
	private String last_name;
	
	private String middle_initial;
	
	private String date_of_birth;
	
	private String username;
	
	private String password;
	
	private String role;
	
	private String street;
	
	private String state;
	
	private String city;
	
	private String zip_code;
	
	private String telephone;
	
	private String telephone_secondary;
	
	private String telephone_one_type;
	
	private String telephone_second_type;
	
	private String university;
	
	public Account(){
		
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getMiddle_initial() {
		return middle_initial;
	}

	public void setMiddle_initial(String middle_initial) {
		this.middle_initial = middle_initial;
	}

	public String getDate_of_birth() {
		return date_of_birth;
	}

	public void setDate_of_birth(String date_of_birth) {
		this.date_of_birth = date_of_birth;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getTelephone_secondary() {
		return telephone_secondary;
	}

	public void setTelephone_secondary(String telephone_secondary) {
		this.telephone_secondary = telephone_secondary;
	}

	public String getTelephone_one_type() {
		return telephone_one_type;
	}

	public void setTelephone_one_type(String telephone_one_type) {
		this.telephone_one_type = telephone_one_type;
	}

	public String getTelephone_second_type() {
		return telephone_second_type;
	}

	public void setTelephone_second_type(String telephone_second_type) {
		this.telephone_second_type = telephone_second_type;
	}

	public String getUniversity() {
		return university;
	}

	public void setUniversity(String university) {
		this.university = university;
	}
	
}
