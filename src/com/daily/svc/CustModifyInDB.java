package com.daily.svc;

import java.io.IOException;

import com.daily.dao.DbAcesse;
import com.daily.dto.Customer;

public class CustModifyInDB {

	public boolean excute(Customer cs) throws IOException {
		boolean r = false;
		
		DbAcesse dba = DbAcesse.getInstance();
		int result = dba.custModify(cs);
		
		if(result > 0) {
			dba.commit();
			r = true;
		}else {
			dba.rollback();
		}
		
		
		return r;
	}
}
