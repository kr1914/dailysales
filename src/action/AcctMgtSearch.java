package action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;
import com.daily.dto.BankAccount;
import com.daily.dto.Customer;
import com.daily.dto.Stock;
import com.daily.svc.AcctListSearchFromDB;
import com.daily.svc.AdminCheck;
import com.daily.svc.CustListSearchFromDB;
import com.daily.svc.StkListSearchFromDB;

public class AcctMgtSearch implements Action {

	
	ActionForward forward;
	HttpSession session;
	AdminCheck admin;
	List<Map<String, Object>> login; //세션 로그인 데이터
	Map<String, Object> callCo;  //지금 메인 회사인 부분
	BankAccount acct;
	List<Map<String, Object>> acctList = null;
	Map<String, String> set;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		session = request.getSession(); //세션호출
		admin = AdminCheck.getInstance(); //권한체크기능 호출
//권한 체크를 위해 세션에서 현재 회사 권한정보 호출
		login = (List<Map<String, Object>>)session.getAttribute("Login");
		String key = (String)session.getAttribute("nowCo");
		for(Map<String, Object> t : login) {
			if(t.get("key").equals(key)) {
				callCo = t;// id, name, company, admin, key
			}
		}
		
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
		}else if(admin.myCoCheckAdminFree(callCo)){ //권한 체크
		
		set = new HashMap<String, String>();
		set.put("adkey", (String)session.getAttribute("nowCo")); //현재 메인 회사
		set.put("keyword", request.getParameter("keyword"));
		set.put("option", request.getParameter("filter"));
		String orderBy = sortOption(request.getParameter("sortOption"));
		set.put("sortOption", orderBy);
	
		
		try {
		AcctListSearchFromDB cls = new AcctListSearchFromDB();
		acctList = cls.excute(set);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		session.setAttribute("acctList", acctList);
		forward = new ActionForward();
		forward.setPath("AcctSearchData.jsp");
		}
		
		return forward;
	}
	
	public String sortOption(String col) {
		String option = "order by ";
		
		if(col.equals("No.")) {
			option = "";
		}else if(col.equals("구분")) {
			option = option + "acct_cla";
		}else if(col.equals("계좌명")) {
			option = option + "acct_name";
		}else if(col.equals("은행명")) {
			option = option + "acct_bank";
		}else if(col.equals("예금주명")) {
			option = option + "acct_owner";
		}else if(col.equals("계좌번호")) {
			option = option + "acct_id";
		}else {
			option = "";
		}
		
		
		
		return option;
	}

}
