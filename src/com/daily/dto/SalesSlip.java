package com.daily.dto;

public class SalesSlip {
	private String tran_index;
	private String custcode;
	private String date;
	private String stkcode;
	private String quantity;
	private String price;
	private String amount;
	private String vat;
	private String memo;
	private String admin_key;
	
	public String getTran_index() {
		return tran_index;
	}
	public void setTran_index(String tran_index) {
		this.tran_index = tran_index;
	}
	public String getCustcode() {
		return custcode;
	}
	public void setCustcode(String custcode) {
		this.custcode = custcode;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStkcode() {
		return stkcode;
	}
	public void setStkcode(String stkcode) {
		this.stkcode = stkcode;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getVat() {
		return vat;
	}
	public void setVat(String vat) {
		this.vat = vat;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getAdmin_key() {
		return admin_key;
	}
	public void setAdmin_key(String admin_key) {
		this.admin_key = admin_key;
	}
	
}
