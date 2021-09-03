package com.daily.svc;

import java.io.IOException;
import java.util.Map;

import com.daily.dao.DbAcesse;

public class AdminCheck {

	boolean result;
	DbAcesse dba;
	
	private static AdminCheck adCheck;
	
	public static AdminCheck getInstance() {
		if(adCheck==null) {
			adCheck = new AdminCheck();
		}
		return adCheck;
	}
	
	public boolean myCoCheckAdminFree(Map<String, Object> co) {
		
		try {
			dba = DbAcesse.getInstance();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int check = dba.myCoCheckAdminFree(co);
		
		if(check > 0) {
			result = true;
		}else {
			result = false;
		}
		
		return result;
	}
	
	public boolean myCoCheckManager(Map<String, Object> co) {
		
		try {
			dba = DbAcesse.getInstance();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int check = dba.myCoCheckManager(co);
		
		if(check > 0) {
			result = true;
		}else {
			result = false;
		}
		
		return result;
	}
	
	public boolean myCoCheckMasterOnly(Map<String, Object> co) {
		
		try {
			dba = DbAcesse.getInstance();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int check = dba.myCoCheckMasterOnly(co);
		
		if(check > 0) {
			result = true;
		}else {
			result = false;
		}
		
		return result;
	}
}
