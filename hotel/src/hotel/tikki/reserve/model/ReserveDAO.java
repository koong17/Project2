package hotel.tikki.reserve.model;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;

public class ReserveDAO {
	private static ReserveDAO instance = new ReserveDAO();	
	
	public static ReserveDAO getInstance(){
		return instance;
	}// getInstance()
	
	// 생성자
	public ReserveDAO(){}  
		
	// DB연결
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:HotelDB");	
		DriverManager.setLogWriter(new PrintWriter(System.out));
		
		return ds.getConnection();
	}// getConnection();
	
	public int insert(ReserveVO vo) {
		Connection conn = null ;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getRoom_num());
			pstmt.setInt(2, vo.getRoom_num());
			pstmt.setDate(3, vo.getCheck_in());
			pstmt.setDate(4, vo.getCheck_out());
			pstmt.setInt(5, vo.getRsrv_ppl());
			pstmt.setString(6, vo.getRsrv_nick());
			pstmt.setString(7, vo.getRsrv_status());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}
		return 0;
	} //insert() end
	
	public int select(ReserveVO vo) {
		Connection conn = null ;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM RESERVATION WHERE RSRV_STATUS = 'N'" ;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getRoom_num());
			pstmt.setInt(2, vo.getRsrv_num());
			pstmt.setDate(3, vo.getCheck_in());
			pstmt.setDate(4, vo.getCheck_out());
			pstmt.setInt(5, vo.getRsrv_ppl());
			pstmt.setString(6, vo.getRsrv_nick());
			pstmt.setString(7, vo.getRsrv_status());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseUtil.close(rs);			CloseUtil.close(pstmt);			CloseUtil.close(conn);
		}
		return 0;
	} //select() end
}
