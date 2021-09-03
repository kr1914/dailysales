package com.daily.dto;

public class CollectionSlip {
	private String tran_index;
	private String custcode;
	private String date;
	private String collect;
	private String collectType;
	private String acctcode;
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
	public String getCollect() {
		return collect;
	}
	public void setCollect(String collect) {
		this.collect = collect;
	}
	public String getCollectType() {
		return collectType;
	}
	public void setCollectType(String collectType) {
		this.collectType = collectType;
	}
	public String getAcctcode() {
		return acctcode;
	}
	public void setAcctcode(String acctcode) {
		this.acctcode = acctcode;
	}
	public String getAdmin_key() {
		return admin_key;
	}
	public void setAdmin_key(String admin_key) {
		this.admin_key = admin_key;
	}
	private String admin_key;
}
