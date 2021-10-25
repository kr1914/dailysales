package com.daily.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.daily.dto.Article;
import com.daily.dto.BankAccount;
import com.daily.dto.Customer;
import com.daily.dto.Manager;
import com.daily.dto.MyCompany;
import com.daily.dto.Paging;
import com.daily.dto.SalesSlip;
import com.daily.dto.Stock;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class DbAcesse {
	

	
	private static DbAcesse dao;
	private static SqlSessionFactory sqlSessionFactory = null;
	private static SqlSession session = null;
	
	public static DbAcesse getInstance() throws IOException {
		if(dao == null) {
			dao = new DbAcesse();
			InputStream inputStream = Resources.getResourceAsStream("com/mybatis/Mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

		}
		session = sqlSessionFactory.openSession();
		return dao;
		
		
	}
	

	
	List<Map<String, Object>> check = null;
	List<HashMap<String, Object>> slips = null;
	Map<String, Object> map = null;
	int result;
	Boolean dupl;
	MyCompany coInfo;
	Customer custInfo;
	Stock stkInfo;
	BankAccount acctInfo;
	SalesSlip sales;
	Article article;
	
//로그인
	public List<Map<String, Object>> login (String id, String pwd){
		Map<String, String> userData = new HashMap<String, String>();
		userData.put("id", id);
		userData.put("pwd", pwd);
		check = session.selectList("login", userData);
		session.close();
		return check;
	}
//아이디 중복확인
	public Boolean duplicateCheck(String id) {
		
		dupl = session.selectOne("duplCheck", id);
		session.close();
		return dupl;
	}
//회원가입
	public int crtId(Map<String, String> map) {
		result = session.insert("crtId", map);
		return result;
	}
//회사 생성
	public int myCoInsert(MyCompany co) {
		result = session.insert("MyCoInsert", co);
		return result;
	}
//회사 정보 조회
	public MyCompany myCoView(Map<String, Object> co) {
		try {
			coInfo = session.selectOne("MyCoView", co);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
		session.close();
		}
		return coInfo;
	}
//회사 정보 수정
	public int myCoModify(MyCompany co) {
		result = session.update("MyCoModify", co);
		return result;
	}

//매니저 정보 추가
	public int managerInsert(Manager mgr) {
		result = session.insert("InsertManager", mgr);
		session.close();
		return result;
	}
	
//사용자 확인
	public int myCoCheckAdminFree(Map<String, Object> co) {	
		//이메일, key값, 모든 권한 가능
		result = session.selectOne("myCoAdminCheck1", co);
		session.close();
		return result;
	}
	public int myCoCheckManager(Map<String, Object> co) {	
		//이메일, key값, 매니저부터 가능
		result = session.selectOne("myCoAdminCheck2", co);
		session.close();
		return result;
	}
	public int myCoCheckMasterOnly(Map<String, Object> co) {	
		//이메일, key값, 마스터만 가능
		result = session.selectOne("myCoAdminCheck3", co);
		session.close();
		return result;
	}
//거래처 등록
	
	public int custInsert(Customer cs) {
		result = session.insert("custInsert", cs);
		return result;
	}
//거래처 조회
	public List<Map<String, Object>> custListView(String key){
		check = session.selectList("custListView",key);
		session.close();
		return check;
	}
// 거래처 상세조회
	public Customer custViewDetail(Map<String, String> cs) {
		custInfo = session.selectOne("custViewDetail",cs);
		session.close();
		return custInfo;
	}
// 거래처 삭제
	public int custDelete(Map<String, String> cs) {
		result = session.delete("custDelete", cs);
		return result;
	}
// 거래처 정보 수정
	public int custModify(Customer cs) {
		result = session.update("custModify", cs);
		session.close();
		return result;
	}
// 거래처 정보 검색
	public List<Map<String, Object>> custSearchList(Map<String, String> set){
		String t = set.get("option");
		if(t.equals("all")&&!set.get("keyword").equals("")){
			check = session.selectList("custSearchAll", set);
		}else if(set.get("keyword").equals("")) {
			check = session.selectList("custSearchSpace",set);
		}else {
			check = session.selectList("custSearchList", set);
		}
		session.close();
		return check;
	}
//상품 목록 조회
	public List<Map<String, Object>> stkListView(String key){
		check = session.selectList("stkListView",key);
		session.close();
		return check;
	}
//상품 생성
	public int stkInsert(Stock stk) {
		result = session.insert("stkInsert", stk);
		return result;
	}
//상품 상세 조회
	public Stock stkViewDetail(Map<String, String> stk) {
		stkInfo = session.selectOne("stkViewDetail",stk);
		session.close();
		return stkInfo;
	}
//상품 정보 수정
	public int stkModify(Stock stk) {
		result = session.update("stkModify", stk);
		return result;
	}
//상품 정보 삭제
	public int stkDelete(Map<String, String> cs) {
		result = session.delete("stkDelete", cs);
		return result;
	}
//상품 정보 검색
	public List<Map<String, Object>> stkSearchList(Map<String, String> set){
		String t = set.get("option");
		if(t.equals("all")&&!set.get("keyword").equals("")){
			check = session.selectList("stkSearchAll", set);
		}else if(set.get("keyword").equals("")) {
			check = session.selectList("stkSearchSpace",set);
		}else {
			check = session.selectList("stkSearchList", set);
		}
		session.close();
		return check;
	}
//계좌 목록 조회
	public List<Map<String, Object>> acctListView(String key){
		check = session.selectList("acctListView",key);
		session.close();
		return check;
	}
//계좌 생성
	public int acctInsert(BankAccount acct) {
		result = session.insert("acctInsert", acct);
		session.close();
		return result;
	}
//계좌 상세 조회
	public BankAccount acctViewDetail(Map<String, String> stk) {
		acctInfo = session.selectOne("acctViewDetail",stk);
		session.close();
		return acctInfo;
	}
//계좌 정보 수정
	public int acctModify(BankAccount acct) {
		result = session.update("acctModify", acct);
		session.close();
		return result;
	}
//계좌 정보 삭제
	public int acctDelete(Map<String, String> cs) {
		result = session.delete("acctDelete", cs);
		session.close();
		return result;
	}
//계좌 정보 검색
	public List<Map<String, Object>> acctSearchList(Map<String, String> set){
		String t = set.get("option");
		if(t.equals("all")&&!set.get("keyword").equals("")){
			check = session.selectList("acctSearchAll", set);
		}else if(set.get("keyword").equals("")) {
			check = session.selectList("acctSearchSpace",set);
		}else {
			check = session.selectList("acctSearchList", set);
		}
		session.close();
		return check;
	}
//메인페이지 일자별 매출 차트 자료
	public List<Map<String, Object>> saleChartData(String key){
		
		check = session.selectList("salesChartData", key);
		session.close();
		return check;
	}
//메인페이지 거래처별 매출 자료
	public List<Map<String, Object>> salesCustChart(String key){
		
		check = session.selectList("salesCustChart", key);
		session.close();
		return check;
	}	
	
		
//매출전표입력
	//거래관리
	public int insertTransaction(HashMap<String, String> slip) {
		
		result = session.insert("insertTransaction", slip);
		if(result>0) {
			session.insert("insertTrans", slip);
			session.insert("insertTransBook", slip);
		}else {
			session.rollback();
		}
		
		return result;
	}
	public int insertPurcharse(HashMap<String, String> slip) {
		
		result = session.insert("insertPurcharse", slip);
		if(result>0) {
			session.insert("insertTransPurcharse", slip);
			session.insert("insertTransBookPurcharse", slip);
		}else {
			session.rollback();
		}
		
		return result;
	}
	
	
	
	public int modifyTransaction(HashMap<String, String> slip) {
			
			String a = session.selectOne("vatCheck", slip);
			System.out.println(slip);
			if(a!=null) {
				result = session.update("updateTrans", slip);
			}else if(a==null) {
				result = session.update("updateTransAndVat", slip);
			}
			
			session.update("updateTransBook", slip);

		return result;
	}
//매입 전표 수정
	public int modifyPurcharse(HashMap<String, String> slip) {
		
		String a = session.selectOne("vatCheckPur", slip);
		System.out.println(slip);
		if(a!=null) {
			System.out.println("부가세있");
			result = session.update("updateTransPur", slip);
		}else if(a==null) {
			System.out.println("부가세없");
			result = session.update("updateTransAndVatPur", slip);
		}
		
		session.update("updateTransBookPur", slip);
	
	return result;
}
	//deleteTran
	
public int deleteTran(HashMap<String, String> slip) {
		
		result = session.delete("deleteTran", slip);

		session.close();
	
	return result;
}
	
	
//매출전표 조회
	public List<HashMap<String, Object>> selectSlipList(Map<String, String> key){
		slips = session.selectList("selectSlipList",key);
		session.close();
		return slips;
	}
	
//매입전표 조회
	public List<HashMap<String, Object>> selectSlipListPurcharse(Map<String, String> key){
		slips = session.selectList("selectSlipListPurcharse",key);
		session.close();
		return slips;
	}
//메인 페이지 게시글
	public List<Map<String, Object>> mainpageArticles(){
		check = session.selectList("mainPageArticles");
		session.close();
		return check;
	}
// 메인 페이지 가이드 게시판
	
	public List<Map<String, Object>> mainPageGuide(){
		check = session.selectList("mainPageGuide");
		session.close();
		return check;
	}
		
//계정과목(비용) 조회
	public List<Map<String, Object>> selectSubject(String key){
		
		check = session.selectList("selectSubject", key);
		session.close();
		return check;
	}
//거래처원장 조회하기 
	public List<Map<String, Object>> custLedgers(Map<String, Object> call){
		try {
			check = session.selectList("custLedgers", call);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return check;
	}
//게시판 확인
	public List<Map<String, Object>> boardSelect(){
		try {
			check = session.selectList("boardSelect");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		session.close();
		
		return check;
	}
//이용가이드 게시판 조회
	public List<Map<String, Object>> guideSelect(){
		try {
			check = session.selectList("guideSelect");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		session.close();
		
		return check;
	}
//커뮤니티 게시판 조회
	public Article selectArticle(String index) {
		article = session.selectOne("selectArticle", index);
		return article;
	}
//
	public List<Map<String, Object>> selectArticle(Map<String, Object> pages) {
		check = session.selectList("selectBoard", pages);
		return check;
	}
//자유게시글 숫자 확인
	public int countArticle(String type) {
		result = session.selectOne("countArticle", type);
		return result;
	}
	
//게시글 보기
	public int viewArticle(String index) {
		result = session.update("viewArticle", index);
		
		return result;
	}
//게시글 좋아요 여부 확인
	public Map<String, Object> checkLikey(HashMap<String, String> info){
		map = session.selectOne("checkLikey", info);
		return map;
	}
//게시글 수정
	public int updateArticle(Article article) {
		result = session.update("updateArticle",article);
		
		return result;
	}
//게시글 삭제
	public int deleteArticle(String index) {
		result = session.delete("deleteArticle", index);
		return result;
	}
//게시글 작성
	public int writeArticle(Article article) {
		result = session.insert("writeArticle", article);
		
		return result;
	}
		
		
	
	
	public void commit() {
		session.commit();
		
	}
	public void rollback() {
		session.rollback();
	}
	public void close() {
		session.close();
	}
}
