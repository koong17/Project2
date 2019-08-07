package hotel.tikki.board.comments.model;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;

public class CommentsDAO {  // controller
	

	private static CommentsDAO instance = new CommentsDAO();	// 한번만 객체를 생성하여 모든 클라이언트들이 공유
	
	public static CommentsDAO getInstance(){
		return instance;
	}// getInstance()
	
	// 생성자
	public CommentsDAO(){}  
		
	// DB연결
	public Connection getConnection() throws Exception{
		// 연결은 JNDI & POLL 형태로 연결 객체 생성해서 리턴
		Context ctx = new InitialContext();
		//Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:HotelDB");	
		//DBMS 에러를 찾는데 도움
		DriverManager.setLogWriter(new PrintWriter(System.out));
		
		return ds.getConnection();
	}// getConnection();
	
	// 해당 글 댓글 수 카운트
	public int cmntCount(int board_num) throws ClassNotFoundException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM COMMENTS WHERE BOARD_NUM = ?");
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) count = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);	CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}
		return count;
	}
	
	// 댓글 내용 가져오기
	public  ArrayList<CommentsVO> selectComments(int board_num) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		ArrayList<CommentsVO> comments = null;
		
		try {
			conn = getConnection();
		    sb.append("select cmnt_num, board_num, cmnt_content, cmnt_nick, cmnt_date");
		    sb.append(" from comments where board_num=? order by cmnt_num desc");
		    pstmt = conn.prepareStatement(sb.toString());
		    pstmt.setInt(1, board_num);
		    rs = pstmt.executeQuery();
		    
		    comments = new ArrayList<>();
		    CommentsVO comment = null;
		    
		    while(rs.next()) {
		        comment = new CommentsVO();
		        comment.setBoard_num(rs.getInt("board_num"));
		        comment.setCmnt_content(rs.getString("cmnt_content"));
		        comment.setCmnt_date(rs.getTimestamp("cmnt_date"));
		        comment.setCmnt_num(rs.getInt("cmnt_num"));
		        comment.setCnmt_nick(rs.getString("cmnt_nick"));
		        comments.add(comment);
		    }
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);	CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}
	    
	    return comments;
	}
	 
	public synchronized HashMap<String, Object> insertComment(int board_num, String cmnt_content, String cmnt_nick) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		HashMap<String, Object> hm = null;
		try {
			conn = getConnection();
		    pstmt = conn.prepareStatement("INSERT INTO comments(cmnt_num, board_num, cmnt_content, cmnt_nick, cmnt_date)"
		    							+ " VALUES((select max(cmnt_num) from comments where board_num=?)+1, ?, ?, ?, sysdate)");
		    pstmt.setInt(1, board_num);
		    pstmt.setInt(2, board_num);
		    pstmt.setString(3, cmnt_content);
		    pstmt.setString(4, cmnt_nick);
		    int result = pstmt.executeUpdate();
		    ArrayList<CommentsVO> comments = selectComments(board_num);
		    
		    hm = new HashMap<>();
		    hm.put("result", result);
		    hm.put("comments", comments);
		    
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}
	    return hm;
	}
	
	
}



