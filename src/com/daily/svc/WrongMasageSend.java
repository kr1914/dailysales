package com.daily.svc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class WrongMasageSend {

	public void wrongAccess(String word, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('"+word+"')");
		out.println("history.back();");
		out.println("</script>");
	}
}
