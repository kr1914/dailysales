package com.daily.dto;

public class Manager {
	private String mgr_index; //권한정보 인덱스
	private String mgr_email; //권한주체 아이디
	private String mgr_company; //회사 사업자등록번호
	private String mgr_admin; // A:마스터권한 B:관리자권한 C:기본조회
	private String mgr_key;
	
	
	public String getMgr_index() {
		return mgr_index;
	}
	public void setMgr_index(String mgr_index) {
		this.mgr_index = mgr_index;
	}
	public String getMgr_email() {
		return mgr_email;
	}
	public void setMgr_email(String mgr_email) {
		this.mgr_email = mgr_email;
	}
	public String getMgr_company() {
		return mgr_company;
	}
	public void setMgr_company(String mgr_company) {
		this.mgr_company = mgr_company;
	}
	public String getMgr_admin() {
		return mgr_admin;
	}
	public void setMgr_admin(String mgr_admin) {
		this.mgr_admin = mgr_admin;
	}
	public String getMgr_key() {
		return mgr_key;
	}
	public void setMgr_key(String mgr_key) {
		this.mgr_key = mgr_key;
	}
	
	
}
