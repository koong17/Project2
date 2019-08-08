package hotel.tikki.board.comments.model;

import java.sql.Timestamp;

public class CommentsVO {
	private int cmnt_num, board_num;
	private String cmnt_content, cmnt_nick;
	private Timestamp cmnt_date;
	
	public int getCmnt_num() {
		return cmnt_num;
	}
	public void setCmnt_num(int cmnt_num) {
		this.cmnt_num = cmnt_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getCmnt_content() {
		return cmnt_content;
	}
	public void setCmnt_content(String cmnt_content) {
		this.cmnt_content = cmnt_content;
	}
	public String getCmnt_nick() {
		return cmnt_nick;
	}
	public void setCmnt_nick(String cmnt_nick) {
		this.cmnt_nick = cmnt_nick;
	}
	public Timestamp getCmnt_date() {
		return cmnt_date;
	}
	public void setCmnt_date(Timestamp cmnt_date) {
		this.cmnt_date = cmnt_date;
	}
	@Override
	public String toString() {
		return "CommentsVO [cmnt_num=" + cmnt_num + ", board_num=" + board_num + ", cmnt_content=" + cmnt_content
				+ ", cmnt_nick=" + cmnt_nick + ", cmnt_date=" + cmnt_date + "]";
	}
	
	
	
}
