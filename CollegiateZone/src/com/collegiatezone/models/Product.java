package com.collegiatezone.models;


public class Product {

	private int product_ID;
	
	private int owner_ID;
	
	private boolean active;
	
	private String category;
	
	private String sub_category;
	
	private String subSub_category;
	
	private String brand;
	
	private float price;
	
	private String product_num;
	
	private String product_name;
	
	private String item_model_name;
	
	private String item_model_num;
	
	private boolean isBook;
	
	private String publisher;
	
	private String language;
	
	private String ISBN_10;
	
	private String ISBN_13;
	
	private String page_numbers;
	
	private String product_description;

	public int getProduct_ID() {
		return product_ID;
	}

	public void setProduct_ID(int product_ID) {
		this.product_ID = product_ID;
	}

	public int getOwner_ID() {
		return owner_ID;
	}

	public void setOwner_ID(int owner_ID) {
		this.owner_ID = owner_ID;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSub_category() {
		return sub_category;
	}

	public void setSub_category(String sub_category) {
		this.sub_category = sub_category;
	}

	public String getSubSub_category() {
		return subSub_category;
	}

	public void setSubSub_category(String subSub_category) {
		this.subSub_category = subSub_category;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getProduct_num() {
		return product_num;
	}

	public void setProduct_num(String product_num) {
		this.product_num = product_num;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getItem_model_name() {
		return item_model_name;
	}

	public void setItem_model_name(String item_model_name) {
		this.item_model_name = item_model_name;
	}

	public String getItem_model_num() {
		return item_model_num;
	}

	public void setItem_model_num(String item_model_num) {
		this.item_model_num = item_model_num;
	}

	public boolean isBook() {
		return isBook;
	}

	public void setBook(boolean isBook) {
		this.isBook = isBook;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getISBN_10() {
		return ISBN_10;
	}

	public void setISBN_10(String iSBN_10) {
		ISBN_10 = iSBN_10;
	}

	public String getISBN_13() {
		return ISBN_13;
	}

	public void setISBN_13(String iSBN_13) {
		ISBN_13 = iSBN_13;
	}

	public String getPage_numbers() {
		return page_numbers;
	}

	public void setPage_numbers(String page_numbers) {
		this.page_numbers = page_numbers;
	}

	public String getProduct_description() {
		return product_description;
	}

	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	
}
