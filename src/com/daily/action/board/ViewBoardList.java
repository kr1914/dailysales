package com.daily.action.board;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.action.Action;
import com.daily.dto.ActionForward;
import com.daily.dto.Paging;
import com.daily.svc.board.BoardMgtCountArticle;
import com.daily.svc.board.BoardMgtListPage;
import com.google.gson.Gson;

public class ViewBoardList implements Action {

	ActionForward forward;
	Paging paging = null;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String type = "";
		type = request.getParameter("type"); // 이용가이드, 자유게시판 접근 경로 확인
		
		
		//총 게시글 숫자
		BoardMgtCountArticle cnt = new BoardMgtCountArticle();
		System.out.println(request.getParameter("page")+"페이지 오픈");
		int cntArticle = cnt.excute(type);
		int page = Integer.parseInt(request.getParameter("page"));
		
		//페이지 정보
		if(paging == null) {
			paging = new Paging(cntArticle, page);
		}else {
			paging.setPages(cntArticle, page);
		}
		
		System.out.println("페이징 정보 갱신");
		
		//해당페이지 게시글 정보
		BoardMgtListPage bmlp = new BoardMgtListPage();
		List<Map<String, Object>> list = bmlp.excute(page, type);
		

		request.setAttribute("board", list);
		request.setAttribute("page", paging);
		
		forward = new ActionForward();
		forward.setPath("/DSJSP/Board/boardList.jsp");
		
		return forward;
	}

}
