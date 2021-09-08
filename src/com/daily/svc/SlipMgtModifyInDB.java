package com.daily.svc;

import java.io.IOException;
import java.util.HashMap;

import com.daily.dao.DbAcesse;
import com.daily.dto.BankAccount;
import com.daily.dto.CollectionSlip;
import com.daily.dto.Customer;
import com.daily.dto.SalesSlip;
import com.daily.dto.Stock;

public class SlipMgtModifyInDB {
	boolean r = false;

	
	public boolean excute(HashMap<String, String> sl) throws IOException {
		
		DbAcesse dba = DbAcesse.getInstance();
		
		int result = dba.modifyTransaction(sl);

		if(result > 0) {
			dba.commit();
			r = true;
		}else {
			dba.rollback();
		}
		
		return r;
	}
}
