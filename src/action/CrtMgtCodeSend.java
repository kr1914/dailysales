package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;
import com.daily.svc.SendMail;

public class CrtMgtCodeSend implements Action{

	HttpSession session;
	String email;
	String code = "";
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//세션에 코드를 올려놓기 위해 세션 생성
		session = request.getSession();
		email = request.getParameter("email");
		this.code = createCode();
		
		SendMail sm = new SendMail();
		String title = "dailySales 이메일 인증";
		String text = "인증번호는 \n"+this.code+"\n입니다.";
		sm.excute(email, title, text);
			
		
		
		
		
		return null;
	}
	
	
	public String createCode() {
		String makeCode = "";
		//숫자 : 48 ~ 57, 소문자 : 65 ~90 ,대문자 : 97 ~ 122 / 임의의 문자 5개 생성
		for(int i = 0 ; i < 5 ; i++) {
			while(true) {
				int cd = (int)(Math.random()*100)+22;
				if((cd>=48 && cd<=68) || (cd>=65 && cd<=90) || (cd>=97 && cd<=122) ) {
					char ct = (char)cd;
					makeCode = makeCode + ct;
					break;
				}
			}
		}		
		
		return makeCode;
	}

}
