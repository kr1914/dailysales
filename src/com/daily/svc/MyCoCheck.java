package com.daily.svc;

import java.io.IOException;
import java.util.Map;

import com.daily.dao.DbAcesse;
import com.daily.dto.MyCompany;

public class MyCoCheck {

	MyCompany co = null;
	public int excute(Map<String, Object> co) throws IOException {
		

		DbAcesse dba = DbAcesse.getInstance();
		int result = dba.myCoCheckAdminFree(co);
		
		if(result > 0) {
			dba.commit();
		}else {
			dba.rollback();
		}	
		
		return result;
	}
}
