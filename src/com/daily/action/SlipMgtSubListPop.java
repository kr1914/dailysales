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

public class SlipMgtSubListPop implements Action {
	
	ActionForward forward;
	HttpSession session;
	List<Map<String, Object>> login; //세션 로그인 데이터
	Map<String, Object> callCo;  //지금 메인 회사인 부분
	AdminCheck admin;
	List<Map<String, Object>> sub = null;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

				String sub_name = request.getParameter("sub_name");
				SlipMgtSelectSub sltSub = new SlipMgtSelectSub();
				
				sub = sltSub.excute(sub_name);
				request.setAttribute("subList", sub);
				
				forward = new ActionForward();
				forward.setPath("SubjectSelect/SubListPop.jsp");
				

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
