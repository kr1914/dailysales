package com.daily.svc.report;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.daily.dao.DbAcesse;

public class CustLedgers {

	DbAcesse dao;
	List<Map<String, Object>> report = null;
	
	public List<Map<String, Object>> excute(Map<String, Object> call) { // call:시작날짜, 종료날짜, adminKey, 거래처코드
		try {
			dao = DbAcesse.getInstance();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		report = dao.custLedgers(call);
		
		return report;
	}
}
