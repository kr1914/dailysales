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

public class CustMgtSearch implements Action {

	
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
		set.put("option", request.getParameter("filter"));
		String orderBy = sortOption(request.getParameter("sortOption"));
		set.put("sortOption", orderBy);
	
		System.out.println(set.get("adkey")+set.get("keyword")+set.get("sortOption"));
		
		try {
		CustListSearchFromDB cls = new CustListSearchFromDB();
		custList = cls.excute(set);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		session.setAttribute("custlist", custList);
		
		System.out.println(custList.size());
		forward = new ActionForward();
		forward.setPath("CustSearchData.do");
		}
		
		return forward;
	}
	
	public String sortOption(String col) {
		String option = "order by ";
		
		if(col.equals("No.")) {
			option = "";
		}else if(col.equals("구분")) {
			option = option + "cust_cla";
		}else if(col.equals("거래처명")) {
			option = option + "cust_name";
		}else if(col.equals("사업자등록번호")) {
			option = option + "cust_bizcode";
		}else if(col.equals("대표자")) {
			option = option + "cust_ceo";
		}else if(col.equals("연락처")) {
			option = option + "cust_tel";
		}else if(col.equals("휴대전화")) {
			option = option + "cust_phone";
		}else if(col.equals("팩스")) {
			option = option + "cust_fax";
		}else if(col.equals("업종")) {
			option = option + "cust_ind";
		}else if(col.equals("종목")) {
			option = option + "cust_stk";
		}else if(col.equals("주소")) {
			option = option + "cust_addr1";
		}else if(col.equals("이메일")) {
			option = option + "cust_email";
		}else {
			option = "";
		}
		
		
		
		return option;
	}

}
