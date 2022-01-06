<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
	int recordPerPage = 15;
	int totalRecord = 0;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;	

	StringBuffer sbHtml = new StringBuffer();
	
	try{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb2");

		conn = dataSource.getConnection();
		
		String sql = "select seq,subject,writer,filename, date_format(wdate,'%Y-%m-%d') wdate,hit,datediff(now(),wdate)wgap from album_board1 order by seq desc";		
		pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);		
		
		rs = pstmt.executeQuery();
		
		rs.last();
		totalRecord = rs.getRow();
		rs.beforeFirst();
		
		for(int i=1; i<=recordPerPage; i++){
			String seq = "0";
			String subject = "";
			String writer = "";
			String filename = "";
			String wdate = "";
			String hit = "";
			int wgap = 0;
			
			//rs에 데이터가 있으면 변수에 할당
			if(rs.next()){
				seq = rs.getString("seq");
				subject = rs.getString("subject");
				if(subject.length()>10){
					subject = subject.substring(0,10)+"...";
				}
			
				writer = rs.getString("writer");
				filename = rs.getString("filename");
				wdate = rs.getString("wdate");
				hit = rs.getString("hit");
				wgap = rs.getInt("wgap");
			}
		
			if(i%5 == 1){
				sbHtml.append("<tr>");	
			}
			
			sbHtml.append("<td width='20%' class='last2'>");
			sbHtml.append("<div class='board'>");
			sbHtml.append("<table class='boardT'>");
			sbHtml.append("<tr>");
			sbHtml.append("<td class='boardThumbWrap'>");
			sbHtml.append("<div class='boardThumb'>");
			
			if(seq.equals("0")){
				sbHtml.append("<img src='../../images/noimage.jpg' border='0' width='100%' />");
			}else{
				sbHtml.append("<a href='board_view1.jsp?seq= " + seq + "'><img src='../../upload/" + filename + "' border='0' width='100%' /></a>");	
			}
			
			sbHtml.append("</div>");														
			sbHtml.append("</td>");
			sbHtml.append("</tr>");
			sbHtml.append("<tr>");
			sbHtml.append("<td>");
			sbHtml.append("<div class='boardItem'>");	
			sbHtml.append("<strong>" +subject+" </strong>");
			if(wgap==0){
				sbHtml.append("<img src='../../images/icon_new.gif' alt='NEW'>");
			}
			sbHtml.append("</div>");
			sbHtml.append("</td>");
			sbHtml.append("</tr>");
			sbHtml.append("<tr>");
			sbHtml.append("<td><div class='boardItem'><span class='bold_blue'>"+ writer +"</span></div></td>");
			sbHtml.append("</tr>");
			sbHtml.append("<tr>");
			sbHtml.append("<td><div class='boardItem'>"+wdate+"<font>|</font> Hit "+hit+ "</div></td>");
			sbHtml.append("</tr>");
			sbHtml.append("</table>");
			sbHtml.append("</div>");
			sbHtml.append("</td>");
			if(i%5 == 0){
				sbHtml.append("</tr>");	
			}
		}
		} catch(NamingException e ){
			System.out.println("[에러]:"+ e.getMessage());	
		} catch(SQLException e){
			System.out.println("[에러]:"+ e.getMessage());
		} finally {
			if(rs != null)rs.close();
			if(pstmt != null)pstmt.close();	
			if(conn != null)conn.close();			
		}
	
	
	
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board_list.css">
<style type="text/css">
<!--
	.board_pagetab { text-align: center; }
	.board_pagetab a { text-decoration: none; font: 12px verdana; color: #000; padding: 0 3px 0 3px; }
	.board_pagetab a:hover { text-decoration: underline; background-color:#f2f2f2; }
	.on a { font-weight: bold; }
-->
</style>
</head>

<body>
<!-- 상단 디자인 -->
<div class="contents1"> 
	<div class="con_title"> 
		<p style="margin: 0px; text-align: right">
			<img style="vertical-align: middle" alt="" src="../../images/home_icon.gif" /> &gt; 커뮤니티 &gt; <strong>여행지리뷰</strong>
		</p>
	</div> 
	<div class="contents_sub">	
		<div class="board_top">
			<div class="bold">
				<p>총 <span class="txt_orange">1</span>건</p>
			</div>
		</div>	
		
		<!--게시판-->
		<table class="board_list">
		<%=sbHtml %>
		</table>
		<!--//게시판-->	
		
		<div class="align_right">		
			<input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='board_write1.jsp'" />
		</div>
		
		<!--페이지넘버-->
		<div class="paginate_regular">
			<div class="board_pagetab">
				<span class="off"><a href="#">&lt;&lt;</a>&nbsp;&nbsp;</span>
				<span class="off"><a href="#">&lt;</a>&nbsp;&nbsp;</span>
				<span class="off"><a href="#">[ 1 ]</a></span>
				<span class="on"><a href="#">[ 2 ]</a></span>
				<span class="off"><a href="#">[ 3 ]</a></span>
				<span class="off">&nbsp;&nbsp;<a href="#">&gt;</a></span>
				<span class="off">&nbsp;&nbsp;<a href="#">&gt;&gt;</a></span>
			</div>
		</div>
		<!--//페이지넘버-->	
  	</div>
</div>
<!--//하단 디자인 -->

</body>
</html>
