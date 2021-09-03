package com.daily.svc;

import java.io.IOException;
import java.util.Map;

import com.daily.dao.DbAcesse;
import com.daily.dto.Customer;
import com.daily.dto.Stock;

public class StkViewDetail {
	
	Stock stk;
	public Stock excute(Map<String, String> co) throws IOException {
		
		DbAcesse dba = DbAcesse.getInstance();
		stk = dba.stkViewDetail(co);	

		return stk;
	}
}
