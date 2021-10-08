package com.daily.svc;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface SlipSelect {
	public List<HashMap<String, Object>> excute(Map<String, String> key) throws IOException;
}
