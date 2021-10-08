package com.daily.svc;

import java.io.IOException;
import java.util.HashMap;

import com.daily.dao.DbAcesse;
import com.daily.dto.BankAccount;
import com.daily.dto.CollectionSlip;
import com.daily.dto.Customer;
import com.daily.dto.SalesSlip;
import com.daily.dto.Stock;

public class SlipMgtInsertSlip {
	boolean r = false;
	int result;
	
	public boolean excute(HashMap<String, String> sl) throws IOException {
		
		DbAcesse dba = DbAcesse.getInstance();
		if(sl.get("slipType").equals("매출") || sl.get("slipType").equals("수금")) {
		
			result = dba.insertTransaction(sl);
		}else if(sl.get("slipType").equals("매입") || sl.get("slipType").equals("지출")) {
			result = dba.insertPurcharse(sl);
		}

		if(result > 0) {
			dba.commit();
			r = true;
		}else {
			dba.rollback();
		}
		
		return r;
	}
}
