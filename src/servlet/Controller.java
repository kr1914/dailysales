package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daily.dto.ActionForward;

import action.AcctMgtDelete;
import action.AcctMgtInsert;
import action.AcctMgtListView;
import action.AcctMgtModify;
import action.AcctMgtSearch;
import action.AcctMgtView;
import action.Action;
import action.CustMgtDelete;
import action.CustMgtInsert;
import action.CustMgtListView;
import action.CustMgtModify;
import action.CustMgtSearch;
import action.CustMgtView;
import action.MainPage;
import action.MyCoChange;
import action.MyCoInsert;
import action.MyCoModify;
import action.MyCoView;
import action.SlipMgtAcctListPop;
import action.SlipMgtCustDelete;
import action.SlipMgtCustInsert;
import action.SlipMgtCustListPop;
import action.SlipMgtCustModify;
import action.SlipMgtCustSearch;
import action.SlipMgtCustView;
import action.SlipMgtStkListPop;
import action.SlipMgtStkListSearch;
import action.SlipMgtStkSearch;
import action.SlipMgtStkSelectOne;
import action.StkMgtDelete;
import action.StkMgtInsert;
import action.StkMgtListView;
import action.StkMgtModify;
import action.StkMgtSearch;
import action.StkMgtView;
import action.SlipMgtsaveSlip;
import action.SlipMgtselectSlips;

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
	}else if(command.equals("/DSJSP/Slip/SlipMgtCustSearch.do")) {
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
	}else if(command.equals("/DSJSP/Slip/SlipMgtCustListPop.do")) {
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
	}else if(command.equals("/DSJSP/Board.do")) {
		forward=new ActionForward();
		forward.setPath("Board/Board.jsp");
		forward.setRedirect(true);
	}else if(command.equals("/DSJSP/Board/WriteGuide.do")) {
		forward=new ActionForward();
		forward.setPath("WriteGuide.jsp");
		forward.setRedirect(true);
	}else if(command.equals("/DSJSP/Board/WriteGuide.do")) {
		forward=new ActionForward();
		forward.setPath("WriteGuide.jsp");
		forward.setRedirect(true);
	}else if(command.equals("/DSJSP/index.do")) {
		forward=new ActionForward();
		forward.setPath("DSJSP/nav.jsp");
		forward.setRedirect(true);
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

