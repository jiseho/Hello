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
request.setCharacterEncoding("utf-8");

//현재 페이지 번호
int cpage = 1;
if(request.getParameter("cpage")!=null&&!request.getParameter("cpage").equals("")){
	cpage = Integer.parseInt(request.getParameter("cpage"));
}
//한 페이지당 보일 데이터 갯수
int recordPerPage = 10;
int totalRecord = 0;
int totalPage = 1;
int blockPerPage = 5;

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;	


StringBuffer sbHtml = new StringBuffer();

try{
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb2");

	conn = dataSource.getConnection();
	
	String sql = "select seq,subject,writer,filesize, date_format(wdate,'%Y-%m-%d') wdate,hit,datediff(now(),wdate)wgap from album_board1 order by seq desc";		
	pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);		
	
	rs = pstmt.executeQuery();
	
	rs.last();
	totalRecord = rs.getRow();
	rs.beforeFirst();
	//전체 페이지
	totalPage = ((totalRecord -1) / recordPerPage) + 1;
	//읽을 데이터 위치
	int skip = (cpage - 1) * recordPerPage;
	if(skip!=0)rs.absolute(skip);
	
	for(int i = 0; i<recordPerPage && rs.next(); i++){
		String seq = rs.getString("seq");	
		String subject = rs.getString("subject");	
		String writer = rs.getString("writer");			
		long filesize = rs.getLong("filesize");		
		String wdate = rs.getString("wdate");	
		String hit = rs.getString("hit");	
		int wgap = rs.getInt("wgap");	
		
		sbHtml.append("<tr>");
		sbHtml.append("<td>&nbsp;</td>");
		sbHtml.append("<td>" + seq +"</td>");
					
		sbHtml.append("<td class='left'>");
		sbHtml.append("<a href='board_view1.jsp?seq="+seq+"'>"+ subject+ "</a>&nbsp");
		if(wgap==0){
		sbHtml.append("<img src='../../images/icon_new.gif' alt='NEW'>");
		sbHtml.append("</td>");
		}
		sbHtml.append("<td>"+writer+"</td>");
		sbHtml.append("<td>"+wdate+"</td>");
		sbHtml.append("<td>"+hit+"</td>");
		sbHtml.append("<td>");
		if(filesize !=0){
			sbHtml.append("<img src='../../images/icon_file.gif'/>");
		}
		sbHtml.append("</td>");
		sbHtml.append("</tr>");		
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
		<tr>
			<td width="20%" class="last2">
				<div class="board">
					<table class="boardT">
					<tr>
						<td class='boardThumbWrap'>
							<div class='boardThumb'>
								<a href="board_view1.jsp"><img src="../../upload/607927_1_thumb1.jpg" border="0" width="100%" /></a>
							</div>																		
						</td>
					</tr>
					<tr>
						<td>
							<div class='boardItem'>	
								<strong>제주 올레길 좋아...</strong>
								<img src="../../images/icon_new.gif" alt="NEW">
							</div>
						</td>
					</tr>
					<tr>
						<td><div class='boardItem'><span class="bold_blue">여행자</span></div></td>
					</tr>
					<tr>
						<td><div class='boardItem'>2016.03.02 <font>|</font> Hit 329</div></td>
					</tr>
					</table>
				</div>
			</td>

			<td width="20%" class="last2">
				<div class="board">
					<table class="boardT">
					<tr>
						<td class='boardThumbWrap'>
							<div class='boardThumb'>
								<a href="board_view1.jsp"><img src="../../upload/607927_1_thumb1.jpg" border="0" width="100%" /></a>
							</div>																		
						</td>
					</tr>
					<tr>
						<td>
							<div class='boardItem'>	
								<strong>제주 올레길 좋아...</strong>
								<img src="../../images/icon_new.gif" alt="NEW">
							</div>
						</td>
					</tr>
					<tr>
						<td><div class='boardItem'><span class="bold_blue">여행자</span></div></td>
					</tr>
					<tr>
						<td><div class='boardItem'>2016.03.02 <font>|</font> Hit 329</div></td>
					</tr>
					</table>
				</div>
			</td>
			<td width="20%" class="last2">
				<div class="board">
					<table class="boardT">
					<tr>
						<td class='boardThumbWrap'>
							<div class='boardThumb'>
								<a href="board_view1.jsp"><img src="../../upload/607927_1_thumb1.jpg" border="0" width="100%" /></a>
							</div>																		
						</td>
					</tr>
					<tr>
						<td>
							<div class='boardItem'>	
								<strong>제주 올레길 좋아...</strong>
								<img src="../../images/icon_new.gif" alt="NEW">
							</div>
						</td>
					</tr>
					<tr>
						<td><div class='boardItem'><span class="bold_blue">여행자</span></div></td>
					</tr>
					<tr>
						<td><div class='boardItem'>2016.03.02 <font>|</font> Hit 329</div></td>
					</tr>
					</table>
				</div>
			</td>
			<td width="20%" class="last2">
				<div class="board">
					<table class="boardT">
					<tr>
						<td class='boardThumbWrap'>
							<div class='boardThumb'>
								<a href="board_view1.jsp"><img src="../../upload/607927_1_thumb1.jpg" border="0" width="100%" /></a>
							</div>																		
						</td>
					</tr>
					<tr>
						<td>
							<div class='boardItem'>	
								<strong>제주 올레길 좋아...</strong>
								<img src="../../images/icon_new.gif" alt="NEW">
							</div>
						</td>
					</tr>
					<tr>
						<td><div class='boardItem'><span class="bold_blue">여행자</span></div></td>
					</tr>
					<tr>
						<td><div class='boardItem'>2016.03.02 <font>|</font> Hit 329</div></td>
					</tr>
					</table>
				</div>
			</td>
			<td width="20%" class="last2">
				<div class="board">
					<table class="boardT">
					<tr>
						<td class='boardThumbWrap'>
							<div class='boardThumb'>
								<a href="board_view1.jsp"><img src="../../upload/607927_1_thumb1.jpg" border="0" width="100%" /></a>
							</div>																		
						</td>
					</tr>
					<tr>
						<td>
							<div class='boardItem'>	
								<strong>제주 올레길 좋아...</strong>
								<img src="../../images/icon_new.gif" alt="NEW">
							</div>
						</td>
					</tr>
					<tr>
						<td><div class='boardItem'><span class="bold_blue">여행자</span></div></td>
					</tr>
					<tr>
						<td><div class='boardItem'>2016.03.02 <font>|</font> Hit 329</div></td>
					</tr>
					</table>
				</div>
			</td>
		</tr>
		</table>
		<!--//게시판-->	
		
		<div class="align_right">		
			<input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='board_write1.jsp?cpage=<%=cpage %>'" />
		</div>
		
		<!--페이지넘버-->
		<div class="paginate_regular">
			<div class="board_pagetab">
				
				<%

	int startblock = cpage-(cpage-1)%blockPerPage;
	int endblock = cpage-(cpage-1)%blockPerPage + blockPerPage-1;
	if(endblock >= totalPage){
	endblock = totalPage;
	}
	if(startblock==1){
		out.println("<span><a>&lt;&lt;</a></span>");
	}else{
		out.println("<span><a href='board_list1.jsp?cpage="+(startblock-blockPerPage)+"'>&lt;&lt;</a></span>");
	}
	out.println("&nbsp;");
	
%>
	
	
<%
				if(cpage==1){
					out.println("<span><a>&lt;</a></span>");				
				}else{
					out.println("<span><a href='board_list1.jsp?cpage="+ (cpage-1) +"'>&lt;</a></span>");				
				}
				out.println("&nbsp;&nbsp;");
				
				for(int i = startblock; i<=endblock; i++){
				if(cpage==i){
					out.println("<span><a>[" + i + "]</a></span>");	
				}else {
					out.println("<span><a href='board_list1.jsp?cpage="+i+"'>"+i+"</a></span>");
				}		
				}
				out.println("&nbsp;&nbsp;");

				if(cpage==totalPage){
					out.println("<span><a>&gt;</a></span>");				
				}else{
					out.println("<span><a href='board_list1.jsp?cpage="+ (cpage+1) +"'>&gt;</a></span>");				
				}
				
%>		
	<% if(endblock==totalPage){
		out.println("<span><a>&gt;&gt;</a></span>");
	}else{
		out.println("<span><a href='board_list1.jsp?cpage="+(startblock+blockPerPage)+"'>&gt;&gt;</a></span>");
	}
	out.println("&nbsp;");
%>

			</div>
		</div>

		<!--//페이지넘버-->	
  	</div>
</div>
<!--//하단 디자인 -->

</body>
</html>
