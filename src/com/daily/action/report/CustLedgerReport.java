package com.daily.action.report;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.action.Action;
import com.daily.dto.ActionForward;
import com.daily.svc.AdminCheck;
import com.daily.svc.MasageSend;
import com.daily.svc.report.CustLedgers;
import com.google.gson.Gson;

public class CustLedgerReport implements Action {

	Map<String, Object> call = null;
	ActionForward forward;
	AdminCheck admin;
	List<Map<String, Object>> login;
	List<Map<String, Object>> report;
	Map<String, Object> callCo = null;
	HttpSession session = null;
	PrintWriter io = null;
	String json = "";
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		session = request.getSession();
		response.setContentType("text/plain;charset=UTF-8");
		io = response.getWriter();
		
		if(session.getAttribute("Login")==null) {
			
			io.print("<script>\n alert('로그인이 필요합니다.')</script>");
		}else if(session.getAttribute("nowCo")== null){
				io.print("<script>\n alert('잘못된 접근입니다.')</script>");
		}else {
			admin = AdminCheck.getInstance();
			
			login = (List<Map<String, Object>>)session.getAttribute("Login");
			String key = (String)session.getAttribute("nowCo");
			for(Map<String, Object> t : login) {
				if(t.get("key").equals(key)) {
					callCo = t;// id, name, company, admin, key
				}
			}
			if(!admin.myCoCheckAdminFree(callCo)) {
				io.print("<script>\n alert('잘못된 접근입니다.')</script>");
			}else {
				call = new HashMap<String, Object>();
				call.put("startDate", request.getParameter("startDate"));
				call.put("endDate", request.getParameter("endDate"));
				call.put("adminKey", key);
				call.put("custCode", request.getParameter("custCode"));
				
				System.out.println((String)call.get("startDate")+call.get("endDate")+call.get("adminKey")+call.get("custCode"));
				CustLedgers clg = new CustLedgers();
				report = clg.excute(call);
				
				Gson gs = new Gson();
				json = gs.toJson(report);
				
				System.out.println(json);
				
				request.setAttribute("report", json);
			}
		}
		
		io.print(json);
		
		forward = new ActionForward();
		forward.setPath("custLedgers.jsp");
	
		return null;
	}

}
