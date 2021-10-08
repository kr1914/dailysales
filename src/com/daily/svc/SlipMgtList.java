package com.daily.svc;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.daily.dao.DbAcesse;

public class SlipMgtList implements SlipSelect{

	public List<HashMap<String, Object>> excute(Map<String, String> key) throws IOException {

		DbAcesse dba = DbAcesse.getInstance();
		List<HashMap<String, Object>> result = dba.selectSlipList(key);
		
		
		return result;
	}
}
