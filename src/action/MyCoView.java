package action;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;
import com.daily.dto.MyCompany;
import com.daily.svc.MyCoCheck;
import com.daily.svc.MyCoInfo;

public class MyCoView implements Action {
	
	HttpSession session;
	ActionForward forward;
	List<Map<String, Object>> login;
	Map<String, Object> callCo; 
	MyCompany myCoInfo;

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//세션값 확인 후 없으면 에러메세지와 뒤로가기, 있으면 세션에서 아이디,회사 key값이 일치하는지 확인 후 그 코드값의 회사정보를 보낸다.
		//이 파일에서는 세션값 확인 / 필요한 데이터 정리를 처리한다.
		session = request.getSession();
		
		if(session.getAttribute("Login")==null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("history.back();");
			out.println("</script>");
		}else if(session.getAttribute("nowCo")==null){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회사를 생성해주세요.')");
			out.println("history.back();");
			out.println("</script>");
		}else{
		
			
			try {
			login = (List<Map<String, Object>>)session.getAttribute("Login");
			String key = (String)session.getAttribute("nowCo");
			for(Map<String, Object> t : login) {
				if(t.get("key").equals(key)) {
					callCo = t;// id, name, company, admin, key
				}
			}
			}catch(Exception e) { e.printStackTrace();}
			
			MyCoCheck idCheck = new MyCoCheck();
			int checkResult = idCheck.excute(callCo);
			
			if(checkResult>0) {
				MyCoInfo callInfo = new MyCoInfo();
				myCoInfo = callInfo.excute(callCo);
			}else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('생성된 회사가 없습니다.')");
				out.println("history.back();");
				out.println("</script>");
			}
			
			request.setAttribute("myCoInfo", myCoInfo);
			forward = new ActionForward();
			forward.setPath("MyCoViewForm.jsp");


		}
		
		
		
		return forward;
	}

}
