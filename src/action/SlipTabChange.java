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
import com.daily.svc.AcctListView;
import com.daily.svc.CustListView;
import com.daily.svc.StkListView;
import com.daily.svc.WrongMasageSend;

public class SlipTabChange implements Action {

	
	ActionForward forward;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		forward = new ActionForward();
		
		String tab = request.getParameter("tab");
		System.out.println(tab);
		
		switch(tab) {
		case "매출": forward.setPath("SlipTableForm/SalesSlipTable.jsp"); break;
		case "매입": forward.setPath("SlipTableForm/PurchaseSlipTable.jsp"); break;
		case "비용": forward.setPath("SlipTableForm/expenseSlipTable.jsp"); break;
		case "수동": forward.setPath("SlipTableForm/manualSlipTable.jsp"); break;
		}

		
		
		
		
		
		
		
		
	
		
		return forward;
	}

}
