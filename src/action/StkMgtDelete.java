package action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;
import com.daily.svc.AdminCheck;
import com.daily.svc.CustDeleteInDB;
import com.daily.svc.StkDeleteInDB;

public class StkMgtDelete implements Action {

	
	ActionForward forward;
	HttpSession session;
	AdminCheck admin;
	List<Map<String, Object>> login; //세션 로그인 데이터
	Map<String, Object> callCo;
	Map<String, String> params;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		session = request.getSession();
		forward = new ActionForward();
		String stkCode = request.getParameter("StkCode"); 
		System.out.println(stkCode);
		
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
			if(admin.myCoCheckManager(callCo)) {
				params = new HashMap<String, String>();
				params.put("admin_key", key); 
				params.put("code", stkCode);
				StkDeleteInDB stkd = new StkDeleteInDB();
				boolean b = stkd.excute(params);
				if(b) {
					forward.setPath("StkMgtListView.do");
				}else {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('삭제 에러')");
					out.println("history.back();");
					out.println("</script>");
				}
				
				
				
			}
		}
		return forward;
	}
}
