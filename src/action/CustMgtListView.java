package action;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;
import com.daily.dto.Customer;
import com.daily.svc.CustListView;
import com.daily.svc.WrongMasageSend;

public class CustMgtListView implements Action {

	
	ActionForward forward;
	HttpSession session;
	String adkey ="";
	CustListView clv;
	List<Map<String, Object>> custList = null;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		session = request.getSession();
		
		if(session.getAttribute("Login")==null) { //로그인 유무
			WrongMasageSend wr = new WrongMasageSend();
			wr.wrongAccess("로그인이 필요합니다.", response);
		}else if(session.getAttribute("nowCo")== null){ //회사 존재유무
			WrongMasageSend wr = new WrongMasageSend();
			wr.wrongAccess("회사 정보를 찾을 수 없습니다.", response);
		}else {
		
		adkey = (String)session.getAttribute("nowCo"); //현재 메인 회사
		
		clv = new CustListView(); 
		custList = clv.excute(adkey);
		
		request.setAttribute("list", custList); //거래처 정보 리스트
		
		forward = new ActionForward();
		forward.setPath("CustMgtList.jsp");
		}
		return forward;
	}

}
