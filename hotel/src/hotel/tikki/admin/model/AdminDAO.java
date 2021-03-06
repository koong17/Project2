package hotel.tikki.admin.model;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;
import hotel.tikki.board.model.BoardVO;
import hotel.tikki.member.model.MemberVO;

public class AdminDAO {  // controller
	

	private static AdminDAO instance = new AdminDAO();	// 한번만 객체를 생성하여 모든 클라이언트들이 공유
	
	public static AdminDAO getInstance(){
		return instance;
	}// getInstance()
	
	// 생성자
	public AdminDAO(){}  
		
	// DB연결
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:HotelDB");
		DriverManager.setLogWriter(new PrintWriter(System.out));
		
		return ds.getConnection();
	}// getConnection();
	
	// 멤버 전체 가져오기
	public List<MemberVO> getSelectAll( int start,  int end ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List  list = null;
		try {
			conn = getConnection();
			StringBuffer  sb = new StringBuffer();
			
			sb.append("select id, password, nickname, phone, r");
			sb.append(" from (select id, password, nickname, phone, rownum r");
			sb.append(" from (select id, password, nickname, phone from member order by id))");
			sb.append(" where r>= ? and r<= ?");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				list = new ArrayList(end);
				
				do {
					MemberVO vo = new MemberVO();
					vo.setId(rs.getString("id"));
					vo.setPassword(rs.getString("password"));
					vo.setNickname(rs.getString("nickname"));
					vo.setPhone(rs.getString("phone"));
					
					list.add(vo);
					
				} while( rs.next() ) ;	
			} // if end
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}				
		return list;
	} // getSelectAll(start, end) end
	
	
	// 총 회원 수 가져오기
	public int getListAllCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = getConnection();
			
			//현재 board 테이블의 레코드 수 구하기
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM MEMBER" );
			rs = pstmt.executeQuery();
			
			if( rs.next() ) count = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}	
		return count;
	} // getListAllCount() end
	
	

	// 회원정보 관리에서 검색 하기
	public List<MemberVO> getSearchResult( int start,  int end, String search, String option) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List  list = null;
		try {
			conn = getConnection();
			StringBuffer  sb = new StringBuffer();
			
			if(option.equals("id")) {
			
				sb.append("select id, password, nickname, phone, r");
				sb.append(" from (select id, password, nickname, phone, rownum r");
				sb.append(" from (select id, password, nickname, phone from member where id like ? order by id))");
				sb.append(" where r>= ? and r<= ?");
			} else if (option.equals("nick")) {
				sb.append("select id, password, nickname, phone, r");
				sb.append(" from (select id, password, nickname, phone, rownum r");
				sb.append(" from (select id, password, nickname, phone from member where nickname like ? order by nickname))");
				sb.append(" where r>= ? and r<= ?");
			} else if (option.equals("phone")) {
				sb.append("select id, password, nickname, phone, r");
				sb.append(" from (select id, password, nickname, phone, rownum r");
				sb.append(" from (select id, password, nickname, phone from member where phone like ? order by phone))");
				sb.append(" where r>= ? and r<= ?");
			}
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, "%"+search+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				list = new ArrayList(end);
				
				do {
					MemberVO vo = new MemberVO();
					vo.setId(rs.getString("id"));
					vo.setPassword(rs.getString("password"));
					vo.setNickname(rs.getString("nickname"));
					vo.setPhone(rs.getString("phone"));
					
					list.add(vo);
					
				} while( rs.next() ) ;	
			} // if end
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}				
		return list;
	} // getSearchResult(start, end, search, option) end
	

	//회원관리테이블에서 총 갯수 가져오기
	public int getSearchListAllCount(String search, String option) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = getConnection();
			
			//현재 member 테이블의 레코드 수 구하기
			if(option.equals("id")) {
				pstmt = conn.prepareStatement("SELECT COUNT(*) FROM MEMBER WHERE ID LIKE ?" );
			} else if (option.equals("nick")) {
				pstmt = conn.prepareStatement("SELECT COUNT(*) FROM MEMBER WHERE nickname LIKE ?" );
			} else if (option.equals("phone")) {
				pstmt = conn.prepareStatement("SELECT COUNT(*) FROM MEMBER WHERE phone LIKE ?" );
			}
			
			pstmt.setString(1, "%"+search+"%");
			rs = pstmt.executeQuery();
			
			if( rs.next() ) count = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}	
		return count;
		
	}//getSearchListAllCount(search, option)
		
	// 예약 전체 가져오기
	public List<RsrvVO> getSelectAllRsrv( int start,  int end ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List  list = null;
		try {
			conn = getConnection();
			StringBuffer  sb = new StringBuffer();
			
			sb.append("select room_num, rsrv_num, check_in, check_out, rsrv_ppl, rsrv_nick, rsrv_status, r");
			sb.append(" from (select room_num, rsrv_num, check_in, check_out, rsrv_ppl, rsrv_nick, rsrv_status, rownum r");
			sb.append(" from (select room_num, rsrv_num, check_in, check_out, rsrv_ppl, rsrv_nick, rsrv_status");
			sb.append(" from reservation order by check_in, check_out, rsrv_num))");
			sb.append(" where r>= ? and r<= ?");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				list = new ArrayList(end);
				
				do {
					RsrvVO vo = new RsrvVO();
					vo.setRoom_num(rs.getInt(1));
					vo.setRsrv_num(rs.getInt(2));
					vo.setCheck_in(rs.getTimestamp(3));
					vo.setCheck_out(rs.getTimestamp(4));
					vo.setRsrv_ppl(rs.getInt(5));
					vo.setRsrv_nick(rs.getString(6));
					vo.setRsrv_status(rs.getString(7));
					
					list.add(vo);
					
				} while( rs.next() ) ;	
			} // if end
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}				
		return list;
	} // getSelectAllRsrv(start, end) end
	
	// 예약 상태 변경
	public void update( int rsrv_num , String rsrv_status_input) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		RsrvVO vo = null;
		String rsrv_status = (rsrv_status_input.equals("n")? "y" : "n");
		
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("UPDATE RESERVATION SET RSRV_STATUS=? WHERE RSRV_NUM=?");
			pstmt.setString(1, rsrv_status);
			pstmt.setInt(2, rsrv_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}				
	} // update() end
	
	//
	public int getRsrvAllCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = getConnection();
			
			//현재 board 테이블의 레코드 수 구하기
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM RESERVATION" );
			rs = pstmt.executeQuery();
			
			if( rs.next() ) count = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}	
		return count;
	} // getRsrvAllCount() end
	

	// 예약 관리에서 검색 하기
	public List<MemberVO> getRsrvSearchResult( int start,  int end, String search, String option) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List  list = null;
		try {
			conn = getConnection();
			StringBuffer  sb = new StringBuffer();
			
			if(option.equalsIgnoreCase("rsrv_nick")) {
						
				sb.append("SELECT ROOM_NUM, RSRV_NUM , CHECK_IN , CHECK_OUT, RSRV_PPL, RSRV_NICK, RSRV_STATUS, R");
				sb.append(" FROM (SELECT ROOM_NUM, RSRV_NUM , CHECK_IN , CHECK_OUT, RSRV_PPL, RSRV_NICK, RSRV_STATUS, ROWNUM R");
				sb.append(" FROM (SELECT ROOM_NUM, RSRV_NUM , CHECK_IN , CHECK_OUT, RSRV_PPL, RSRV_NICK, RSRV_STATUS FROM RESERVATION WHERE RSRV_NICK LIKE ? ORDER BY CHECK_IN, check_out, rsrv_num))");
				sb.append(" WHERE R>= ? AND R<= ?");
			} else if (option.equalsIgnoreCase("rsrv_num")) {
				sb.append("select ROOM_NUM, RSRV_NUM , CHECK_IN , CHECK_OUT, RSRV_PPL, RSRV_NICK, RSRV_STATUS, r");
				sb.append(" FROM (SELECT ROOM_NUM, RSRV_NUM , CHECK_IN , CHECK_OUT, RSRV_PPL, RSRV_NICK, RSRV_STATUS, ROWNUM R");
				sb.append(" FROM (SELECT ROOM_NUM, RSRV_NUM , CHECK_IN , CHECK_OUT, RSRV_PPL, RSRV_NICK, RSRV_STATUS FROM RESERVATION WHERE RSRV_NUM LIKE ? ORDER BY CHECK_IN, check_out, rsrv_num))");
				sb.append(" WHERE R>= ? AND R<= ?");
			}
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, "%"+search+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
				
			if( rs.next() ) {
				list = new ArrayList(end);
				
				do {
					RsrvVO vo = new RsrvVO();
					vo.setRoom_num(rs.getInt(1));
					vo.setRsrv_num(rs.getInt(2));
					vo.setCheck_in(rs.getTimestamp(3));
					vo.setCheck_out(rs.getTimestamp(4));
					vo.setRsrv_ppl(rs.getInt(5));
					vo.setRsrv_nick(rs.getString(6));
					vo.setRsrv_status(rs.getString(7));
					
					list.add(vo);
					
				} while( rs.next() ) ;	
			} // if end
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}				
		return list;
	} // getRsrvSearchResult(start, end, search, option) end
	
	
	//예약관리 검색한 결과 총 갯수구하기
	public int getRsrvSearchListAllCount(String search, String option) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = getConnection();
			
			//현재 member 테이블의 레코드 수 구하기
			if(option.equalsIgnoreCase("rsrv_nick")) {
				pstmt = conn.prepareStatement("SELECT COUNT(*) FROM RESERVATION WHERE RSRV_NICK LIKE ?" );
			} else if (option.equalsIgnoreCase("rsrv_num")) {
				pstmt = conn.prepareStatement("SELECT COUNT(*) FROM RESERVATION WHERE RSRV_NUM LIKE ?" );
			}
			System.out.println(search);
			pstmt.setString(1, "%"+search+"%");
			rs = pstmt.executeQuery();
			
			if( rs.next() ) count = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}	
		return count;
	}//getRsrvSearchListAllCount (search, option) end

	public void memberListDelete(String nickname) {
		Connection conn = null;
		PreparedStatement pstmt=null;
				
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("DELETE FROM MEMBER WHERE NICKNAME = ?");
			pstmt.setString(1, nickname);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}				
		
	}
	
	public void rsrvListDelete(int rsrv_num) {
		Connection conn = null;
		PreparedStatement pstmt=null;
				
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("DELETE FROM RESERVATION WHERE RSRV_NUM = ?");
			pstmt.setInt(1, rsrv_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}				
		
	}
	

}



