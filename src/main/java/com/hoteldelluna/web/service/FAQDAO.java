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

import com.hoteldelluna.web.entity.FAQTO;


public class FAQDAO {
private DataSource dataSource;
	
	public FAQDAO() {
		// DataSource얻어내는 역할
		try {
			Context initCtx=new InitialContext();
			Context envCtx=(Context)initCtx.lookup("java:comp/env");
			this.dataSource=(DataSource)envCtx.lookup("jdbc/OracleDB");
		} catch (NamingException e) {
			System.out.println("[에러]"+e.getMessage());
		}
	}
	
	public ArrayList<FAQTO> faqlist() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		ArrayList<FAQTO> faqlists=new ArrayList<FAQTO>();
		
		int totalRecord=0;

		StringBuffer sbHtml=new StringBuffer();
		try{
				 	
		 	conn=dataSource.getConnection();
			
//		 	String sql="select q_no , q_grpl , q_subject , q_name , q_date , q_hit from faq order by q_grp desc , q_grps asc";
		 	String sql="select q_no , q_grpl , q_subject , q_name , q_date , q_hit from faq order by q_date desc";
			pstmt=conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			
			rs=pstmt.executeQuery();
			
			rs.last();
			totalRecord=rs.getRow();
			rs.beforeFirst();
			
			while(rs.next())
			{
				FAQTO to=new FAQTO();
				to.setQ_no(rs.getString("q_no"));
				to.setQ_grpl(rs.getInt("q_grpl"));
				String sgrpl="";
				for(int j=1; j<=rs.getInt("q_grpl"); j++)
				{
					sgrpl +="&nbsp;&nbsp;&nbsp;&nbsp;";
				}
				to.setQ_sgrpl(sgrpl);
				to.setQ_subject(rs.getString("q_subject"));
				to.setQ_name(rs.getString("q_name"));
				to.setQ_date(rs.getString("q_date"));
				to.setQ_hit(rs.getString("q_hit"));
				/* to.setWgap(rs.getInt("wgap")); */
				
				faqlists.add(to);	
			}
			

		}catch(SQLException e)
		{
			System.out.println("[에러]:"+e.getMessage());
		}finally{
			if(rs != null) try{rs.close();} catch(SQLException e) {}
			if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
			if(conn != null) try{conn.close();} catch(SQLException e) {}
		}
		return faqlists;
	}
	
	public FAQTO faqView(FAQTO to) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		
		try{
			
		 	conn=dataSource.getConnection();
			
		 	String sql="update faq set q_hit=q_hit+1 where q_no=?"; //seq가 넘어갈 때마다 방문자 수 1씩 증가
		 	pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,to.getQ_no());
			pstmt.executeUpdate();
			
		 	sql="select q_subject,q_name,q_date,q_hit,q_content from faq where q_no=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,to.getQ_no());
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				to.setQ_subject(rs.getString("q_subject"));
				to.setQ_name(rs.getString("q_name"));
				to.setQ_date(rs.getString("q_date"));
				to.setQ_hit(rs.getString("q_hit"));
				to.setQ_content(rs.getString("q_content")== null ? "": rs.getString("q_content").replaceAll("\n","<br/>"));
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
	
	public int FAQ_manager_Write_Ok(FAQTO to) {
		 Connection conn = null;
	     PreparedStatement pstmt = null;
	     ResultSet rs= null;
	     int q_grp = 0;
	     int flag = 1;
	     
	     try{
	 		conn = this.dataSource.getConnection();
	 		String sql = "SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'FAQ_SEQ'";
	 		pstmt=conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	 		rs = pstmt.executeQuery(sql);
	 		
	 		if(rs.next()) {
	 			q_grp = rs.getInt("LAST_NUMBER");
	 		}
	 		System.out.println(q_grp);
	 		
	 		String sql1 = "insert into faq(q_grp, q_grps, q_grpl,q_name, q_subject, q_content, q_pwd) values(?,0,0,?,?,?,?)";		
	 		pstmt = conn.prepareStatement(sql1);
	 		pstmt.setString(1,Integer.toString(q_grp));
	 		pstmt.setString(2,to.getQ_name());
	 		pstmt.setString(3,to.getQ_subject());
	 		pstmt.setString(4,to.getQ_content());
	 		pstmt.setString(5,to.getQ_pwd());
	 		
	 		
	 		if(pstmt.executeUpdate() == 1){
	 			flag = 0;
	 		}
	 	} catch(SQLException e){
	 		System.out.println("[에러]:"+ e.getMessage());
	 	} finally {
	 		 if( pstmt != null ) try {pstmt.close();} catch(SQLException e) {}
	         if( conn != null ) try {conn.close();} catch(SQLException e) {}		
	 	}
	     return flag;
	 }
	 public ArrayList<FAQTO> FAQ_manager(){
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 
		 ArrayList<FAQTO> FAQ_managers = new ArrayList<FAQTO>();
		 
		 int totalRecord=0;
		 StringBuffer sbHtml= new StringBuffer();
		 try{
				conn = this.dataSource.getConnection();
				
				String sql = "select q_no,q_grpl,q_subject,q_name, to_char(q_date,'YYYY-MM-DD') q_date,q_hit from faq order by q_grp desc,q_grps asc";
				/* date_format(q_date,'%Y-%m-%d') */
				/* datediff(now(),q_date)wgap */
				pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);		
				
				rs = pstmt.executeQuery();
				rs.last();
				totalRecord=rs.getRow();
				rs.beforeFirst();
				
				while(rs.next()){
					FAQTO to = new FAQTO();
					to.setQ_no (rs.getString("q_no"));
					to.setQ_grpl (rs.getInt("q_grpl"));
					String sgrpl = "";
					for(int j=1; j<=rs.getInt("q_grpl"); j++){
						sgrpl += "&nbsp;&nbsp;";
					}
					to.setQ_name (rs.getString("q_name"));
					to.setQ_subject (rs.getString("q_subject"));	
								
					to.setQ_date (rs.getString("q_date"));	
					to.setQ_hit (rs.getString("q_hit"));	
					/* to.setWgap (rs.getInt("wgap")); */	
					to.setWgap (0);
					
					FAQ_managers.add(to);
				}
			
			} catch(SQLException e){
				System.out.println("[에러]:"+ e.getMessage());
			} finally {
				 if(rs != null) try {rs.close();} catch(SQLException e) {}
		         if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
		         if(conn != null) try {conn.close();} catch(SQLException e) {}		
			}
		 return FAQ_managers;
		 
	 }
	 
	 public FAQTO FAQ_manager_View(FAQTO to) {
		  Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
		 try {
			 	conn = this.dataSource.getConnection();
			 	String sql = "update faq set q_hit=q_hit+1 where q_no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,to.getQ_no());
				pstmt.executeUpdate();
				
				sql = "select q_subject,q_name,q_date,q_hit,q_content from faq where q_no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,to.getQ_no());
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					to.setQ_subject(rs.getString("q_subject"));
					to.setQ_name(rs.getString("q_name"));
					to.setQ_date(rs.getString("q_date"));
					to.setQ_hit(rs.getString("q_hit"));
					to.setQ_content(rs.getString("q_content")==null?"":rs.getString("q_content").replaceAll("\n","<br/>"));
				}
			} catch(SQLException e){
				System.out.println("[에러]:"+ e.getMessage());
			} finally {
				 if( rs != null ) try {rs.close();} catch(SQLException e) {}
		         if( pstmt != null ) try {pstmt.close();} catch(SQLException e) {}
		         if( conn != null ) try {conn.close();} catch(SQLException e) {}
			}
		 return to;
	 }
	 public FAQTO FAQ_manager_Modify(FAQTO to) {
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 
		 try{
				conn = dataSource.getConnection();
				
				String sql = "select q_subject, q_name, q_content from faq where q_no =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,to.getQ_no());
				
				rs = pstmt.executeQuery();
				if(rs.next()){
					to.setQ_subject(rs.getString("q_subject"));
					to.setQ_name(rs.getString("q_name"));
					to.setQ_content(rs.getString("q_content"));
				}
			
				} catch( SQLException e ) {
					System.out.println( "[에러] : " + e.getMessage() );
				} finally {
					if( rs != null ) try { rs.close(); } catch(SQLException e) {}
					if( pstmt != null ) try { pstmt.close(); } catch(SQLException e) {}
					if( conn != null ) try { conn.close(); } catch(SQLException e) {}
			}
		 return to;
	 }
	 public int FAQ_manager_Modify_Ok(FAQTO to) {
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 
		 int flag = 2;
		   try {
		      conn = dataSource.getConnection();
		      
		      String sql = "update faq set q_subject=?, q_content=? where q_no=? and q_pwd=?";
		      pstmt = conn.prepareStatement(sql);
		      pstmt.setString(1, to.getQ_subject());
		      pstmt.setString(2, to.getQ_content());
		      pstmt.setString(3, to.getQ_no());
		      pstmt.setString(4, to.getQ_pwd());
		      
		      int result = pstmt.executeUpdate();
		      
		      if(result == 0) {
		         flag = 1;
		      } else if(result == 1) {
		         flag = 0;
		      }
		      
		
		   } catch(SQLException e) {
		      System.out.println("에러: " + e.getMessage());
		   } finally {
			   if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			   if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		   }
		   return flag;
	 }
	 public FAQTO FAQ_manager_Delete(FAQTO to) {
		    Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try{
				conn = dataSource.getConnection();
				
				String sql = "select q_subject,q_name from faq where q_no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, to.getQ_no());
				
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					to.setQ_subject(rs.getString("q_subject"));
					to.setQ_name(rs.getString("q_name"));		
				}
				
			} catch(SQLException e){
				System.out.println("[에러]:"+ e.getMessage());
			} finally {
				if( rs != null ) try { rs.close(); } catch(SQLException e) {}
				if( pstmt != null ) try { pstmt.close(); } catch(SQLException e) {}
				if( conn != null ) try { conn.close(); } catch(SQLException e) {}
			}
			return to;
	 }
	 public int FAQ_manager_Delete_Ok(FAQTO to) {
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 int flag = 2;
		 try{
				conn = this.dataSource.getConnection();
				
				String sql = "delete from faq where q_no=? and q_pwd=?";			
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,to.getQ_no());
				pstmt.setString(2,to.getQ_pwd());
						
				int result = pstmt.executeUpdate();
				if(result == 0){
					// 비밀번호가 틀린경우
					flag = 1;
				}else if(result == 1){
					//정상
					flag = 0;
				}
		
			} catch(SQLException e){
				System.out.println("[에러]:"+ e.getMessage());
			} finally {
				if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
				if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
			}
			return flag;
	 }
	 public void FAQ_manager_Reply() {
		 
	   }
	 public int FAQ_manager_Reply_Ok(FAQTO to) {
		 Connection conn = null;
	     PreparedStatement pstmt = null;
	     ResultSet rs = null;
	     
	     int flag = 1;
	     
	     try{
	    	 conn = dataSource.getConnection();
	 		
	 		String sql = "select q_grp,q_grps,q_grpl from faq where q_no=?";
	 		pstmt = conn.prepareStatement(sql);
	 		pstmt.setString(1,to.getQ_no());
	 		
	 		rs = pstmt.executeQuery();
	 		
	 		int q_grp = 0;
	 		int q_grps = 0;
	 		int q_grpl = 0;
	 		
	 		if(rs.next()){
	 			q_grp=rs.getInt("q_grp");
	 			q_grps=rs.getInt("q_grps");
	 			q_grpl=rs.getInt("q_grpl");
	 		}
	 		
	 		//grps 재설정
	 		sql = "update faq set q_grps=q_grps+1 where q_grp=? and q_grps>?";
	 		pstmt = conn.prepareStatement(sql);
	 		pstmt.setInt(1,q_grp);
	 		pstmt.setInt(2,q_grps);
	 		
	 		pstmt.executeUpdate();
	 		
	 		sql = "insert into faq(q_grp, q_grps, q_grpl,q_name, q_subject, q_content, q_pwd) values(?,?,?,?,?,?,?)";	
	 		pstmt = conn.prepareStatement(sql);
	 		pstmt.setInt(1,q_grp);
	 		pstmt.setInt(2,q_grps+1);
	 		pstmt.setInt(3,q_grpl+1);
	 				
	 		pstmt.setString(4,to.getQ_name());
	 		pstmt.setString(5,to.getQ_subject());
	 		pstmt.setString(6,to.getQ_content());
	 		pstmt.setString(7,to.getQ_pwd());
	 		
	 		if(pstmt.executeUpdate() == 1){
	 			flag = 0;
	 		}
	 
	 	} catch(SQLException e){
	 		System.out.println("[에러]:"+ e.getMessage());
	 	} finally {
	 		 if( pstmt != null ) try {pstmt.close();} catch(SQLException e) {}
	         if( conn != null ) try {conn.close();} catch(SQLException e) {}	
	 	}
	     return flag;
	 }
	
}
