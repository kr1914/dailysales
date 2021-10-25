package com.daily.action;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;
import com.daily.svc.SendMail;
import com.daily.svc.MasageSend;

public class CrtMgtCheckCode implements Action{
	HttpSession session;
	String code = "";
	String input = "";
	String func = "";
	ActionForward forward;
	HashMap<String, Object> authentication = null;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//세션에 코드를 올려놓기 위해 세션 생성
		session = request.getSession();
		MasageSend wms = new MasageSend(); //안내메세지
		authentication = (HashMap<String, Object>)session.getAttribute("authen");
		this.code = (String)authentication.get("key");
		input = (String)authentication.get("key");
		if(input.equals(code)) {
			String funt = "function authenClear() {\r\n" + 
					"	alert('인증성공');\r\n" + 
					"	var t = document.getElementById('authenBtn');\r\n" + 
					"	t.remove();\r\n" + 
					"}\r\n" + 
					"authenClear();";
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println(funt);
			out.println("</script>");
			
			System.out.println("인증성공");
		}else {
			wms.wrongAccess("잘못된 입력입니다.", response);
		}
		return forward;
	}
}
