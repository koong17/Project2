package hotel.tikki.admin.model;

import java.sql.Timestamp;

public class RsrvVO {
	private int room_num, rsrv_num, rsrv_ppl;
	private Timestamp check_in, check_out;
	private String rsrv_nick, rsrv_status;
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public int getRsrv_num() {
		return rsrv_num;
	}
	public void setRsrv_num(int rsrv_num) {
		this.rsrv_num = rsrv_num;
	}
	public int getRsrv_ppl() {
		return rsrv_ppl;
	}
	public void setRsrv_ppl(int rsrv_ppl) {
		this.rsrv_ppl = rsrv_ppl;
	}
	public Timestamp getCheck_in() {
		return check_in;
	}
	public void setCheck_in(Timestamp check_in) {
		this.check_in = check_in;
	}
	public Timestamp getCheck_out() {
		return check_out;
	}
	public void setCheck_out(Timestamp check_out) {
		this.check_out = check_out;
	}
	public String getRsrv_nick() {
		return rsrv_nick;
	}
	public void setRsrv_nick(String rsrv_nick) {
		this.rsrv_nick = rsrv_nick;
	}
	public String getRsrv_status() {
		return rsrv_status;
	}
	public void setRsrv_status(String rsrv_status) {
		this.rsrv_status = rsrv_status;
	}
}
