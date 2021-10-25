package com.daily.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;
import com.daily.svc.AdminCheck;
import com.daily.svc.SlipMgtList;
import com.daily.svc.SlipMgtListPurcharse;
import com.daily.svc.SlipMgtSelectSub;
import com.daily.svc.SlipSelect;

public class SlipMgtselectSub implements Action {
	
	ActionForward forward;
	HttpSession session;
	List<Map<String, Object>> login; //세션 로그인 데이터
	Map<String, Object> callCo;  //지금 메인 회사인 부분
	AdminCheck admin;
	List<Map<String, Object>> sub = null;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		session = request.getSession();
		
		
		if(session.getAttribute("Login")==null) {
			wrongAccess("로그인이 필요합니다.", response);
		}else {
			admin = AdminCheck.getInstance();
			
			login = (List<Map<String, Object>>)session.getAttribute("Login");
			String key = (String)session.getAttribute("nowCo");
			for(Map<String, Object> t : login) {
				if(t.get("key").equals(key)) {
					callCo = t;// id, name, company, admin, key
				}
			}
			
				String sub_name = request.getParameter("sub_name");
				SlipMgtSelectSub sltSub = new SlipMgtSelectSub();
				
				sub = sltSub.excute(sub_name);
				request.setAttribute("subList", sub);
				
				forward = new ActionForward();
				
				if(sub.size()==1) {
					forward.setPath("SubjectSelect/SelectSub_One.jsp");
				}else if(sub.size()==0 || sub.size()>1){
					request.setAttribute("key", sub_name);
					forward.setPath("SubjectSelect/SelectSub_List.jsp");
				}
	
				
		}
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
