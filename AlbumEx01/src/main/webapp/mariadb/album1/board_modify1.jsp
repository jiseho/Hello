﻿<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%
	request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
	
	String subject = "";
	String writer = "";
	String mail[] = null;
	String content = "";
	String filename = "";
	String latitude = "";
	String longitude = "";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb2");
		
		conn = dataSource.getConnection();

		
		String sql = "select subject, writer, mail, content, filename, latitude, longitude from album_board1 where seq=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,seq);	
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			subject = rs.getString("subject");
			writer = rs.getString("writer");
			

			if(rs.getString("mail").equals("")){
				mail = new String[]{"",""};
			}else{
				mail = rs.getString("mail").split("@");
			}
			content = rs.getString("content");	
			
			filename = rs.getString("filename") == null?"":rs.getString("filename");	//파일없으면 공백값을 넣고 없으면 파일이름을 넣어라
			latitude = rs.getString("latitude");
			longitude = rs.getString("longitude");
		}
		
		} catch( NamingException e ) {
			System.out.println( "[에러] : " + e.getMessage() );
		} catch( SQLException e ) {
			System.out.println( "[에러] : " + e.getMessage() );
		} finally {
			if( rs != null ) rs.close();
			if( pstmt != null ) pstmt.close();
			if( conn != null ) conn.close();		
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board_write.css">
<script type="text/javascript">
	window.onload = function() {
		document.getElementById( 'mbtn' ).onclick = function() {
			if( document.mfrm.subject.value.trim() == '' ) {
				alert( '제목을 입력하셔야 합니다.' );
				return false;
			}
			if( document.mfrm.password.value.trim() == '' ) {
				alert( '비밀번호를 입력하셔야 합니다.' );
				return false;
			}
			
			document.mfrm.submit();
		};
	};
</script>
</head>

<body>
<!-- 상단 디자인 -->
<div class="contents1"> 
	<div class="con_title"> 
		<p style="margin: 0px; text-align: right">
			<img style="vertical-align: middle" alt="" src="../../images/home_icon.gif" /> &gt; 커뮤니티 &gt; <strong>여행지리뷰</strong>
		</p>
	</div> 

	<form action="./board_modify1_ok.jsp" method="post" name="mfrm" enctype="multipart/form-data">
		<input type="hidden" name="seq" value="<%=seq %>"/>
		<div class="contents_sub">
		<!--게시판-->
			<div class="board_write">
				<table>
				<tr>
					<th class="top">글쓴이</th>
					<td class="top" colspan="3"><input type="text" name="writer" value="<%=writer %>" class="board_view_input_mail" maxlength="5" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" name="subject" value="<%=subject %>" class="board_view_input" /></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td colspan="3"><input type="password" name="password" value="" class="board_view_input_mail"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
						<textarea name="content" class="board_editor_area"><%=content %></textarea>
					</td>
				</tr>
				<tr>
					<th>이미지</th>
					<td colspan="3">
						기존 이미지 : <br /><br />
						<input type="file" name="upload" value="" class="board_view_input" /><br /><br />
						위도 : <input type="text" name="latitude" value="<%=latitude %>" class="board_view_input_mail"/> 
						경도 : <input type="text" name="longitude" value="<%=longitude %>" class="board_view_input_mail"/>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td colspan="3"><input type="text" name="mail1" value="<%=mail[0] %>" class="board_view_input_mail"/> @ <input type="text" name="mail2" value="<%=mail[1] %>" class="board_view_input_mail"/></td>
				</tr>
				</table>
			</div>

			<div class="btn_area">
				<div class="align_left">			
					<input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_list1.jsp'" />
					<input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_view1.jsp?seq=<%=seq %>'" />
				</div>
				<div class="align_right">			
					<input type="button" id="mbtn" value="수정" class="btn_write btn_txt01" style="cursor: pointer;" />
				</div>	
			</div>	
			<!--//게시판-->
		</div>
	</form>
</div>
<!-- 하단 디자인 -->

</body>
</html>
