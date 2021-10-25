package com.daily.svc.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.daily.dao.DbAcesse;
import com.daily.dto.Paging;

public class BoardMgtListPage {

	List<Map<String, Object>> list = null;
	Map<String, Object> pages = null;
	DbAcesse dao;
	
	public List<Map<String, Object>> excute (int page, String type) throws IOException{
		//dao객체 생성
		dao = DbAcesse.getInstance();
		pages = new HashMap<String, Object>();
		String start = String.valueOf((page-1)*15);
		String end = String.valueOf((page*15));
		pages.put("start", start);
		pages.put("end", end);
		pages.put("type", type);
		//해당 페이지 게시글과, paging객체 담아서 리턴
		list = dao.selectArticle(pages);
		
		return list;
	}
}
