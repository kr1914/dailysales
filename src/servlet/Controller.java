package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.action.AcctMgtDelete;
import com.daily.action.AcctMgtInsert;
import com.daily.action.AcctMgtListView;
import com.daily.action.AcctMgtModify;
import com.daily.action.AcctMgtSearch;
import com.daily.action.AcctMgtView;
import com.daily.action.Action;
import com.daily.action.CrtMgtCheckCode;
import com.daily.action.CrtMgtCodeSend;
import com.daily.action.CustMgtDelete;
import com.daily.action.CustMgtInsert;
import com.daily.action.CustMgtListView;
import com.daily.action.CustMgtModify;
import com.daily.action.CustMgtSearch;
import com.daily.action.CustMgtView;
import com.daily.action.MainPage;
import com.daily.action.MyCoChange;
import com.daily.action.MyCoInsert;
import com.daily.action.MyCoModify;
import com.daily.action.MyCoView;
import com.daily.action.SlipMgtAcctListPop;
import com.daily.action.SlipMgtCustDelete;
import com.daily.action.SlipMgtCustInsert;
import com.daily.action.SlipMgtCustListPop;
import com.daily.action.SlipMgtCustModify;
import com.daily.action.SlipMgtCustSearch;
import com.daily.action.SlipMgtCustView;
import com.daily.action.SlipMgtDelete;
import com.daily.action.SlipMgtStkListPop;
import com.daily.action.SlipMgtStkListSearch;
import com.daily.action.SlipMgtStkSearch;
import com.daily.action.SlipMgtStkSelectOne;
import com.daily.action.SlipMgtSubListPop;
import com.daily.action.SlipMgtsaveSlip;
import com.daily.action.SlipMgtselectSlips;
import com.daily.action.SlipMgtselectSub;
import com.daily.action.SlipTabChange;
import com.daily.action.StkMgtDelete;
import com.daily.action.StkMgtInsert;
import com.daily.action.StkMgtListView;
import com.daily.action.StkMgtModify;
import com.daily.action.StkMgtSearch;
import com.daily.action.StkMgtView;
import com.daily.action.board.ViewBoardList;
import com.daily.action.report.CustLedgerReport;
import com.daily.dto.ActionForward;

@WebServlet("*.do")
public class Controller extends javax.servlet.http.HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		//RequestURI : 넘어온 주소값, contextPath : 앞 포트번호 제외한 / 부터 저장
		
		String RequestURI=request.getRequestURI(); 
		String contextPath=request.getContextPath();
		String command=request.getServletPath();
		ActionForward forward=null;
		Action action=null;
		
		System.out.println(command);
	
	if(command.equals("/DSJSP/MyCoMgt/MyCoInsert.do")) {
		action = new MyCoInsert();
		try {
			forward= action.execute(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}else if(command.equals("/DSJSP/MyCoMgt/main.do")){
		forward=new ActionForward();
		forward.setPath("../main.jsp");
		forward.setRedirect(true);
	}else if(command.equals("/DSJSP/MyCoChange.do")) {
		action = new MyCoChange();
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/MyCoMgt/MyCoView.do")){
		action = new MyCoView();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/MyCoMgt/MyCoModifyForm.do")) {
		action = new MyCoModify();
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/CustMgt/CustMgtInsert.do")) {
		action = new CustMgtInsert();
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/CustMgt/CustMgtListView.do")) {
		action = new CustMgtListView();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/CustMgt/CustMgtViewForm.do")) {
		action = new CustMgtView();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/CustMgt/CustMgtDelete.do")) {
		action = new CustMgtDelete();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/CustMgt/CustMgtModify.do")) {
		action = new CustMgtModify();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/CustMgt/CustMgtListSearch.do")) {
		action = new CustMgtSearch();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/StkMgt/StkMgtListView.do")) {
		action = new StkMgtListView();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/StkMgt/StkMgtInsert.do")) {
		action = new StkMgtInsert();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/StkMgt/StkMgtViewForm.do")) {
		action = new StkMgtView();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/StkMgt/StkMgtModify.do")) {
		action = new StkMgtModify();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/StkMgt/StkMgtDelete.do")) {
		action = new StkMgtDelete();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/StkMgt/StkMgtListSearch.do")) {
		action = new StkMgtSearch();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/AcctMgt/AcctMgtListView.do")) {
		action = new AcctMgtListView();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/AcctMgt/AcctMgtInsert.do")) {
		action = new AcctMgtInsert();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/AcctMgt/AcctMgtViewForm.do")) {
		action = new AcctMgtView();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/AcctMgt/AcctMgtModify.do")) {
		action = new AcctMgtModify();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/AcctMgt/AcctMgtDelete.do")) {
		action = new AcctMgtDelete();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/AcctMgt/AcctMgtListSearch.do")) {
		action = new AcctMgtSearch();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/Slip/SlipMgtCustSearch.do") || command.equals("/dailySales/DSJSP/Slip/SlipMgtCustSearch.do")) {
		action = new SlipMgtCustSearch();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/Slip/SlipMgtInsertCust.do")) {
		forward=new ActionForward();
		forward.setPath("SlipMgtInsertCust.jsp");
		forward.setRedirect(true);
	}else if(command.equals("/DSJSP/Slip/SlipMgtCustInsert.do")) {
		action = new SlipMgtCustInsert();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/Slip/SlipMgtCustListPop.do") || command.equals("/dailySales/DSJSP/Slip/SlipMgtCustListPop.do")) {
		action = new SlipMgtCustListPop();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/Slip/CustMgtViewForm.do")) {
		action = new SlipMgtCustView();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/Slip/SlipMgtCustListSearch.do")) {
		action = new CustMgtSearch();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/Slip/CustSearchData.do")) {
		forward=new ActionForward();
		forward.setPath("../CustMgt/CustSearchData.jsp");
		forward.setRedirect(true);
	}else if(command.equals("/DSJSP/Slip/SlipMgtCustDelete.do")) {
		action = new SlipMgtCustDelete();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/Slip/SlipMgtCustInsertForm.do")) {
		forward=new ActionForward();
		forward.setPath("SlipMgtInsertCust.jsp");
		forward.setRedirect(true);
	}else if(command.equals("/DSJSP/Slip/SlipMgtCustModify.do")) {
		action = new SlipMgtCustModify();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/Slip/SlipMgtStockSearch.do")) {
		action = new SlipMgtStkSearch();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/Slip/SlipMgtStkListPop.do")) {
		action = new SlipMgtStkListPop();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/Slip/SlipMgtStkListSearch.do")) {
		action = new SlipMgtStkListSearch();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/Slip/SlipMgtStkSelectOne.do")) {
		action = new SlipMgtStkSelectOne();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/Slip/SlipMgtAcctListPop.do")) {
		action = new SlipMgtAcctListPop();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/Slip/saveSlip.do")) {
		action = new SlipMgtsaveSlip();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/Slip/selectSlips.do")) {
		action = new SlipMgtselectSlips();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/CustMgt/CustSearchData.do")) {
		forward=new ActionForward();
		forward.setPath("CustSearchData.jsp");
		forward.setRedirect(true);
	}else if(command.equals("/DSJSP/main.do")) {
		HttpSession session;
		session = request.getSession();
		if(session.getAttribute("Login")==null) {
			forward=new ActionForward();
			forward.setPath("index.jsp");
			forward.setRedirect(true);
		}else {
		action = new MainPage();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
		}
	}else if(command.equals("/DSJSP/Guide.do")) {
		forward=new ActionForward();
		forward.setPath("Board/Guide.jsp");
		forward.setRedirect(true);
	}else if(command.equals("/DSJSP/intro.do")) {
		forward=new ActionForward();
		forward.setPath("intro.jsp");
		forward.setRedirect(true);
	}else if(command.equals("/DSJSP/Board.do")) {
		forward=new ActionForward();
		forward.setPath("Board/Board.jsp");
		forward.setRedirect(true);
	}else if(command.equals("/DSJSP/Board2.do")) {
		forward=new ActionForward();
		forward.setPath("Board/Board2.jsp");
		forward.setRedirect(true);
	}else if(command.equals("/DSJSP/Board/WriteGuide.do")) {
		forward=new ActionForward();
		forward.setPath("WriteGuide.jsp");
		forward.setRedirect(true);
	}else if(command.equals("/DSJSP/Board/WriteGuide.do")) {
		forward=new ActionForward();
		forward.setPath("WriteGuide.jsp");
		forward.setRedirect(true);
	}else if(command.equals("/index.do")) {
		forward=new ActionForward();
		forward.setPath("DSJSP/nav.jsp");
		forward.setRedirect(true);
	}else if(command.equals("/DSJSP/Slip/changTab.do")) {
		action = new SlipTabChange();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/Slip/SlipDelete.do")) {
		action = new SlipMgtDelete();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/Slip/subPopup.do")) {
		action = new SlipMgtselectSub();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/Slip/SlectSubPop.do")) {
		action = new SlipMgtSubListPop();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/codeSend.do")) {
		action = new CrtMgtCodeSend();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/checkAuthen.do")) {
		action = new CrtMgtCheckCode();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/authenCodeDelete.do")) {
		forward=new ActionForward();
		forward.setPath("DSJSP/authenCodeDelete.jsp");
		forward.setRedirect(true);
	}else if(command.equals("/DSJSP/custReportView.do")) {
		forward=new ActionForward();
		forward.setPath("Report/custLedgers.jsp");
		forward.setRedirect(true);
	}else if(command.equals("/DSJSP/Report/CustLedgerReport.do")) {
		action = new CustLedgerReport();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}else if(command.equals("/DSJSP/Board/BoardList.do")) {
		action = new ViewBoardList();
		try {
			forward = action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
		
		
	
		if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
				request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			
		}
		
	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		try {
			doProcess(request,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		try {
			doProcess(request,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}   
	
}

