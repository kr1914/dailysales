package com.daily.svc;

import java.io.IOException;

import com.daily.dao.DbAcesse;
import com.daily.dto.MyCompany;

public class MyCoInsertIntoDB {
	
	
	
	public boolean excute(MyCompany co) throws IOException {
		boolean r = false;
		
		DbAcesse dba = DbAcesse.getInstance();
		int result = dba.myCoInsert(co);
		
		if(result > 0) {
			dba.commit();
			r = true;
		}else {
			dba.rollback();
		}
		
		
		return r;
	}
}
