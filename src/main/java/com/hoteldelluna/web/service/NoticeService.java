package com.hoteldelluna.web.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.hoteldelluna.web.entity.Notice;

public class NoticeService {
	private DataSource dataSource;
	
	public NoticeService() {
		// DataSource얻어내는 역할
		try {
	         Context ctx = new InitialContext();
	         dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
	      } catch (NamingException e) {
	         // TODO Auto-generated catch block
	         System.out.println("에러: " +  e.getMessage());
	      }
	}
	
	public ArrayList<Notice> noticelist() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		ArrayList<Notice> noticelists=new ArrayList<Notice>();
		
		try{
		 	
		 	conn=dataSource.getConnection();
			
			String sql="select * from notice order by ndate desc";
			pstmt=conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				Notice to=new Notice();
				to.setN_no(rs.getString("n_no"));
				to.setN_subject(rs.getString("n_subject"));
				to.setN_name(rs.getString("n_name"));
				to.setNdate(rs.getString("ndate"));
				to.setNhit(rs.getString("nhit"));
				
				noticelists.add(to);	
				//System.out.println(sbHtml);
			}

		}catch(SQLException e)
		{
			System.out.println("[에러]:"+e.getMessage());
		}finally{
			if(rs != null) try{rs.close();} catch(SQLException e) {}
			if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
			if(conn != null) try{conn.close();} catch(SQLException e) {}
		}
		return noticelists;
	}
	
	public int NoticeWriteOk(Notice to) { 
		Connection conn=null;
		PreparedStatement pstmt=null;

		int flag=1;
		try{	 	
		 	conn=this.dataSource.getConnection();
		 	
			String sql="insert into notice(n_name, n_subject, n_content, n_pwd, n_user) values(?,?,?,?,100)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,to.getN_name());
			pstmt.setString(2,to.getN_subject());
			pstmt.setString(3,to.getN_content());
			pstmt.setString(4,to.getN_pwd());
			
			if(pstmt.executeUpdate()==1){
				flag=0;
			}
		}catch(SQLException e)
		{
			System.out.println("[에러]:"+e.getMessage());
		}finally{
			if(pstmt != null)try{pstmt.close();} catch(SQLException e) {}
			if(conn != null)try{conn.close();} catch(SQLException e) {}
		}
		return flag;
	}
	public Notice NoticeView(String noticeno) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Notice to = new Notice();
		try{		 	
		 	conn=this.dataSource.getConnection();
			
		 	String sql="update notice set nhit=nhit+1 where n_no=?"; 
		 	pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, noticeno);
			
			pstmt.executeUpdate();
			
		 	sql="select n_name,n_subject,n_content,ndate,nhit from notice where n_no=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,noticeno);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				to.setN_subject(rs.getString("n_subject"));
				to.setN_name(rs.getString("n_name"));
				to.setNdate(rs.getString("ndate"));
				to.setNhit(rs.getString("nhit"));
				to.setN_content(rs.getString("n_content")== null ? "": rs.getString("n_content").replaceAll("\n","<br/>"));
				
			}			
		}catch(SQLException e)
		{
			System.out.println("[에러]:"+e.getMessage());
		}finally{
			if(rs != null) try{rs.close();} catch(SQLException e) {}
			if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
			if(conn != null) try{conn.close();} catch(SQLException e) {}
		}
		return to;
	}
	public Notice noticeModify(Notice to) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			
		 	conn=this.dataSource.getConnection();
			
			String sql="select n_name,n_subject,n_content from notice where n_no=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,to.getN_no());
			
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				to.setN_subject(rs.getString("n_subject"));
				to.setN_name(rs.getString("n_name")); 
				to.setN_content(rs.getString("n_content")); 
			}
				
		}catch(SQLException e)
		{
			System.out.println("[에러]:"+e.getMessage());
		}finally{
			if(rs != null) try{rs.close();} catch(SQLException e) {}
			if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
			if(conn != null) try{conn.close();} catch(SQLException e) {}
		}
		return to;
	}
	public int noticeModifyOk(Notice to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 2;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "update notice set n_subject=?, n_content=? where n_no=? and n_pwd=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getN_subject() );
			pstmt.setString( 2, to.getN_content() );
			pstmt.setString( 3, to.getN_no() );
			pstmt.setString( 4, to.getN_pwd() );
			
			int result = pstmt.executeUpdate();
			if( result == 0 ) {
				flag = 1;
			} else if( result == 1 ) {
				flag = 0;
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}

		return flag;
	}
	public Notice noticeDelete(Notice to) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
		 	
		 	conn=this.dataSource.getConnection();
			
			String sql="select n_subject,n_name from notice where n_no=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,to.getN_no());
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				to.setN_subject(rs.getString("n_subject"));
				to.setN_name(rs.getString("n_name"));
			}	
		}catch(SQLException e)
		{
			System.out.println("[에러]:"+e.getMessage());
		}finally{
			if(rs != null) try{rs.close();} catch(SQLException e) {}
			if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
			if(conn != null) try{conn.close();} catch(SQLException e) {}
		}
		return to;
	}
	
	public int noticeDeleteOk(Notice to) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;

		int flag=2;
		try{
		 	conn=this.dataSource.getConnection();
			String sql="delete from notice where n_no=? and n_pwd=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,to.getN_no());
			pstmt.setString(2,to.getN_pwd());
			int result=pstmt.executeUpdate();
			if(result==0){
				flag=1;//비밀번호가 틀린 경우
			}else if(result==1){
				flag=0;//정상
			}

		}catch(SQLException e)
		{
			System.out.println("[에러]:"+e.getMessage());
		}finally{
			if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
			if(conn != null) try{conn.close();} catch(SQLException e) {}
		}
		return flag;
	}

}
