package action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;

public class MyCoChange implements Action {

	ActionForward forward;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		forward = new ActionForward();
		forward.setPath("MyCoMgt/MyCoChange.jsp");
		
		return forward;
	}

}
