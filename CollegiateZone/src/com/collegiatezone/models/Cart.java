package com.collegiatezone.models;

import java.util.ArrayList;



public class Cart {

	private ArrayList<Product> products = new ArrayList<Product>(); 
	
	private int product_count = 0;

	public float cart_total = 0;
	
	public float getTotalPrice (){
		float price_temp = 0;
		for(int i = 0; i < products.size(); i++){
			price_temp += products.get(i).getPrice();
		}
		return price_temp;
	}
	
	public int getCartSize(){
		return products.size();
	}
	
	public boolean isEmpty(){
		boolean isEmpty = false;
		if(product_count == 0){
			isEmpty = true;
		}
		return isEmpty;
	}
	
	public ArrayList<Product> getProducts() {
		return products;
	}

	public void setProducts(ArrayList<Product> products) {
		this.products = products;
	}

	public int getProduct_count() {
		return product_count;
	}

	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}


	public float getCart_total() {
		return cart_total;
	}


	public void setCart_total(float cart_total) {
		this.cart_total = cart_total;
	}
}
