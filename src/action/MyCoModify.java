package action;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;
import com.daily.dto.MyCompany;
import com.daily.svc.MyCoModifyInDB;

public class MyCoModify implements Action {
	
	ActionForward forward;
	HttpSession session;
	List<Map<String, Object>> login;
	Map<String, Object> callCo; 
	MyCompany myCoInfo;
	boolean result = false;

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		session = request.getSession();
		// MyCoModifyToDB 에서 작업 시행 아이디 및 권한을 체크하는 check() 메소드와 excute() 메소드로 작업 데이터는 이 파일에서 작업
		
		
		if(session.getAttribute("Login").equals(null)) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('세션이 만료되었습니다.')");
			out.println("history.back();");
			out.println("</script>");
		}else {
			
			try {
			login = (List<Map<String, Object>>)session.getAttribute("Login");
			String key = (String)session.getAttribute("nowCo");
			for(Map<String, Object> t : login) {
				if(t.get("key").equals(key)) {
					callCo = t;// id, name, company, admin, key
				}
			}
			}catch(Exception e) { e.printStackTrace();}
		
		
			MyCoModifyInDB modi = new MyCoModifyInDB(); //수정작업 svc 파일
			
			result = modi.check(callCo);
			
			if(result) {
		
		
		
		
				//회사정보 기입
				MyCompany ModiCo = new MyCompany();
				ModiCo.setCo_name(request.getParameter("co_name"));
				ModiCo.setCo_code(request.getParameter("co_code1")+"-"+request.getParameter("co_code2")+"-"+request.getParameter("co_code3"));
				ModiCo.setCo_ceo(request.getParameter("co_ceo"));
				ModiCo.setCo_ind(request.getParameter("co_ind"));
				ModiCo.setCo_stk(request.getParameter("co_stk"));
				ModiCo.setCo_post1(request.getParameter("co_post1"));
				ModiCo.setCo_addr1(request.getParameter("co_addr1"));
				ModiCo.setCo_post2(request.getParameter("co_post2"));
				ModiCo.setCo_addr2(request.getParameter("co_addr2"));
				ModiCo.setCo_tel(request.getParameter("co_tel"));
				ModiCo.setCo_phone(request.getParameter("co_phone"));
				ModiCo.setCo_fax(request.getParameter("co_fax"));
				ModiCo.setCo_div(request.getParameter("co_div1")+request.getParameter("co_div2")+request.getParameter("co_div3"));
				ModiCo.setCo_closing(request.getParameter("co_closing"));
				ModiCo.setAdmin_key((String)callCo.get("key"));
				result = modi.excute(ModiCo);
				
				if(!result) {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('정보 수정에 실패했습니다.')");
					out.println("history.back();");
					out.println("</script>");
				}else {
					forward = new ActionForward();
					forward.setPath("MyCoView.do");
				}
		
			}
		}
		
		return forward;
	}

}
