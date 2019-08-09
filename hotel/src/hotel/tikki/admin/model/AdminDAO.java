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
	
	
	/* 여기서부터 내가 */
	
	
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
	} // getSelectAll(start, end) end

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
	}
	
	/* 여기까지 내가 */
	
	
}



