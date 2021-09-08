package com.daily.svc;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.daily.dao.DbAcesse;

public class SalesChartDataFromDB {

	public List<Map<String, Object>> excute(String key) throws IOException {

		DbAcesse dba = DbAcesse.getInstance();
		List<Map<String, Object>> result = dba.saleChartData(key);
		
		
		return result;
	}
}
