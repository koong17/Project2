package hotel.tikki.board.model;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;
import hotel.tikki.board.comments.model.CommentsVO;

public class BoardDAO {  // controller
	

	private static BoardDAO instance = new BoardDAO();	// 한번만 객체를 생성하여 모든 클라이언트들이 공유
	
	public static BoardDAO getInstance(){
		return instance;
	}// getInstance()
	
	// 생성자
	public BoardDAO(){}  
		
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
	
//	public String getnick(int board_num) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String board_nick = null;
//		
//		try {
//			conn = getConnection();
//			
//			//현재 board 테이블의 레코드 수 구하기
//			pstmt = conn.prepareStatement("SELECT BOARD_NICK FROM BOARD WHERE BOARD_NUM=?" );
//			pstmt.setInt(1, board_num);
//			rs = pstmt.executeQuery();
//			
//			if( rs.next() ) board_nick = rs.getString(1);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
//		}	
//		return board_nick;
//	}
	
	//insert(vo) method - 새로운 글을 게시판에 추가, 글 입력 처리에 사용
	public void insert(BoardVO vo) {
		Connection conn = null ;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int number = 0;							// board 테이블에 들어갈 번호
		StringBuffer sb = new StringBuffer();
		
		try {
			conn = getConnection();
			//현재 board 테이블에 레코드 유무 판단과 글 번호 지정
			pstmt = conn.prepareStatement("SELECT MAX(BOARD_NUM) FROM BOARD");
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				number = rs.getInt(1) + 1;     // 1 : num , 다음 글 번호는 가장 큰 번호 + 1 
			} else {
				number = 1;
			} // if end
			System.out.println("number : "+ number);
			//insert 명령 처리
			sb.append("INSERT INTO BOARD(BOARD_NUM, BOARD_NICK, BOARD_CONTENT, BOARD_DATE, BOARD_TITLE)");
			sb.append(" VALUES(?, ?, ?, SYSDATE, ?)");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, number);
			pstmt.setString(2, vo.getBoard_nick());
			pstmt.setString(3, vo.getBoard_content());
			pstmt.setString(4, vo.getBoard_title());	
			
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}	
	} // insert() end
	
	//getListAllCount() : list.jsp 페이지에서 사용할 레코드 갯수 얻어오는 메소드
	public int getListAllCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = getConnection();
			
			//현재 board 테이블의 레코드 수 구하기
			pstmt = conn.prepareStatement("SELECT COUNT(*) FROM BOARD" );
			rs = pstmt.executeQuery();
			
			if( rs.next() ) count = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}	
		return count;
	} // getListAllCount() end
	
	//getSelectAll(startRow, endRow) : list.jsp 에서 사용할 전체 레코드 출력 메소드
	public List<BoardVO> getSelectAll( int start,  int end ) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		List  list = null;
		
		try {
			conn = getConnection();
			StringBuffer  sb = new StringBuffer();
			// 방법 3>
			//sb.append("SELECT j.* FROM (	SELECT k.*, rownum r FROM( SELECT * FROM board ORDER BY ref desc, re_step asc	) k ) j WHERE j.r BETWEEN ? AND ?");
			
			// 방법 2>
			//sb.append("select * from (select rownum as r,  x.*   from (select *  from board  order by ref desc, re_step asc)  x ) where r BETWEEN ? and ?");
			
			//방법 1>
			/*sb.append("SELECT NUM, WRITER, EMAIL, SUBJECT, PASSWD, REG_DATE, REF, RE_STEP, RE_LEVEL, CONTENT, IP, READCOUNT, R ");
			sb.append("FROM(SELECT NUM, WRITER, EMAIL, SUBJECT, PASSWD, REG_DATE, REF, RE_STEP, RE_LEVEL, CONTENT, IP, READCOUNT, ROWNUM R ");
			sb.append("FROM(SELECT NUM, WRITER, EMAIL, SUBJECT, PASSWD, REG_DATE, REF, RE_STEP, RE_LEVEL, CONTENT, IP, READCOUNT ");
			sb.append("FROM BOARD ORDER BY REF DESC, RE_STEP ASC, re_level ) ORDER BY REF DESC,  re_step asc, re_level asc, reg_date asc) WHERE R>=? AND R<=?");*/
			
			//방법 4>
			/*sb.append("SELECT NUM, WRITER, EMAIL, SUBJECT, PASSWD, REG_DATE, REF, RE_STEP, RE_LEVEL, CONTENT, IP, READCOUNT, R ");
			sb.append("FROM(SELECT NUM, WRITER, EMAIL, SUBJECT, PASSWD, REG_DATE, REF, RE_STEP, RE_LEVEL, CONTENT, IP, READCOUNT, ROWNUM R ");
			sb.append("FROM(SELECT NUM, WRITER, EMAIL, SUBJECT, PASSWD, REG_DATE, REF, RE_STEP, RE_LEVEL, CONTENT, IP, READCOUNT ");
			sb.append("FROM BOARD GROUP BY NUM, WRITER, EMAIL, SUBJECT, PASSWD, REG_DATE, REF, RE_STEP, RE_LEVEL, CONTENT, IP, READCOUNT ORDER BY REF DESC, RE_STEP ASC) ");
			sb.append("ORDER BY REF DESC, RE_STEP ASC, RE_LEVEL DESC, REG_DATE asc) WHERE R>=? AND R<=? ORDER BY R asc ");*/
			
			// 수정 했음
			sb.append("select BOARD_NUM, BOARD_NICK, BOARD_CONTENT, BOARD_DATE, BOARD_TITLE, r");
			sb.append(" from (select BOARD_NUM, BOARD_NICK, BOARD_CONTENT, BOARD_DATE, BOARD_TITLE, rownum r");
			sb.append(" from(select BOARD_NUM, BOARD_NICK, BOARD_CONTENT, BOARD_DATE, BOARD_TITLE from board order by board_num desc))");
			sb.append(" where r>= ? and r<=?");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				list = new ArrayList(end);
				
				do {
					BoardVO vo = new BoardVO();
					vo.setBoard_num(rs.getInt("board_num"));
					vo.setBoard_title(rs.getString("board_title"));
					vo.setBoard_nick(rs.getString("board_nick"));
					
					// list 객체에 데이터 저장 Bean인 BoardVO 객체에 저장한다.
					list.add(vo);
					
				} while( rs.next() ) ;	
			} // if end
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}				
		return list;
	} // getSelectAll(startRow, endRow) end
	
	// getDataDetail( num ) - content.jsp 상세보기 페이지
	// num 에 해당하는 레코드를 board 테이블에서 검색함
	public BoardVO getDataDetail( int board_num ) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		BoardVO vo = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("SELECT * FROM BOARD WHERE BOARD_NUM = ?");
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				vo = new BoardVO();
				vo.setBoard_num(rs.getInt("board_num"));
				vo.setBoard_nick(rs.getString("board_nick"));
				vo.setBoard_date(rs.getTimestamp("board_date"));
				vo.setBoard_content(rs.getString("board_content"));
				vo.setBoard_title(rs.getString("board_title"));
			} // if end


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}			
		return vo;
	} // getDataDetail() end
	
	// update(num) - 업데이트시 사용하는 메소드
	public BoardVO  update( int board_num ) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		BoardVO vo = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM BOARD WHERE BOARD_NUM = ?");
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				vo = new BoardVO();
				vo.setBoard_num(rs.getInt("board_num"));
				vo.setBoard_nick(rs.getString("board_nick"));
				vo.setBoard_title(rs.getString("board_title"));
				vo.setBoard_date(rs.getTimestamp("board_date"));
				vo.setBoard_content(rs.getString("board_content"));
			} // if end
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}				
		return vo;
	} // update(num) end
	
	//update(vo) - 글수정시 처리 메소드 <=== updatePro.jsp 에서 사용
	public void update(BoardVO vo) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		String db_num = "";
		String sql = "";
		
		try {
			conn = getConnection();
			sql = "UPDATE BOARD SET BOARD_TITLE=?, BOARD_CONTENT=?, BOARD_DATE=SYSDATE";
			sql += " WHERE BOARD_NUM = ?";
			
			System.out.println(sql);
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getBoard_title());
			pstmt.setString(2, vo.getBoard_content());
			pstmt.setInt(3, vo.getBoard_num());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}
	} // update() end	
	
	//delete( board_num) - deletePro.jsp
	public void delete(int board_num) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("DELETE FROM BOARD WHERE BOARD_NUM = ?");
			pstmt.setInt(1, board_num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}
	} // delete() end
	
	// comment method들
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


