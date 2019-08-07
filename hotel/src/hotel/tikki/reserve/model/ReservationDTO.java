package hotel.tikki.reserve.model;

public class ReservationDTO {

	   int room_num, rsrv_num, rsrv_date, rsrv_ppl;
	   String type, rsrv_nick;
	   
	   //////////////getter and setter//////////////
	   
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
	   public int getRsrv_date() {
	      return rsrv_date;
	   }
	   public void setRsrv_date(int rsrv_date) {
	      this.rsrv_date = rsrv_date;
	   }
	   public int getRsrv_ppl() {
	      return rsrv_ppl;
	   }
	   public void setRsrv_ppl(int rsrv_ppl) {
	      this.rsrv_ppl = rsrv_ppl;
	   }
	   public String getType() {
	      return type;
	   }
	   public void setType(String type) {
	      this.type = type;
	   }
	   public String getRsrv_nick() {
	      return rsrv_nick;
	   }
	   public void setRsrv_nick(String rsrv_nick) {
	      this.rsrv_nick = rsrv_nick;
	   }
}