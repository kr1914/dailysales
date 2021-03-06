package action;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;
import com.daily.dto.Customer;
import com.daily.svc.AdminCheck;
import com.daily.svc.CustInsertIntoDB;
import com.daily.svc.WrongMasageSend;

public class CustMgtInsert implements Action {

	ActionForward forward;
	HttpSession session;
	List<Map<String, Object>> login; //세션 로그인 데이터
	Map<String, Object> callCo;  //지금 메인 회사인 부분
	AdminCheck admin;
	Customer cs;
	Map<String, String> params;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		
		//기본 세팅
		session = request.getSession();
		
		//로그인, 회사, 권한 체크
		if(session.getAttribute("Login")==null) {
			WrongMasageSend wr = new WrongMasageSend();
			wr.wrongAccess("로그인이 필요합니다.", response);
		}else if(session.getAttribute("nowCo")== null){
			WrongMasageSend wr = new WrongMasageSend();
			wr.wrongAccess("회사 정보를 찾을 수 없습니다.", response);
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
				
			}
		
		
		cs = new Customer();
		
		cs.setCust_name(request.getParameter("cust_name"));
		cs.setCust_cla(request.getParameter("cust_cla"));
		cs.setCust_bizcode(request.getParameter("cust_bizcode"));
		cs.setCust_ceo(request.getParameter("cust_ceo"));
		cs.setCust_ind(request.getParameter("cust_ind"));
		cs.setCust_stk(request.getParameter("cust_stk"));
		cs.setCust_post1(request.getParameter("cust_post1"));
		cs.setCust_addr1(request.getParameter("cust_addr1"));
		cs.setCust_post2(request.getParameter("cust_post2"));
		cs.setCust_addr2(request.getParameter("cust_addr2"));
		cs.setCust_tel(request.getParameter("cust_tel"));
		cs.setCust_phone(request.getParameter("cust_phone"));
		cs.setCust_fax(request.getParameter("cust_fax"));
		cs.setCust_email(request.getParameter("cust_email"));
		cs.setCust_account(request.getParameter("cust_account"));
		cs.setCust_memo(request.getParameter("cust_memo"));
		cs.setAdmin_key((String)session.getAttribute("nowCo"));
		
		CustInsertIntoDB insert = new CustInsertIntoDB();
		if(!insert.excute(cs)) {
			WrongMasageSend wr = new WrongMasageSend();
			wr.wrongAccess("업로드 실패", response);
		}else {
			forward = new ActionForward();
			forward.setPath("CustMgtListView.do");
		}
		}
		
		return forward;
	}

}
