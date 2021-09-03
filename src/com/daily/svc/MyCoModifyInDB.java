package com.daily.svc;

import java.io.IOException;
import java.util.Map;

import com.daily.dao.DbAcesse;
import com.daily.dto.MyCompany;

public class MyCoModifyInDB {
	
	
	
	boolean r = false;
	int result;

	public boolean check(Map<String, Object> co) {
		
		try {
			DbAcesse dba = DbAcesse.getInstance();
			result = dba.myCoCheckManager(co);		
			
			if(result>0) {
				r=true;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return r;
	}
	
	public boolean excute(MyCompany co) throws IOException {
		
		DbAcesse dba = DbAcesse.getInstance();
		result = dba.myCoModify(co);
		
		if(result > 0) {
			dba.commit();
			r = true;
		}else {
			dba.rollback();
		}
		
		
		return r;
	}
}
