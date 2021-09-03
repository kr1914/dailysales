package com.daily.svc;

import java.io.IOException;
import java.util.Map;

import com.daily.dao.DbAcesse;
import com.daily.dto.Customer;

public class CustViewDetail {
	
	Customer cs;
	public Customer excute(Map<String, String> co) throws IOException {
		
		DbAcesse dba = DbAcesse.getInstance();
		cs = dba.custViewDetail(co);	

		return cs;
	}
}
