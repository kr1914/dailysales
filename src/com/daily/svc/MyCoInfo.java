package com.daily.svc;

import java.io.IOException;
import java.util.Map;

import com.daily.dao.DbAcesse;
import com.daily.dto.MyCompany;

public class MyCoInfo {
	MyCompany com;
	
	public MyCompany excute(Map<String, Object> co) throws IOException {
		

		DbAcesse dba = DbAcesse.getInstance();
		com = dba.myCoView(co);	

		return com;
	}
}
