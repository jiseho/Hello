package com.hoteldelluna.web.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.hoteldelluna.web.entity.Login;
import com.hoteldelluna.web.entity.Users;

public class UsersService {

	public Users mypage(Users to) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			Context initCtx=new InitialContext();
		 	Context envCtx=(Context)initCtx.lookup("java:comp/env");
		 	DataSource dataSource=(DataSource)envCtx.lookup("jdbc/OracleDB");
		 	
		 	conn=dataSource.getConnection();
			
			String sql="select u_id,u_name, u_birth, u_phone,u_email,u_pwd from users where u_no=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,to.getU_no());
			
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				to.setU_id(rs.getString("u_id"));
				to.setU_name(rs.getString("u_name"));
				to.setU_birth(rs.getString( "u_birth" ));
				to.setU_email(rs.getString("u_email"));
				to.setU_pwd(rs.getString("u_pwd"));
				to.setU_phone(rs.getString( "u_phone" ));
			}
		}catch(NamingException e)
		{
			System.out.println("[에러]:"+e.getMessage());
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

	public int mypageOK(Login to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 2;
		try {
			Context initCtx=new InitialContext();
		 	Context envCtx=(Context)initCtx.lookup("java:comp/env");
		 	DataSource dataSource=(DataSource)envCtx.lookup("jdbc/OracleDB");
		 	
		 	conn=dataSource.getConnection();
			
			String sql = "update users set u_birth=?, u_phone=?, u_email=? where u_no=? and u_pwd=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getBirth() );
			pstmt.setString( 2, to.getPhone() );
			pstmt.setString( 3, to.getEmail() );
			pstmt.setInt( 4, to.getNo() );
			pstmt.setString( 5, to.getPwd() );
			
			int result = pstmt.executeUpdate(); 
			if( result == 0 ) {
				flag = 1;
			} else if( result == 1 ) {
				flag = 0;
			}
			
		} catch( NamingException e) {
			System.out.println( "[에러] : " + e.getMessage() );
		} catch( SQLException e ) {
			System.out.println( "[에러] : " + e.getMessage() );
		} finally {
			if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
			if(conn != null) try{conn.close();} catch(SQLException e) {}
		}
		return flag;
	}
}
