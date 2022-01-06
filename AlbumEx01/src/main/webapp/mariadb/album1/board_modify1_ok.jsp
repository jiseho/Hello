<%@page import="javax.naming.NamingException"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>

<%
	String uploadPath = "C:/JSP/jsp-workspace/AlbumEx01/src/main/webapp/upload";
	int maxFileSize = 1024 * 1024 * 4;
	String encType = "utf-8";
	
	MultipartRequest multi = 
	new MultipartRequest(request,uploadPath,maxFileSize,encType, new DefaultFileRenamePolicy());	

	
	String seq = multi.getParameter( "seq" );	
	String subject = multi.getParameter( "subject" );
	String mail = "";
	
	if( !multi.getParameter( "mail1" ).equals( "" ) && !multi.getParameter( "mail2" ).equals( "" ) ) {
		mail = multi.getParameter( "mail1" ) + "@" + multi.getParameter( "mail2" );
	}
		
	String password = multi.getParameter( "password" );
	String content = multi.getParameter( "content" );
	String latitude = multi.getParameter("latitude");
	String longitude = multi.getParameter("longitude");
	
	//기존 파일 이름, 사이즈
	String filename="";
	long filesize = 0;
	
	//새로운 파일이름, 사이즈
	String newFilename = multi.getFilesystemName("upload");
	java.io.File newFile = multi.getFile("upload");
	long newFilesize = 0;
	if(newFile != null){
		newFilesize = newFile.length();
	}
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int flag = 2;
	try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup( "java:comp/env" );
		DataSource dataSource = (DataSource)envCtx.lookup( "jdbc/mariadb2" );
	
		conn = dataSource.getConnection();
		
		String sql = "select filename  from album_board1 where seq=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,seq);
		
		rs = pstmt.executeQuery();
		filename = null;
		if(rs.next()){
			filename = rs.getString("filename");			
		}
		if(newFilename!=null){//새로운 파일이 업로드 있으면
		sql = "update album_board1 set subject=?, mail=?, content=?, filename=? ,filesize=?,latitude=?,longitude=? where seq=? and password=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, subject );
			pstmt.setString( 2, mail );
			pstmt.setString( 3, content );
			pstmt.setString( 4, newFilename);
			pstmt.setLong( 5, newFilesize );
			pstmt.setString( 6, latitude );
			pstmt.setString( 7, longitude );
			pstmt.setString( 8, seq );
			pstmt.setString( 9, password );
			
		}else{//새로운 파일이 업로드 없으면
			sql = "update album_board1 set subject=?, mail=?,content=?,latitude=?,longitude=? where seq=? and password=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString( 1, subject );
			pstmt.setString( 2, mail );
			pstmt.setString( 3, content );
			pstmt.setString( 4, latitude );
			pstmt.setString( 5, longitude );
			pstmt.setString( 6, seq );
			pstmt.setString( 7, password );
		
		}		
		
		int result = pstmt.executeUpdate(); 
		if( result == 0 ) {
			flag = 1;
		} else if( result == 1 ) {
			flag = 0;
			
			if(newFilename != null && filename!=null){//새로운 파일추가시 기존파일이있으면 기존파일 삭제
				java.io.File file = new java.io.File("C:/JSP/jsp-workspace/BoardEx01/src/main/webapp/upload"+"/" + filename);
				file.delete();
			}
		}
	} catch( NamingException e ) {
		System.out.println( "[에러] : " + e.getMessage() );	
	} catch( SQLException e ) {
		System.out.println( "[에러] : " + e.getMessage() );
	} finally {
		if( pstmt != null ) pstmt.close();
		if( conn != null ) conn.close();
	}

	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert('글수정에 성공했습니다.');" );
		out.println( "location.href='board_view1.jsp?seq=" + seq + "';" );
	} else if( flag == 1 ) {
		out.println( "alert('비밀번호가 틀립니다.');" );
		out.println( "history.back();" );
	} else if( flag == 2 ) {
		out.println( "alert('글수정에 실패했습니다.');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>
