package action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;
import com.daily.svc.AcctDeleteInDB;
import com.daily.svc.AdminCheck;
import com.daily.svc.CustDeleteInDB;
import com.daily.svc.StkDeleteInDB;
import com.daily.svc.WrongMasageSend;

public class AcctMgtDelete implements Action {

	
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
		
		String acctCode = request.getParameter("AcctCode"); 
		
		if(session.getAttribute("Login")==null) {
			WrongMasageSend wr = new WrongMasageSend();
			wr.wrongAccess("로그인이 필요합니다.", response);
		}else if(session.getAttribute("nowCo")== null){
			WrongMasageSend wr = new WrongMasageSend();
			wr.wrongAccess("회사정보가 없습니다.", response);
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
				params.put("code", acctCode);
				AcctDeleteInDB acctd = new AcctDeleteInDB();
				boolean b = acctd.excute(params);
				if(b) {
					forward.setPath("AcctMgtListView.do");
				}else {
					WrongMasageSend wr = new WrongMasageSend();
					wr.wrongAccess("삭제 에러", response);
				}
				
				
				
			}else {
				WrongMasageSend wr = new WrongMasageSend();
				wr.wrongAccess("권한이 부족합니다.", response);
			}
		}
		return forward;
	}
}
