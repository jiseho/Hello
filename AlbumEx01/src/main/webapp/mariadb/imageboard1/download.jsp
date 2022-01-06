<%@page import="org.apache.catalina.startup.SetContextPropertiesRule"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.net.URLEncoder" %>
<%
	request.setCharacterEncoding("utf-8");
	String fileName = request.getParameter("filename");
	String downPath = "C:/JSP/jsp-workspace/AlbumEx01/src/main/webapp/upload/"+fileName;
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition","attachment;filename="+URLEncoder.encode(fileName,"utf-8"));
	FileInputStream fis = new FileInputStream(downPath);
	ServletOutputStream sos = response.getOutputStream();
	byte[]b = new byte[4096];
	int data;
	while((data = fis.read(b,0,b.length))!=-1){
		sos.write(b,0,data);
	}
	sos.flush();
	sos.close();
	fis.close();
%>
