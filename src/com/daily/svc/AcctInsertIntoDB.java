package com.daily.svc;

import java.io.IOException;

import com.daily.dao.DbAcesse;
import com.daily.dto.BankAccount;
import com.daily.dto.Customer;
import com.daily.dto.Stock;

public class AcctInsertIntoDB {
	
	public boolean excute(BankAccount acct) throws IOException {
		boolean r = false;
		
		DbAcesse dba = DbAcesse.getInstance();
		int result = dba.acctInsert(acct);
		
		if(result > 0) {
			dba.commit();
			r = true;
		}else {
			dba.rollback();
		}
		
		
		return r;
	}
}
