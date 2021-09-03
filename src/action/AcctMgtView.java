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
import com.daily.svc.AcctViewDetail;
import com.daily.svc.AdminCheck;
import com.daily.svc.CustViewDetail;
import com.daily.svc.StkViewDetail;

public class AcctMgtView implements Action {

	ActionForward forward;
	HttpSession session;
	AdminCheck admin;
	List<Map<String, Object>> login; //세션 로그인 데이터
	Map<String, Object> callCo;  //지금 메인 회사인 부분
	BankAccount acct;
	Map<String, String> params; 
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {


		session = request.getSession();
		String acctCode = request.getParameter("AcctCode"); 
		
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
			//권한 체크 부분 (myCoCheckAdminFree)
			admin = AdminCheck.getInstance();
			
			//login : 세션 로그인 데이터, key = 
			login = (List<Map<String, Object>>)session.getAttribute("Login");
			String key = (String)session.getAttribute("nowCo");
			for(Map<String, Object> t : login) {
				if(t.get("key").equals(key)) {
					callCo = t;// id, name, company, admin, key
				}
			}
			
			//nowCo와 cust_code가 일치하는 회사의 정보를 Customer로 가져오기
			if(admin.myCoCheckAdminFree(callCo)) { //검증 완료 
				params = new HashMap<String, String>();
				params.put("admin_key", key); 
				params.put("code", acctCode);
				AcctViewDetail svd = new AcctViewDetail(); //여기서 code랑 key값 가지고 회사정복
				acct = svd.excute(params);
				//여기 다음이
			}else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('권한 에러')");
				out.println("history.back();");
				out.println("</script>");
			}
			
			request.setAttribute("Account", acct);
			
			forward = new ActionForward();
			
			if(request.getParameter("page").equals("acctView")) {
			forward.setPath("AcctMgtViewForm.jsp"); //여기로 가면 
			}else if(request.getParameter("page").equals("acctModify")) {
			forward.setPath("AcctMgtModifyForm.jsp");
			}
			
			
			
			
			
			
		}
		return forward;
	}

}
