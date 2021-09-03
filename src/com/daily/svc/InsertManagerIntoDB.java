package com.daily.svc;

import java.io.IOException;

import com.daily.dao.DbAcesse;
import com.daily.dto.Manager;

public class InsertManagerIntoDB {
	
	
	public boolean excute(Manager mgr) throws IOException {
		boolean r = false;
		
		DbAcesse dba = DbAcesse.getInstance();
		int result = dba.managerInsert(mgr);
		
		if(result > 0) {
			dba.commit();
			r = true;
		}else {
			dba.rollback();
		}
		
		
		return r;
	}

}
