<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.daily.dao.DbAcesse" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.PrintWriter" %>
<%	DbAcesse dba = DbAcesse.getInstance();%>
<%  String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String check = null;
	List<Map<String, Object>> result = dba.login(id,pwd);
	String re = "";
	//가져올것. 아이디, 이름, 보유회사명, 
	if(result.size()==0){ //일치하는 아이디 패스워드가 없으면
		%>fail<%
	}else {
		session.setAttribute("Login", result);
		if(result.get(0).get("company")!=null){ //생성된 회사 계정이 있으면, 리스트 처음 값을 세션에 등록
			session.setAttribute("nowCo",result.get(0).get("key"));
		}else {
			session.setAttribute("nowCo",null);
		}
	}
%>