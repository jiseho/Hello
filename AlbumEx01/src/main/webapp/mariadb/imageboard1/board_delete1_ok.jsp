<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
	request.setCharacterEncoding("utf-8");

	String seq = request.getParameter("seq");
	String password = request.getParameter("password");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int flag = 2;	
	try{		
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb2");	
		conn = dataSource.getConnection();
		
		String sql = "select filename from pds_board1 where seq=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,seq);
		
		rs = pstmt.executeQuery();
		
		String filename = null;
		if(rs.next()){
			filename = rs.getString("filename");
		}
		
		sql = "delete from pds_board1 where seq=? and password=?";			
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,seq);
		pstmt.setString(2,password);		
		
		int result = pstmt.executeUpdate();
		if(result == 0){
			// 비밀번호가 틀린경우
			flag = 1;
		}else if(result == 1){
			//정상
			flag = 0;
			
			if(filename != null){
				java.io.File file = new java.io.File("C:/JSP/jsp-workspace/BoardEx01/src/main/webapp/upload"+"/"+filename);
				file.delete();
			}
			
			
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
		out.println("alert('글삭제에 성공했습니다.');");
		out.println("location.href='board_list1.jsp';");
	}else if(flag == 1){
		out.println("alert('비밀번호가 틀립니다.');");
		out.println("history.back();");		
	}else if(flag == 2){
		out.println("alert('글삭제에 실패했습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
%>