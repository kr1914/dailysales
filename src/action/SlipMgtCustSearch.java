package action;

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
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("history.back();");
			out.println("</script>");
		}else if(session.getAttribute("nowCo")== null){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회사를 생성해주세요.')");
			out.println("history.back();");
			out.println("</script>");
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
			session.setAttribute("custlist", custList);
			forward = new ActionForward();
			forward.setPath("SlipCustListData.jsp");
		}
		
	
		}
		
		return forward;
	}
	
}
