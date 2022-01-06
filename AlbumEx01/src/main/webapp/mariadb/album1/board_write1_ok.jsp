<%@page import="java.io.File"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.sql.DriverManager" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%

	String uploadPath = "C:/JSP/jsp-workspace/AlbumEx01/src/main/webapp/upload";
	int maxFileSize = 1024 * 1024 * 4;
	String encType = "utf-8";
		
	MultipartRequest multi 
	= new MultipartRequest(request,uploadPath,maxFileSize,encType, new DefaultFileRenamePolicy());
	
	String subject = multi.getParameter("subject");
	String writer = multi.getParameter("writer");	
	String mail = "";
	if(!multi.getParameter("mail1").equals("")&&!multi.getParameter("mail2").equals("")){
		mail = multi.getParameter("mail1")+"@"+multi.getParameter("mail2");
	}
	
	String password = multi.getParameter("password");
	String content = multi.getParameter("content");
	
	String wip = request.getRemoteAddr();
	
	String filename = multi.getFilesystemName("upload");
	java.io.File file = multi.getFile("upload");
	long filesize = 0;
	if(file!=null){
		filesize = file.length();
	}
	
	String latitude = multi.getParameter("latitude");
	String longitude = multi.getParameter("longitude");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	int flag = 1;
	
	try{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb2");
		
		conn = dataSource.getConnection();
		
		String sql = "insert into album_board1 values(0,?,?,?,?,?,?,?,?,?,0,?,now())";		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,subject);
		pstmt.setString(2,writer);
		pstmt.setString(3,mail);
		pstmt.setString(4,password);
		pstmt.setString(5,content);
		pstmt.setString(6,filename);
		pstmt.setLong(7,filesize);
		pstmt.setString(8,latitude);
		pstmt.setString(9,longitude);
		pstmt.setString(10,wip);
		
		if(pstmt.executeUpdate() == 1){
			flag = 0;
		}
	} catch(NamingException e ){
		System.out.println("[에러]:"+ e.getMessage());	
	
	} catch(SQLException e){
		System.out.println("[에러]:"+ e.getMessage());
	} finally {
		if(pstmt != null)pstmt.close();	
		if(conn != null)conn.close();			
	}
	
	out.println("<script type='text/javascript'>");
	if(flag==0){
		//out.println("정상 입력");
		out.println("alert('글쓰기에 성공했습니다.');");
		out.println("location.href='board_list1.jsp';");
	}else if(flag == 1){
		//out.println("비정상");
		out.println("alert('글쓰기에 실패했습니다.');");
		out.println("history.back();");		
	}
	out.println("</script>");
%>