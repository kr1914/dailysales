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
import com.daily.svc.CustListView;
import com.daily.svc.StkListView;
import com.daily.svc.WrongMasageSend;

public class SlipMgtStkListPop implements Action {

	
	ActionForward forward;
	HttpSession session;
	String adkey ="";
	StkListView slv;
	List<Map<String, Object>> stkList = null;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		session = request.getSession();
		
		if(session.getAttribute("Login")==null) {
			WrongMasageSend wr = new WrongMasageSend();
			wr.wrongAccess("로그인이 필요합니다.", response);
		}else if(session.getAttribute("nowCo")== null){
			WrongMasageSend wr = new WrongMasageSend();
			wr.wrongAccess("회사 정보를 찾을 수 없습니다.", response);
		}else {
		
		adkey = (String)session.getAttribute("nowCo"); //현재 메인 회사
		
		slv = new StkListView(); 
		stkList = slv.excute(adkey);
		
		request.setAttribute("list", stkList); //거래처 정보 리스트
		
		forward = new ActionForward();
		forward.setPath("StkMgtStkListPop.jsp");
		}
		
		
		
	
		
		return forward;
	}

}
