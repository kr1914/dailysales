package action;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;
import com.daily.dto.BankAccount;
import com.daily.dto.Customer;
import com.daily.dto.Stock;
import com.daily.svc.AcctModifyInDB;
import com.daily.svc.AdminCheck;
import com.daily.svc.CustModifyInDB;
import com.daily.svc.StkModifyInDB;
import com.daily.svc.WrongMasageSend;

public class AcctMgtModify implements Action {

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
		
		//로그인, 회사, 권한 체크
		if(session.getAttribute("Login")==null) {
			WrongMasageSend wr = new WrongMasageSend();
			wr.wrongAccess("로그인이 필요합니다.", response);
		}else if(session.getAttribute("nowCo")== null){
			WrongMasageSend wr = new WrongMasageSend();
			wr.wrongAccess("회사정보를 찾을 수 없습니다.", response);
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
				WrongMasageSend wr = new WrongMasageSend();
				wr.wrongAccess("권한이 부족합니다.", response);
			}else {
				//데이터 세팅
				acct = new BankAccount();
				
				int code = Integer.parseInt(request.getParameter("acct_code"));
				acct.setAcct_code(code);
				acct.setAcct_name(request.getParameter("acct_name"));
				acct.setAcct_cla(request.getParameter("acct_cla"));
				acct.setAcct_bank(request.getParameter("acct_bank"));
				acct.setAcct_owner(request.getParameter("acct_owner"));
				acct.setAcct_id(request.getParameter("acct_id"));
				acct.setAcct_memo(request.getParameter("acct_memo"));
				acct.setAdmin_key((String)session.getAttribute("nowCo"));
				
				AcctModifyInDB acctModi = new AcctModifyInDB();
				

				if(acctModi.excute(acct)) {
					forward = new ActionForward();
					forward.setPath("AcctMgtListView.do");
				}else {
					WrongMasageSend wr = new WrongMasageSend();
					wr.wrongAccess("수정 실패", response);
				}
			}
		
		}
		
		
		
		
		return forward;
	}

}
