package hotel.tikki.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}

	public MemberDAO() {
		super();
	}
	
	public Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();

		DataSource  ds = 
			(DataSource)initCtx.lookup("java:comp/env/jdbc:HotelDB");
		
		return ds.getConnection();
	}//getConnection() end
	
	public void memberinsert(MemberVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("memberinsert");
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("INSERT INTO MEMBER(id, password, nickname, phone) values(?,?,?,?)");
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getNickname());
			pstmt.setString(4, vo.getPhone());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs); CloseUtil.close(pstmt);  CloseUtil.close(conn);
		} // try end
		
	}
	
	public String memberNick(String id) throws Exception {   // 로그인 시 id와 닉네임 세션 저장
		String sql = "SELECT NICKNAME FROM MEMBER WHERE ID = ?";
		String nick = null;
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		if( rs.next() ) nick = rs.getString("NICKNAME");
		
		return nick;
	}
	
	public int joinConfirmID(String id) throws Exception { // 아이디 중복 체크(있으면 1, 없으면 -1)
		String sql = "SELECT ID FROM MEMBER WHERE ID = ?";
		int result = -1;
		
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		if( rs.next() ) {
			result = 1;
		} else { 
			result = -1; 
		}  

		CloseUtil.close(rs); CloseUtil.close(pstmt); CloseUtil.close(conn);
				
		return result;
	}
	
	public int joinConfirmNick(String nickname) throws Exception { // 닉네임 중복 체크(있으면 1, 없으면 -1)
		String sql = "SELECT NICKNAME FROM MEMBER WHERE NICKNAME = ?";
		int result = -1;
		
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nickname);
		ResultSet rs = pstmt.executeQuery();
		
		if( rs.next() ) result = 1;
		else result = -1;  
		
		CloseUtil.close(rs);  CloseUtil.close(pstmt); CloseUtil.close(conn);
				
		return result;
	} 
	
	public int memberLoginCheck(String id, String password) throws Exception {  // 유저, 비번 체크해서 로그인 성공 여부 (성공 1, 실패 -1) 
		String sql = "SELECT PASSWORD FROM MEMBER WHERE ID = ?";
		String dbpwd = "";
		int result = -1;
		
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		if( rs.next() ) {  //id check
			dbpwd = rs.getString("password");
			if( dbpwd.equals(password)) result = 1;  
			
		}else {
			result = -1;  
		}//end if
		
		CloseUtil.close(rs);  CloseUtil.close(pstmt); CloseUtil.close(conn);
		
		return result;
	} // memberLoginCheck() end
}
