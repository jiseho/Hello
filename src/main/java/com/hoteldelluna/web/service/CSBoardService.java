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

import com.hoteldelluna.web.entity.CSBoard;


public class CSBoardService {
	private DataSource dataSource;
	private String uploadPath = "C:/jsp/jsp-workspace/HotelDelLuna/src/main/webapp/upload";

	public CSBoardService() {
		// TODO Auto-generated constructor stub

		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			this.dataSource = (DataSource) envCtx.lookup("jdbc/OracleDB");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			System.out.println("에러: " + e.getMessage());
		}
	}

	public int boardWrite(CSBoard to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int q_grp=0;
		int flag = 1;
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'CS_BOARD_SEQ'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			if(rs.next()) {
	 			q_grp = rs.getInt("LAST_NUMBER");
	 		}
			System.out.println(q_grp);
			String sql1 = "insert into cs_board(c_u_no, c_branch, c_subject, c_name, c_email, c_password, c_content, c_filename, c_filesize, c_wip, c_grp) "
					+ "values (?, ?, ?, ?, ?, ?, ?, ?, 0, 0, ?)";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, to.getC_u_no());
			pstmt.setString(2, to.getC_branch());
			pstmt.setString(3, to.getC_subject());
			pstmt.setString(4, to.getC_name());
			pstmt.setString(5, to.getC_email());
			pstmt.setString(6, to.getC_password());
			pstmt.setString(7, to.getC_content());
			pstmt.setString(8, to.getC_filename());
			pstmt.setInt(9, q_grp);

			if (pstmt.executeUpdate() == 1) {
				flag = 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
		return flag;
	}

	public int csboardWriteOk(CSBoard to) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 1;
		try {
			conn = this.dataSource.getConnection();

			String sql = "insert into cs_board values (0, ?, ?, ?, ?, ?, ?, ?, 0, ?, now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getC_branch());
			pstmt.setString(2, to.getC_subject());
			pstmt.setString(3, to.getC_name());
			pstmt.setString(4, to.getC_password());
			pstmt.setString(5, to.getC_content());
			pstmt.setString(6, to.getC_filename());
			pstmt.setLong(7, to.getC_filesize());
			pstmt.setString(8, to.getC_wip());

			if (pstmt.executeUpdate() == 1) {
				flag = 0;
			}
		} catch (SQLException e) {
			System.out.println("에러: " + e.getMessage());
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
		return flag;
	}

	public ArrayList<CSBoard> csboardList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<CSBoard> csboardLists = new ArrayList<CSBoard>();
		try {
			conn = this.dataSource.getConnection();

			String sql = "select * from cs_board order by c_no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CSBoard to = new CSBoard();
				to.setC_no(rs.getString("c_no"));
				to.setC_subject(rs.getString("c_subject"));
				to.setC_name(rs.getString("c_name"));
				int index = rs.getString("c_wdate").indexOf(' ');
				String date = rs.getString("c_wdate").substring(0, index);
				to.setC_wdate(date);
				to.setC_hit(rs.getString("c_hit"));
				/* to.setC_wgap(rs.getInt("c_wgap")); */

				csboardLists.add(to);
			}
		} catch (SQLException e) {
			System.out.println("에러: " + e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
		return csboardLists;
	}
	
	public ArrayList<CSBoard> csboardList(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<CSBoard> csboardLists = new ArrayList<CSBoard>();
		try {
			conn = this.dataSource.getConnection();

			String sql = "select * from cs_board where c_u_no = ? order by c_no desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CSBoard to = new CSBoard();
				to.setC_no(rs.getString("c_no"));
				to.setC_subject(rs.getString("c_subject"));
				to.setC_name(rs.getString("c_name"));
				int index = rs.getString("c_wdate").indexOf(' ');
				String date = rs.getString("c_wdate").substring(0, index);
				to.setC_wdate(date);
				to.setC_hit(rs.getString("c_hit"));
				/* to.setC_wgap(rs.getInt("c_wgap")); */

				csboardLists.add(to);
			}
		} catch (SQLException e) {
			System.out.println("에러: " + e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
		return csboardLists;
	}

//	public CSBoardList csboardList(CSBoardList listTO) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			conn = this.dataSource.getConnection();
//			
//			String sql = "select c_no, c_subject, c_name, c_filesize, date_format(c_wdate, '%Y-%m-%d') c_wdate, c_hit, datediff(now(), c_wdate) c_wgap from cs_board order by c_no desc";
//			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
//			
//			rs = pstmt.executeQuery();
//			
//			int cpage = listTO.getCpage();
//			int recordPerPage = listTO.getRecordPerPage();
//			int blockPerPage = listTO.getBlockPerPage();
//			
//			rs.last();
//			listTO.setTotalRecord(rs.getRow());
//			rs.beforeFirst();
//			
//			listTO.setTotalPage(((listTO.getTotalRecord()- 1) / recordPerPage) + 1);
//			
//			int skip = (cpage - 1) * recordPerPage;
//			if(skip != 0) rs.absolute(skip);
//
//			ArrayList<CSBoard> csboardLists = new ArrayList<CSBoard>();
//			for(int i = 0; i < recordPerPage && rs.next(); i++) {
//				CSBoard to = new CSBoard();
//				to.setC_no(rs.getString("c_no"));
//				to.setC_subject(rs.getString("c_subject"));
//				to.setC_name(rs.getString("c_name"));
//				to.setC_filesize(rs.getLong("c_filesize"));
//				to.setC_wdate(rs.getString("c_wdate"));
//				to.setC_hit(rs.getString("c_hit"));
//				to.setC_wgap(rs.getInt("c_wgap"));
//				
//				csboardList().add(to);
//			}
//			listTO.setCsboardLists(csboardLists);
//			
//			listTO.setStartBlock(cpage - (cpage - 1) % blockPerPage);
//			listTO.setEndBlock(cpage - (cpage - 1) % blockPerPage + blockPerPage - 1);
//			
//			if(listTO.getEndBlock() >= listTO.getTotalPage()) {
//				listTO.setEndBlock(listTO.getTotalPage());
//			}
//			
//		} catch(SQLException e) {
//			System.out.println("에러: " + e.getMessage());
//		} finally {
//			if(rs != null) try {rs.close();} catch(SQLException e) {}
//			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
//			if(conn != null) try {conn.close();} catch(SQLException e) {}
//		}
//		
//		return listTO;
//	}

	public CSBoard csboardView(String no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CSBoard to = null;

		try {
			conn = this.dataSource.getConnection();

			
			String sql1 = "update cs_board set c_hit=c_hit+1 where c_no=?"; 
			pstmt = conn.prepareStatement(sql1); 
			pstmt.setString(1, no);
			  
			pstmt.executeUpdate();
			 
			String sql = "select * from cs_board where c_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				to = new CSBoard();
				to.setC_subject(rs.getString("c_subject"));
				to.setC_name(rs.getString("c_name"));
				to.setC_email(rs.getString("c_email"));
				to.setC_wip(rs.getString("c_wip"));
				to.setC_wdate(rs.getString("c_wdate"));
				to.setC_hit(rs.getString("c_hit"));
				to.setC_content(
						rs.getString("c_content") == null ? "" : rs.getString("c_content").replaceAll("\n", "<br>"));
				to.setC_filename(rs.getString("c_filename") == null ? "" : rs.getString("c_filename"));
				to.setC_filesize(rs.getLong("c_filesize"));

				System.out.println(to.toString());
			}
		} catch (SQLException e) {
			System.out.println("에러: " + e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return to;
	}
	
	
	public int csboardReplyOk(CSBoard to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println(to);
		int flag = 1;
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select c_grp, c_grps, c_grpl from cs_board where c_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(to.getC_no()));
			
			rs = pstmt.executeQuery();
			
			int c_grp = 0;
			int c_grps = 0;
			int c_grpl = 0;
			
			// 부모글 데이터 가져오기
			if(rs.next()) {
				System.out.println(rs.getInt("c_grp"));
				c_grp = rs.getInt("c_grp");
				c_grps = rs.getInt("c_grps");
				c_grpl = rs.getInt("c_grpl");
			}
			
			// grps 재설정
			sql = "update cs_board set c_grps=c_grps+1 where c_grp=? and c_grps>?";
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
	
	public ArrayList<CSBoard> csmanageboardList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<CSBoard> csboardLists = new ArrayList<CSBoard>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select c_no, c_grpl, c_subject, c_name, to_char(c_wdate, 'YYYY-MM-DD') c_wdate, c_hit from cs_board order by c_grp desc, c_grps asc";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CSBoard to = new CSBoard();
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
}
