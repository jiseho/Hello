package com.hoteldelluna.web.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.hoteldelluna.web.entity.Room;

public class RoomService {
   
   private DataSource dataSource;
   private String uploadPath = "C:/jsp/jsp-workspace/HotelDelLuna/src/main/webapp/upload/";
   
   public RoomService() {
      // TODO Auto-generated constructor stub
      
      try {
         Context ctx = new InitialContext();
         dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
      } catch (NamingException e) {
         // TODO Auto-generated catch block
         System.out.println("에러: " +  e.getMessage());
      }
   }
   
   public ArrayList<Room> roomList() {
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      ArrayList<Room> roomLists = new ArrayList<Room>();
   
      try {
         conn = this.dataSource.getConnection();
         
         String sql = "select r_no, r_branch , r_star, r_img, r_roomtype, r_bedtype, r_occupancy, to_char(r_price, '999,999') as r_price from room";
         pstmt = conn.prepareStatement(sql);
         
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            Room to = new Room();
            to.setR_no(rs.getInt("r_no"));
            to.setR_branch(rs.getString("r_branch"));
            to.setR_star(rs.getInt("r_star"));
            to.setR_img(rs.getString("r_img"));
            to.setR_roomtype(rs.getString("r_roomtype"));
            to.setR_bedtype(rs.getString("r_bedtype"));
            to.setR_occupancy(rs.getInt("r_occupancy"));
            to.setR_price(rs.getString("r_price"));
            
            System.out.println(to.toString());
            roomLists.add(to);
         }
      } catch(SQLException e) {
         System.out.println("에러: " + e.getMessage());
      } finally {
         if(rs != null) try {rs.close();} catch(SQLException e) {}
         if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
         if(conn != null) try {conn.close();} catch(SQLException e) {}
      }
      return roomLists;
   }
   
   public ArrayList<Room> roomList(String branch) {
	   Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      ArrayList<Room> roomLists = new ArrayList<Room>();
	   
	      try {
	         conn = this.dataSource.getConnection();
	         
	         String sql = "select r_no, r_branch , r_star, r_img, r_roomtype, r_bedtype, r_occupancy, to_char(r_price, '999,999') as r_price from room where r_branch like ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, branch);
	         
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            Room to = new Room();
	            to.setR_no(rs.getInt("r_no"));
	            to.setR_branch(rs.getString("r_branch"));
	            to.setR_star(rs.getInt("r_star"));
	            to.setR_img(rs.getString("r_img"));
	            to.setR_roomtype(rs.getString("r_roomtype"));
	            to.setR_bedtype(rs.getString("r_bedtype"));
	            to.setR_occupancy(rs.getInt("r_occupancy"));
	            to.setR_price(rs.getString("r_price"));
	            
	            System.out.println(to.toString());
	            roomLists.add(to);
	         }
	      } catch(SQLException e) {
	         System.out.println("에러: " + e.getMessage());
	      } finally {
	         if(rs != null) try {rs.close();} catch(SQLException e) {}
	         if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
	         if(conn != null) try {conn.close();} catch(SQLException e) {}
	      }
	      return roomLists;
	}
		
   
   public Room foundRoom(int roomNo) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      Room room = null;
	      
	   
	      try {
	         conn = this.dataSource.getConnection();
	         
	         String sql = "select r_no, r_branch , r_star, r_img, r_roomtype, r_bedtype, r_occupancy, to_char(r_price, '999,999') as r_price from room where r_no=? ";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, roomNo);
	         
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            room = new Room();
	            room.setR_no(rs.getInt("r_no"));
	            room.setR_branch(rs.getString("r_branch"));
	            room.setR_star(rs.getInt("r_star"));
	            room.setR_img(rs.getString("r_img"));
	            room.setR_roomtype(rs.getString("r_roomtype"));
	            room.setR_bedtype(rs.getString("r_bedtype"));
	            room.setR_occupancy(rs.getInt("r_occupancy"));
	            room.setR_price(rs.getString("r_price"));
	            
	         }
	         
	         System.out.println(room);
	      } catch(SQLException e) {
	         System.out.println("에러: " + e.getMessage());
	      } finally {
	         if(rs != null) try {rs.close();} catch(SQLException e) {}
	         if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
	         if(conn != null) try {conn.close();} catch(SQLException e) {}
	      }
	      return room;
	   }

		public int insert(Room room) {
			int result = 0;
			
			String sql = "INSERT INTO room(r_branch, r_star, r_img, r_roomtype, r_bedtype, r_occupancy, r_price) VALUES (?,?,?,?,?,?,?)";

			try {
				
				Connection con = dataSource.getConnection();
				PreparedStatement st = con.prepareStatement(sql);
				st.setString(1, room.getR_branch());
				st.setInt(2, room.getR_star());
				st.setString(3, room.getR_img());
				st.setString(4, room.getR_roomtype());
				st.setString(5, room.getR_bedtype());
				st.setInt(6, room.getR_occupancy());
				st.setInt(7, Integer.parseInt(room.getR_price()));
				
				result = st.executeUpdate();
				
				st.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
			return result; 
		}

		public int deleteRoom(String[] delIds) {
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
			String sql = "DELETE room WHERE r_no IN ( "+params+")";
			

			try {
				
				Connection con = dataSource.getConnection();
				Statement st = con.createStatement();
				
				result = st.executeUpdate(sql);
				
				st.close();
				con.close();
			}  catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
			return result;
		}

		public int updateRoom(Room room) {
			// TODO Auto-generated method stub
			int result = 0;
			
			

			try {
				
				Connection con = dataSource.getConnection();
				String sql = "update room set r_branch=?, r_star=?, r_roomtype=?, r_bedtype=?, r_occupancy=?, r_price=? where r_no=?";
				PreparedStatement st = con.prepareStatement(sql);
				st = con.prepareStatement( sql );
				st.setString(1, room.getR_branch());
				st.setInt(2, room.getR_star());
				st.setString(3, room.getR_roomtype());
				st.setString(4, room.getR_bedtype());
				st.setInt(5, room.getR_occupancy());
				st.setInt(6, Integer.parseInt(room.getR_price()));
				st.setInt(7, room.getR_no());
				
				result = st.executeUpdate();
				System.out.println(result);
				st.close();
				con.close();
			}  catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
			return result; 
			
		}

		
		
}