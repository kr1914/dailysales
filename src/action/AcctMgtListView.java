package action;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;
import com.daily.dto.Customer;
import com.daily.dto.Stock;
import com.daily.svc.AcctListView;
import com.daily.svc.CustListView;
import com.daily.svc.StkListView;
import com.daily.svc.WrongMasageSend;

public class AcctMgtListView implements Action {

	
	ActionForward forward;
	HttpSession session;
	String adkey ="";
	AcctListView alv;
	List<Map<String, Object>> acctList = null;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		session = request.getSession();
		
		if(session.getAttribute("Login")==null) {
			WrongMasageSend wr = new WrongMasageSend();
			wr.wrongAccess("로그인이 필요합니다.", response);
		}else if(session.getAttribute("nowCo")== null){
			WrongMasageSend wr = new WrongMasageSend();
			wr.wrongAccess("회사를 생성해 주세요", response);
		}else {
		
		adkey = (String)session.getAttribute("nowCo"); //현재 메인 회사
		
		alv = new AcctListView(); 
		acctList = alv.excute(adkey);
		
		request.setAttribute("list", acctList); //거래처 정보 리스트
		
		forward = new ActionForward();
		forward.setPath("AcctMgtList.jsp");
		}
		
		
		
	
		
		return forward;
	}

}
