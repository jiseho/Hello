package com.hoteldelluna.web.service;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.hoteldelluna.web.entity.Login;



public class LoginService {
	
	private DataSource dataSource;
	
	public LoginService() {
		
		try {
			InitialContext ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public int insertLogin(Login login) {
		int result = 0;
		
		//String sql1 = "insert into login (id, pwd, repwd, name, birth, gender, email, phone, isdel) VALUES ( ? , ? , ? , ? , ? , ? , ? , ? , 0)";
		String sql = "insert into users (u_id, u_pwd, u_name, u_birth, u_phone, u_email, u_gender) VALUES ( ? , ? , ? , ? , ? , ? , ? )";
		
		String url = "jdbc:oracle:thin:@localhost:1522/orclpdb";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = dataSource.getConnection();
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,login.getId());
			st.setString(2, login.getPwd());
			st.setString(3, login.getName());
			st.setString(4, login.getBirth());
			st.setString(5, login.getPhone());
			st.setString(6, login.getEmail());
			st.setString(7, login.getGender());
			
			result = st.executeUpdate();
			
			st.close();
			con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return result;

	}

	public boolean LoginCheck(String id, String password) {
		// TODO Auto-generated method stub
		
		List<Login> list = new ArrayList<Login>();
		boolean result = false;
		
		String sql = "SELECT u_id , u_pwd FROM users";
		String url = "jdbc:oracle:thin:@localhost:1522/orclpdb";
		

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = dataSource.getConnection();
			Statement st = con.createStatement();
			
			ResultSet rs = st.executeQuery(sql);

			while (rs.next()) {
				String id_ = rs.getString("u_id");
				String password_ = rs.getString("u_pwd");
				
				System.out.println(id_);
				
				if (id_.equals(id) && password.equals(password_)) {
					result = true;
					break;
				} 
			}
			rs.close();
			st.close();
			con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return result;
	}
	
	public boolean KakaoIdCheck(String id) { //중복이 있으면 참 없으면 false
		// TODO Auto-generated method stub
		
		List<Login> list = new ArrayList<Login>();
		boolean result = false;
		
		String sql = "SELECT u_id FROM users";
		String url = "jdbc:oracle:thin:@localhost:1522/orclpdb";
		

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = dataSource.getConnection();
			Statement st = con.createStatement();
			
			ResultSet rs = st.executeQuery(sql);

			while (rs.next()) {
				String id_ = rs.getString("u_id");
				
				
				System.out.println(id_);
				
				if (id_.equals(id)) {
					result = true;
					break;
				} 
			}
			rs.close();
			st.close();
			con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return result;
	}

	public List<Login> getLoginList() {

		List<Login> list = new ArrayList<Login>();
		
		String sql = "SELECT * FROM users";
		String url = "jdbc:oracle:thin:@localhost:/orclpdb";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
//			Connection con = DriverManager.getConnection(url, "MINSOO", "11111");
			Connection con = dataSource.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);

			while (rs.next()) {
				int no = rs.getInt("u_no");
				String id = rs.getString("u_id");
				String pwd = rs.getString("u_pwd");
				String name = rs.getString("u_name");
				String birth = rs.getString("u_birth");
				String gender = rs.getString("u_gender");
				String email = rs.getString("u_email");
				String phone = rs.getString("u_phone");
				String date = rs.getString("u_date");


				Login login = new Login(no, id, pwd, name, birth, gender, email, phone, date);
				list.add(login);
				
			}
			rs.close();
			st.close();
			con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return list;
	}
	
	public Login getLogin(String u_id) {

		
		String sql = "SELECT * FROM users where u_id=?";
		String url = "jdbc:oracle:thin:@localhost:1522/orclpdb";
		Login login = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = dataSource.getConnection();
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, u_id);
			ResultSet rs = st.executeQuery();

			if (rs.next()) {
				int no = rs.getInt("u_no");
				String id = rs.getString("u_id");
				String pwd = rs.getString("u_pwd");
				String name = rs.getString("u_name");
				String birth = rs.getString("u_birth");
				String gender = rs.getString("u_gender");
				String email = rs.getString("u_email");
				String phone = rs.getString("u_phone");
				String date = rs.getString("u_date");


				login = new Login(no, id, pwd, name, birth, gender, email, phone, date);
				
				System.out.println(login.toString());
			}
			rs.close();
			st.close();
			con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return login;
	}

	public int deleteLogin(String[] delIds) {
		int result =0;
		String params = "";
		for(int i=0; i<delIds.length; i++) {
			params += "'";
			params += delIds[i];
			params += "'";
			if( i < delIds.length-1)
				params += ',';
			
		}
		System.out.println(params);
		String sql = "DELETE users WHERE u_no IN ( "+params+")";
		String url = "jdbc:oracle:thin:@localhost:1522/orclpdb";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = dataSource.getConnection();
			Statement st = con.createStatement();
			
			result = st.executeUpdate(sql);
			
			st.close();
			con.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return result;
		
	}
}

