<%@ page import="javax.naming.NamingException"%>
<%@ page import="javax.naming.Context"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>

<%
	request.setCharacterEncoding("utf-8");
	
	int flag = (Integer)request.getAttribute("flag");
	
	out.println("<script type='text/javascript'>");
	if(flag==0){
		//out.println("정상 입력");
		out.println("alert('Success');");
		out.println("location.href='faqmanage';");
	}else if(flag == 1){
		//out.println("비정상");
		out.println("alert('Fail to write');");
		out.println("history.back();");		
	}
	out.println("</script>");
%>