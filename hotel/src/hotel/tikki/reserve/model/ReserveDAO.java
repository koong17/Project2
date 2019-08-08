package hotel.tikki.reserve.model;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dbclose.util.CloseUtil;

public class ReserveDAO {
	private static ReserveDAO instance = new ReserveDAO();	
	
	public static ReserveDAO getInstance(){
		return instance;
	}// getInstance()
	
	// ������
	public ReserveDAO(){}  
		
	// DB����
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc:HotelDB");	
		DriverManager.setLogWriter(new PrintWriter(System.out));
		
		return ds.getConnection();
	}// getConnection();
	
	
	
	public int select(ReserveVO vo) { //고객이 검색한 정보에 상응하는 방 정보를 불러오는 기능
		Connection conn = null ;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT R.ROOM_NUM FROM ROOMS R NOT IN (SELECT B.ROOM_NUM FROM RESERVATION B WHERE NOT (B.CHECK_IN>'2019-08-07' OR B.CHECK_OUT<'2019-08-19')) ORDER BY R.ROOM_NUM" ;
		
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
	
	public int search(ReserveVO vo) { //고객이 선택한 방에 대한 정보를 가져오는 구문
		Connection conn = null ;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from rooms where room_num=1" ;
		
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
	} //search() end

	public int insert(ReserveVO vo) { //고객이 원하는 예약 정보를 예약 DB에 저장
		Connection conn = null ;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "insert into reservation values(1,1,'2019-08-16','2019-08-22',2,'nick',1)";
		
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
	} //insert() end

}