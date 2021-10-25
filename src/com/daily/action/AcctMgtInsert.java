package com.daily.action;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;
import com.daily.dto.BankAccount;
import com.daily.dto.Stock;
import com.daily.svc.AcctInsertIntoDB;
import com.daily.svc.AdminCheck;
import com.daily.svc.CustInsertIntoDB;
import com.daily.svc.StkInsertIntoDB;
import com.daily.svc.MasageSend;

public class AcctMgtInsert implements Action {

	ActionForward forward;
	HttpSession session;
	List<Map<String, Object>> login; //세션 로그인 데이터
	Map<String, Object> callCo;  //지금 메인 회사인 부분
	AdminCheck admin;
	BankAccount acct;
	Map<String, String> params;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		
		//기본 세팅
		session = request.getSession();
		
		//로그인, 회사, 권한 체크
		if(session.getAttribute("Login")==null) {
			MasageSend wr = new MasageSend();
			wr.wrongAccess("로그인이 필요합니다.", response);
		}else if(session.getAttribute("nowCo")== null){
			MasageSend wr = new MasageSend();
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
				MasageSend wr = new MasageSend();
				wr.wrongAccess("권한이 부족합니다.", response);
			}else {
				
			}
		
		
		acct = new BankAccount();
		
		acct.setAcct_name(request.getParameter("acct_name"));
		acct.setAcct_cla(request.getParameter("acct_cla"));
		acct.setAcct_bank(request.getParameter("acct_bank"));
		acct.setAcct_owner(request.getParameter("acct_owner"));
		acct.setAcct_id(request.getParameter("acct_id"));
		acct.setAcct_memo(request.getParameter("acct_memo"));
		acct.setAdmin_key((String)session.getAttribute("nowCo"));
		
		AcctInsertIntoDB insert = new AcctInsertIntoDB();
		if(!insert.excute(acct)) {
			MasageSend wr = new MasageSend();
			wr.wrongAccess("업로드 실패", response);
		}else {
			forward = new ActionForward();
			forward.setPath("AcctMgtListView.do");
		}
		}
		
		return forward;
	}

}
