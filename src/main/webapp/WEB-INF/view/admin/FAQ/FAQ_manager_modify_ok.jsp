
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>

<%@ page import="javax.sql.DataSource" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>

<%
   request.setCharacterEncoding("utf-8");
   
   String q_no = (String)request.getAttribute("q_no");
   int flag = (Integer)request.getAttribute("flag");
   
   out.println("<script type='text/javascript'>");
   if(flag == 0) {
      out.println("alert('Success');");
      out.println("location.href='./faqview.do?q_no=" + q_no + "';");
   } else if(flag == 1) {
      out.println("alert('Wrong password');");
      out.println("history.back();");
   } else if(flag == 2) {
      out.println("alert('Fail to write');");
      out.println("history.back();");
   }
   out.println("</script>");
%>