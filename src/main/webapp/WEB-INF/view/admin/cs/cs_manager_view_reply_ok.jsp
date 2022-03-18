<%@ page import="com.hoteldelluna.web.service.CSBoardDAO"%>
<%@ page import="com.hoteldelluna.web.entity.CSBoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	
	String c_no = request.getParameter("c_no");
	CSBoardTO to = new CSBoardTO();
	
	to.setC_subject(request.getParameter("c_subject"));
	to.setC_name(request.getParameter("c_name"));
	to.setC_password(request.getParameter("c_password"));
	to.setC_content(request.getParameter("c_content"));
	to.setC_wip(request.getRemoteAddr());
	
	CSBoardDAO dao = new CSBoardDAO();
	int flag = dao.csboardReplyOk(to);
	
	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('Success');");
		out.println("location.href='cs_manager.jsp';");
	} else if (flag == 1) {
		out.println("alert('Fail to write');");
		out.println("history.back();");
	}
	out.println("</script>");
%>