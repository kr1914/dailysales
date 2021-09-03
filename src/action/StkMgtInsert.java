package action;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;
import com.daily.dto.Stock;
import com.daily.svc.AdminCheck;
import com.daily.svc.CustInsertIntoDB;
import com.daily.svc.StkInsertIntoDB;

public class StkMgtInsert implements Action {

	ActionForward forward;
	HttpSession session;
	List<Map<String, Object>> login; //세션 로그인 데이터
	Map<String, Object> callCo;  //지금 메인 회사인 부분
	AdminCheck admin;
	Stock stk;
	Map<String, String> params;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		
		//기본 세팅
		session = request.getSession();
		
		//로그인, 회사, 권한 체크
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
			admin = AdminCheck.getInstance();
			
			login = (List<Map<String, Object>>)session.getAttribute("Login");
			String key = (String)session.getAttribute("nowCo");
			for(Map<String, Object> t : login) {
				if(t.get("key").equals(key)) {
					callCo = t;// id, name, company, admin, key
				}
			}
			
			if(!admin.myCoCheckManager(callCo)) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('권한이 부족합니다.')");
				out.println("history.back();");
				out.println("</script>");
			}else {
				
			}
		
		
		stk = new Stock();
		
		stk.setStk_name(request.getParameter("stk_name"));
		stk.setStk_cla(request.getParameter("stk_cla"));
		stk.setStk_size1(request.getParameter("stk_size1"));
		stk.setStk_size2(request.getParameter("stk_size2"));
		stk.setStk_unit(request.getParameter("stk_unit"));
		int price;
		if(request.getParameter("stk_price").equals("")) {
			price = 0;
		}else { price = Integer.parseInt(request.getParameter("stk_price"));}
		stk.setStk_price(price);
		stk.setStk_vat(request.getParameter("stk_vat"));
		String date = "null";
		if(request.getParameter("stk_date").equals("")) {
			date = "null";
		}else { date = "'"+request.getParameter("stk_date")+"'";}
		stk.setStk_date(date);
		stk.setStk_amount(request.getParameter("stk_amount"));
		stk.setStk_memo(request.getParameter("stk_memo"));
		stk.setAdmin_key((String)session.getAttribute("nowCo"));
		
		StkInsertIntoDB insert = new StkInsertIntoDB();
		if(!insert.excute(stk)) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('업로드 실패')");
			out.println("history.back();");
			out.println("</script>");
		}else {
			forward = new ActionForward();
			forward.setPath("StkMgtListView.do");
		}
		}
		
		return forward;
	}

}
