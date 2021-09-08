package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;
import com.daily.dto.Customer;
import com.daily.svc.CustListSearchFromDB;

public class SlipMgtCustSearch implements Action {

	
	ActionForward forward;
	HttpSession session;
	Customer cs;
	List<Map<String, Object>> custList = null;
	Map<String, String> set;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		session = request.getSession();
		
		if(session.getAttribute("Login")==null) {
			wrongAccess("로그인이 필요합니다.", response);
		}else if(session.getAttribute("nowCo")== null){
			wrongAccess("회사 정보를 찾을 수 없습니다.", response);
		}else {
		
		set = new HashMap<String, String>();
		set.put("adkey", (String)session.getAttribute("nowCo")); //현재 메인 회사
		set.put("keyword", request.getParameter("keyword"));
		set.put("option", "cust_name");
		set.put("sortOption", "");
	
		
		try {
		CustListSearchFromDB cls = new CustListSearchFromDB();
		custList = cls.excute(set);
		System.out.println(custList.size());
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		if(custList.size()==0) {
			request.setAttribute("key", request.getParameter("keyword"));
			forward = new ActionForward();
			forward.setPath("SlipNoneCustData.jsp");
		}else if(custList.size()==1) {
			request.setAttribute("custlist", custList);
			forward = new ActionForward();
			forward.setPath("SlipOneCustData.jsp");
		}else if(custList.size()>1) {
			request.setAttribute("size", custList.size());
			session.setAttribute("custlist", custList);
			forward = new ActionForward();
			forward.setPath("SlipMultiCustData.jsp");
		}
		
	
		}
		
		return forward;
	}
	
	public void wrongAccess(String word, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('"+word+"');");
		out.println("history.back();");
		out.println("</script>");
		out.flush();
	}
	
}
