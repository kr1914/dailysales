package action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;
import com.daily.dto.CollectionSlip;
import com.daily.dto.SalesSlip;
import com.daily.svc.AcctListView;
import com.daily.svc.AdminCheck;
import com.daily.svc.SlipMgtInsertSlip;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;

public class SlipMgtsaveSlip implements Action {

	
	ActionForward forward;
	HttpSession session;
	List<Map<String, Object>> login; //세션 로그인 데이터
	Map<String, Object> callCo;  //지금 메인 회사인 부분
	String adkey ="";
	AdminCheck admin;
	String json;
	List<HashMap<String, String>> slip = null;
	SalesSlip sales;
	CollectionSlip col;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		session = request.getSession();
		
		ParseListFromJson(request); // json파일 -> list<hashmap>으로 변경
		
	    System.out.println(slip.get(0));
	    
	    
		if(session.getAttribute("Login")==null) {
			wrongAccess("로그인이 필요합니다.", response);
		}else {
			admin = AdminCheck.getInstance();
			
			login = (List<Map<String, Object>>)session.getAttribute("Login");
			String key = (String)session.getAttribute("nowCo");
			for(Map<String, Object> t : login) {
				if(t.get("key").equals(key)) {
					callCo = t;// id, name, company, admin, key
				}
			}
			
			if(!admin.myCoCheckManager(callCo)) { //매니저 권한 확인
				wrongAccess("권한이 부족합니다.", response);
			}else {
				
			
			
			adkey = (String)session.getAttribute("nowCo"); //현재 메인 회사
			SlipMgtInsertSlip smis = new SlipMgtInsertSlip();
			for(HashMap<String, String> sl : slip) {
				sl.put("admin_key", adkey);
				String amount = sl.get("amount");
				String vat = sl.get("vat");
				if(!amount.equals("") && !vat.equals("")) {
					sl.put("total", Integer.toString(Integer.parseInt(sl.get("amount"))+Integer.parseInt(sl.get("vat"))));
				}else if(!amount.equals("")) {
					sl.put("total", Integer.toString(Integer.parseInt(sl.get("amount"))));
				}else if(!vat.equals("")) {
					sl.put("total", Integer.toString(Integer.parseInt(sl.get("vat"))));
				}
			if(sl.get("tran_index").equals("")) { //새로입력
				
				smis.excute(sl);
			
			}else { //수정
				
				
			}
			
			}
			
			
	
			
			
			}
		}

		return null;
	}
//ArrayJson 에서 List<Map>으로 변환
	public void ParseListFromJson(HttpServletRequest request) {
		Gson gson = new Gson();
	    json = request.getParameter("target");
	    slip = (List<HashMap<String, String>>) gson.fromJson(json, new TypeToken<List<HashMap<String, String>>>() {}.getType());
	}

	public void wrongAccess(String word, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('"+word+"')");
		out.println("history.back();");
		out.println("</script>");
	}

}