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
import com.daily.svc.AdminCheck;
import com.daily.svc.SlipMgtList;
import com.daily.svc.SlipMgtListPurcharse;
import com.daily.svc.SlipSelect;

public class SlipMgtselectSlips implements Action {
	
	ActionForward forward;
	HttpSession session;
	List<Map<String, Object>> login; //세션 로그인 데이터
	Map<String, Object> callCo;  //지금 메인 회사인 부분
	AdminCheck admin;
	SlipSelect select; //셀렉트용 인터페이스
	List<HashMap<String, Object>> slip = null;
	Map<String, String> param = null;
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
			
			if(!admin.myCoCheckManager(callCo)) { //매니저 권한 확인
				wrongAccess("권한이 부족합니다.", response);
			}else {
				//실제 작업 넣는 곳
				param = new HashMap<String, String>();
				param.put("date", request.getParameter("date"));
				param.put("admin_key", key);
				String tab = request.getParameter("tab");
				
				
				if(tab.equals("매출")) {
					select = new SlipMgtList();
					param.put("custcode", request.getParameter("custcode"));
				}else if(tab.equals("매입")) {
					select = new SlipMgtListPurcharse();
					param.put("custcode", request.getParameter("custcode"));
				}else if(tab.equals("비용")) {
					
				}
				
				slip = select.excute(param);
				request.setAttribute("slipList", slip);
	
				forward = new ActionForward();
				forward.setPath("SelectSlipData.jsp");
				
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
