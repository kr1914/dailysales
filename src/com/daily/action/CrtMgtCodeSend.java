package com.daily.action;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;
import com.daily.svc.SendMail;
import com.daily.svc.MasageSend;

public class CrtMgtCodeSend implements Action{

	HttpSession session;
	String email;
	String code = "";
	ActionForward forward;
	HashMap<String, Object> authentication = null;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//세션에 코드를 올려놓기 위해 세션 생성
		session = request.getSession();
		MasageSend wms = new MasageSend(); //안내메세지
		email = request.getParameter("email");
		this.code = createCode();
		
		SendMail sm = new SendMail();
		String title = "dailySales 이메일 인증";
		String text = "인증번호는 \n"+this.code+"\n입니다.";
		if(session.getAttribute("authen") == null) {
			authentication = new HashMap<String, Object>();
			authentication.put("key", code);
			authentication.put("try", 2);
			wms.wrongAccess("인증번호가 발송되었습니다.", response);
		}else {
			authentication = (HashMap<String, Object>)session.getAttribute("authen");
			if((int)authentication.get("try") == 0) { //인증제한 
				String funt = "alert('인증은 3회까지 가능합니다')";
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println(funt);
				out.println("</script>");
			}else {
			int t = (int)authentication.get("try");
			authentication.put("try", t--);
			authentication.put("key", code);
			}
		}
		if(sm.excute(email, title, text)) {
			session.setAttribute("authen", authentication);
		}
		return null;
	}
	
	
	public String createCode() {
		String makeCode = "";
		//숫자 : 48 ~ 57, 소문자 : 65 ~90 ,대문자 : 97 ~ 122 / 임의의 문자 5개 생성
		for(int i = 0 ; i < 5 ; i++) {
			while(true) {
				int cd = (int)(Math.random()*100)+22;
				if((cd>=48 && cd<=57) || (cd>=65 && cd<=90) || (cd>=97 && cd<=122) ) {
					char ct = (char)cd;
					makeCode = makeCode + ct;
					break;
				}
			}
		}		
		
		return makeCode;
	}

}
