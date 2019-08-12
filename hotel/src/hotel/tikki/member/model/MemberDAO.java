package hotel.tikki.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.Random;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Message;
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
	
	public void memberinsert(MemberVO vo) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = getConnection();
		pstmt = conn.prepareStatement("INSERT INTO MEMBER(id, password, nickname, phone) values(?,?,?,?)");
		pstmt.setString(1, vo.getId());
		pstmt.setString(2, vo.getPassword());
		pstmt.setString(3, vo.getNickname());
		pstmt.setString(4, vo.getPhone());
		pstmt.executeUpdate();
		
		CloseUtil.close(pstmt);  CloseUtil.close(conn);
		
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
	
	public void memberUpdate(MemberVO vo) throws Exception {
		String sql = "UPDATE MEMBER SET NICKNAME=?, PHONE=? WHERE ID = ?";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, vo.getNickname());
		pstmt.setString(2, vo.getPhone());
		pstmt.setString(3, vo.getId());
		pstmt.executeUpdate();
		
		CloseUtil.close(pstmt);  CloseUtil.close(conn);
	}

	public void memberUpdatePass(MemberVO vo) throws Exception {
		String sql = "UPDATE MEMBER SET PASSWORD=? WHERE ID = ?";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, vo.getPassword());
		pstmt.setString(2, vo.getId());
		pstmt.executeUpdate();
		
		CloseUtil.close(pstmt);  CloseUtil.close(conn);
	}
	
	public void memberDelete(String id) throws Exception {
		String sql = "DELETE FROM MEMBER WHERE ID=?";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		
		CloseUtil.close(pstmt);  CloseUtil.close(conn);
	}
	
	public static void sendMail(String email, String subject, String msg) throws Exception {
		// Mail server 
		String hostSMTP = "smtp.naver.com"; //SMTP 서버명
		String hostSMTPid = "hoteltikki"; // ID
		String hostSMTPpwd = "tikkimail"; // 비밀번호
		
		// 보내는 사람
		String fromEmail = "hoteltikki@naver.com";
		
		// email 전송
		Properties props = new Properties();
		
		props.put("mail.smtp.host", hostSMTP);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", true);
		
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un=hostSMTPid;
			String pw=hostSMTPpwd;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true); // debug
		Message mimeMessage = new MimeMessage(session);
		mimeMessage.setFrom(new InternetAddress(fromEmail)); // 발신자 셋팅
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email)); // 수신자 셋팅
		
		mimeMessage.setSubject(subject);
		mimeMessage.setText(msg);
		
		Transport.send(mimeMessage);
	}
	
	public static String createKey() throws Exception {
		StringBuffer key = new StringBuffer();
		Random rnd = new Random();
		
		for (int i = 0; i < 10; i++) {
			int index = rnd.nextInt(3);
			
			switch (index) {
			case 0:
				key.append((char)((int)(rnd.nextInt(26)) + 97));
				break;
			case 1:
				key.append((char)((int)(rnd.nextInt(26)) + 97));
				break;
				
			case 2:
				key.append((rnd.nextInt(10)));
				break;
			default:
				break;
			}
		}
		
		return key.toString();		
	}

}
