package com.daily.svc;

import java.io.IOException;

import com.daily.dao.DbAcesse;
import com.daily.dto.Stock;

public class StkModifyInDB {
	
	public boolean excute(Stock stk) throws IOException {
		boolean r = false;
		
		DbAcesse dba = DbAcesse.getInstance();
		int result = dba.stkModify(stk);
		
		if(result > 0) {
			dba.commit();
			r = true;
		}else {
			dba.rollback();
		}
		
		
		return r;
	}
}
