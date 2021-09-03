package com.daily.dto;

public class Stock {
	private int stk_code;
	private String stk_name;
	private String stk_cla;

	private String stk_size1;
	private String stk_size2;
	private String stk_unit;
	private int stk_price;
	private String stk_vat;
	private String stk_date;
	private String stk_amount;
	
	
	public String getStk_cla() {
		return stk_cla;
	}
	public void setStk_cla(String stk_cla) {
		this.stk_cla = stk_cla;
	}
	public String getStk_size1() {
		return stk_size1;
	}
	public void setStk_size1(String stk_size1) {
		this.stk_size1 = stk_size1;
	}
	public String getStk_size2() {
		return stk_size2;
	}
	public void setStk_size2(String stk_size2) {
		this.stk_size2 = stk_size2;
	}
	private String stk_memo;
	private String admin_key;
	
	
	public int getStk_code() {
		return stk_code;
	}
	public void setStk_code(int stk_code) {
		this.stk_code = stk_code;
	}
	public String getStk_name() {
		return stk_name;
	}
	public void setStk_name(String stk_name) {
		this.stk_name = stk_name;
	}

	public String getStk_unit() {
		return stk_unit;
	}
	public void setStk_unit(String stk_unit) {
		this.stk_unit = stk_unit;
	}
	public int getStk_price() {
		return stk_price;
	}
	public void setStk_price(int stk_price) {
		this.stk_price = stk_price;
	}
	public String getStk_vat() {
		return stk_vat;
	}
	public void setStk_vat(String stk_vat) {
		this.stk_vat = stk_vat;
	}
	public String getStk_date() {
		return stk_date;
	}
	public void setStk_date(String stk_date) {
		this.stk_date = stk_date;
	}
	public String getStk_amount() {
		return stk_amount;
	}
	public void setStk_amount(String stk_amount) {
		this.stk_amount = stk_amount;
	}
	public String getStk_memo() {
		return stk_memo;
	}
	public void setStk_memo(String stk_memo) {
		this.stk_memo = stk_memo;
	}
	public String getAdmin_key() {
		return admin_key;
	}
	public void setAdmin_key(String admin_key) {
		this.admin_key = admin_key;
	}
	
}
