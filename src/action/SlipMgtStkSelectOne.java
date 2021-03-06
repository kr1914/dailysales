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
import com.daily.dto.Stock;
import com.daily.svc.AdminCheck;
import com.daily.svc.CustViewDetail;
import com.daily.svc.StkViewDetail;
import com.daily.svc.WrongMasageSend;

public class SlipMgtStkSelectOne implements Action {

	ActionForward forward;
	HttpSession session;
	AdminCheck admin;
	List<Map<String, Object>> login; //세션 로그인 데이터
	Map<String, Object> callCo;  //지금 메인 회사인 부분
	Stock stk;
	Map<String, String> params; 
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {


		session = request.getSession();
		String stkCode = request.getParameter("StkCode"); 
		System.out.println(stkCode);
		
		if(session.getAttribute("Login")==null) {
			WrongMasageSend wr = new WrongMasageSend();
			wr.wrongAccess("로그인이 필요합니다.", response);
		}else if(session.getAttribute("nowCo")== null){
			WrongMasageSend wr = new WrongMasageSend();
			wr.wrongAccess("회사 정보를 찾을 수 없습니다.", response);
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
				params.put("code", stkCode);
				StkViewDetail svd = new StkViewDetail(); //여기서 code랑 key값 가지고 회사정복
				stk = svd.excute(params);
				System.out.println(stk.getStk_code());
				//여기 다음이
			}else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('권한 에러')");
				out.println("history.back();");
				out.println("</script>");
			}
			
			request.setAttribute("Stock", stk);
			
			forward = new ActionForward();
			forward.setPath("SlipMgtStkSelect.jsp");
			
			
			
			
		}
		return forward;
	}

}
