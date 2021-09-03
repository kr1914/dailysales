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
