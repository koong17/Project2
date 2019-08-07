package hotel.tikki.board.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class BoardVO implements Serializable {
	private int board_num;
	private String board_nick, board_content, board_title;
	private Timestamp board_date;
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_nick() {
		return board_nick;
	}
	public void setBoard_nick(String board_nick) {
		this.board_nick = board_nick;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public Timestamp getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Timestamp board_date) {
		this.board_date = board_date;
	}
}
