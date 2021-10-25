package com.daily.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;
import com.daily.dto.CollectionSlip;
import com.daily.dto.SalesSlip;
import com.daily.svc.AcctListView;
import com.daily.svc.AdminCheck;
import com.daily.svc.SlipMgtDeleteSlip;
import com.daily.svc.SlipMgtInsertSlip;
import com.daily.svc.SlipMgtModifyInDB;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;

public class SlipMgtDelete implements Action {

	
	ActionForward forward;
	HttpSession session;
	List<Map<String, Object>> login; //세션 로그인 데이터
	Map<String, Object> callCo;  //지금 메인 회사인 부분
	HashMap<String, String> slip; //삭제용 파라미터
	String adkey;
	AdminCheck admin;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		session = request.getSession();
		if(session.getAttribute("Login")==null) {
			wrongAccess("로그인이 필요합니다.", response);
		}else {
			admin = AdminCheck.getInstance();
			login = (List<Map<String, Object>>)session.getAttribute("Login"); //로그인 세션
			adkey = (String)session.getAttribute("nowCo"); //현재 작업중인 회사 admin_key
			for(Map<String, Object> t : login) {  
				if(t.get("key").equals(adkey)) {
					callCo = t;// id, name, company, admin, key //회사 정보 추출
				}
			}
			if(!admin.myCoCheckManager(callCo)) { //매니저 권한 확인
				wrongAccess("권한이 부족합니다.", response);
			}else {
				slip = new HashMap<String,String>();
				slip.put("admin_key", adkey);
				slip.put("index", request.getParameter("tran_index"));
				SlipMgtDeleteSlip sd = new SlipMgtDeleteSlip();
				sd.excute(slip);
				
			}			
		}
		
		forward = new ActionForward();
		forward.setPath("selectSlip.do");

		return forward;
	}

	public void wrongAccess(String word, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('"+word+"')");
		out.println("history.back();");
		out.println("</script>");
	}

}