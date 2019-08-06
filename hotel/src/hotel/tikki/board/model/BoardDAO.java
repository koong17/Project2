package hotel.tikki.board.model;

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

public class BoardDAO {  // controller
	
	private static BoardDAO instance = new BoardDAO();	// ?�번�?객체�??�성?�여 모든 ?�라?�언?�들??공유
	
	public static BoardDAO getInstance(){
		return instance;
	}// getInstance()
	
	// ?�성??
	public BoardDAO(){}  
		
	// DB?�결
	public Connection getConnection() throws Exception{
		// ?�결?� JNDI & POLL ?�태�??�결 객체 ?�성?�서 리턴
		Context ctx = new InitialContext();
		//Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:HotelDB");	
		//DBMS ?�러�?찾는???��?
		DriverManager.setLogWriter(new PrintWriter(System.out));
		
		return ds.getConnection();
	}// getConnection();
	
	//insert(vo) method - ?�로??글??게시?�에 추�?, 글 ?�력 처리???�용
	public void insert(BoardVO vo) {
		Connection conn = null ;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int number = 0;							// board ?�이블에 ?�어�?번호
		StringBuffer sb = new StringBuffer();
		
		try {
			conn = getConnection();
			//?�재 board ?�이블에 ?�코???�무 ?�단�?글 번호 지??
			pstmt = conn.prepareStatement("SELECT MAX(NUM) FROM BOARD");
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				number = rs.getInt(1) + 1;     // 1 : num , ?�음 글 번호??가????번호 + 1 
			} else {
				number = 1;
			} // if end
			
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
	
	//getListAllCount() : list.jsp ?�이지?�서 ?�용???�코??�?�� ?�어?�는 메소??
	public int getListAllCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = getConnection();
			
			//?�재 board ?�이블의 ?�코????구하�?
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
	
	//getSelectAll(startRow, endRow) : list.jsp ?�서 ?�용???�체 ?�코??출력 메소??
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
			
			// ?�정 ?�음
			sb.append("SELECT NUM, WRITER, EMAIL, SUBJECT, PASSWD, REG_DATE, REF, RE_STEP, RE_LEVEL, CONTENT, IP, READCOUNT, R ");
			sb.append("FROM(SELECT NUM, WRITER, EMAIL, SUBJECT, PASSWD, REG_DATE, REF, RE_STEP, RE_LEVEL, CONTENT, IP, READCOUNT, ROWNUM R ");
			sb.append("FROM(SELECT NUM, WRITER, EMAIL, SUBJECT, PASSWD, REG_DATE, REF, RE_STEP, RE_LEVEL, CONTENT, IP, READCOUNT ");
			sb.append("FROM BOARD ORDER BY REF DESC, RE_STEP ASC) ORDER BY REF DESC,  re_step asc, re_level asc, reg_date asc) WHERE R>=? AND R<=?");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				list = new ArrayList(end);
				
				do {
					BoardVO vo = new BoardVO();
					vo.setNum(rs.getInt("num"));
					vo.setWriter(rs.getString("writer"));
					
					vo.setEmail(rs.getString("email"));
					vo.setSubject(rs.getString("subject"));
					vo.setPasswd(rs.getString("passwd"));
					vo.setReg_date(rs.getTimestamp("reg_date"));
					
					vo.setReadcount(rs.getInt("readcount"));
					vo.setRef(rs.getInt("ref"));
					vo.setRe_level(rs.getInt("re_level"));
					vo.setRe_step(rs.getInt("re_step"));
					
					vo.setIp(rs.getString("ip"));
					vo.setContent(rs.getString("content"));
					
					// list 객체???�이???�??Bean??BoardVO 객체???�?�한??
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
	
	// getDataDetail( num ) - content.jsp ?�세보기 ?�이지
	// num ???�당?�는 ?�코?��? board ?�이블에??검?�함
	public BoardVO getDataDetail( int num ) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		BoardVO vo = null;
		String sql = "";
		
		try {
			conn = getConnection();
			//조회??증�?
			sql = "UPDATE BOARD SET READCOUNT = READCOUNT + 1 WHERE NUM = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeQuery();
			
			pstmt = conn.prepareStatement("SELECT * FROM BOARD WHERE NUM = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				vo = new BoardVO();
				vo.setNum(rs.getInt("num"));
				vo.setWriter(rs.getString("writer"));	
				vo.setEmail(rs.getString("email"));
				vo.setSubject(rs.getString("subject"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setReg_date(rs.getTimestamp("reg_date"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setRef(rs.getInt("ref"));
				vo.setRe_level(rs.getInt("re_level"));
				vo.setRe_step(rs.getInt("re_step"));
				vo.setIp(rs.getString("ip"));
				vo.setContent(rs.getString("content"));
			} // if end			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}			
		return vo;
	} // getDataDetail() end
	
	// update(num) - ?�데?�트???�용?�는 메소??
	public BoardVO  update( int num ) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		BoardVO vo = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM BOARD WHERE NUM = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				vo = new BoardVO();
				vo.setNum(rs.getInt("num"));
				vo.setWriter(rs.getString("writer"));	
				vo.setEmail(rs.getString("email"));
				vo.setSubject(rs.getString("subject"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setReg_date(rs.getTimestamp("reg_date"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setRef(rs.getInt("ref"));
				vo.setRe_level(rs.getInt("re_level"));
				vo.setRe_step(rs.getInt("re_step"));
				vo.setIp(rs.getString("ip"));
				vo.setContent(rs.getString("content"));
			} // if end
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}				
		return vo;
	} // update(num) end
	
	//update(vo) - 글?�정??처리 메소??<=== updatePro.jsp ?�서 ?�용
	public int update(BoardVO vo) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		String dbpasswd = "";
		String sql = "";
		int result = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT PASSWD FROM BOARD WHERE NUM = ?");
			pstmt.setInt(1, vo.getNum());
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				dbpasswd = rs.getString("passwd");
				
				if( dbpasswd.equals(vo.getPasswd())) {
					sql = "UPDATE BOARD SET WRITER=?, EMAIL=?, SUBJECT=?, PASSWD=? ";
					sql += " ,CONTENT = ? WHERE NUM = ?";
					
					System.out.println(sql);
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, vo.getWriter());
					pstmt.setString(2, vo.getEmail());
					pstmt.setString(3, vo.getSubject());
					pstmt.setString(4, vo.getPasswd());
					pstmt.setString(5, vo.getContent());
					pstmt.setInt(6, vo.getNum());
					
					pstmt.executeUpdate();
					result = 1;
					
				} else {
					result = 0;
				} // in if end
			} // out if end
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}					
		return result;
	} // update() end	
	
	//delete( num, passwd ) - deletePro.jsp
	public int delete(int num, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		String dbpasswd = "";
		int result = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT PASSWD FROM BOARD WHERE NUM=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				dbpasswd = rs.getString("passwd");
				
				if( dbpasswd.equals(passwd) ) {
					pstmt = conn.prepareStatement("DELETE FROM BOARD WHERE NUM = ?");
					pstmt.setInt(1, num);
					result = pstmt.executeUpdate();
					result = 1;   // 글??�� ?�공
					
				} else 	result = 0;  // 비�?번호 ?��?
			} // out if end	
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}					
		return result;
	} // delete() end
}

