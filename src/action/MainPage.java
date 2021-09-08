package action;

import java.io.IOException;
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
import com.daily.svc.MainPageBoardData;
import com.daily.svc.MainPageGuideData;
import com.daily.svc.SalesChartDataFromDB;
import com.daily.svc.SalesCustChartDataFromDB;
import com.daily.svc.StkListView;
import com.daily.svc.WrongMasageSend;

public class MainPage implements Action {

	
	ActionForward forward;
	HttpSession session;
	String adkey ="";
	SalesChartDataFromDB alv;
	List<Map<String, Object>> chartData = null;
	List<Map<String, Object>> board = null;
	List<Map<String, Object>> custSales = null;
	List<Map<String, Object>> guide = null;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		session = request.getSession();
		
		
		
		adkey = (String)session.getAttribute("nowCo"); //현재 메인 회사
		chartData(adkey); //차트 데이터 불러오기
		mainPageArticles(); //게시글 불러오기
		chartData_cust(adkey);
		mainPageGuides(); //가이드 글
		
		request.setAttribute("chartData", chartData); //차트 정보
		request.setAttribute("board", board);
		request.setAttribute("custSales", custSales);
		request.setAttribute("guide", guide);
		
		forward = new ActionForward();
		forward.setPath("main.jsp");

		
		
	
		
		return forward;
	}
//차트 데이터 불러오기
		public void chartData(String key) throws IOException {
			alv = new SalesChartDataFromDB(); 
			this.chartData = alv.excute(key);
		}
//게시글 가져오기
		public void mainPageArticles() throws IOException {
			MainPageBoardData sml = new MainPageBoardData();
			this.board = sml.excute();
			
		}
//거래처별 매출 순위
		public void chartData_cust(String key) throws IOException {
			SalesCustChartDataFromDB sla = new SalesCustChartDataFromDB(); 
			this.custSales = sla.excute(key);
		}
//가이드글 가져오기
		public void mainPageGuides() throws IOException {
			MainPageGuideData sml = new MainPageGuideData();
			this.guide = sml.excute();
			
		}
}
