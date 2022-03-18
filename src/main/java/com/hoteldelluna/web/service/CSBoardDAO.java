package com.hoteldelluna.web.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

// 관리자 model1

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.hoteldelluna.web.entity.CSBoardTO;

public class CSBoardDAO {
	private DataSource dataSource;
	
	public CSBoardDAO() {
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource)envCtx.lookup("jdbc/OracleDB");
		} catch (NamingException e) {
			System.out.println("에러: " +  e.getMessage());
		}
	}
	
	public void csboardReply() {
		
	}
	
	public int csboardReplyOk(CSBoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 1;
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select c_grp, c_grps, c_grpl from cs_board where c_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getC_no());
			
			rs = pstmt.executeQuery();
			
			int c_grp = 0;
			int c_grps = 0;
			int c_grpl = 0;
			
			// 부모글 데이터 가져오기
			if(rs.next()) {
				c_grp = rs.getInt("c_grp");
				c_grps = rs.getInt("c_grps");
				c_grpl = rs.getInt("c_grpl");
			}
			
			// grps 재설정
			sql = "update cs_board set c_grps=c_grps+1 where c_grp=? and c_grps=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_grp);
			pstmt.setInt(2, c_grps);
			
			pstmt.executeUpdate();
			
			sql = "insert into cs_board(c_subject, c_name, c_password, c_content, c_wip, c_grp, c_grps, c_grpl, c_branch) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, to.getC_subject());
			pstmt.setString(2, to.getC_name());
			pstmt.setString(3, to.getC_password());
			pstmt.setString(4, to.getC_content());
			pstmt.setString(5, to.getC_wip());
			
			pstmt.setInt(6, c_grp);
			pstmt.setInt(7, c_grps + 1);
			pstmt.setInt(8, c_grpl + 1);
			pstmt.setString(9, "All");
			
			if( pstmt.executeUpdate() == 1 ) {
				flag = 0;
			}
			
		} catch(SQLException e) {
			System.out.println("에러: " + e.getMessage() );
		} finally {
			if(pstmt != null ) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null ) try {conn.close();} catch(SQLException e) {}
		}
		
		return flag;
	}
	
	public ArrayList<CSBoardTO> csboardList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<CSBoardTO> csboardLists = new ArrayList<CSBoardTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select c_no, c_grpl, c_subject, c_name, to_char(c_wdate, 'YYYY-MM-DD') c_wdate, c_hit from cs_board order by c_grp desc, c_grps asc";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CSBoardTO to = new CSBoardTO();
				to.setC_no(rs.getString("c_no"));
				to.setC_grpl(rs.getInt("c_grpl"));
				String c_sgrpl = "";
				
				for(int j = 1; j <= rs.getInt("c_grpl"); j++) {
					c_sgrpl += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				}
					
				to.setC_subject(rs.getString("c_subject"));
				to.setC_name(rs.getString("c_name"));
				to.setC_wdate(rs.getString("c_wdate"));
				to.setC_hit(rs.getString("c_hit"));
				
				csboardLists.add(to);
			}
		} catch(SQLException e) {
			System.out.println("에러: " + e.getMessage());
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
		}
		return csboardLists;
	}
	
	public CSBoardTO csboardView(String to2) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CSBoardTO to = null;
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "update cs_board set c_hit=c_hit+1 where c_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to2); 
			pstmt.executeUpdate();
			
			sql = "select c_subject, c_name, c_wip, c_wdate, c_hit, c_content from cs_board where c_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to2); 
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				to = new CSBoardTO();
				to.setC_subject(rs.getString("c_subject"));
				to.setC_name(rs.getString("c_name"));
				to.setC_wip(rs.getString("c_wip"));
				to.setC_wdate(rs.getString("c_wdate"));
				to.setC_hit(rs.getString("c_hit"));
				to.setC_content(rs.getString("c_content") == null ? "" : rs.getString("c_content").replaceAll("\n", "<br>"));
				
				//System.out.println(to.toString());
			}
		
		} catch(SQLException e) {
			System.out.println("에러: " + e.getMessage());
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
		}
		return to;
	}
}
