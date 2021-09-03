package com.daily.svc;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.daily.dao.DbAcesse;

public class StkListSearchFromDB {
	public List<Map<String, Object>> excute(Map<String, String> set) throws IOException {

		DbAcesse dba = DbAcesse.getInstance();
		List<Map<String, Object>> result = dba.stkSearchList(set);
		
		
		
		return result;
	}
	
}
