package com.daily.svc;

import java.io.IOException;
import java.util.Map;

import com.daily.dao.DbAcesse;
import com.daily.dto.BankAccount;
import com.daily.dto.Customer;
import com.daily.dto.Stock;

public class AcctViewDetail {
	
	BankAccount acct;
	public BankAccount excute(Map<String, String> co) throws IOException {
		
		DbAcesse dba = DbAcesse.getInstance();
		acct = dba.acctViewDetail(co);	

		return acct;
	}
}
