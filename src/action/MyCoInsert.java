package action;

import java.io.PrintWriter;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;
import com.daily.dto.Manager;
import com.daily.dto.MyCompany;
import com.daily.svc.InsertManagerIntoDB;
import com.daily.svc.MyCoInsertIntoDB;

public class MyCoInsert implements Action {

	ActionForward forward;
	HttpSession session;
	//회사 생성 메소드
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		session = request.getSession();

		//회사정보 기입
		MyCompany CrtCo = new MyCompany();
		CrtCo.setCo_name(request.getParameter("co_name"));
		CrtCo.setCo_code(request.getParameter("co_code1")+"-"+request.getParameter("co_code2")+"-"+request.getParameter("co_code3"));
		CrtCo.setCo_ceo(request.getParameter("co_ceo"));
		CrtCo.setCo_ind(request.getParameter("co_ind"));
		CrtCo.setCo_stk(request.getParameter("co_stk"));
		CrtCo.setCo_post1(request.getParameter("co_post1"));
		CrtCo.setCo_addr1(request.getParameter("co_addr1"));
		CrtCo.setCo_post2(request.getParameter("co_post2"));
		CrtCo.setCo_addr2(request.getParameter("co_addr2"));
		CrtCo.setCo_tel(request.getParameter("co_tel"));
		CrtCo.setCo_phone(request.getParameter("co_phone"));
		CrtCo.setCo_fax(request.getParameter("co_fax"));
		CrtCo.setCo_div(request.getParameter("co_div1")+request.getParameter("co_div2")+request.getParameter("co_div3"));
		CrtCo.setCo_closing(request.getParameter("co_closing"));
		Date admin = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyMMddHHmm");
		String key = format.format(admin);
		CrtCo.setAdmin_key(key);
		
		//회사 데이터 입력
		MyCoInsertIntoDB insert = new MyCoInsertIntoDB();
		boolean result = insert.excute(CrtCo);
		
		
		if(!result) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('업로드 실패')");
			out.println("history.back();");
			out.println("</script>");
		}else{
			forward = new ActionForward();
			forward.setPath("main.do");
		}
		
		//권한정보입력
		
		Manager mgr = new Manager();
		mgr.setMgr_company(CrtCo.getCo_code());
		mgr.setMgr_email((String)session.getAttribute("ID"));
		mgr.setMgr_admin("A");
		mgr.setMgr_key(key);
		
		InsertManagerIntoDB insertMgr = new InsertManagerIntoDB();
		result = insertMgr.excute(mgr);
		
		if(!result) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('권한생성실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		
		
		//생성시 방금 만든 계정 정보를 세션에 업데이트
		List<Map<String, Object>> update = (List<Map<String, Object>>)session.getAttribute("Login");
		
		Map<String, Object> newCo = null;
		newCo.put("key", key);
		newCo.put("company", CrtCo.getCo_name());
		newCo.put("grade", mgr.getMgr_admin());
		update.add(newCo);
		session.setAttribute("Login", update);
		
		
		return forward;
	
	}

}
