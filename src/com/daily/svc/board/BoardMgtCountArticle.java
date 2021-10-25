package com.daily.svc.board;

import java.io.IOException;

import com.daily.dao.DbAcesse;

public class BoardMgtCountArticle {
	
	DbAcesse dao;
	//총 게시글 숫자 확인 
	public int excute(String type) throws IOException {
		dao = DbAcesse.getInstance();
		int count = dao.countArticle(type);
		
		return count;
	}
}
